/*

1. To view data from Tables
2. To view data from views
3. Sample examples of executing UDF Functions
4. Sample examples of executing Procedures
4. Cleaning up database 

*/

GO
use FsRental
go

--View Data from tables
SELECT * FROM [AUTHENTICATION];
SELECT * FROM CUSTOMER;
SELECT * FROM PAYMENTDETAILS;
SELECT * FROM [ORDER];
SELECT * FROM SUPPLIER;
SELECT * FROM SUPPLIER_RENTAL;
SELECT * FROM STORE;
SELECT * FROM PRODUCT_CATEGORY;
SELECT * FROM PRODUCT;
SELECT * FROM ORDERLINE;
SELECT * FROM EMPLOYEE;
SELECT * FROM CUSTOMER_SERVICE;

--View Data from VIEWS
SELECT * FROM view_TypesOfPaymentMethods;
SELECT * FROM view_StoreSummary;
SELECT * FROM view_CustomerOrderDetails;

--Sample examples of executing UDF Functions
SELECT * FROM GetProductsBySupplierId(1); --Input : supplier_id
SELECT * FROM GetCustomerPurchaseDetails(101); --Input: customer_id

--Sample examples of executing Procedures
EXECUTE dbo.calculateBillingAmount  @OrderID = 2004;;
EXECUTE dbo.addProductToOrder @OrderID = 2002, @ProductID = 6, @Quantity = 2;
EXECUTE dbo.updateRentalCharges @SupplierRentalID = 1;
EXECUTE dbo.calculateRentalCharges @OrderID = 2001;
EXECUTE UpdateCustomer 
    @customer_id = 101,
    @customer_firstname = 'Johnny',
    @customer_lastname = 'Doe',
    @customer_dateofbirth = '1990-01-01',
    @customer_email = 'johndoee@example.com',
    @customer_phonenumber = 1234567890,
    @customer_address1 = '123 Main St',
    @customer_address2 = 'Apt 2',
    @customer_state = 'NY',
    @customer_city = 'New York',
    @customer_zipcode = 10001,
    @user_id = 'john123';


--Cleaning the Database---
DELETE FROM CUSTOMER_SERVICE
DELETE FROM EMPLOYEE
DELETE FROM ORDERLINE
DELETE FROM PRODUCT
DELETE FROM PRODUCT_CATEGORY
DELETE FROM STORE
DELETE FROM SUPPLIER_RENTAL
DELETE FROM SUPPLIER
DELETE FROM [ORDER]
DELETE FROM PAYMENTDETAILS
DELETE FROM CUSTOMER
DELETE FROM [AUTHENTICATION]

DROP TABLE CUSTOMER_SERVICE
DROP TABLE EMPLOYEE
DROP TABLE ORDERLINE
DROP TABLE PRODUCT
DROP TABLE PRODUCT_CATEGORY
DROP TABLE STORE
DROP TABLE SUPPLIER_RENTAL
DROP TABLE SUPPLIER
DROP TABLE [ORDER]
DROP TABLE PAYMENTDETAILS
DROP TABLE CUSTOMER
DROP TABLE [AUTHENTICATION]

-- Drop Views
DROP VIEW view_TypesOfPaymentMethods
DROP VIEW view_StoreSummary
DROP VIEW view_CustomerOrderDetails

-- Drop Functions
DROP FUNCTION validateUserEmail
DROP FUNCTION CalculateCustomerAge
DROP FUNCTION GetProductsBySupplierId
DROP FUNCTION GetCustomerPurchaseDetails

--Drop Triggers
DROP TRIGGER closed_Ticket_Time
DROP TRIGGER UpdateBillingAmount

--Drop procedures
DROP PROCEDURE dbo.calculateBillingAmount;
DROP PROCEDURE addProductToOrder;
DROP PROCEDURE updateRentalCharges;
DROP PROCEDURE calculateRentalCharges;
DROP PROCEDURE UpdateCustomer;
-- Close the symmetric key
CLOSE SYMMETRIC KEY Fs_rentalkey;
-- Drop the symmetric key
DROP SYMMETRIC KEY Fs_rentalkey;
-- Drop the certificate
DROP CERTIFICATE FsrentalCertificate;
--Drop the DMK
DROP MASTER KEY;

--drop database
DROP DATABASE FsRental

