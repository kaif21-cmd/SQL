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

``jsx
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N > 38.7780
);

```

