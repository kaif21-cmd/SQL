# Question 1 Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

```jsx
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0;

alternate
select distinct city from station where id%2=0;

```
# Question 2 : Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

```jsx
select count(city)-count(distinct city) as difference 
from station; 
```

# Question 3 Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

```jsx
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, 1, 1)) IN ('a', 'e', 'i', 'o', 'u');

SUBSTR(CITY, 1, 1): extracts the first letter of the city name.

LOWER(...): ensures case-insensitive comparison.

IN ('a', 'e', 'i', 'o', 'u'): filters for vowels.

DISTINCT: removes duplicates
```
# question 4 : Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
### The LOWER() function converts all characters in a string to lowercase.
### String Functions: LEFT() and RIGHT()
These functions are used to manipulate text strings by extracting a substring from either the left or right side.

```jsx

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY, 1)) IN ('a', 'e', 'i', 'o', 'u')
  AND LOWER(RIGHT(CITY, 1)) IN ('a', 'e', 'i', 'o', 'u');

```
# Question 5 : Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates

```jsx
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(RIGHT(CITY, 1)) NOT IN ('a', 'e', 'i', 'o', 'u');
```
# Question 6 : Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

```jsx
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY, 1)) NOT IN ('a', 'e', 'i', 'o', 'u')
 AND LOWER(RIGHT(CITY, 1)) NOT IN ('a', 'e', 'i', 'o', 'u');

```
# Question 7 Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

```jsx
SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3), ID ASC;

## RIGHT(NAME, 3) extracts the last 3 letters of the name.
## ORDER BY first sorts by those characters, then by ID if needed.

```

# Question 8 : Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

```jsx
SELECT name
FROM Employee
ORDER BY name ASC;

```
# Question 9 : Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 1000  per month who have been employees for less than 10  months. Sort your result by ascending employee_id.

```jsx
select  name from employee
where salary>2000 and months<10
order by 
employee_id ASC;
```
# Question 10 : Query the total population of all cities in CITY where District is California.
```jsx
select distinct sum(population) 
as population 
from city 
where district='california'
```

# Question 11 : Query the difference between the maximum and minimum populations in CITY.

```jsx
select max(population)-min(population) as difference from city;
```

# Question 12 Query the following two values from the STATION table:

```jsx
SELECT 
    ROUND(SUM(LAT_N), 2), 
    ROUND(SUM(LONG_W), 2) 
FROM STATION;

```

# Question 13 Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 134542 and less 78543 than . Truncate your answer to  4 decimal places.

```jsx
SELECT TRUNCATE(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

```

# Question 14  Difference Between ROUND() and TRUNCATE() in SQL

| Function    | Description                                      | Example (Value = 12.56789, Decimal = 2) | Result   |
|-------------|--------------------------------------------------|------------------------------------------|----------|
| `ROUND()`   | Rounds the number to the nearest value           | `ROUND(12.56789, 2)`                     | `12.57`  |
| `TRUNCATE()`| Cuts off the digits after the specified decimal  | `TRUNCATE(12.56789, 2)`                  | `12.56`  |

---

### ✅ Key Points

- `ROUND()`:
  - Rounds up if the next digit is 5 or more.
  - Changes the digit before the cutoff.

- `TRUNCATE()`:
  - Simply removes extra digits.
  - Does **not** change the digit before the cutoff.

---

### 📌 Use Cases

- **ROUND()**: When you want accurate rounding (e.g., prices, marks).
- **TRUNCATE()**: When you just want fixed-length numbers (e.g., display formatting).

# Question 15 Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 73821. Truncate your answer to 4 decimal places.

```jsx
SELECT TRUNCATE(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

```
# Question 16 Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 36432 . Round your answer to 4 decimal places.

```jsx
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MAX(LAT_N)
    FROM STATION
    WHERE LAT_N < 137.2345
);

```

# Question 17 : Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than . Round your answer to  decimal places.

```jsx
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N > 38.7780
);

```

# question 18 : P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(20):

```jsx
WITH RECURSIVE pattern(n) AS (
  SELECT 20
  UNION ALL
  SELECT n - 1 FROM pattern WHERE n > 1
)
SELECT repeat('* ', n) AS row_output
FROM pattern;

```

# explnation : 

