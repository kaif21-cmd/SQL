# Question1 
# Q1. What is the difference between WHERE and HAVING?
Filters rows before aggregation - where
Filters groups after aggregation - having

```
SELECT Product, SUM(Quantity) as TotalQty
FROM Sales
WHERE Price > 2
GROUP BY Product;

```
