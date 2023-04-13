GO
use FsRental
go

OPEN SYMMETRIC KEY Fs_rentalkey 
DECRYPTION BY CERTIFICATE FsrentalCertificate;
GO

--Insert into AUTHENTICATION Table
INSERT INTO AUTHENTICATION VALUES ('john123', 'John Doe', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'123456789'), '2022-03-01 10:45:32', '2022-03-01 11:12:09', '2022-03-01 12:30:15');
INSERT INTO AUTHENTICATION VALUES ('susan456', 'Susan Smith', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'113456789'), '2022-03-02 14:21:50', '2022-03-02 15:08:31', '2022-03-03 09:45:12');
INSERT INTO AUTHENTICATION VALUES ('jake789', 'Jake Johnson', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'133456789'), '2022-03-03 08:16:40', '2022-03-04 10:30:55', '2022-03-04 11:40:22');
INSERT INTO AUTHENTICATION VALUES ('emma101', 'Emma Davis', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'143456789'), '2022-03-05 12:30:20', '2022-03-05 14:55:10', '2022-03-06 16:20:45');
INSERT INTO AUTHENTICATION VALUES ('michael555', 'Michael Brown', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'153456789'), '2022-03-06 17:30:45', '2022-03-07 09:15:35', '2022-03-07 10:25:50');
INSERT INTO AUTHENTICATION VALUES ('lucy999', 'Lucy Johnson', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'163456789'), '2022-03-08 11:20:10', '2022-03-09 12:30:25', '2022-03-09 13:40:05');
INSERT INTO AUTHENTICATION VALUES ('peter777', 'Peter Parker', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'173456789'), '2022-03-10 09:15:55', '2022-03-10 10:30:45', '2022-03-11 11:45:30');
INSERT INTO AUTHENTICATION VALUES ('jane222', 'Jane Williams', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'183456789'), '2022-03-12 13:25:30', '2022-03-13 08:10:20', '2022-03-13 09:20:45');
INSERT INTO AUTHENTICATION VALUES ('mark333', 'Mark Taylor', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'129456789'), '2022-03-14 10:30:15', '2022-03-15 11:40:30', '2022-03-16 12:50:10');
INSERT INTO AUTHENTICATION VALUES ('sophia888', 'Sophia Martinez', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'143456789'), '2022-03-17 15:20:05','2022-03-18 10:40:30', '2022-03-18 11:50:10');
GO

--Insert into CUSTOMER Table
INSERT INTO CUSTOMER VALUES (101, 'John', 'Doe', '1990-05-10', 'john.doe@example.com', 1234567895, '123 Main St', '', 'CA', 'LA', 90001, 'john123');
INSERT INTO CUSTOMER VALUES (102, 'Susan', 'Smith', '1985-12-15', 'susan@example.com', 1345678901, '456 Pine', 'Apt 10', 'NY', 'NYC', 10001, 'susan456');
INSERT INTO CUSTOMER VALUES (103, 'Jake', 'Johnson', '1992-02-28', 'jakejohnson@example.com', 1456789012, '789 Oak St', '', 'TX', 'Houston', 77002, 'jake789');
INSERT INTO CUSTOMER VALUES (104, 'Emma', 'Davis', '1988-09-20', 'emma@example.com', 1567890123, '12 Maple Ave', 'Unit 5', 'MA', 'Boston', 20108, 'emma101');
INSERT INTO CUSTOMER VALUES (105, 'Michael', 'Brown', '1995-07-03', 'michael@example.com', 1678901234, '345 Elm St', 'Apt 3B', 'IL', 'Chicago', 60601, 'michael555');
INSERT INTO CUSTOMER VALUES (106, 'Lucy', 'Johnson', '1998-11-05', 'lucyjohn@example.com', 1789012345, '678 Main St', '', 'CA', 'San Fransico', 94102, 'lucy999');
INSERT INTO CUSTOMER VALUES (107, 'Peter', 'Parker', '1986-04-15', 'peter@example.com', 1890123456, '901 Vine St', 'Suite 300', 'WA', 'Seattle', 98101, 'peter777');
INSERT INTO CUSTOMER VALUES (108, 'Jane', 'Williams', '1991-08-30', 'jane@example.com', 1901234567, '234 Cedar Rd', '', 'FL', 'Miami', 33101, 'jane222');
INSERT INTO CUSTOMER VALUES (109, 'Mark', 'Taylor', '1989-03-22', 'mark@example.com', 1012345678, '567 Pine St', 'Apt 7C', 'NY', 'Albany', 12201, 'mark333');
INSERT INTO CUSTOMER VALUES (110, 'Sophia', 'Martinez', '1996-01-12', 'sophiam@example.com', 1234567890, '345 Oak St', '', 'TX', 'Austin', 78701, 'sophia888');
GO


