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

```
