SELECT
  sku.category,
  COUNT(DISTINCT CASE WHEN pay.payment_method = 'cod' THEN ord.id END) AS cod,
  COUNT(DISTINCT CASE WHEN pay.payment_method = 'Easypay' THEN ord.id END) AS easypay,
  COUNT(DISTINCT CASE WHEN pay.payment_method = 'Payaxis' THEN ord.id END) AS payaxis,
  COUNT(DISTINCT CASE WHEN pay.payment_method = 'customercredit' THEN ord.id END) AS customercredit,
  COUNT(DISTINCT CASE WHEN pay.payment_method = 'jazzwallet' THEN ord.id END) AS jazzwallet
FROM 
  order_detail AS ord
LEFT JOIN 
  payment_detail pay 
  ON pay.id = ord.payment_id
LEFT JOIN 
  sku_detail sku 
  ON sku.id = ord.sku_id
WHERE 
  is_valid = 1 AND
  order_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY 
  sku.category
ORDER BY 
  cod DESC
LIMIT 5;