# Find employees earning more than the average salary in their department

```jsx
SELECT emp_id, emp_name, salary, department_id
FROM employees
WHERE salary > (SELECT AVG(salary) 
                FROM employees e2 
                WHERE e2.department_id = employees.department_id);

```