OPEN SYMMETRIC KEY Fs_rentalkey 
DECRYPTION BY CERTIFICATE FsrentalCertificate;
GO
--Insert into PAYMENTDETAILS table
INSERT INTO PAYMENTDETAILS VALUES (1001,'Zelle', 'John Doe', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'6175567654'), 101);
INSERT INTO PAYMENTDETAILS VALUES (1002, 'Credit Card', 'Susan Smith', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'4556854473966861'), 102);
INSERT INTO PAYMENTDETAILS VALUES (1003, 'Credit Card', 'Jake Johnson',EncryptByKey(Key_GUID(N'Fs_rentalkey'),'4556854473966854'), 103);
INSERT INTO PAYMENTDETAILS VALUES (1004, 'Debit Card', 'Emma Davis', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'45568544739666717'), 104);
INSERT INTO PAYMENTDETAILS VALUES (1005, 'Debit Card', 'Michael Brown', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'4556854473961234'), 105);
INSERT INTO PAYMENTDETAILS VALUES (1006, 'Debit Card','Lucy Johnson', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'4556854473966813'), 106);
INSERT INTO PAYMENTDETAILS VALUES (1007, 'Debit Card','Peter Parker', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'45568544739668412'), 107);
INSERT INTO PAYMENTDETAILS VALUES (1008, 'Credit Card', 'Jane Williams', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'4556854473966811'), 108);
INSERT INTO PAYMENTDETAILS VALUES (1009, 'Credit Card', 'Mark Taylor', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'4556854473964878'), 109);
INSERT INTO PAYMENTDETAILS VALUES (1010, 'Credit Card', 'Sophia Martinez',EncryptByKey(Key_GUID(N'Fs_rentalkey'),'4556854473966831'), 110);
INSERT INTO PAYMENTDETAILS VALUES (1011, 'Credit Card', 'John Doe', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'4556854473989842'), 101);
INSERT INTO PAYMENTDETAILS VALUES (1012, 'Debit Card', 'John Doe', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'4556854783966772'), 101);
INSERT INTO PAYMENTDETAILS VALUES (1013, 'Debit Card', 'Sophia Martinez', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'45568544739668787'), 110);
INSERT INTO PAYMENTDETAILS VALUES (1014, 'Zelle', 'Sophia Martinez',EncryptByKey(Key_GUID(N'Fs_rentalkey'),'6178767654'), 110);
INSERT INTO PAYMENTDETAILS VALUES (1015, 'Credit Card', 'Sophia Martinez', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'4556854473966902'), 110);
INSERT INTO PAYMENTDETAILS VALUES (1016, 'Credit Card', 'Sophia Martinez', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'4956854473966842'), 110);
INSERT INTO PAYMENTDETAILS VALUES (1017, 'Zelle', 'Michael Brown', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'6175634578'), 105);
INSERT INTO PAYMENTDETAILS VALUES (1018, 'Debit Card', 'Michael Brown', EncryptByKey(Key_GUID(N'Fs_rentalkey'),'455685447396677'), 105);
INSERT INTO PAYMENTDETAILS VALUES (1019, 'Debit Card', 'Michael Brown',EncryptByKey(Key_GUID(N'Fs_rentalkey'),'41156854473966842'), 105);
INSERT INTO PAYMENTDETAILS VALUES (1020, 'Credit Card', 'Michael Brown',EncryptByKey(Key_GUID(N'Fs_rentalkey'),'4556854473966842'), 105);
GO

