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
# Question 30 :  Display Orders from Salespeople Handling Customer ID 3007

```jsx
SELECT *
    -> FROM orders
    -> WHERE salesman_id = (
    ->     SELECT DISTINCT salesman_id
    ->     FROM orders
    ->     WHERE customer_id = 3007
    -> );
+--------+-----------+------------+-------------+-------------+
| ord_no | purch_amt | ord_date   | customer_id | salesman_id |
+--------+-----------+------------+-------------+-------------+
|  70002 |     65.26 | 2012-10-05 |        3002 |        5001 |
|  70005 |   2400.60 | 2012-07-27 |        3007 |        5001 |
|  70008 |   5760.00 | 2012-09-10 |        3002 |        5001 |
|  70013 |   3045.60 | 2012-04-25 |        3002 |        5001 |
+--------+-----------+------------+-------------+-------------+
4 rows in set (0.00 sec)

```
# Question 31 From the following tables write a SQL query to find the order values greater than the average order value of 10th October 2012. Return ord_no, purch_amt, ord_date, customer_id, salesman_id.

```jsx
select *from orders
where purch_amt>
(select avg(purch_amt) from orders WHERE ord_date = '10/10/2012.

```

# Question 32 : From the following tables, write a SQL query to find all the orders generated in New York city. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.

```jsx
select *
    -> from orders
    -> where salesman_id=(
    -> select salesman_id
    -> from salesman
    -> where city ='new york'
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

# Codechef.

![image](https://github.com/user-attachments/assets/64433386-6487-41a0-968e-1766f852f4bd)
```jsx
SELECT AVG(salary) AS avg_salary
FROM works;
```
#  Question 33 Write a query to retrieve the department_name and location of people who live in location that starts with 'S'.
![image](https://github.com/user-attachments/assets/6405001b-25ea-42e1-82d7-c4e20239a3f8)

```jsx
select department_name , location from departments WHERE location LIKE 'S%';
```
#  Question 34 Write a query to find the total count of books whose genre is Fiction.Note: Output column name should be fiction_count.
![image](https://github.com/user-attachments/assets/5f7e8e01-c8d2-4818-945c-77585ce5e9e8)

```jsx
select count(*) as fiction_count from books where genre ='Fiction';
```
#  Question 35
![image](https://github.com/user-attachments/assets/b958a67b-c52c-4463-b071-09a4224e8c7b)

```jsx
select Movie_name from cinema where rating > 7 AND rating < 9;
```

# Question 36 Write a query to retrieve book_id, title, author and published_year of the books which have NULL rating for their books. Table name: Library
![image](https://github.com/user-attachments/assets/e3230170-cef5-4670-be68-7935ac9df122)
```jsx
select book_id, title, author, published_year from library where rating is NULL;
```

# Question 37 : Create a query to retrieve the employee_name, company, and salary for employees in the full-time category, ordered by salary in descending order
![image](https://github.com/user-attachments/assets/ae83872a-df1b-4118-863f-b5131fd5dbb4)

```jsx
select employee_name, company , salary from employees where category='Full-Time' order by salary desc;
```
# Question 38 : Write a query to group the employees by their department and display the total number of employees (as total_employees) in each department.

![image](https://github.com/user-attachments/assets/6fc1f600-fdd8-4322-8bcb-771648c28b7d)

```jsx
select department,count(employee_name) as total_employees from employees group by department;
```
# Question 39 : Write a query to retrieve the author_id, author_name, and publication_name for authors whose articles got zero views. The result should be sorted by author_id in ascending order.Return the result table sorted by id in ascending order.
![image](https://github.com/user-attachments/assets/31946f6d-97a6-46d9-bf0e-63a957702c77)
```jsx
select author_id,author_name,publication_name from views where view_count='0' order by author_id asc;
```
# Question 40 important : Write a query to find the names of the top 3 distinct players by highest score who have won matches, including their scores.
![image](https://github.com/user-attachments/assets/46156a79-3e2c-41fa-a00b-8d2740fe078a)

```jsx
SELECT DISTINCT
    P.player_name,
    P.score
FROM
    Players AS P
JOIN
    Matches AS M ON P.player_name = M.winner
ORDER BY
    P.score DESC
LIMIT 3;

```
# Question 41 : Show unique birth years from patients and order them by ascending.
![image](https://github.com/user-attachments/assets/0f71e8b5-7803-4bee-a069-66bef6e7b078)
```jsx
SELECT
  DISTINCT YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year;
```
# Question 42 : Show first name and last name of patients who does not have allergies. (null)
```jsx
SELECT
  first_name,
  last_name
FROM patients
WHERE allergies IS NULL;
```
# Question 43 : Show first name of patients that start with the letter 'C'
```jsx
SELECT
  first_name
FROM
  patients
WHERE
  first_name LIKE 'C%'
```
# Question 44  : Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
```jsx
SELECT patient_id, first_name
FROM patients
WHERE first_name LIKE 's%s'
  AND LENGTH(first_name) >= 6;

```

# Question 45: Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.

```jsx
SELECT p.patient_id, p.first_name, p.last_name
FROM patients AS p
INNER JOIN admissions AS a ON p.patient_id = a.patient_id
WHERE a.diagnosis = 'Dementia';

