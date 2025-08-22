CREATE DATABASE online_retail;
USE online_retail;

-- drop table OnlineRetail_2009;

SHOW VARIABLES LIKE 'secure_file_priv';

CREATE TABLE OnlineRetail_2010 (
    Invoice VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    Price DECIMAL(10,4),
    CustomerID VARCHAR(20),
    Country VARCHAR(50)
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/OnlineRetail_2010.csv'
INTO TABLE OnlineRetail_2010
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Invoice, StockCode, Description, Quantity, InvoiceDate, Price, CustomerID, Country);

-- load 2009 data 

CREATE TABLE OnlineRetail_2009 (
    Invoice VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    Price DECIMAL(10,4),
    CustomerID VARCHAR(20),
    Country VARCHAR(50)
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/OnlineRetail_2009.csv'
INTO TABLE OnlineRetail_2009
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Invoice, StockCode, Description, Quantity, InvoiceDate, Price, CustomerID, Country);