--Insert into ORDER table
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2001,'2023-04-09 10:30:00.000',5,'2023-04-12 10:30:00.000',822.00,6576.00,'INPROGRESS',0,101,1001);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2002,'2023-04-09 12:00:00.000',7,'2023-04-12 12:00:00.000',858.00,8580.00,'INPROGRESS',1,102,1002);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2003,'2023-04-09 14:00:00.000',3,'2023-04-11 14:00:00.000',117.00,585.00,'INPROGRESS',2,103,1003);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2004,'2023-04-10 08:00:00.000',2,'2023-04-11 08:00:00.000',546.00,1638.00,'INPROGRESS',5,104,1004);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2005,'2023-04-10 09:00:00.000',4,'2023-04-12 09:00:00.000',208.00,1248.00,'INPROGRESS',3,105,1005);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2006,'2023-04-10 10:00:00.000',1,'2023-04-11 10:00:00.000',312.00,624.00,'COMPLETED',4,106,1006);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2007,'2023-04-11 11:30:00.000',6,'2023-04-13 11:30:00.000',312.00,2496.00,'CANCELLED',2,107,1007);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2008,'2023-04-11 13:00:00.000',8,'2023-04-14 13:00:00.000',205.00,2255.00,'INPROGRESS',5,108,1008);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2009,'2023-04-11 15:00:00.000',2,'2023-04-12 15:00:00.000',234.00,702.00,'COMPLETED',3,109,1009);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2010,'2023-04-12 16:00:00.000',3,'2023-04-13 16:00:00.000',234.00,936.00,'INPROGRESS',4,110,1010);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2011,'2023-04-12 16:00:00.000',3,'2023-04-13 16:00:00.000',208.00,832.00,'INPROGRESS',4,110,1013);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2012,'2023-04-12 16:00:00.000',3,'2023-04-13 16:00:00.000',30.00,120.00,'COMPLETED',4,110,1014);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2013,'2023-04-12 16:00:00.000',3,'2023-04-13 16:00:00.000',205.00,820.00,'COMPLETED',4,110,1015);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2014,'2023-04-12 16:00:00.000',3,'2023-04-13 16:00:00.000',15.00,60.00,'DISPATCHED',4,105,1017);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2015,'2023-04-12 16:00:00.000',3,'2023-04-13 16:00:00.000',45.00,180.00,'CANCELLED',4,105,1018);
INSERT INTO [ORDER](order_id,date_booked,extended_booking,date_returned,rental_charges,billing_amount,order_status,order_rating,customer_id,purchdetail_id) VALUES (2016,'2023-04-12 16:00:00.000',3,'2023-04-13 16:00:00.000',208.00,832.00,'DISPATCHED',4,105,1019);
GO

