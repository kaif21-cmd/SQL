
 #  question 1 Write a query to calculate the cumulative total amount spent by each customer, ordered by order_date.

```jsx
SELECT 
    customer_id,
    order_date,
    SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS cumulative_total
FROM orders
ORDER BY customer_id, order_date;

```

# 2 We have a table orders(order_id, customer_id, order_date, total_amount) Write a query to find the month-wise total sales for the year 2025, showing month and total_sales
```jsx
SELECT 
    MONTH(order_date) AS month,
    SUM(total_amount) AS month_wise_total
FROM orders
WHERE YEAR(order_date) = 2025
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date);

```
# 3 We have a table employees(emp_id, emp_name, department, salary).  Write a query to find the departments that have more than 5 employee

```jsx
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

```
