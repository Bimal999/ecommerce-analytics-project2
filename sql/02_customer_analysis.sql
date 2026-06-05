
-- Total Customers

SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM analytics.ecommerce_data

-- Revenue by Customer Segment

SELECT
    customer_segment,
    ROUND(SUM(total_price_usd)::numeric,2) AS revenue,
    ROUND(SUM(profit_usd)::numeric,2) AS profit
FROM analytics.ecommerce_data
GROUP BY customer_segment
ORDER BY revenue DESC;

-- Revenue by Age Group

SELECT
    age_group,
    ROUND(SUM(total_price_usd)::numeric,2) AS revenue,
    ROUND(SUM(profit_usd)::numeric,2) AS profit
FROM analytics.ecommerce_data
GROUP BY age_group
ORDER BY revenue DESC;

-- Top Customers by Revenue

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(total_price_usd)::numeric,2) AS revenue
FROM analytics.ecommerce_data
GROUP BY customer_id, customer_name
ORDER BY revenue DESC
LIMIT 20;


-- Average Revenue per Customer

SELECT
    ROUND((
        SUM(total_price_usd)
        /
        COUNT(DISTINCT customer_id))::numeric,
        2
    ) AS revenue_per_customer
FROM analytics.ecommerce_data;