--Insert into SUPPLIER table
INSERT INTO SUPPLIER (supplier_id, supplier_name, supplier_address1, supplier_address2, supplier_state, supplier_city, supplier_zipcode, supplier_phonenumber, supplier_email)
VALUES (1, 'Cynthia Suppliers', '123 Main St', 'Suite 100', 'CA', 'Los Angeles', 90001, 1234567890, 'cynthia@supplier.com');
INSERT INTO SUPPLIER (supplier_id, supplier_name, supplier_address1, supplier_address2, supplier_state, supplier_city, supplier_zipcode, supplier_phonenumber, supplier_email)
VALUES (2, 'Sam Suppliers', '456 Oak St', '', 'NY', 'New York', 10001, 9876543211, 'samclothes@supplier.com');
INSERT INTO SUPPLIER (supplier_id, supplier_name, supplier_address1, supplier_address2, supplier_state, supplier_city, supplier_zipcode, supplier_phonenumber, supplier_email)
VALUES (3, 'Jaden Suppliers', '456 fenway St', '', 'MA', 'Boston', 12215, 6176543210, 'jaden@supplier.com');
INSERT INTO SUPPLIER (supplier_id, supplier_name, supplier_address1, supplier_address2, supplier_state, supplier_city, supplier_zipcode, supplier_phonenumber, supplier_email)
VALUES (4, 'Star Suppliers', '457 Oak St', '', 'NY', 'New York', 10001, 6176543456, 'star@supplier.com');
INSERT INTO SUPPLIER (supplier_id, supplier_name, supplier_address1, supplier_address2, supplier_state, supplier_city, supplier_zipcode, supplier_phonenumber, supplier_email)
VALUES (5, 'Duke Suppliers', '457 Oak St', '', 'MA', 'Boston', 12215, 6176543499, 'duke@supplier.com');
INSERT INTO SUPPLIER (supplier_id, supplier_name, supplier_address1, supplier_address2, supplier_state, supplier_city, supplier_zipcode, supplier_phonenumber, supplier_email)
VALUES (6, 'Duke Suppliers', '123 Main St', 'Suite 100', 'CA', 'Los Angeles', 90001, 1234567890, 'duke@supplier.com');
INSERT INTO SUPPLIER (supplier_id, supplier_name, supplier_address1, supplier_address2, supplier_state, supplier_city, supplier_zipcode, supplier_phonenumber, supplier_email)
VALUES (7, 'Tim Suppliers', '456 Oak St', '', 'NY', 'New York', 10001, 9876543211, 'tim@supplier.com');
INSERT INTO SUPPLIER (supplier_id, supplier_name, supplier_address1, supplier_address2, supplier_state, supplier_city, supplier_zipcode, supplier_phonenumber, supplier_email)
VALUES (8, 'Sim Suppliers', '456 fenway St', '', 'MA', 'Boston', 12215, 6176543210, 'sim@supplier.com');
INSERT INTO SUPPLIER (supplier_id, supplier_name, supplier_address1, supplier_address2, supplier_state, supplier_city, supplier_zipcode, supplier_phonenumber, supplier_email)
VALUES (9, 'Den Suppliers', '457 Oak St', '', 'NY', 'New York', 10001, 6176543456, 'den@supplier.com');
INSERT INTO SUPPLIER (supplier_id, supplier_name, supplier_address1, supplier_address2, supplier_state, supplier_city, supplier_zipcode, supplier_phonenumber, supplier_email)
VALUES (10, 'Tara Suppliers', '457 Oak St', '', 'MA', 'Boston', 12215, 6176543499, 'tara@supplier.com');
GO

--Insert into SUPPLIER_RENTAL table
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (1,'2022-02-01 10:00:00.000',1,100.00,'Women Clothing',1);
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (2,'2022-02-02 12:30:00.000',1,80.00,'Men Clothing',1);
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (3,'2022-02-03 09:45:00.000',0,20.00,'Accessories Out of Stock',1);
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (4,'2022-02-04 14:00:00.000',1,50.00,'Women Clothing',2);
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (5,'2022-02-05 11:15:00.000',0,90.00,'Men Clothing Out of Stock',2);
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (6,'2022-02-06 13:45:00.000',1,60.00,'Accessories',2);
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (7,'2022-02-07 15:30:00.000',0,80.00,'Women Clothing Out of Stock',3);
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (8,'2022-02-08 16:45:00.000',1,40.00,'Men Clothing',3);
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (9,'2022-02-09 10:30:00.000',1,25.00,'Accessories',3);
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (10,'2022-02-10 11:00:00.000',1,70.00,'Women Clothing',4);
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (11,'2022-02-11 14:15:00.000',0,40.00,'Men Clothing Out of Stock',4);
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (12,'2022-02-11 14:15:00.000',1,79.00,'Women Clothing',4);
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (13,'2022-02-11 14:15:00.000',1,40.00,'Women Clothing',5);
INSERT INTO [SUPPLIER_RENTAL](supplierrental_id,date_processed,inventory_availabilty,transaction_amount,prodcat_description,supplier_id) VALUES (14,'2022-02-11 14:15:00.000',1,60.00,'Men Clothing',5);
GO

