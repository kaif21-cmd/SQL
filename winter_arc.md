
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
#4  We have a table products(product_id, product_name, price, category).Write a query to find all products whose price is above the average price of all products.
```jsx
SELECT product_id, product_name, price, category
FROM products
WHERE price > (SELECT AVG(price) FROM products);

```

# 5 We have a table employees(emp_id, emp_name, department, salary) Write a query to find the average salary per department, but only for departments where the average salary is greater than 50000.
```jsx
SELECT department, AVG(salary) AS avg_salary FROM employee GROUP BY department HAVING AVG(salary) > 50000;
```
# 6 Ranke employee based on salary with in each department
```jsx
mysql> select
    -> employee_name,
    -> salary,
    -> department_id
    -> ,
    -> rank() over (partition by department_id order by salary desc) as salary_department_wise
    -> from employee;
```
# 7 ranking the whole table using the row_number.
```jsx
mysql> select
    -> employee_id,
    -> employee_name,
    -> salary,
    -> row_number() over (order by employee_id desc) as ranking_wise
    -> from employee;
+-------------+----------------+-----------+--------------+
| employee_id | employee_name  | salary    | ranking_wise |
+-------------+----------------+-----------+--------------+
|         120 | Unassigned Dev |  55000.00 |            1 |
|         119 | Leo DiCaprio   |  95000.00 |            2 |
|         118 | Jennifer Fox   | 130000.00 |            3 |
|         117 | Will Smith     |  72000.00 |            4 |
|         116 | Tom Hanks      |  65000.00 |            5 |
|         115 | Sophia Hill    |  90000.00 |            6 |
|         114 | Ben Gates      |  45000.00 |            7 |
|         113 | Lisa Ray       |  45000.00 |            8 |
|         112 | Steven Hall    |  40000.00 |            9 |
|         111 | Kelly Clark    |  75000.00 |           10 |
|         110 | Chris Martin   | 105000.00 |           11 |
|         109 | Michael Wang   |  85000.00 |           12 |
|         108 | Jessica Chen   |  50000.00 |           13 |
|         107 | David Wilson   |  70000.00 |           14 |
|         106 | Emily Brown    |  60000.00 |           15 |
|         105 | Robert Lee     | 110000.00 |           16 |
|         104 | Alex Johnson   |  80000.00 |           17 |
|         103 | Jane Doe       |  95000.00 |           18 |
|         102 | John Smith     | 120000.00 |           19 |
|         101 | Sarah Connor   | 150000.00 |           20 |
+-------------+----------------+-----------+--------------+
20 rows in set (0.00 sec)
```

