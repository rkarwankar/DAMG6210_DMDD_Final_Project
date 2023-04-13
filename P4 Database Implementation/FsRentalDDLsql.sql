/*

1. Created Databse
2. Created Tables
3. Created Non cluster Index
4. Created encryption for user password and  card details
4. Created Column Based UDF

*/
--1. create Database--
CREATE DATABASE FsRental;
GO
use FsRental
go

--2. create Table--

CREATE TABLE [AUTHENTICATION]
(
    [user_id] VARCHAR(20) NOT NULL,
    [user_name] VARCHAR(30) NOT NULL,
    [password] VARBINARY(100) NOT NULL, 
    date_created DATETIME,
    date_updated DATETIME,
    last_login DATETIME,
	CONSTRAINT AUTHENTICATION_PK PRIMARY KEY ([user_id]),
);

CREATE TABLE CUSTOMER
(
 customer_id INT NOT NULL,
 customer_firstname VARCHAR(20) NOT NULL,
 customer_lastname VARCHAR(20) NOT NULL,
 customer_dateofbirth DATETIME,
 customer_email VARCHAR(30),
 customer_phonenumber BIGINT not null CONSTRAINT Ph_length_check CHECK  (len([customer_phonenumber])=10),
 customer_address1 VARCHAR(30) NOT NULL,
 customer_address2 VARCHAR(20),
 customer_state VARCHAR(2) NOT NULL,
 customer_city VARCHAR(20) NOT NULL,
 customer_zipcode INT NOT NULL CONSTRAINT zip_chk CHECK (LEN(customer_zipcode)=5),
 [user_id] VARCHAR(20) NOT NULL,
 CONSTRAINT CUSTOMER_PK PRIMARY KEY (customer_id),
 CONSTRAINT CUSTOMER_FK FOREIGN KEY ([user_id]) REFERENCES AUTHENTICATION([user_id]) 
);

CREATE TABLE PAYMENTDETAILS
(purchdetail_id INT NOT NULL,
 payment_type VARCHAR(15) NOT NULL CHECK ([payment_type] IN ('Zelle', 'Credit Card','Debit Card')) DEFAULT 'Credit Card',
 payment_detail_name VARCHAR(20),
 payment_type_details VARBINARY(100),
 customer_id INT NOT NULL,
 CONSTRAINT PAYMENTDETAILS_PK PRIMARY KEY (purchdetail_id),
 CONSTRAINT [CUSTOMER_FK.customer_id] FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);

CREATE TABLE [ORDER]
(
order_id INT NOT NULL,
date_booked DATETIME NOT NULL,
extended_booking INT NOT NULL,
date_returned DATETIME NOT NULL,
rental_charges DECIMAL(7,2),
billing_amount DECIMAL(7,2),
order_status VARCHAR(20) NOT NULL CHECK ([order_status] IN ('INPROGRESS', 'COMPLETED', 'CANCELLED','DISPATCHED')),
order_rating INT NOT NULL CHECK ([order_rating] IN (0,1,2,3,4,5)) DEFAULT 0,
customer_id INT NOT NULL,
purchdetail_id INT NOT NULL,
CONSTRAINT ORDER_PK PRIMARY KEY (order_id),
CONSTRAINT [CUSTOMER_FK.order] FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
CONSTRAINT PAYMENTDETAILS_FK FOREIGN KEY (purchdetail_id) REFERENCES PAYMENTDETAILS(purchdetail_id),
);

CREATE TABLE SUPPLIER (
  supplier_id INT NOT NULL,
  supplier_name VARCHAR(20) NOT NULL,
  supplier_address1 VARCHAR(30) NOT NULL,
  supplier_address2 VARCHAR(30) NOT NULL,
  supplier_state VARCHAR(2) NOT NULL,
  supplier_city VARCHAR(30) NOT NULL,
  supplier_zipcode INT NOT NULL CONSTRAINT supplier_zip_chk CHECK (LEN(supplier_zipcode)=5),
  supplier_phonenumber BIGINT NOT NULL CONSTRAINT supplier_Ph_length_check CHECK  (len([supplier_phonenumber])=10),
  supplier_email VARCHAR(30) NOT NULL CONSTRAINT supplier_email_check CHECK (supplier_email LIKE '[a-z,0-9,_,-]%@[a-z]%.[a-z][a-z]%'),
  CONSTRAINT SUPPLIER_PK PRIMARY KEY (supplier_id),
);

CREATE TABLE SUPPLIER_RENTAL (
  supplierrental_id INT NOT NULL,
  date_processed DATETIME,
  inventory_availabilty BIT NOT NULL,
  transaction_amount DECIMAL(7,2),
  prodcat_description VARCHAR(50),
  supplier_id INT NOT NULL,
  CONSTRAINT SUPPLIER_RENTAL_PK PRIMARY KEY (supplierrental_id),
  CONSTRAINT [SUPPLIER_FK.supplier_id] FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(supplier_id)
);

CREATE TABLE STORE (
  store_id INT NOT NULL,
  store_name VARCHAR(30) NOT NULL,
  store_address1 VARCHAR(30) NOT NULL,
  store_address2 VARCHAR(30),
  store_state VARCHAR(2) NOT NULL,
  store_city VARCHAR(30) NOT NULL,
  store_zipcode INT NOT NULL,
  date_operated DATETIME,
  store_rent DECIMAL(7,2) NOT NULL,
  CONSTRAINT STORE_PK PRIMARY KEY (store_id)
);

