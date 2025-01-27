Create database Marketing;
use marketing;
Create table Sales(
saleid int,
productid int,
customerid int,
saledate date,
quantity int,
unitprice int,
region varchar(50));

select * from Sales;

insert into Sales(saleid,productid,customerid,saledate,quantity,unitprice,region)
values(1,101,1001,"2024-01-05",5,200,"North"),
	  (2,102,1002,"2024-01-10",10,150,"East"),
      (3,103,1003,"2024-02-15",2,300,"North"),
      (4,104,1001,"2024-02-20",7,250,"West"),
      (5,101,1004,"2024-03-05",1,200,"East");

#1.Write a query to calculate the total sales (Quantity * UnitPrice) for each product.#
SELECT productid,sum(quantity * unitprice) as totalsales from Sales group by productid;
#2.Write a query to find the total number of products sold in each region.#
select region,sum(quantity) as totalproductssold from Sales group by region;
#3.Write a query to get the average sales amount per product.#
select productid,avg(unitprice) as avgsalesamount from Sales group by productid;  
#4.Find the regions where total sales are more than 3000.#
select region,sum(unitprice) as totalsales from Sales group by region having sum(unitprice) > 3000;   
#5.Write a query to get the maximum quantity sold for each product.#
select productid,max(quantity) as max_quantity_sold from Sales group by productid;
#6.Write a query to calculate the average quantity of products sold per region.#
select region,avg(quantity) as average_quantity_sold from Sales group by region;
#7.Find the product IDs that have generated a total sales amount of more than 1000.#
select productid from Sales where productid in (select productid from Sales group by productid having sum(unitprice) > 1000);
#8.Write a query to get the total number of sales (rows) made for each customer.#
select customerid, COUNT(*) as total_sales from Sales group by customerid;
#9.Find the products for which the average quantity sold is less than 5.#
select productid,avg(quantity) as average_quantity from Sales group by productid having avg(quantity) < 5;

#10.Write a query to find the sum of total sales for each customer in each region.#
select region, sum(quantity*unitprice) as total_sales
from sales
group by region;

#11.Write a query to calculate the total sales for each month.#
select month("2024-01-05") as month,sum(saledate) as total_sales from Sales group by month("2024-03-05");
#12.Find the regions where the average unit price is more than 200.#
select region,avg(unitprice) as average_price from Sales group by region having avg(unitprice) > 200;
#13.Write a query to get the minimum and maximum quantity sold per region.#
select region,min(quantity)as min_quantity_sold,max(quantity) as max_quantity_sold from Sales group by region;
#14.Find the customers who have made more than 2 purchases.#
select customerid,count(*) as total_purchases from Sales group by customerid having count(*) > 2;
#15.Write a query to find the total sales for each product and filter only those products where the total sales exceed 1500.#
select productid,sum(unitprice) as total_sales from Sales group by productid having sum(unitprice) > 1500;
      
