CREATE DATABASE supply_chain_project;
USE supply_chain_project;
CREATE TABLE supply_chain_data (
    order_id INT,
    shipping_days INT,
    delivery_status VARCHAR(50),
    late_delivery_risk INT,
    customer_segment VARCHAR(50),
    market VARCHAR(50),
    order_city VARCHAR(100),
    order_country VARCHAR(100),
    order_date DATE,
    quantity INT,
    sales DECIMAL(10,2),
    profit DECIMAL(10,2),
    order_region VARCHAR(50),
    shipping_date DATE,
    shipping_mode VARCHAR(50),
    delivery_days INT,
    delay_status INT
);

ALTER TABLE supply_chain_final 
MODIFY profit VARCHAR(50);
ALTER TABLE supply_chain_final 
MODIFY delay_status VARCHAR(50);
SHOW VARIABLES LIKE 'secure_file_priv';
ALTER TABLE supply_chain_final 
MODIFY shipping_mode VARCHAR(50),
MODIFY delivery_status VARCHAR(50),
MODIFY customer_segment VARCHAR(50),
MODIFY market VARCHAR(50),
MODIFY order_city VARCHAR(100),
MODIFY order_country VARCHAR(100),
MODIFY order_region VARCHAR(50),
MODIFY delay_status VARCHAR(50);
TRUNCATE TABLE supply_chain_final;
SELECT COUNT(*) FROM supply_chain_final;

/*Top Performing Countries by Profit*/

SELECT order_country,
       SUM(profit) AS total_profit
FROM supply_chain_final
GROUP BY order_country
ORDER BY total_profit DESC
LIMIT 10;

/*Top 10 High-Profit Orders*/

SELECT order_id,
       order_country,
       profit
FROM supply_chain_final
ORDER BY profit DESC
LIMIT 10;

/*Delivery Performance (On-time vs Delayed)*/

SELECT delay_status,
       COUNT(*) AS total_orders
FROM supply_chain_final
GROUP BY delay_status;

/*Average Delivery Time*/

SELECT AVG(delivery_days) AS avg_delivery_days
FROM supply_chain_final;

/*Shipping Mode Analysis*/

SELECT shipping_mode,
       COUNT(*) AS total_orders
FROM supply_chain_final
GROUP BY shipping_mode
ORDER BY total_orders DESC;

/*Region-wise Sales Performance*/

SELECT order_region,
       SUM(sales) AS total_sales
FROM supply_chain_final
GROUP BY order_region
ORDER BY total_sales DESC;

/*Monthly Order Trends*/

SELECT MONTH(order_date) AS month,
       COUNT(*) AS total_orders
FROM supply_chain_final
GROUP BY MONTH(order_date)
ORDER BY month;

/*Customer Segment Analysis*/

SELECT customer_segment,
       COUNT(*) AS total_orders
FROM supply_chain_final
GROUP BY customer_segment;

/*Late Delivery Risk Impact*/

SELECT late_delivery_risk,
       COUNT(*) AS total_orders
FROM supply_chain_final
GROUP BY late_delivery_risk;

/*Profit by Shipping Mode*/

SELECT shipping_mode,
       SUM(profit) AS total_profit
FROM supply_chain_final
GROUP BY shipping_mode
ORDER BY total_profit DESC;
