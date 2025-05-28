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
```jsx

## **Q2. Types of JOINs and When to Use Them**

| Type | What It Does | Example Use Case |
| --- | --- | --- |
| INNER JOIN | Only matching rows from both tables | Customers who placed orders |
| LEFT JOIN | All from left + matched rows from right | All products, even if unsold |
| RIGHT JOIN | All from right + matched rows from left | All sales reps, even if no sales |
| FULL JOIN | All rows from both (match if possible) | Audit of users vs purchases |
```
