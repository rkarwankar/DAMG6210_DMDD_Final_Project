/*

1. Created UDF
2. Created views
3. Created Triggers
4. Created Procedures
4. Created Column Based UDF

*/

GO
use FsRental
go

--created UDF--

--1.UDF-tracks customers order  (used subquery)----

CREATE FUNCTION GetCustomerPurchaseDetails (@customerId INT)
RETURNS TABLE 
AS
RETURN
    (SELECT p.product_name, pc.prodcat_name, s.store_name
    FROM product p
    JOIN product_category pc ON p.prodcat_id = pc.prodcat_id
    JOIN store s ON p.store_id = s.store_id
    WHERE p.product_id IN (
        SELECT op.product_id
        FROM ORDERLINE op
        JOIN [order] o ON op.order_id = o.order_id
        WHERE o.customer_id = @customerId
    ));
GO

--2.UDF  (Based on supplierId this view will show all the stores and all the products the given suuplier has supplied) 

CREATE FUNCTION GetProductsBySupplierId (@supplier_id INT)
RETURNS @result TABLE (store_id INT, store_name VARCHAR(30),product_id INT, product_name VARCHAR(30), availability_count INT)
AS
BEGIN
    INSERT INTO @result (store_id, store_name,product_id, product_name, availability_count)
    SELECT p.store_id, s.store_name,p.product_id, p.product_name, p.availability_count
    FROM PRODUCT p
    INNER JOIN SUPPLIER_RENTAL sr ON p.supplierrental_id = sr.supplierrental_id
    INNER JOIN STORE s ON p.store_id = s.store_id
    WHERE sr.supplier_id = @supplier_id
    RETURN;
END;
GO

--Create view

--View 1 see the payment type 
CREATE VIEW view_TypesOfPaymentMethods AS
SELECT
cust.customer_id ,
customer_firstname  + ' ' +  customer_lastname AS name ,
payDetails.payment_type,
COUNT(*) AS NoOfTransOfGivenPaymentType
FROM PAYMENTDETAILS payDetails
JOIN CUSTOMER cust
ON payDetails.customer_id = cust.customer_id
GROUP BY cust.customer_id,customer_firstname,customer_lastname, payment_type ;
GO

--View 2 this view tells number of products at each store  and the average rental price of the products

CREATE VIEW view_StoreSummary AS
SELECT s.store_id, s.store_name, s.store_city, s.store_state, COUNT(product_id) AS num_products, AVG(pc.rental_price) AS avg_rental_price
FROM store s
JOIN product p ON s.store_id = p.store_id
JOIN product_category pc ON p.prodcat_id = pc.prodcat_id
GROUP BY s.store_id,s.store_name, s.store_city, s.store_state;
GO

--View 3 (This view can be used to see which products were rented in each customer order, along with details about the customer and the order itself)
CREATE VIEW view_CustomerOrderDetails AS
SELECT
    c.customer_id, 
    c.customer_firstname, 
    c.customer_lastname,
	p.product_id, 
    p.product_name, 
    p.product_description, 
    p.product_colour, 
    p.product_size, 
    o.order_id, 
    o.date_booked, 
    o.date_returned, 
    o.rental_charges, 
    o.billing_amount, 
    o.order_status, 
    o.order_rating,
	ol.order_quantity
    FROM 
    [ORDER] o 
    JOIN CUSTOMER c ON o.customer_id = c.customer_id
    JOIN ORDERLINE ol ON o.order_id = ol.order_id
    JOIN PRODUCT p ON ol.product_id = p.product_id;
GO

--created triggers-- 

--1 trigger to closed ticket when the case status is closed

CREATE TRIGGER closed_Ticket_Time
ON CUSTOMER_SERVICE
AFTER UPDATE
AS
BEGIN
DECLARE @case_status VARCHAR(15);
DECLARE @case_id INT;
SELECT
	@case_status = cs.case_status
FROM CUSTOMER_SERVICE cs
INNER JOIN inserted i
	ON cs.case_id = i.case_id;
SELECT
	@case_id = cs.case_id
FROM CUSTOMER_SERVICE cs
INNER JOIN inserted i
	ON cs.case_id = i.case_id;

IF @case_status = 'Closed'
BEGIN
UPDATE CUSTOMER_SERVICE
SET date_closed = CURRENT_TIMESTAMP
WHERE case_id = @case_id
END;
END;

GO

---update the status as Closed for the given caseId
/*UPDATE CUSTOMER_SERVICE SET case_status='Closed'
FROM CUSTOMER_SERVICE
WHERE case_id=1; */

--trigger 2 updates billing amount in order table onces rental charge is updated

CREATE TRIGGER UpdateBillingAmount
ON [ORDER]
AFTER UPDATE
AS
BEGIN
  IF UPDATE(rental_charges)
  BEGIN
    UPDATE [ORDER]
    SET billing_amount =(DATEDIFF(day, CAST(o.date_booked AS DATE), CAST(o.date_returned AS DATE)) + o.extended_booking) * o.rental_charges
    FROM [ORDER] o
    INNER JOIN inserted i ON o.order_id = i.order_id
  END
END

GO

--created procedures

