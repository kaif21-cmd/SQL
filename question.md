# Question1 
# Q1. What is the difference between WHERE and HAVING?
Filters rows before aggregation - where
Filters groups after aggregation - having

```jsx
Filter row before aggregation
SELECT Product, SUM(Quantity) as TotalQty
FROM Sales
WHERE Price > 2
GROUP BY Product;

```jsx
Filter row before aggregation
SELECT Product, SUM(Quantity) as TotalQty
FROM Sales
GROUP BY Product
HAVING SUM(Quantity) > 15;
```
# Question 2
## What is a Primary Key vs Foreign Key?
```jsx
- **Primary Key:** Uniquely identifies each row (e.g., `customer_id`)
- **Foreign Key:** Links to another table’s primary key (e.g., `order.customer_id`)
```
# Question 3
## Difference Between UNION and UNION ALL

```jsx
- **UNION:** Removes duplicates
- **UNION ALL:** Keeps duplicates
```

# Question 4 
##  What is Normalization? Why is it Important?

```jsx
- Process of **breaking data into smaller, related tables** to avoid redundancy.
- Ensures **data integrity + easier updates.**
```

# question 5 
## Find the Second Highest Salary

```jsx
SELECT DISTINCT Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 1 OFFSET 1;

```


```jsx
# by using sub query
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employees
WHERE Salary < (SELECT MAX(Salary) FROM Employees);

```
# by using dense rank()
```jsx
SELECT Salary
FROM (
    SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rnk
    FROM Employees
) AS RankedSalaries
WHERE rnk = 2;

```
# question 6 
# Find duplicate email addresses in the users table

```jsx
SELECT email, COUNT(*) AS duplicate_count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

```

# question 7
# Defference between Delete and Truncate
```jsx

![image](https://github.com/user-attachments/assets/434dcde5-b042-45fe-906d-7f468751456b)


```
# question 8
# How Do You Handle Dividing by Zero in SQL?

```jsx
SELECT 
  value,
  divisor,
  value / NULLIF(divisor, 0) AS result
FROM your_table;

| value | divisor | result      |
| ----- | ------- | ----------- |
| 100   | 10      | 10.0        |
| 50    | 0       | NULL (safe) |
| 30    | 5       | 6.0         |

```
# Question 9 
# How to Select Only Even Rows (Row Number)?
```jsx
sql
CopyEdit
WITH numbered AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY id) AS rn
    FROM employees
)
SELECT * FROM numbered WHERE rn % 2 = 0;

```

# Question 10

```jsx
| Function        | What It Does                                      | Includes NULLs? |
| --------------- | ------------------------------------------------- | --------------- |
| `COUNT(*)`      | Counts **all rows**, regardless of `NULL`s        | ✅ Yes           |
| `COUNT(column)` | Counts only rows where the **column is NOT NULL** | ❌ No            |

```
