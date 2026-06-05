
-- Top Products by Revenue

SELECT
    product_name,
    ROUND(SUM(total_price_usd)::numeric, 2) AS revenue
FROM analytics.ecommerce_data
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 20;


-- Top Products by Profit

SELECT
    product_name,
    ROUND(SUM(profit_usd)::numeric, 2) AS profit
FROM analytics.ecommerce_data
GROUP BY product_name
ORDER BY profit DESC
LIMIT 20;


-- Best-Selling Products

SELECT
    product_name,
    SUM(quantity) AS units_sold
FROM analytics.ecommerce_data
GROUP BY product_name
ORDER BY units_sold DESC
LIMIT 20;


-- Category Performance

SELECT
    category,
    COUNT(DISTINCT product_id) AS total_products,
    SUM(quantity) AS units_sold,
    ROUND(SUM(total_price_usd)::numeric, 2) AS revenue
FROM analytics.ecommerce_data
GROUP BY category
ORDER BY revenue DESC;



-- Brand Performance

SELECT
    brand,
    ROUND(SUM(total_price_usd)::numeric, 2) AS revenue,
    ROUND(SUM(profit_usd)::numeric, 2) AS profit
FROM analytics.ecommerce_data
GROUP BY brand
ORDER BY revenue DESC
LIMIT 20;


-- Product Rating Analysis

SELECT
    category,
    ROUND(AVG(product_rating_avg)::numeric, 2) AS avg_product_rating
FROM analytics.ecommerce_data
GROUP BY category
ORDER BY avg_product_rating DESC;



-- Return Rate by Category

SELECT
    category,
    ROUND((
        COUNT(return_reason) * 100.0
        / COUNT(*))::numeric,
        2
    ) AS return_rate_percent
FROM analytics.ecommerce_data
GROUP BY category
ORDER BY return_rate_percent DESC;