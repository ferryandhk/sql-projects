SELECT
    category,
    SUM(CASE
        WHEN EXTRACT(YEAR FROM order_date) = 2021 THEN ROUND(after_discount)
        ELSE 0
        END) AS revenue_2021,
    SUM(CASE
        WHEN EXTRACT(YEAR FROM order_date) = 2022 THEN ROUND(after_discount)
        ELSE 0
        END) AS revuenue_2022,
    SUM(CASE
        WHEN EXTRACT(YEAR FROM order_date) = 2022 THEN ROUND(after_discount)
        ELSE 0
        END) - SUM(CASE
        WHEN EXTRACT(YEAR FROM order_date) = 2021 THEN ROUND(after_discount)
        ELSE 0
        END) AS revenue_growth
FROM order_detail
LEFT JOIN sku_detail ON order_detail.sku_id = sku_detail.id
WHERE EXTRACT(YEAR FROM order_date) IN (2021, 2022) AND is_valid = 1
GROUP BY 1
ORDER BY 4 ASC;