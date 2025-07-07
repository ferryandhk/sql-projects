WITH tab_brand AS (
SELECT
  id,
  (CASE 
     WHEN LOWER(sku_name) LIKE '%samsung%' THEN 'Samsung'
     WHEN LOWER(sku_name) LIKE '%apple%' OR LOWER(sku_name) LIKE '%iphone%' THEN 'Apple'
     WHEN LOWER(sku_name) LIKE '%sony%' THEN 'Sony'
     WHEN LOWER(sku_name) LIKE '%huawei%' THEN 'Huawei'
     WHEN LOWER(sku_name) LIKE '%lenovo%' THEN 'Lenovo'
  END) AS brand
FROM 
  sku_detail
)
SELECT 
  sku.brand,
  ROUND(SUM(ord.after_discount)) AS total_revenue
FROM
  order_detail AS ord
LEFT JOIN
  tab_brand AS sku
  ON ord.sku_id = sku.id
WHERE
  is_valid = 1 AND
  brand IS NOT NULL
GROUP BY
  sku.brand
ORDER BY
  total_revenue DESC;