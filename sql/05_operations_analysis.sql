
-- Average Delivery Time

SELECT
    ROUND(AVG(delivery_days)::numeric, 2) AS avg_delivery_days
FROM analytics.ecommerce_data;


-- Delivery Performance

SELECT
    delivery_performance,
    COUNT(*) AS orders
FROM analytics.ecommerce_data
GROUP BY delivery_performance;


-- Shipping Method Performance

SELECT
    shipping_method,
    COUNT(*) AS orders,
    ROUND(AVG(delivery_days)::numeric, 2) AS avg_delivery_days,
    ROUND(SUM(total_price_usd)::numeric, 2) AS revenue
FROM analytics.ecommerce_data
GROUP BY shipping_method
ORDER BY revenue DESC;



-- Return Rate

SELECT
    ROUND((
        COUNT(return_reason) * 100.0
        / COUNT(*))::numeric,
        2
    ) AS return_rate_percent
FROM analytics.ecommerce_data;



-- Return Reasons

SELECT
    return_reason,
    COUNT(*) AS returns
FROM analytics.ecommerce_data
WHERE return_reason IS NOT NULL
GROUP BY return_reason
ORDER BY returns DESC;



-- Returns by Category

SELECT
    category,
    ROUND(
        COUNT(return_reason) * 100.0
        / COUNT(*),
        2
    ) AS return_rate_percent
FROM analytics.ecommerce_data
GROUP BY category
ORDER BY return_rate_percent DESC;



-- Support Tickets

SELECT
    support_ticket_created,
    COUNT(*) AS orders
FROM analytics.ecommerce_data
GROUP BY support_ticket_created;




-- Support Tickets by Category

SELECT
    category,
    COUNT(*) FILTER (
        WHERE support_ticket_created = 'Yes'
    ) AS support_tickets
FROM analytics.ecommerce_data
GROUP BY category
ORDER BY support_tickets DESC;


-- Fraud Risk Distribution

SELECT
    CASE
        WHEN fraud_risk_score < 30 THEN 'Low Risk'
        WHEN fraud_risk_score < 70 THEN 'Medium Risk'
        ELSE 'High Risk'
    END AS risk_level,
    COUNT(*) AS orders
FROM analytics.ecommerce_data
GROUP BY risk_level;



-- Revenue at Fraud Risk

SELECT
    ROUND(
        SUM(total_price_usd)::numeric,
        2
    ) AS high_risk_revenue
FROM analytics.ecommerce_data
WHERE fraud_risk_score >= 70;