USE online_retail;

-- ============================================
-- Analysis for Online Retail Dataset (2009 & 2010)
-- ============================================

-- ============================================
-- 1. Revenue Analysis
-- ============================================
-- Total Revenue by Year
SELECT '2009-2010' AS Period, ROUND(SUM(Quantity * Price), 2) AS Revenue
FROM OnlineRetail_2009
WHERE Quantity > 0 AND Price > 0 AND Invoice NOT LIKE 'C%'

UNION ALL
SELECT '2010-2011' AS Period, ROUND(SUM(Quantity * Price), 2) AS Revenue
FROM OnlineRetail_2010
WHERE Quantity > 0 AND Price > 0 AND Invoice NOT LIKE 'C%';

-- ------------------------------------------------------------

-- Monthly Revenue Trend (for each year)
SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
       ROUND(SUM(Quantity * Price), 2) AS MonthlyRevenue
FROM OnlineRetail_2009
WHERE Quantity > 0 AND Price > 0 AND Invoice NOT LIKE 'C%'
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY Month;

-- for year 2010 dataset

SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
       ROUND(SUM(Quantity * Price), 2) AS MonthlyRevenue
FROM OnlineRetail_2010
WHERE Quantity > 0 AND Price > 0 AND Invoice NOT LIKE 'C%'
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY Month;

-- ------------------------------------------------------------
-- ============================================
-- 2. Product Analysis
-- ============================================

-- Top 10 Best-Selling Products by Revenue
SELECT Description,
       ROUND(SUM(Quantity * Price), 2) AS Revenue
FROM OnlineRetail_2009
WHERE Quantity > 0 AND Price > 0 AND Invoice NOT LIKE 'C%'
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;

-- for year 2010 dataset

SELECT Description,
       ROUND(SUM(Quantity * Price), 2) AS Revenue
FROM OnlineRetail_2010
WHERE Quantity > 0 AND Price > 0 AND Invoice NOT LIKE 'C%'
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;

-- ------------------------------------------------------------

-- Product Returns (most returned items, top 10)
SELECT Description,
       COUNT(*) AS ReturnCount
FROM OnlineRetail_2009
WHERE Quantity < 0
	AND Description IS NOT NULL
	AND Description <> ''
GROUP BY Description
ORDER BY ReturnCount DESC
LIMIT 10;

-- for 2010 year dataset 

SELECT Description,
       COUNT(*) AS ReturnCount
FROM OnlineRetail_2010
WHERE Quantity < 0
	AND Description IS NOT NULL
	AND Description <> ''
GROUP BY Description
ORDER BY ReturnCount DESC
LIMIT 10;

-- ============================================
-- 3. Customer Analysis
-- ============================================

-- Top 10 Customers by Revenue for year 2010 dataset

SELECT CustomerID,
       ROUND(SUM(Quantity * Price), 2) AS CustomerRevenue,
       COUNT(DISTINCT Invoice) AS Orders
FROM OnlineRetail_2010
WHERE Quantity > 0 AND Price > 0 
  AND Invoice NOT LIKE 'C%'
  AND CustomerID IS NOT NULL
  AND CustomerID <> ''
GROUP BY CustomerID
ORDER BY CustomerRevenue DESC
LIMIT 10;
-- ------------------------------------------------------------
-- 6. Average Order Value (AOV)
SELECT ROUND(SUM(Quantity * Price) / COUNT(DISTINCT Invoice), 2) AS AOV
FROM OnlineRetail_2009
WHERE  Quantity > 0 AND Price > 0 AND Invoice NOT LIKE 'C%'
  AND CustomerID IS NOT NULL AND CustomerID <> '';

-- for year 2010 dataset

SELECT ROUND(SUM(Quantity * Price) / COUNT(DISTINCT Invoice), 2) AS AOV
FROM OnlineRetail_2010
WHERE  Quantity > 0 AND Price > 0 AND Invoice NOT LIKE 'C%'
  AND CustomerID IS NOT NULL AND CustomerID <> '';
  
-- ------------------------------------------------------------
--  Customer Lifetime Value (CLV)
-- CLV across both years (2009 + 2010 datasets combined).
SELECT CustomerID,
       ROUND(SUM(Quantity*Price),2) AS TotalSpend,
       COUNT(DISTINCT Invoice) AS Orders
