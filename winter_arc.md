
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

# 8 find the TOP 3 highest salary in each department
```jsx
mysql> with ranked as(
    -> select
    -> employee_id,
    -> employee_name,
    -> department_id,
    -> salary,
    -> dense_rank() over (partition by department_id order by salary desc) as rnk
    -> from employee)
    -> select *from ranked where rnk <=3;
+-------------+----------------+---------------+-----------+-----+
| employee_id | employee_name  | department_id | salary    | rnk |
+-------------+----------------+---------------+-----------+-----+
|         120 | Unassigned Dev |          NULL |  55000.00 |   1 |
|         105 | Robert Lee     |            10 | 110000.00 |   1 |
|         107 | David Wilson   |            10 |  70000.00 |   2 |
|         116 | Tom Hanks      |            10 |  65000.00 |   3 |
|         117 | Will Smith     |            20 |  72000.00 |   1 |
|         108 | Jessica Chen   |            20 |  50000.00 |   2 |
|         101 | Sarah Connor   |            30 | 150000.00 |   1 |
|         102 | John Smith     |            30 | 120000.00 |   2 |
|         103 | Jane Doe       |            30 |  95000.00 |   3 |
|         119 | Leo DiCaprio   |            30 |  95000.00 |   3 |
|         109 | Michael Wang   |            40 |  85000.00 |   1 |
|         113 | Lisa Ray       |            40 |  45000.00 |   2 |
|         114 | Ben Gates      |            40 |  45000.00 |   2 |
|         118 | Jennifer Fox   |            50 | 130000.00 |   1 |
|         110 | Chris Martin   |            50 | 105000.00 |   2 |
|         111 | Kelly Clark    |            50 |  75000.00 |   3 |
+-------------+----------------+---------------+-----------+-----+
16 rows in set (0.01 sec)
```
# 9 Rank the customer by total-purchase.
```jsx
mysql> SELECT
    ->     customer_id,
    ->     SUM(total_amount) AS total_spent,
    ->     RANK() OVER (ORDER BY SUM(total_amount) DESC) AS ranking
    -> FROM orders
    -> GROUP BY customer_id;
+-------------+-------------+---------+
| customer_id | total_spent | ranking |
+-------------+-------------+---------+
|         203 |     9150.00 |       1 |
|         201 |     9120.00 |       2 |
|         205 |     6600.00 |       3 |
|         202 |     1620.00 |       4 |
|         206 |     1300.00 |       5 |
|         210 |      900.00 |       6 |
|         209 |      840.00 |       7 |
|         207 |      300.00 |       8 |
|         204 |      200.00 |       9 |
|         208 |      150.00 |      10 |
+-------------+-------------+---------+
10 rows in set (0.01 sec)
```
# 10. Find Top 2 most order per customer.

```jsx
mysql> with ranked as(
    -> select
    -> customer_id,
    -> order_id,
    -> order_date,
    -> row_number() over (partition by customer_id order by order_date desc) as rnk
    -> from orders)
    -> select *from ranked where rnk<=2;
+-------------+----------+------------+-----+
| customer_id | order_id | order_date | rnk |
+-------------+----------+------------+-----+
|         201 |      424 | 2024-09-01 |   1 |
|         201 |      412 | 2024-04-15 |   2 |
|         202 |      413 | 2024-05-01 |   1 |
|         202 |      404 | 2024-02-01 |   2 |
|         203 |      422 | 2024-08-10 |   1 |
|         203 |      419 | 2024-07-15 |   2 |
|         204 |      417 | 2024-06-10 |   1 |
|         204 |      406 | 2024-02-10 |   2 |
|         205 |      418 | 2024-07-01 |   1 |
|         205 |      407 | 2024-03-01 |   2 |
|         206 |      420 | 2024-07-20 |   1 |
|         206 |      409 | 2024-03-20 |   2 |
|         207 |      410 | 2024-04-01 |   1 |
|         208 |      415 | 2024-05-10 |   1 |
|         209 |      425 | 2024-09-15 |   1 |
|         209 |      421 | 2024-08-01 |   2 |
|         210 |      423 | 2024-08-20 |   1 |
+-------------+----------+------------+-----+
17 rows in set (0.01 sec)
```
# 11. find the highest-paid employee in each department.
```jsx
mysql> SELECT
    ->     employee_name,
    ->     department_id,
    ->     salary
    -> FROM employee e1
    -> WHERE salary = (
    ->     SELECT MAX(salary)
    ->     FROM employee e2
    ->     WHERE e2.department_id = e1.department_id
    -> );
+---------------+---------------+-----------+
| employee_name | department_id | salary    |
+---------------+---------------+-----------+
| Sarah Connor  |            30 | 150000.00 |
| Robert Lee    |            10 | 110000.00 |
| Michael Wang  |            40 |  85000.00 |
| Will Smith    |            20 |  72000.00 |
| Jennifer Fox  |            50 | 130000.00 |
+---------------+---------------+-----------+
5 rows in set (0.02 sec)
```
# 12 Find all employees who earn more than the average salary.
```jsx
WITH AvgSalary AS (
    SELECT AVG(Salary) AS avg_sal
    FROM Employees
)
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT avg_sal FROM AvgSalary);

```
# 13 Total salary per department, then select departments with total salary > 9000.
```jsx
WITH DeptSalary AS (
    SELECT Department, SUM(Salary) AS total_salary
    FROM Employees
    GROUP BY Department
)
SELECT *
FROM DeptSalary
WHERE total_salary > 9000;

```
# 14 Assign row number to employees per department by descending salary and pick highest per department.
```jsx
WITH RankedEmp AS (
    SELECT Name, Department, Salary,
           ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS rn
    FROM Employees
)
SELECT Name, Department, Salary
FROM RankedEmp
WHERE rn = 1;

```
# :15  Calculate total sales per month, return months with sales > 50000.
```jsx
WITH MonthlySales AS (
    SELECT YEAR(OrderDate) AS yr, MONTH(OrderDate) AS mon, SUM(Amount) AS total_sales
    FROM Sales
    GROUP BY YEAR(OrderDate), MONTH(OrderDate)
)
SELECT *
FROM MonthlySales
WHERE total_sales > 50000;

```
# 16 Find employees in IT department and earning more than 5000.
```jsx
WITH HighSalary AS (
    SELECT EmployeeID, Name
    FROM Employees
    WHERE Salary > 5000
),
ITDept AS (
    SELECT EmployeeID, Name
    FROM Employees
    WHERE Department = 'IT'
)
SELECT h.Name
FROM HighSalary h
INNER JOIN ITDept i ON h.EmployeeID = i.EmployeeID;

```
# 17 Consecutive Numbers
```jsx
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        id - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS grp
    FROM Logs
) t
GROUP BY num, grp
HAVING COUNT(*) >= 3;

```
# 18 employees who earn more than their managers.
```jsx
SELECT e.name AS Employee
FROM Employee e
JOIN Employee m
ON e.managerId = m.id
WHERE e.salary > m.salary;

```
# 19 Duplicate Emails.
```jsx
SELECT 
    email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

```
