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
