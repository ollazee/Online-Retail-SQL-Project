
--Online Retail Dataset Project

--task 1 (group customers based on their purchase frequency

select * 
from dbo.['Online Retail$']

select count(*)
from ['Online Retail$']

select CustomerID,count(distinct InvoiceNo)as purchase_frequency,
case
WHEN count(distinct InvoiceNo)=1 THEN 'onetime-purchase'
WHEN count (distinct InvoiceNo) between 2 and 6 THEN 'repeat-purchase'
ELSE 'high-purchase'
END as customer_segmentation
from ['Online Retail$']
GROUP BY CustomerID;

---provide insight into how much revenue is generated from each segment

select InvoiceNo,Description,CustomerID,Country,(Quantity*UnitPrice)as Revenue
from ['Online Retail$']



 --task 2,top 10 most purchase product based on total quantity sold

 select top 10 Description,sum(quantity) as totalquantity_sold
 from dbo.['Online Retail$']
 group by Description
 order by totalquantity_sold desc

 ---provide a breakdown of which countries purchase  the product the most

 select top 10 Country,Description,sum(Quantity)as totalquantity_sold
 from ['Online Retail$']
 group by Country,Description
 order by totalquantity_sold desc
 


--task 3 revenue analysis(calculate total sales revenue for each country,identifying the top 5 countries that contribute the most
 
 select top 5 country,ROUND(sum(Quantity*unitprice),2) as totalsalesrevenue
 from dbo.['Online Retail$']
 group by Country
 order by totalsalesrevenue desc


 --provide insight into customer bahaviour in these countries

 select top 5 COUNT(*),Country,ROUND(SUM(Quantity*unitprice),2)as total_sales_revenue
 from ['Online Retail$']
 group by Country
 order by total_sales_revenue desc



 --task 4(analyze monthly sales data to identify seasonal trends and keys periods of high or low sales


  select format(invoicedate,'MMMM')as month_year,YEAR(InvoiceDate)as year_name,ROUND(sum(quantity*unitprice),2)as total_sales
  from ['Online Retail$']
  group by  format(invoicedate,'MMMM'),year(invoicedate)
  order by total_sales


 --task 5 calculate lifetime value(CLv)analysis by analysing total revenue

 select CustomerID,ROUND(sum(quantity*unitprice),2)as total_revenue
 from ['Online Retail$']
 group by CustomerID
 order by total_revenue desc


 --identify top 5 customers based on total sales value

 select top 5 CustomerID,ROUND(sum(QUANTITY*unitprice),2)as totalrevenue
 from ['Online Retail$']
 group by CustomerID
 order by totalrevenue desc


 

 --task 6(Analyse which productcategory generate the most sales revenue

 select 
 case
 WHEN Description like' %BLUE%' THEN 'BLUES'
 WHEN Description like' %CREAM%' THEN 'CREAM'
 WHEN Description like' %ROSE%' THEN 'ROSE'
 WHEN Description like' %GREEN%' THEN 'GREEN'
 ELSE 'OTHER'
 END AS product_categories,round(sum(quantity*unitprice),2)as total_revenue
 from ['Online Retail$']
 group by Description
 order by total_revenue;
 






