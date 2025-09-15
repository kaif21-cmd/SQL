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
