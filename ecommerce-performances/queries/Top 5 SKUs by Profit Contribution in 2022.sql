WITH profit AS (
SELECT
  ord.id,
  sku.sku_name,
  ord.after_discount - (sku.cogs * ord.qty_ordered) AS profit
FROM 
  order_detail AS ord
LEFT JOIN 
  sku_detail AS sku 
  ON sku.id = ord.sku_id
WHERE
  is_valid = 1 AND
  order_date BETWEEN '2022-01-01' AND '2022-12-31' AND
  sku.category = 'Women Fashion'
)
SELECT 
  sku_name,
  SUM(profit) AS total_profit
FROM 
  profit
GROUP BY 
  sku_name
ORDER BY 
  total_profit DESC
LIMIT 5;