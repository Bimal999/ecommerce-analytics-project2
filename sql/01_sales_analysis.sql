-- Total Revenue

SELECT
    ROUND(SUM(total_price_usd),2) AS total_revenue
FROM analytics.ecommerce_data;


-- Total Profit

SELECT
    ROUND(SUM(profit_usd),2) AS total_profit
FROM analytics.ecommerce_data;


-- Average Order Value

SELECT
    ROUND(
        SUM(total_price_usd) /
        COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM analytics.ecommerce_data;




-- Profit Margin

SELECT
    ROUND(
        SUM(profit_usd)::numeric
        /
        SUM(total_price_usd)::numeric
        * 100,
        2
    ) AS profit_margin_percent
FROM analytics.ecommerce_data;


-- Revenue by Country

SELECT
    country,
    ROUND(SUM(total_price_usd),2) AS revenue
FROM analytics.ecommerce_data
GROUP BY country
ORDER BY revenue DESC;