#  1 Show how many patients have a birth_date with 2010 as the birth year.
```jsx
select count(*) from patients where year(birth_date)=2010;
```
# 2 Show the first_name, last_name, and height of the patient with the greatest height.
```jsx
select max(height),first_name,last_name from patients

SELECT
  first_name,
  last_name,
  height
FROM patients
WHERE height = (
    SELECT max(height)
    FROM patients
  )
```
# 3 Show all columns for patients who have one of the following patient_ids:
1,45,534,879,1000

```jsx
SELECT patient_id,
       first_name,
       last_name,
       gender,
       birth_date,
       city,
       province_id,
       allergies,
       height,
       weight
FROM patients 
WHERE patient_id IN (1, 45, 534, 879, 1000);

```
# 4 Show all the columns from admissions where the patient was admitted and discharged on the same day.
```jsx
select *from admissions where admission_date=discharge_date;
```
# 5 Write a query to find list of patients first_name, last_name, and allergies where allergies are not null and are from the city of 'Hamilton'
```jsx
SELECT
  first_name,
  last_name,
  allergies
FROM patients
WHERE
  city = 'Hamilton'
  and allergies is not null
```

# 6 Show unique birth years from patients and order them by ascending.

```jsx
SELECT
  DISTINCT YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year;
```
# 7 Show unique first names from the patients table which only occurs once in the list.For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is #
### named 'Leo' then include them in the output.
```jsx
SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(*) = 1;

```
