SELECT
   sd.category,
   ROUND(SUM(od.after_discount)) total_revenue
FROM order_detail od
LEFT JOIN sku_detail sd 
ON sd.id = od.sku_id
WHERE
   is_valid = 1 AND 
   order_date between '2022-01-01' AND '2022-12-31'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5 ;