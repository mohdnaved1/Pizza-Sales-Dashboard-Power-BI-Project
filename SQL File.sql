# Total Revenue
SELECT sum(total_price) as Total_Revenue FROM pizza_sales;

# Average Order Value
select sum(total_price)/count(distinct order_id) as Avg_Order_Value from pizza_sales;

# Total Pizzas Sold
select sum(quantity) as Total_Pizzas_Sold from pizza_sales;

# Total Order
select count(distinct order_id) as Total_Order from pizza_sales;

# Average Pizzas Per Order
select sum(quantity)/count(distinct order_id) as Avg_pizza_Per_Order from pizza_sales;

# Daily trend for Total Orders
select dayname(order_date) as Order_Day, count(distinct order_id) as Total_Orders from pizza_sales group by dayname(order_date);

# Monthly Trend for Total Orders
select monthname(order_date) as Order_Month, count(distinct order_id) as Total_Orders from pizza_sales group by monthname(order_date);

# Percentage of Sales by Pizza Category
select pizza_category, sum(total_price)*100/(select sum(total_price) from pizza_sales) as Percentage_Of_Sales_By_Category 
from pizza_sales group by pizza_category;

# Percentage of Sales by Pizza Size
select pizza_size, sum(total_price)*100/(select sum(total_price) from pizza_sales) as Percentage_Of_Sales_By_Pizza_Size 
from pizza_sales group by pizza_size;

# Top 5 Best Sellers by Revenue, Total Quantity and Total Orders
select pizza_name, sum(total_price) as Revenue, sum(quantity) as Total_Quantity, count(distinct order_id) as Total_Orders
from pizza_sales group by pizza_name order by Revenue desc, Total_Quantity desc, Total_Orders desc limit 5;

# Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders
select pizza_name, sum(total_price) as Revenue, sum(quantity) as Total_Quantity, count(distinct order_id) as Total_Orders
from pizza_sales group by pizza_name order by Revenue, Total_Quantity, Total_Orders limit 5;