```jsx
WITH RECURSIVE pattern(n) AS (...)
Defines a recursive CTE named pattern.

n is a column that stores the number of stars per row.

2. SELECT 20
This is the base case of recursion.

It initializes the pattern with 20 stars in the first row.

3. UNION ALL
Combines the base row with additional rows generated by the recursive step.

4. SELECT n - 1 FROM pattern WHERE n > 1
The recursive case: subtracts 1 from n each time.

Continues generating rows until n = 1.

5. SELECT repeat('* ', n) AS row_output FROM pattern
Final output: repeats the string "* " exactly n times for each row.

Produces the inverted triangle pattern.

🧠 What is repeat('* ', n)?
A string function that repeats the '* ' pattern n times.

Examples:

repeat('* ', 3) → * * *

repeat('* ', 1) → *

💡 Notes
This query works in PostgreSQL, MySQL 8+, and other SQL engines that support recursive CTEs.

To generate a pattern with a different number of rows, change 20 to another number
```
# question 19 : P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

```jsx
* 
* * 
* * * 
* * * * 
* * * * *

WITH RECURSIVE pattern(n) AS (
  SELECT 1
  UNION ALL
  SELECT n + 1 FROM pattern WHERE n < 20
)
SELECT repeat('* ', n) AS row_output
FROM pattern;


```

# Question 20 : Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

```jsx
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[AEIOUaeiou]';

```

# Question 21 : Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates

```jsx
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[AEIOUaeiou]';
```
# Question 22 : Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

```jsx
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[AEIOUaeiou]'   -- Does not start with a vowel
  AND CITY NOT REGEXP '[AEIOUaeiou]$';  -- Does not end with a vowel

```

# Question 23 : TEST

![image](https://github.com/user-attachments/assets/5caf301c-575b-4e0b-ab22-c7de7b9fbd2d)

# ans 

![image](https://github.com/user-attachments/assets/4f1f9ae7-01f8-4170-bcee-3eef39a0bb0f)
![image](https://github.com/user-attachments/assets/f7c18697-dbe9-4fb5-8727-c422e1d02eda)

# question 24 : 
![image](https://github.com/user-attachments/assets/973aa9de-80ac-4edf-af54-619f42229fdb)

```jsx
SELECT p.player_id, p.player_name, p.level, p.experience_points
FROM players p
JOIN characters c ON p.player_id = c.player_id
WHERE c.race = 'Elf';

```
# Question 25 : 
![image](https://github.com/user-attachments/assets/8b260bcd-3536-4fdb-a81e-5c7ae661b59e)

```jsx
select player_name from players
union 
select character_name from characters
```

# Question 26 : 
![image](https://github.com/user-attachments/assets/f544a2e4-0b1e-4864-8f18-ca5b384d2b45)

```jsx
SELECT player_id, level AS max_level
FROM players
WHERE level = (SELECT MAX(level) FROM players);

```
# Question 27 : 
![image](https://github.com/user-attachments/assets/14834c2a-0f00-4870-9b09-390b67be3b56)

```jsx
SELECT SUM(c.population) AS total_population
FROM city AS c
JOIN country AS d ON c.countrycode = d.code
WHERE d.continent = 'Asia';

```
# Question 28: SUBQUERY

#  From the following tables, write a SQL query to find all the orders issued by the salesman 'Paul Adam'. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.

```jsx
SELECT * 
FROM orders
WHERE salesman_id = (
    SELECT salesman_id 
    FROM salesman 
    WHERE name = 'Paul Adam'
);
+--------+-----------+------------+-------------+-------------+
| ord_no | purch_amt | ord_date   | customer_id | salesman_id |
+--------+-----------+------------+-------------+-------------+
|  70011 |     75.29 | 2012-08-17 |        3003 |        5007 |
+--------+-----------+------------+-------------+-------------+
```
# Question 29 : From the following tables write a SQL query to find all orders generated by London-based salespeople. Return ord_no, purch_amt, ord_date, customer_id, salesman_id.
```jsx
mysql> SELECT *
    -> FROM orders
    -> WHERE salesman_id IN (
    ->     SELECT salesman_id
    ->     FROM salesman
    ->     WHERE city = 'New York'
    -> );
+--------+-----------+------------+-------------+-------------+
| ord_no | purch_amt | ord_date   | customer_id | salesman_id |
+--------+-----------+------------+-------------+-------------+
|  70002 |     65.26 | 2012-10-05 |        3002 |        5001 |
|  70005 |   2400.60 | 2012-07-27 |        3007 |        5001 |
|  70008 |   5760.00 | 2012-09-10 |        3002 |        5001 |
|  70013 |   3045.60 | 2012-04-25 |        3002 |        5001 |
+--------+-----------+------------+-------------+-------------+
```


