-- Create database for the analysis
CREATE DATABASE KMS_inventories;
GO

-- Use the database
USE KMS_inventories;
GO

SELECT * FROM KMS_CaseStudy;

-- Case Scenario I

-- 1. Which product category had the highest sales?
SELECT TOP 1 
    Product_Category, 
    COUNT(Product_Category) AS [Product Count]
FROM KMS_CaseStudy
GROUP BY Product_Category
ORDER BY [Product Count] DESC;

-- 2a. Top 3 regions by total sales
SELECT TOP 3 
    Region, 
    SUM(Sales) AS [Total Sales]
FROM KMS_CaseStudy
GROUP BY Region
ORDER BY [Total Sales] DESC;

-- 2b. Bottom 3 regions by total sales
SELECT TOP 3 
    Region, 
    SUM(Sales) AS [Total Sales]
FROM KMS_CaseStudy
GROUP BY Region
ORDER BY [Total Sales] ASC;

-- 3. Total sales of appliances in Ontario
SELECT 
    Region, 
    SUM(Sales) AS [Total Sales]
FROM KMS_CaseStudy
WHERE Region = 'Ontario' AND Product_Category = 'Appliances'
GROUP BY Region;

-- 4. Bottom 10 customers by sales (advise on how to increase revenue)
SELECT TOP 10 
    Customer_Name, 
    SUM(Sales) AS [Total Sales]
FROM KMS_CaseStudy
GROUP BY Customer_Name
ORDER BY [Total Sales] ASC;
-- Recommendation: Target these customers with loyalty programs, discount offers or personalized marketing.

-- 5. Ship mode with highest shipping cost
SELECT TOP 1 
    Ship_Mode, 
    SUM(Shipping_Cost) AS [Total Shipping Cost]
FROM KMS_CaseStudy
GROUP BY Ship_Mode
ORDER BY [Total Shipping Cost] DESC;

-- Case Scenario II

-- 6. Most valuable customers and what they purchase (by sales per product)
SELECT 
    Customer_Name, 
    Product_Name, 
    SUM(Sales) AS [Total Sales]
FROM KMS_CaseStudy
GROUP BY Customer_Name, Product_Name
ORDER BY [Total Sales] DESC;

-- 7. Small Business customer with the highest sales
SELECT TOP 1 
    Customer_Name, 
    Customer_Segment, 
    SUM(Sales) AS [Total Sales]
FROM KMS_CaseStudy
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name, Customer_Segment
ORDER BY [Total Sales] DESC;

-- 8. Corporate customer with most orders between 2009 and 2012
SELECT TOP 1  
    Customer_Name, 
    Customer_Segment, 
    COUNT(Order_ID) AS [Total Orders]
FROM KMS_CaseStudy
WHERE Customer_Segment = 'Corporate' 
  AND Order_Date BETWEEN '2009-01-01' AND '2012-12-31'
GROUP BY Customer_Name, Customer_Segment
ORDER BY [Total Orders] DESC;

-- 9. Most profitable Consumer segment customer
SELECT TOP 1 
    Customer_Name, 
    Customer_Segment, 
    SUM(Profit) AS [Total Profit]
FROM KMS_CaseStudy
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name, Customer_Segment
ORDER BY [Total Profit] DESC;

-- 10. Customers who returned items and their segment
SELECT 
    KMS_CaseStudy.Customer_Name, 
    KMS_CaseStudy.Customer_Segment, 
    Order_Status.Status
FROM KMS_CaseStudy
JOIN Order_Status ON KMS_CaseStudy.Order_ID = Order_Status.Order_ID
WHERE Order_Status.Status = 'Returned';
-- Status table was merged with KMS_CaseStudy

-- 11. Evaluate shipping cost effectiveness by Order Priority and Ship Mode
SELECT 
    Order_Priority, 
    Ship_Mode,
    COUNT(Order_ID) AS [Order Count],
    SUM(Sales - Profit) AS [Estimated Shipping Cost], -- Sales - Profit ≈ Cost
    AVG(DATEDIFF(DAY, Order_Date, Ship_Date)) AS [Avg Ship Time (days)]
FROM KMS_CaseStudy
GROUP BY Order_Priority, Ship_Mode
ORDER BY Order_Priority, Ship_Mode DESC;