--Insert into STORE table
INSERT INTO STORE (store_id, store_name, store_address1, store_address2, store_state, store_city, store_zipcode, date_operated, store_rent) VALUES
(1, 'Fashionista', '123 Main St', 'Suite 100', 'CA', 'Los Angeles', 90001, '2021-01-01', 5000.00),
(2, 'Trendy Threads', '456 Oak Ave', '', 'NY', 'New York', 10001, '2021-02-15', 7500.00),
(3, 'Vintage Vibes', '789 Pine St', '', 'TX', 'Austin', 78701, '2021-03-10', 6000.00),
(4, 'Chic Boutique', '101 Main St', 'Unit B', 'FL', 'Miami', 33101, '2021-04-20', 4500.00),
(5, 'Urban Outfitters', '555 Elm St', '', 'CA', 'San Francisco', 94101, '2021-05-05', 8000.00),
(6, 'Glamour Girl', '888 Maple Ave', 'Suite 200', 'TX', 'Dallas', 75201, '2021-06-30', 5500.00),
(7, 'Sassy Styles', '222 Chestnut St', '', 'NY', 'Brooklyn', 11201, '2021-07-15', 6500.00),
(8, 'Boho Beauty', '444 Walnut St', 'Unit C', 'CA', 'San Diego', 92101, '2021-08-10', 7000.00),
(9, 'Preppy Picks', '777 Oak St', '', 'FL', 'Orlando', 32801, '2021-09-25', 5000.00),
(10, 'Designer Deals', '999 Maple Ave', 'Suite 300', 'TX', 'Houston', 77001, '2021-10-20', 7500.00);
GO

--Insert into PRODUCT_CATEGORY table
INSERT INTO [PRODUCT_CATEGORY](prodcat_id,prodcat_name,prodcat_brand,rental_price,inventory_availabilty,prodcat_description) VALUES (1,'Dress','Gucci',102.70,1,'Elegant and chic dress for special occasions');
INSERT INTO [PRODUCT_CATEGORY](prodcat_id,prodcat_name,prodcat_brand,rental_price,inventory_availabilty,prodcat_description) VALUES (2,'Suit','Armani',104.00,1,'Classic and timeless suit for formal events');
INSERT INTO [PRODUCT_CATEGORY](prodcat_id,prodcat_name,prodcat_brand,rental_price,inventory_availabilty,prodcat_description) VALUES (3,'Shoes','Jimmy Choo',30.00,1,'High heels for a touch of glamor');
INSERT INTO [PRODUCT_CATEGORY](prodcat_id,prodcat_name,prodcat_brand,rental_price,inventory_availabilty,prodcat_description) VALUES (4,'Tuxedo','Versace',117.00,1,'Elegant and luxurious tuxed');
INSERT INTO [PRODUCT_CATEGORY](prodcat_id,prodcat_name,prodcat_brand,rental_price,inventory_availabilty,prodcat_description) VALUES (5,'Jewelry','Tiffany & Co.',20.00,1,'Elegant and refined jewelry');
INSERT INTO [PRODUCT_CATEGORY](prodcat_id,prodcat_name,prodcat_brand,rental_price,inventory_availabilty,prodcat_description) VALUES (6,'Watch','Rolex',78.00,1,'Luxury and sophisticated watch for any event');
INSERT INTO [PRODUCT_CATEGORY](prodcat_id,prodcat_name,prodcat_brand,rental_price,inventory_availabilty,prodcat_description) VALUES (7,'Bag','Chanel',40.00,1,'Classic and elegant bag to complement any outfit');
INSERT INTO [PRODUCT_CATEGORY](prodcat_id,prodcat_name,prodcat_brand,rental_price,inventory_availabilty,prodcat_description) VALUES (8,'Sunglasses','Ray-Ban',52.00,1,'Stylish and trendy sunglasses to protect your eyes');
INSERT INTO [PRODUCT_CATEGORY](prodcat_id,prodcat_name,prodcat_brand,rental_price,inventory_availabilty,prodcat_description) VALUES (9,'Hat','Gucci',15.00,1,'Stylish and trendy hat to complete your outfit');
INSERT INTO [PRODUCT_CATEGORY](prodcat_id,prodcat_name,prodcat_brand,rental_price,inventory_availabilty,prodcat_description) VALUES (10,'Coat','Burberry',104.00,1,'Warm and stylish coat');
GO

