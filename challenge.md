# 1 Find employees earning more than the average salary in their department

```jsx
SELECT emp_id, emp_name, salary, department_id
FROM employees
WHERE salary > (SELECT AVG(salary) 
                FROM employees e2 
                WHERE e2.department_id = employees.department_id);

```
# 2 List products whose price is higher than the average price of their category Use products table with columns: product_id, product_name, category_id, price.

```jsx
SELECT product_id, product_name, category_id, price
FROM products p1
WHERE price > (
    SELECT AVG(price)
    FROM products p2
    WHERE p2.category_id = p1.category_id
);

```
# 3 . Find customers who have placed orders with total amount greater than 5000 Tables: customers(customer_id, name) and orders(order_id, customer_id, total_amount)

```jsx
SELECT c.customer_id, c.name, o.order_id, o.customer_id, o.total_amount
FROM customers AS c
JOIN orders AS o 
    ON c.customer_id = o.customer_id
WHERE o.total_amount > 5000;

```
# 4 4. List employees who have the second highest salary

```jsx
SELECT emp_id, emp_name, salary
FROM employee
WHERE salary = (
    SELECT MAX(salary)
    FROM employee
    WHERE salary < (SELECT MAX(salary) FROM employee)
);

```
# 5. Find students who scored above the average in all subjects Tables: students(student_id, name) and marks(student_id, subject_id, score)

```jsx
SELECT s.student_id, s.name, m.subject_id, m.score
FROM students AS s
JOIN marks AS m 
    ON s.student_id = m.student_id
WHERE m.score > (
    SELECT AVG(m2.score)
    FROM marks m2
    WHERE m2.subject_id = m.subject_id
);

```
```jsx
SELECT s.student_id, s.name
FROM students s
JOIN marks m ON s.student_id = m.student_id
GROUP BY s.student_id, s.name
HAVING AVG(m.score) > (SELECT AVG(score) FROM marks);

```
# . 6 Find the top 3 customers based on total order amount
```jsx
SELECT c.customer_id, c.name, total_amount
FROM customers c
JOIN (
    SELECT customer_id, SUM(total_amount) AS total_amount
    FROM orders
    GROUP BY customer_id
) t ON c.customer_id = t.customer_id
ORDER BY t.total_amount DESC
LIMIT 3;

```
# How to Find the Second Highest Salary in SQL?
<img width="782" height="140" alt="image" src="https://github.com/user-attachments/assets/dc2d937f-f695-45f2-b6fe-5acba3803119" />


