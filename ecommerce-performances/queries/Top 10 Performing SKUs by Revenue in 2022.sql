SELECT 
     sku.sku_name,
     sku.category,
     ROUND(SUM(after_discount)) total_sales,
     COUNT(DISTINCT customer_id) customer,
     COUNT(DISTINCT ord.id) total_order,
     SUM(qty_ordered) total_qty
FROM order_detail ord
LEFT JOIN sku_detail sku
ON ord.sku_id = sku.id
WHERE 
     is_valid = 1 AND 
     date_part('YEAR', order_date) = 2022
GROUP BY 1,2
ORDER BY ROUND(SUM(after_discount)) DESC
LIMIT 10;