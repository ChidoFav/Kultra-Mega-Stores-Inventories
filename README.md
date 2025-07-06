### Kultra Mega Stores (KMS) Inventory SQL Analysis
This project contains SQL queries used to analyze sales and order data for Kultra Mega Stores (KMS), a company based in Lagos, Nigeria that specializes in office supplies and furniture.

## Dataset
Table: KMS_CaseStudy and Status 

Time Period: 2009 to 2012

Focus: Abuja division of KMS

## Case Scenario I – Sales Overview
Identify the product category with the highest sales

Determine the top 3 and bottom 3 regions by total sales

Find total sales of appliances in the Ontario region

Analyze the bottom 10 customers to suggest ways to increase revenue

Identify which shipping method incurred the highest total shipping cost

## Case Scenario II – Customer Insights
Determine the most valuable customers and the products they typically purchase

Find the small business customer with the highest total sales

Identify the corporate customer with the most orders from 2009 to 2012

Determine the most profitable consumer customer

Identify customers who returned items and their respective segments

Analyze if shipping costs were appropriately aligned with order priority and shipping methods

## How to Use
Run the SQL queries in this project using any SQL database engine that contains the KMS_CaseStudy data. Make sure date formats and field names match this version of the dataset.

# This was the table structure:

| Column Name       | Data Type     | Description                                               |
| ----------------- | ------------- | --------------------------------------------------------- |
| Order_ID         | VARCHAR(20)   | Unique ID for each order                                  |
| Order_Date       | DATE          | Date the order was placed                                 |
| Ship_Date        | DATE          | Date the order was shipped                                |
| Customer_Name    | VARCHAR(100)  | Name of the customer                                      |
| Customer_Segment | VARCHAR(50)   | Customer type (e.g., Consumer, Corporate, Small Business) |
| Region            | VARCHAR(50)   | Region where the order was placed                         |
| Product_Category | VARCHAR(50)   | Category of the product (e.g., Furniture, Appliances)     |
| Product_Name     | VARCHAR(150)  | Full name of the product                                  |
| Sales             | DECIMAL(10,2) | Sale amount for the product                               |
| Profit            | DECIMAL(10,2) | Profit made from the sale                                 |
| Shipping_Cost    | DECIMAL(10,2) | Cost of shipping the product                              |
| Ship_Mode        | VARCHAR(50)   | Mode of shipping (e.g., Express Air, Truck)               |
| Order_Priority   | VARCHAR(20)   | Priority level of the order (e.g., High, Low)             |


| Column Name | Data Type   | Description                                         |
| ----------- | ----------- | --------------------------------------------------- |
| Order_ID   | VARCHAR(20) | Foreign key from `KMS_CaseStudy`           |
| Status      | VARCHAR(20) | Order status (e.g., Delivered, Returned, Cancelled) |


