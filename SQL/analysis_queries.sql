--Calculate Total Sales
SELECT ROUND(SUM(sales), 2) AS total_sales
FROM global_superstore;

--Calculate Total Profit
SELECT ROUND(CAST(SUM(profit) AS NUMERIC), 2) AS total_profit
FROM global_superstore;

--Calculate Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM global_superstore;

--Calculate Average Order Value
SELECT ROUND(
    CAST(SUM(sales) / COUNT(DISTINCT order_id) AS NUMERIC),
    2
) AS average_order_value
FROM global_superstore;

--Top 10 Products by Sales
SELECT
    product_name,
    ROUND(CAST(SUM(sales) AS NUMERIC), 2) AS total_sales
FROM global_superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

--Sales and Profit by Category
SELECT
    category,
    ROUND(CAST(SUM(sales) AS NUMERIC), 2) AS total_sales,
    ROUND(CAST(SUM(profit) AS NUMERIC), 2) AS total_profit
FROM global_superstore
GROUP BY category
ORDER BY total_sales DESC;

--Sales and Profit by Region
SELECT
    region,
    ROUND(CAST(SUM(sales) AS NUMERIC), 2) AS total_sales,
    ROUND(CAST(SUM(profit) AS NUMERIC), 2) AS total_profit
FROM global_superstore
GROUP BY region
ORDER BY total_sales DESC;

--Top 10 Customers by Sales
SELECT
    customer_name,
    ROUND(CAST(SUM(sales) AS NUMERIC),2) AS total_sales
FROM global_superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

--Analyze Customer Segments
SELECT
    segment,
    ROUND(CAST(SUM(sales) AS NUMERIC),2) AS total_sales,
    ROUND(CAST(SUM(profit) AS NUMERIC),2) AS total_profit,
    COUNT(DISTINCT customer_id) AS customers
FROM global_superstore
GROUP BY segment
ORDER BY total_sales DESC;

--Which Sub-Categories Generate the Most Profit
SELECT
    sub_category,
    ROUND(CAST(SUM(profit) AS NUMERIC),2) AS total_profit
FROM global_superstore
GROUP BY sub_category
ORDER BY total_profit DESC
LIMIT 10;

--Find Loss-Making Sub-Categories
SELECT
    sub_category,
    ROUND(CAST(SUM(profit) AS NUMERIC),2) AS total_profit
FROM global_superstore
GROUP BY sub_category
ORDER BY total_profit ASC
LIMIT 10;

--Analyze the Impact of Discounts on Profit
SELECT
    discount,
    ROUND(CAST(AVG(profit) AS NUMERIC),2) AS avg_profit,
    COUNT(*) AS orders
FROM global_superstore
GROUP BY discount
ORDER BY discount;
