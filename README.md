# 🛍️ Online Retail Sales Analysis (SQL Project)

This project uses SQL to analyze sales and customer behavior in an online retail dataset. It covers customer segmentation, sales performance, product popularity, revenue trends, and customer value insights.

## 📁 Dataset
- *Source*: Online Retail (commonly found on UCI Machine Learning Repository or Kaggle)
- *Table Used*: online_retail
- *Key Columns*: InvoiceNo, Description, Quantity, UnitPrice, InvoiceDate, CustomerID, Country

##

1. *Revenue Insights*
   - Total revenue by year and Month
   - Identify Top 10 performing countries.
   - Total revenue by Quater
   - Customer per Month

## 🧠 Sample SQL Logic

- *Customer Segmentation*
```sql
SELECT 
  CustomerID,
  COUNT(DISTINCT InvoiceNo) AS purchase_frequency,
  CASE
    WHEN COUNT(DISTINCT InvoiceNo) = 1 THEN 'OneTime-purchase'
    WHEN COUNT(DISTINCT InvoiceNo) BETWEEN 2 AND 6 THEN 'Repeat-purchase'
    ELSE 'High-purchase'
  END AS Customer_Segmentation
FROM online_retail
GROUP BY CustomerID;

- *Top 10 Products*
SELECT 
  Description, 
  SUM(Quantity) AS total_quantity_sold
FROM online_retail
GROUP BY Description
ORDER BY total_quantity_sold DESC
LIMIT 10;

- *Revenue by Country*
SELECT 
  Country, 
  ROUND(SUM(Quantity * UnitPrice), 2) AS Total_sales_revenue
FROM online_retail
GROUP BY Country
ORDER BY Total_sales_revenue DESC;