--1st  procedure based on the transaction amount the rental price is inreased by 30 percent for earning profit
CREATE PROCEDURE updateRentalCharges(@SupplierRentalID INT)
AS
BEGIN
    BEGIN TRANSACTION;
    
    DECLARE @TransactionAmount DECIMAL = 0;
    DECLARE @ProdCatID INT;

    SET @ProdCatID = (SELECT DISTINCT p.prodcat_id
    FROM PRODUCT p
    WHERE p.supplierrental_id = @SupplierRentalID);
    
    SELECT @TransactionAmount = transaction_amount
    FROM SUPPLIER_RENTAL
    WHERE supplierrental_id = @SupplierRentalID;

    UPDATE [Product_category]
    SET rental_price = @TransactionAmount + (@TransactionAmount * 0.3)
    WHERE prodcat_id = @ProdCatID;

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    COMMIT TRANSACTION;
END;

GO
--By passing supplierrentalID, it updates the rental_price 
--EXECUTE dbo.updateRentalCharges @SupplierRentalID = 1;

--2nd procedure
CREATE PROCEDURE addProductToOrder(
    @OrderID INT,
    @ProductID INT,
    @Quantity INT
)
AS
BEGIN
    BEGIN TRANSACTION;
    DECLARE @prodcat_id INT;
    DECLARE @RentalPrice DECIMAL = 0;
    DECLARE @OrderStatus VARCHAR(20);
    DECLARE @ProductAvail INT;

    SELECT @OrderStatus = order_status
    FROM [ORDER]
    WHERE order_id = @OrderID;
    
    SELECT @ProductAvail = availability_count
    FROM PRODUCT 
    WHERE product_id = @ProductID;

    IF (@OrderStatus) = 'INPROGRESS' AND (@ProductAvail >= @Quantity)
    BEGIN
    -- Insert new order line 
    INSERT INTO [ORDERLINE] (order_id, product_id, order_quantity)
    VALUES (@OrderID, @ProductID, @Quantity);
    
    -- Update product availability with deducted quantity ordered 
    UPDATE [PRODUCT]
    SET availability_count = availability_count - @Quantity
    WHERE product_id = @ProductID;
    
    SELECT @RentalPrice = pc.rental_price * @Quantity
    FROM PRODUCT_CATEGORY pc
    WHERE pc.prodcat_id = (SELECT p.prodcat_id
                           FROM PRODUCT p
                           WHERE p.product_id = @ProductID);
    
    UPDATE [ORDER]
    SET rental_charges = rental_charges + @RentalPrice
    WHERE ORDER_ID = @OrderID;
    END;

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    COMMIT TRANSACTION;
END;

--passing the below dentals will give us the total rental_charges for the given order
--EXECUTE dbo.addProductToOrder @OrderID = 2004, @ProductID = 1, @Quantity = 3;

--3rd procedures (updates the rental charges in order table)
GO
CREATE PROCEDURE dbo.calculateRentalCharges(@OrderID INT)
AS
BEGIN
	DECLARE @calc DECIMAL = 0;
    DECLARE @RentalCharges DECIMAL = 0;
    SET @calc = (SELECT SUM(pc.rental_price * o.order_quantity)
    FROM ORDERLINE o, PRODUCT_CATEGORY pc
    WHERE o.order_id = @OrderID
    AND pc.prodcat_id = (SELECT p.prodcat_id
                           FROM PRODUCT p
                           WHERE p.product_id = o.product_id));

IF (@calc > 0) BEGIN
set @RentalCharges = @calc;
UPDATE [ORDER]
SET rental_charges = @RentalCharges
WHERE ORDER_ID = @OrderID;
END;
END;

--By passing orderId for the product, rental charges will be updated
--EXECUTE dbo.calculateRentalCharges @OrderID = 2001;

--4th procedures (it updates the billing amount)
GO
CREATE PROCEDURE dbo.calculateBillingAmount(@OrderID INT)
AS
BEGIN
	DECLARE @calc DECIMAL = 0;
    DECLARE @BillingAmount DECIMAL = 0;
SELECT @calc = (DATEDIFF(day, CAST(date_booked AS DATE), CAST(date_returned AS DATE)) + extended_booking) * o.rental_charges  
FROM [ORDER] o
WHERE order_status = 'INPROGRESS' --NOT IN ('Cancelled','Completed','Closed')
AND ORDER_ID = @OrderID;
IF (@calc > 0) BEGIN
set @BillingAmount = @calc;
UPDATE [ORDER]
SET billing_amount = @BillingAmount
WHERE ORDER_ID = @OrderID;
END;
END;

GO
--EXECUTE dbo.calculateBillingAmount @OrderID = 2004;

--5th procedure (it updates authentication table when we update customers)
CREATE PROCEDURE UpdateCustomer
    @customer_id INT,
    @customer_firstname VARCHAR(20),
    @customer_lastname VARCHAR(20),
    @customer_dateofbirth DATETIME,
    @customer_email VARCHAR(30),
    @customer_phonenumber BIGINT,
    @customer_address1 VARCHAR(30),
    @customer_address2 VARCHAR(20),
    @customer_state VARCHAR(2),
    @customer_city VARCHAR(20),
    @customer_zipcode INT,
    @user_id VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the customer record
    UPDATE CUSTOMER
    SET customer_firstname = @customer_firstname,
        customer_lastname = @customer_lastname,
        customer_dateofbirth = @customer_dateofbirth,
        customer_email = @customer_email,
        customer_phonenumber = @customer_phonenumber,
        customer_address1 = @customer_address1,
        customer_address2 = @customer_address2,
        customer_state = @customer_state,
        customer_city = @customer_city,
        customer_zipcode = @customer_zipcode
    WHERE customer_id = @customer_id

    -- Update the date_updated column in the AUTHENTICATION table
    UPDATE AUTHENTICATION
    SET date_updated = GETDATE()
    WHERE user_id = @user_id;
END




