create database pizzaDB;

use pizzaDB;

select * from pizza_sales;

SELECT 
	SUM(total_price) "Total_Revenue" from pizza_sales;

select 
	SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value from pizza_sales;

select 
	sum(quantity) "Total_Pizza_Sold" from pizza_sales;

select 
	count(distinct order_id) "Total_Order" from pizza_Sales;

select 
	cast(sum(quantity)/count(distinct order_id) as DECIMAL(10,2))"Avg_Pizzas_per_order" from pizza_sales;

select 
	dayname(DW, order_date) as order_day, 
	count(distinct order_id) "Total_Orders" 
    from pizza_sales
	group by dayname(DW, order_date);

select 
	dayname(DW, order_date)"Order_day", 
	count(distinct order_id) "Total_Orders" 
    from pizza_sales 
    group by dayname(DW, order_date);

SELECT 
	DATENAME(DW, order_date) AS order_day, 
    COUNT(DISTINCT order_id) AS total_orders 
	FROM pizza_sales
	GROUP BY DATENAME(DW, order_date);

SELECT 
	DAYNAME(order_date) AS order_day, 
    COUNT(DISTINCT order_id) AS total_orders 
	FROM pizza_sales
	GROUP BY DAYNAME(order_date);

select 
	datename(month, order_date) AS Month_Name, 
    Count(distinct order_id) 
    from pizza_sales;

SELECT 
	monthname(order_date) AS order_day, 
    COUNT(DISTINCT order_id) AS total_orders 
	FROM pizza_sales
	GROUP BY monthNAME(order_date) 
    order by total_orders desc;

select 
	pizza_category, 
    sum(total_price) "Total_Sales", 
    sum(total_price) * 100 / (select sum(total_price) 
    from pizza_sales 
    where MONTH(order_date)=1) as PCT
	from pizza_sales 
	WHERE MONTh(Order_date) = 1
	GROUP BY pizza_category;

select * from pizza_sales;

SELECT 
    pizza_size,
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM 
    pizza_sales 
WHERE 
    QUARTER(order_date) = 1
GROUP BY 
    pizza_size
ORDER BY 
    PCT DESC;

SELECT 
	pizza_name, 
    SUM(total_price) as Total_Revenue from pizza_sales
    GROUP BY pizza_name
    ORDER BY Total_Revenue DESC;

SELECT
	pizza_name, 
    SUM(total_price) as Total_Revenue from pizza_sales
    GROUP BY pizza_name
    ORDER BY Total_Revenue DESC
    limit 5;
    
SELECT
	pizza_name, 
    SUM(total_price) as Total_Revenue from pizza_sales
    GROUP BY pizza_name
    ORDER BY Total_Revenue
    limit 5;
    
SELECT
	pizza_name, 
    SUM(quantity) as Total_Quantity from pizza_sales
    GROUP BY pizza_name
    ORDER BY Total_Quantity
    limit 5;  
  
SELECT
	pizza_name, 
    COUNT(DISTINCT order_id)as Total_Orders from pizza_sales
    GROUP BY pizza_name
    ORDER BY Total_Orders
    limit 5;  
    
desc
	pizza_sales;