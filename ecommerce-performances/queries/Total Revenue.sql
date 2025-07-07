SELECT
  TO_CHAR(order_date, 'Month') AS month_2021, 
  ROUND(SUM(after_discount)) AS total_revenue
FROM
  order_detail
WHERE
  is_valid =1 AND
  order_date BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY
  1
ORDER BY
  2 DESC;