FROM (
    SELECT * FROM OnlineRetail_2009
    UNION ALL
    SELECT * FROM OnlineRetail_2010
) combined
WHERE Quantity > 0 AND Price > 0 AND Invoice NOT LIKE 'C%'
      AND CustomerID IS NOT NULL AND CustomerID <> ''
GROUP BY CustomerID
ORDER BY TotalSpend DESC
LIMIT 10;

-- ============================================
-- 4. Returns & Cancellations Analysis
-- ============================================
-- Returns % (Negative Quantity / Total Rows)

SELECT ROUND( (SUM(CASE WHEN Quantity < 0 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS ReturnRate
FROM OnlineRetail_2009;

-- Cancellation % (Invoices with 'C')
SELECT ROUND( (COUNT(DISTINCT CASE WHEN Invoice LIKE 'C%' THEN Invoice END) * 100.0) / COUNT(DISTINCT Invoice), 2) AS CancellationRate
FROM OnlineRetail_2009;

-- for year 2010 dataset 

-- Returns % (Negative Quantity / Total Rows)
SELECT ROUND( (SUM(CASE WHEN Quantity < 0 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS ReturnRate
FROM OnlineRetail_2010;

-- Cancellation % (Invoices with 'C')
SELECT ROUND( (COUNT(DISTINCT CASE WHEN Invoice LIKE 'C%' THEN Invoice END) * 100.0) / COUNT(DISTINCT Invoice), 2) AS CancellationRate
FROM OnlineRetail_2010;

-- ============================================
-- 5. Geographic Analysis
-- ============================================

-- Revenue by Country (Top 5 excluding UK)
SELECT Country,
       ROUND(SUM(Quantity * Price), 2) AS Revenue
FROM OnlineRetail_2009
WHERE Quantity > 0 AND Price > 0 
  AND Invoice NOT LIKE 'C%'
  AND Country <> 'United Kingdom\r'
GROUP BY Country
ORDER BY Revenue DESC
LIMIT 5;


-- for year 2010 dataset

SELECT Country,
       ROUND(SUM(Quantity * Price), 2) AS Revenue
FROM OnlineRetail_2010
WHERE Quantity > 0 AND Price > 0 AND Invoice NOT LIKE 'C%'
  AND Country <> 'United Kingdom\r'
GROUP BY Country
ORDER BY Revenue DESC
LIMIT 5;

-- ------------------------------------------------------------
-- Cancellation rate by country (Top 5)
SELECT Country,
       ROUND(
         (COUNT(DISTINCT CASE WHEN Invoice LIKE 'C%' THEN Invoice END) * 100.0) / COUNT(DISTINCT Invoice),
         2
       ) AS CancellationRate
FROM OnlineRetail_2009
GROUP BY Country
HAVING COUNT(DISTINCT Invoice) > 100 -- filter tiny markets
ORDER BY CancellationRate DESC
LIMIT 5;

-- for year 2010 dataset
SELECT Country,
       ROUND(
         (COUNT(DISTINCT CASE WHEN Invoice LIKE 'C%' THEN Invoice END) * 100.0) / COUNT(DISTINCT Invoice),
         2
       ) AS CancellationRate
FROM OnlineRetail_2010
GROUP BY Country
HAVING COUNT(DISTINCT Invoice) > 100 -- filter tiny markets
ORDER BY CancellationRate DESC
LIMIT 5;


-- ============================================
-- 6. Year-to-Year Comparison (Growth/Trends)
-- ============================================

-- Revenue growth % from 2009 -> 2010
SELECT ROUND(
  (
    (SELECT SUM(Quantity * Price) FROM OnlineRetail_2010 WHERE Quantity > 0 AND Price > 0 AND Invoice NOT LIKE 'C%')
    -
    (SELECT SUM(Quantity * Price) FROM OnlineRetail_2009 WHERE Quantity > 0 AND Price > 0 AND Invoice NOT LIKE 'C%')
  ) * 100.0 /
  (SELECT SUM(Quantity * Price) FROM OnlineRetail_2009 WHERE Quantity > 0 AND Price > 0 AND Invoice NOT LIKE 'C%'),
  2
) AS RevenueGrowthPercent;


-- ------------------------------------------------------------

