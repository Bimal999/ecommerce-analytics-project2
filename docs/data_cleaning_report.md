# Data Cleaning Report

## Objective

Validate dataset quality and prepare data for analysis.

## Cleaning Activities

### Date Conversion

Converted `order_date` from string to datetime.

### Duplicate Check

- Duplicate Rows Found: 0
- Action Taken: None required

### Missing Values

| Column | Missing Count | Action |
|----------|----------:|----------|
| return_reason | 900244 | Business Null |
| coupon_code | 500083 | Business Null |
| customer_feedback | 199617 | Business Null |

### Age Validation

| Metric | Value |
|----------|----------:|
| Min Age | 18 |
| Max Age | 75 |
| Mean Age | 46.49 |

Result: No anomalies detected.

## Outcome

Dataset approved for EDA and SQL analysis.