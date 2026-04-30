-- KPI's REQUIREMENT

-- QUESTION 1: TOTAL REVENUE
SELECT 
    SUM(total_price) AS Total_Revenue
FROM
    sales;


-- QUESTION 2:  AVERAGE ORDER VALUE
SELECT 
    SUM(total_price) / COUNT(DISTINCT (order_id)) AS Avg_Order_Value
FROM
    sales;


-- QUESTION 3: TOTAL PIZZAS SOLD
SELECT 
    SUM(quantity) AS Total_Pizza_Sold
FROM
    sales;


-- QUESTION 4: TOTAL ORDERS 
SELECT 
    COUNT(DISTINCT (order_id)) AS Total_orders
FROM
    sales;


-- QUESTION 5: AVERAGE PIZZAS PER ORDER 
SELECT 
    SUM(quantity) / COUNT(DISTINCT (order_id)) AS Average_Pizza_per_order
FROM
    sales;

-- CHARTS REQUIREMENT

-- QUESTION 1: DAILY TREND FOR TOTAL ORDERS 
SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%y')) AS order_day,
    COUNT(DISTINCT (order_id)) AS Total_orders
FROM
    sales
GROUP BY order_day;


-- QUESTION 2: MONTHLY TREND FOR TOTAL ORDERS
SELECT 
    MONTHNAME(STR_TO_DATE(order_Date, '%d-%m-%y')) AS order_month,
    COUNT(DISTINCT (order_id)) AS Total_order
FROM
    sales
GROUP BY MONTHNAME(STR_TO_DATE(order_Date, '%d-%m-%y'))
ORDER BY total_order DESC;


-- QUESTION 3: PERCENTAGE OF SALES BY PIZZA CATEGORY 
SELECT 
    pizza_category,
    (SUM(total_price) * 100) / (SELECT 
            SUM(total_price)
        FROM
            sales) AS PCT
FROM
    sales
GROUP BY pizza_category;


--  QUESTION 5: PERCENTAGE OF SALES BY PIZZA SIZE
SELECT 
    pizza_size,
    ROUND((SUM(total_price) * 100) / (SELECT 
                    SUM(total_price)
                FROM
                    sales),
            2) AS PCT
FROM
    sales
GROUP BY pizza_size
ORDER BY pct DESC;


-- QUESTION 6: TOP 5 BEST SELLERS BY REVENUE
SELECT 
    pizza_name, SUM(total_price) AS Total_Revenue
FROM
    sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;


-- QUESTION 7: TOP 5 BEST SELLERS BY QUANTITY  
SELECT 
    pizza_name, SUM(quantity) AS Total_quantity
FROM
    sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC
LIMIT 5;


-- QUESTION 8: TOP 5 BEST SELLERS BY TOTAL ORDERS
SELECT 
    pizza_name, SUM(DISTINCT (order_id)) AS Total_orders
FROM
    sales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;


-- QUESTION 9: BOTTOM 5 BEST SELLERS BY REVENUE
SELECT 
    pizza_name, SUM(total_price) AS Total_Revenue
FROM
    sales
GROUP BY pizza_name
ORDER BY Total_Revenue
LIMIT 5;

 
 -- QUESTION 10: BOTTOM 5 BEST SELLERS BY QUANTITY
SELECT 
    pizza_name, SUM(quantity) AS Total_quantity
FROM
    sales
GROUP BY pizza_name
ORDER BY Total_quantity
LIMIT 5;


-- QUESTION 11: BOTTOM 5 BEST SELLERS BY TOTAL ORDERS
SELECT 
    pizza_name, SUM(DISTINCT (order_id)) AS Total_orders
FROM
    sales
GROUP BY pizza_name
ORDER BY total_orders
LIMIT 5;