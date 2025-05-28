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

