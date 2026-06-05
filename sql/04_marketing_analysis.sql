
-- Revenue by Campaign Source

SELECT
    campaign_source,
    ROUND(SUM(total_price_usd)::numeric, 2) AS revenue,
    ROUND(SUM(profit_usd)::numeric, 2) AS profit
FROM analytics.ecommerce_data
GROUP BY campaign_source
ORDER BY revenue DESC;


-- Revenue by Traffic Source

SELECT
    traffic_source,
    ROUND(SUM(total_price_usd)::numeric, 2) AS revenue,
    ROUND(SUM(profit_usd)::numeric, 2) AS profit
FROM analytics.ecommerce_data
GROUP BY traffic_source
ORDER BY revenue DESC;



-- Orders by Traffic Source

SELECT
    traffic_source,
    COUNT(DISTINCT order_id) AS total_orders
FROM analytics.ecommerce_data
GROUP BY traffic_source
ORDER BY total_orders DESC;



-- Average Order Value by Traffic Source

SELECT
    traffic_source,
    ROUND((
        SUM(total_price_usd)
        /
        COUNT(DISTINCT order_id))::numeric,
        2
    ) AS avg_order_value
FROM analytics.ecommerce_data
GROUP BY traffic_source
ORDER BY avg_order_value DESC;


-- Revenue by Device Type

SELECT
    device_type,
    ROUND(SUM(total_price_usd), 2) AS revenue,
    ROUND(SUM(profit_usd), 2) AS profit
FROM analytics.ecommerce_data
GROUP BY device_type
ORDER BY revenue DESC;

-- Customer Engagement Analysis

SELECT
    traffic_source,
    ROUND(AVG(session_duration_minutes)::numeric, 2) AS avg_session_duration,
    ROUND(AVG(pages_visited)::numeric, 2) AS avg_pages_visited
FROM analytics.ecommerce_data
GROUP BY traffic_source
ORDER BY avg_session_duration DESC;


-- Abandoned Cart Analysis

SELECT
    traffic_source,
    ROUND(
        AVG(
            CASE
                WHEN abandoned_cart_before = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100,
        2
    ) AS abandoned_cart_rate
FROM analytics.ecommerce_data
GROUP BY traffic_source
ORDER BY abandoned_cart_rate DESC;



-- Coupon Performance

SELECT
    coupon_used,
    COUNT(*) AS orders,
    ROUND(SUM(total_price_usd)::numeric, 2) AS revenue
FROM analytics.ecommerce_data
GROUP BY coupon_used;




-- Campaign Performance Ranking

SELECT
    campaign_source,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(total_price_usd)::numeric, 2) AS revenue,
    ROUND(SUM(profit_usd)::numeric, 2) AS profit
FROM analytics.ecommerce_data
GROUP BY campaign_source
ORDER BY profit DESC;




-- Customer Sentiment by Traffic Source

SELECT
    traffic_source,
    review_sentiment,
    COUNT(*) AS reviews
FROM analytics.ecommerce_data
GROUP BY traffic_source, review_sentiment
ORDER BY traffic_source, reviews DESC;