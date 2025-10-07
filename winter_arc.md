```jsx
Write a query to calculate the cumulative total amount spent by each customer, ordered by order_date.
```
```jsx
SELECT 
    customer_id,
    order_date,
    SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS cumulative_total
FROM orders
ORDER BY customer_id, order_date;

```
