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