```
# Question 46 : Display every patient's first_name. Order the list by the length of each name and then by alphabetically.
```jsx
SELECT first_name
FROM patients
ORDER BY LENGTH(first_name), first_name;
```
# Question 47 : Show the total amount of male patients and the total amount of female patients in the patients table.
```jsx
Display the two results in the same row.
SELECT 
  SUM(gender = 'M') AS male_count,
  SUM(gender = 'F') AS female_count
FROM patients;

```
# Question 48 : Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.

```jsx
select first_name,last_name,allergies from patients where allergies='Penicillin' or allergies='Morphine'
order by allergies,first_name,last_name asc;
```

# Question 49 : Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
```jsx
select patient_id,diagnosis from admissions group by patient_id,diagnosis HAVING COUNT(*) > 1;
```
# Question 50 : Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)

```jsx
select first_name,last_name from patients where weight between 100 and 120;
```
# Question 51 : Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
```jsx
UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS NULL;

```
# Question 52 : Show first name and last name concatinated into one column to show their full name.
```jsx
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM patients;

```
# Question 53: Show first name, last name and role of every person that is either patient or doctor.The roles are either "Patient" or "Doctor"

```jsx
SELECT first_name, last_name, 'Patient' as role FROM patients
    union all
select first_name, last_name, 'Doctor' from doctors;
```

# Question 54: Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.

```jsx
SELECT first_name, last_name, birth_date
FROM patients
WHERE birth_date BETWEEN '1970-01-01' AND '1979-12-31'
ORDER BY birth_date ASC;

```

# Question 56: Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
```jsx
select max(weight)-min(weight) from patients where last_name='Maroni';
```

# Question 57 : Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.

```jsx
SELECT DAY(admission_date) AS day_of_month, COUNT(*) AS admission_count
FROM admissions
GROUP BY day_of_month
ORDER BY admission_count DESC;

```
# Question 58 : Show all columns for patient_id 542's most recent admission_date.
```jsx
SELECT patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id
FROM admissions
WHERE patient_id = 542
ORDER BY admission_date DESC
LIMIT 1;

```

# Question 59 : Important , Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters.

```jsx
SELECT patient_id, attending_doctor_id, diagnosis
FROM admissions
WHERE 
  (patient_id % 2 != 0 AND attending_doctor_id IN (1, 5, 19))
  OR
  (attending_doctor_id LIKE '%2%' AND patient_id >= 100 AND patient_id <= 999);

```
# Question 60 : Show first_name, last_name, and the total number of admissions attended for each doctor.very admission has been attended by a doctor.
```jsx
SELECT d.first_name, d.last_name, COUNT(*) AS total_admissions
FROM doctors d
INNER JOIN admissions a ON d.doctor_id = a.attending_doctor_id
GROUP BY d.first_name, d.last_name
ORDER BY total_admissions DESC;

```

# Question 61: For each doctor, display their id, full name, and the first and last admission date they attended.
```jsx
SELECT 
  d.doctor_id,
  d.first_name || ' ' || d.last_name AS full_name,
  MIN(a.admission_date) AS first_admission,
  MAX(a.admission_date) AS last_admission
FROM doctors d
JOIN admissions a ON d.doctor_id = a.attending_doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY d.doctor_id;

```
# Question 62 : For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
```jsx
SELECT 
  CONCAT(p.first_name, ' ', p.last_name) AS patient_full_name,
  a.diagnosis,
  CONCAT(d.first_name, ' ', d.last_name) AS doctor_full_name
FROM admissions a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.attending_doctor_id = d.doctor_id;

```
# Question 63: Show patient_id, first_name, last_name from patients whose does not have any records in the admissions table. (Their patient_id does not exist in any admissions.patient_id rows.
```jsx
SELECT p.patient_id, p.first_name, p.last_name
FROM patients AS p
LEFT JOIN admissions AS a ON p.patient_id = a.patient_id
WHERE a.patient_id IS NULL;
```
# Quesetion 64: Display a single row with max_visits, min_visits, average_visits where the maximum, minimum and average number of admissions per day is calculated. Average is rounded to 2 decimal places.

```jsx
SELECT 
  MAX(count) AS max_visits,
  MIN(count) AS min_visits,
  ROUND(AVG(count), 2) AS average_visits
FROM (
  SELECT COUNT(*) AS count
  FROM admissions
  GROUP BY admission_date
) AS daily;

```

# Question 65 : Show all the contact_name, address, city of all customers which are not from 'Germany', 'Mexico', 'Spain'

```jsx

SELECT contact_name, address, city
FROM customers
WHERE country NOT IN ('Germany', 'Mexico', 'Spain');

```
# Question 66 : Show the city, company_name, contact_name of all customers from cities which contains the letter 'L' in the city name, sorted by contact_name
```jsx
SELECT city, company_name, contact_name
FROM customers
WHERE city LIKE '%L%'
ORDER BY contact_name;

```
# Question 67 Show the average unit price rounded to 2 decimal places, the total units in stock, total discontinued products from the products table.
```jsx
select round(avg(unit_price),2) as average_price , sum(units_in_stock) as total_stock, sum(discontinued) as total_discontinued from products;
```

# question 68: Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

```jsx
```
