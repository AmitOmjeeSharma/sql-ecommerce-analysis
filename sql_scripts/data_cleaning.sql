USE online_retail;

-- Data Cleaning for Online Retail Dataset (2009 & 2010)

-- 1. Check row counts
SELECT COUNT(*) AS TotalRecords FROM OnlineRetail_2009;
SELECT COUNT(*) AS TotalRecords FROM OnlineRetail_2010;

-- 2. Null Customer IDs (missing values)
SELECT COUNT(*) AS NullCustomerIDs_2009
FROM OnlineRetail_2009
WHERE CustomerID IS NULL;

SELECT COUNT(*) AS NullCustomerIDs_2010
FROM OnlineRetail_2010
WHERE CustomerID IS NULL;

-- 3. Negative Quantities (returns)
SELECT COUNT(*) AS NegativeQty_2009
FROM OnlineRetail_2009
WHERE Quantity < 0;

SELECT COUNT(*) AS NegativeQty_2010
FROM OnlineRetail_2010
WHERE Quantity < 0;

-- 4. Cancelled Invoices (Invoice numbers starting with 'C')
SELECT COUNT(*) AS CancelledOrders_2009
FROM OnlineRetail_2009
WHERE Invoice LIKE 'C%';

SELECT COUNT(*) AS CancelledOrders_2010
FROM OnlineRetail_2010
WHERE Invoice LIKE 'C%';

-- 5. Duplicates check (Invoice + StockCode combinations)
SELECT Invoice, StockCode, COUNT(*) AS DupCount
FROM OnlineRetail_2009
GROUP BY Invoice, StockCode
HAVING COUNT(*) > 1;

SELECT Invoice, StockCode, COUNT(*) AS DupCount
FROM OnlineRetail_2010
GROUP BY Invoice, StockCode
HAVING COUNT(*) > 1;

-- 6. Check Price anomalies (zero or null)
SELECT COUNT(*) AS ZeroPrice_2009
FROM OnlineRetail_2009
WHERE Price <= 0;

SELECT COUNT(*) AS ZeroPrice_2010
FROM OnlineRetail_2010
WHERE Price <= 0;

-- 7. Date Range Validation
SELECT MIN(InvoiceDate) AS EarliestDate, MAX(InvoiceDate) AS LatestDate 
FROM OnlineRetail_2009;

SELECT MIN(InvoiceDate) AS EarliestDate, MAX(InvoiceDate) AS LatestDate 
FROM OnlineRetail_2010;

-- 8. Empty Descriptions
SELECT COUNT(*) AS EmptyDescriptions_2009
FROM OnlineRetail_2009
WHERE Description = '' OR Description IS NULL;

SELECT COUNT(*) AS EmptyDescriptions_2010
FROM OnlineRetail_2010
WHERE Description = '' OR Description IS NULL;

-- 9. Country Values
SELECT count(DISTINCT Country) as Total_country_2009  FROM OnlineRetail_2009 ORDER BY Country;
SELECT count( DISTINCT Country) as Total_country_2010 FROM OnlineRetail_2010 ORDER BY Country;

-- 10. Missing Countries
SELECT DISTINCT Country, 'Only in 2009' AS source
FROM OnlineRetail_2009
WHERE Country NOT IN (SELECT DISTINCT Country FROM OnlineRetail_2010)
UNION
SELECT DISTINCT Country, 'Only in 2010' AS source
FROM OnlineRetail_2010
WHERE Country NOT IN (SELECT DISTINCT Country FROM OnlineRetail_2009);

-- 11. Outlier Prices
SELECT MAX(Price) AS MaxPrice_2009, MIN(Price) AS MinPrice_2009 
FROM OnlineRetail_2009;

SELECT MAX(Price) AS MaxPrice_2010, MIN(Price) AS MinPrice_2010 
FROM OnlineRetail_2010;