--Insert into PRODUCT table
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (1,20,1,1,1,'Blue','M','Blue dress','A party wear blue dress');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (2,20,1,1,1,'Red','M','Red dress','A soothing red dress');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (3,25,3,3,4,'Black','S','Black Tuxedo','A classic pair of tuxedo');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (4,28,4,4,4,'White','M','White Tuxedo','A stylish white tuxedo');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (5,18,5,5,4,'Red','XL','Red Tuxedo','A bright and bold Tuxedo');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (6,20,6,6,6,'Gray','S','Watch','A elegant rolex watch');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (7,12,7,7,10,'Navy','L','Navy Coat','A stylish navy Coat that is perfect');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (8,8,8,8,8,'Brown','M','Brown Sunglasses','Sunglasses to make you look stylish');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (9,16,9,9,9,'Pink','S','Pink Hat','A pretty pink hat');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (10,16,9,9,9,'Brown','S','Brown hat','A pretty brown gucci hat');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (11,16,9,9,9,'yellow','S','yellow hat','A pretty yellow hat');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (12,8,8,8,8,'Black','M','Black sunglasses','A classic black shades');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (13,12,7,7,10,'Navy','L','Navy Coat','A stylish navy coat for parties');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (14,8,8,8,8,'Red','M','Sunglasses','A classic funky sunglasses');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (15,12,7,7,10,'Pink','L','Pink coat','A stylish pink coat');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (16,8,8,8,8,'Grey','M','Sunglasses grey','A classic grey shades');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (17,20,1,1,1,'Maroon','M','Maroon gown','A glam maroon dress');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (18,20,1,1,1,'Red','M','Red dress','A shiny red dress');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (19,15,2,2,2,'Green','L','Green Suit','A warm and cozy green suit');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (20,16,9,9,9,'Orange','S','Orange hat','A sunny orange hat');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (21,15,2,2,2,'Green','L','Green suit','A party wear suit');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (22,16,12,7,1,'Olive','M','Olive dress','A comfortable olive dress');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (23,16,12,8,1,'Brown','S','Brown dress','A cute brown day-outfit');
INSERT INTO [PRODUCT](product_id,availability_count,supplierrental_id,store_id,prodcat_id,product_colour,product_size,product_name,product_description) VALUES (24,16,12,6,1,'Silver','S','Silver Blouse','A shimmery silver blouse');
GO

--Insert into ORDERLINE table
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2001,1,5);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2001,2,3);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2002,3,2);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2002,4,4);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2002,6,2);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2003,5,1);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2004,6,7);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2005,7,2);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2006,7,3);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2007,8,6);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2008,1,2);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2009,4,2);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2010,4,2);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2011,19,2);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2012,20,2);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2013,18,2);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2014,9,1);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2015,11,3);
INSERT INTO [ORDERLINE](order_id,product_id,order_quantity) VALUES (2016,15,2);
GO

