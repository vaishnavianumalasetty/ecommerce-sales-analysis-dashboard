CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;
create table sales_data(
 order_id  varchar(50),
order_date varchar(20), 
 customer_id varchar(50), 
 product_category varchar(50),product_name varchar(50),state varchar(50),city varchar(50),payment_mode varchar(50),
quantity int,sales_amount varchar(50),   
 discount varchar(50),profit varchar(50) 
);

SELECT * FROM sales_data;
select count(order_id) from sales_data;
SELECT COUNT(*) FROM sales_data;
DESCRIBE sales_data;
SELECT * FROM sales_data LIMIT 5;

SELECT COUNT(*)  as Count FROM sales_data;
SELECT * 
FROM sales_data
LIMIT 10;

SELECT ORDER_ID,COUNT(ORDER_ID)
FROM SALES_DATA
GROUP BY ORDER_ID
HAVING COUNT(ORDER_ID)>1;

SELECT CUSTOMER_ID,COUNT(CUSTOMER_ID)
FROM SALES_DATA
GROUP BY CUSTOMER_ID
HAVING COUNT(CUSTOMER_ID)>1;

select customer_id from sales_data
where customer_id is null or customer_id = '';

select order_date from sales_data
where order_date is null or order_date = '';

select product_name from sales_data
where product_name is null or product_name = '';

select sales_amount from sales_data
where sales_amount is null or sales_amount = '';

select profit from sales_data
where profit is null or profit = '';

SELECT 
order_date,
STR_TO_DATE(order_date,'%d-%m-%Y')
FROM sales_data
LIMIT 5;
ALTER TABLE sales_data
add cleaned_date date;
desc sales_data;
SET SQL_SAFE_UPDATES = 0;
update sales_data 
set cleaned_date=str_to_date(order_date,'%d-%m-%Y');

SELECT order_date, cleaned_date
FROM sales_data
LIMIT 10;

SELECT sales_amount, profit, discount
FROM sales_data
LIMIT 10;
alter table sales_data
add cleaned_sales int;

update sales_data
set cleaned_sales=cast(sales_amount as decimal(10,2));

SELECT sales_amount, cleaned_sales
FROM sales_data
LIMIT 10;

alter table sales_data
add upd_discount decimal(10,2);
SELECT discount, upd_discount
FROM sales_data
LIMIT 10;

SELECT discount
FROM sales_data
LIMIT 10;

update sales_data
set upd_discount=cast(discount as decimal(10,2));

alter table sales_data
add upd_profit decimal(10,2);

update sales_data
set upd_profit=cast(profit as decimal(10,2));

SELECT profit, upd_profit
FROM sales_data
LIMIT 10;
DESC sales_data;
select upd_profit from sales_data;
select sum(sales_amount) as sum
from sales_data;

select sum(profit) as Total_Profit
from sales_data;

select count(order_id) as count 
from sales_data;

select avg(discount) as avg
from sales_data;

select sum(quantity) as Quantity_count
from sales_data;

select sum(sales_amount),state 
from sales_data
group by state
order by  sum(sales_amount) desc 
limit 1;

select product_category,sum(sales_amount)
from sales_data
group by product_category
order by  sum(sales_amount)  desc
limit 1;

select payment_mode,count(payment_mode)
from sales_data
group by payment_mode 
order by count(payment_mode)  desc 
limit 1;

select sum( sales_amount),month(order_date)  as Month
from sales_data
group by month(order_date)
order by month(order_date) asc;

select sum(profit),product_name
from sales_data
group by product_name
order by sum(profit) desc
limit 1;
select * from sales_data;