CREATE TABLE PRODUCT_CATEGORY (
  prodcat_id INT NOT NULL,
  prodcat_name VARCHAR(30) NOT NULL,
  prodcat_brand VARCHAR(30) NOT NULL,
  rental_price DECIMAL(7,2) NOT NULL,
  inventory_availabilty BIT,
  prodcat_description VARCHAR(50) NOT NULL,
  CONSTRAINT PRODUCT_CATEGORY_PK PRIMARY KEY (prodcat_id) 
);

CREATE TABLE PRODUCT (
  product_id INT NOT NULL,
  availability_count INT NOT NULL,
	supplierrental_id INT NOT NULL,
	store_id INT NOT NULL,
	prodcat_id INT NOT NULL,
  product_colour VARCHAR(20),
  product_size CHAR(5) NOT NULL,
  product_name VARCHAR(30) NOT NULL,
  product_description VARCHAR(50) NOT NULL,
	CONSTRAINT PRODUCT_PK PRIMARY KEY (product_id),
  CONSTRAINT [SUPPLIER_RENTAL_FK.supplierrental_id] FOREIGN KEY (supplierrental_id) REFERENCES SUPPLIER_RENTAL(supplierrental_id),
  CONSTRAINT [STORE_FK.store_id] FOREIGN KEY (store_id) REFERENCES STORE(store_id),
  CONSTRAINT [PRODUCT_CATEGORY_FK.prodcat_id] FOREIGN KEY (prodcat_id) REFERENCES PRODUCT_CATEGORY(prodcat_id)
);

CREATE TABLE ORDERLINE (
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  order_quantity INT,
  CONSTRAINT ORDERLINE_PK PRIMARY KEY (order_id, product_id),
  CONSTRAINT ORDER_FK FOREIGN KEY (order_id) REFERENCES [ORDER](order_id),
  CONSTRAINT PRODUCT_FK FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
);

CREATE TABLE EMPLOYEE (
  employee_id INT NOT NULL,
  employee_name VARCHAR(30) NOT NULL,
  employee_address1 VARCHAR(30) NOT NULL,
  employee_address2 VARCHAR(30),
  employee_state VARCHAR(2) NOT NULL,
  employee_city VARCHAR(10) NOT NULL,
  employee_zipcode INT NOT NULL CONSTRAINT emp_zip_chk CHECK (LEN(employee_zipcode)=5),
  employee_phonenumber BIGINT NOT NULL UNIQUE CONSTRAINT emp_Ph_length_check CHECK  (len([employee_phonenumber])=10),
  employee_designation VARCHAR(30) NOT NULL CHECK ([employee_designation] IN ('storeManager', 'CustomerRepresentative','storeStaff')) DEFAULT 'storeManager',
  store_id INT NOT NULL,
  CONSTRAINT EMPLOYEE_PK PRIMARY KEY (employee_id),
  CONSTRAINT STORE_FK FOREIGN KEY (store_id) REFERENCES STORE(store_id)
);

CREATE TABLE CUSTOMER_SERVICE (
  case_id INT NOT NULL,
  case_description VARCHAR(50) NOT NULL,
  case_status VARCHAR(15),
  order_rating INT,
  employee_id INT NOT NULL,
  order_id INT NOT NULL,
  date_registered DATETIME,
  date_closed DATETIME,
  CONSTRAINT CUSTOMER_SERVICE_PK PRIMARY KEY (case_id),
  CONSTRAINT [EMPLOYEE_FK.employee_id] FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id),
  CONSTRAINT [ORDER_FK.order_id] FOREIGN KEY (order_id) REFERENCES [ORDER](order_id)
);
GO
--3.create noncluster index (need one)
CREATE NONCLUSTERED INDEX idx_email ON customer(customer_email);
CREATE NONCLUSTERED INDEX idx_prodcatname ON product_category(prodcat_name);
CREATE NONCLUSTERED INDEX idx_prodcatid ON product_category(prodcat_id);
GO
--4. Encryption for user password and  card details  (using Symmetric Encryption)

CREATE MASTER KEY ENCRYPTION BY 
PASSWORD = 'Rental@Team14';
GO

CREATE CERTIFICATE FsrentalCertificate 
WITH SUBJECT  = 'hide password and card details',
EXPIRY_DATE = '2025-08-26';
GO

CREATE SYMMETRIC KEY Fs_rentalkey
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE FsrentalCertificate;
GO

OPEN SYMMETRIC KEY Fs_rentalkey 
DECRYPTION BY CERTIFICATE FsrentalCertificate;
GO

--5.Create Column based UDF

--email vaildation for user
CREATE FUNCTION validateUserEmail(@Email VARCHAR(30))
RETURNS BIT
AS
BEGIN
    DECLARE @IsValid BIT = 0
    
    IF @Email LIKE '%_@__%.__%' AND PATINDEX('%[^a-z,@,.,_]%', @Email) = 0
        SET @IsValid = 1
    
    RETURN @IsValid
END;
GO

ALTER TABLE CUSTOMER ADD CONSTRAINT ValidEmail_CK CHECK (dbo.validateUserEmail(customer_email) = 1);

-- calculates age of the customer (user define functions)
GO

CREATE FUNCTION CalculateCustomerAge(@DateOfBirth datetime)
RETURNS INT 
BEGIN
 
	DECLARE @age INT
SET @age = DATEDIFF(hour,@DateOfBirth ,GETDATE())/8766
	RETURN @age
END;
GO

ALTER TABLE CUSTOMER ADD age AS dbo.CalculateCustomerAge(customer_dateofbirth);