--Insert into EMPLOYEE table
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_address1, employee_address2, employee_state, employee_city, employee_zipcode, employee_phonenumber, employee_designation, store_id)
VALUES (1331, 'John Doe', '123 Main St', '', 'NY', 'Manhattan', 10001, 5551234456, 'storeManager', 1);
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_address1, employee_address2, employee_state, employee_city, employee_zipcode, employee_phonenumber, employee_designation, store_id)
VALUES (1332, 'Jane Smith', '456 Maple Ave', '', 'NY', 'New York', 10002, 5552345555, 'CustomerRepresentative', 2);
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_address1, employee_address2, employee_state, employee_city, employee_zipcode, employee_phonenumber, employee_designation, store_id)
VALUES (1333, 'Bob Johnson', '789 Oak St', '', 'NY', 'New York', 10003, 5553456555, 'storeStaff', 2);
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_address1, employee_address2, employee_state, employee_city, employee_zipcode, employee_phonenumber, employee_designation, store_id)
VALUES (1334, 'Mary Brown', '321 Elm St', '', 'CA', 'San Diego', 10004, 5554567565, 'CustomerRepresentative', 8);
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_address1, employee_address2, employee_state, employee_city, employee_zipcode, employee_phonenumber, employee_designation, store_id)
VALUES (1335, 'Tom Green', '654 Pine Ave', '', 'CA', 'San Diego', 10005, 5555678456, 'storeStaff', 8);
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_address1, employee_address2, employee_state, employee_city, employee_zipcode, employee_phonenumber, employee_designation, store_id)
VALUES (1336, 'Sarah Lee', '987 Walnut Blvd', '', 'FL', 'Orlando', 10006, 5556789782, 'CustomerRepresentative', 9);
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_address1, employee_address2, employee_state, employee_city, employee_zipcode, employee_phonenumber, employee_designation, store_id)
VALUES (1337, 'Jim Clark', '246 Broadway', '', 'FL', 'Orlando', 10007, 5557890784, 'storeStaff', 9);
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_address1, employee_address2, employee_state, employee_city, employee_zipcode, employee_phonenumber, employee_designation, store_id)
VALUES (1338, 'Alice Chen', '369 Lexington Ave', '', 'TX', 'Houston', 10008, 5558901898, 'CustomerRepresentative', 10);
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_address1, employee_address2, employee_state, employee_city, employee_zipcode, employee_phonenumber, employee_designation, store_id)
VALUES (1339, 'David Kim', '450 liva Ave', '', 'CA', 'San Jose', 10009, 5559012675, 'CustomerRepresentative', 5);
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_address1, employee_address2, employee_state, employee_city, employee_zipcode, employee_phonenumber, employee_designation, store_id)
VALUES (1340, 'Duke Leo', '582 Madison Ave', '', 'FL', 'Miami', 10009, 5559012676, 'CustomerRepresentative', 4);
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_address1, employee_address2, employee_state, employee_city, employee_zipcode, employee_phonenumber, employee_designation, store_id)
VALUES (1341, 'Sami Dami','6778 adison Ave', '', 'TX', 'Austin', 10009, 5559012677, 'CustomerRepresentative', 3);
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_address1, employee_address2, employee_state, employee_city, employee_zipcode, employee_phonenumber, employee_designation, store_id)
VALUES (1342, 'Arina cal', '676 bolytson Ave', '', 'NY', 'Brooklyn', 10009, 5559012670, 'CustomerRepresentative', 7);
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_address1, employee_address2, employee_state, employee_city, employee_zipcode, employee_phonenumber, employee_designation, store_id)
VALUES (1343, 'Davik tara', '555 Madison Ave', '', 'TX', 'Dallas', 10009, 5559012679, 'CustomerRepresentative', 6);
GO

--Insert into CUSTOMER_SERVICE table
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (1, 'Product not delivered', 'Open', 0, 1332, 2001, '2023-04-12 10:30:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (2, 'Bad Qaulity', 'Open', 1, 1332, 2002, '2023-04-09 12:00:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (3, 'Product delivered broken', 'Open', 2, 1336, 2003, '2023-04-09 14:00:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (4, 'Good Product', 'Open', 5, 1336, 2004, '2023-04-10 08:00:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (5, 'Product not delivered', 'Open', 3, 1338, 2005, '2023-04-10 09:00:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (6, 'Satisfied Product', 'Open', 4, 1338, 2006, '2023-04-10 10:00:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (7, 'Product not delivered', 'Open', 2, 1334, 2007, '2023-04-11 11:30:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (8, 'Good Product', 'Open', 5, 1334, 2008, '2023-04-11 13:00:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (9, 'Average Product', 'Open', 3, 1332, 2009, '2023-04-11 15:00:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (10, 'great Product', 'Open', 4, 1336, 2010, '2023-04-12 16:00:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (11, 'Good quality', 'Open', 4, 1338, 2011, '2023-04-10 10:00:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (12, 'Good quality', 'Open', 4, 1334, 2012, '2023-04-11 11:30:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (13, 'Good quality', 'Open', 4, 1334, 2013, '2023-04-11 13:00:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (14, 'Good quality', 'Open', 4, 1332, 2014, '2023-04-11 15:00:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (15, 'Good quality', 'Open', 4, 1336, 2015, '2023-04-12 16:00:00', NULL);
INSERT INTO CUSTOMER_SERVICE (case_id, case_description, case_status, order_rating, employee_id, order_id, date_registered, date_closed)
VALUES (16, 'Good quality', 'Closed', 4, 1336, 2016, '2023-04-12 16:00:00', '2023-04-13 16:00:00');

