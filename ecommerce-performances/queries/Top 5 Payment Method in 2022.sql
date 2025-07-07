SELECT  
   py.payment_method,
   COUNT(DISTINCT ord.id) total_order
FROM order_detail ord
LEFT JOIN payment_detail py
ON ord.payment_id = py.id
WHERE EXTRACT(YEAR FROM order_date) = 2022 AND is_valid = 1
GROUP BY 1
ORDER BY COUNT(DISTINCT ord.id) DESC
LIMIT 5