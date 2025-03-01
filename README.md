```jsx
Day 1 at Hackerank
```
```jsx
Question 1 Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than . Truncate your answer to  4 decimal places
SELECT TRUNCATE(SUM(LAT_N), Z) 
FROM STATION 
WHERE LAT_N > X AND LAT_N < Y;

```
<img width="1687" alt="image" src="https://github.com/user-attachments/assets/44b7f0a7-53fb-43ef-acad-5e2612585e55" />

```jsx
# Question 2 

```
<img width="1687" alt="image" src="https://github.com/user-attachments/assets/7454351a-7277-4579-96e2-ae7539a1314a" />

# Question 3 
```jsx
SELECT ROUND(LONG_W, Z) 
FROM STATION 
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < X);
```

<img width="1703" alt="image" src="https://github.com/user-attachments/assets/bec02de6-537d-406c-ab36-aaf19f46d37f" />

# Question 4

```jsx
select round(min(lat_n),4) min from station
where 
lat_n>38.7780
```
<img width="1694" alt="image" src="https://github.com/user-attachments/assets/37ee3679-f26c-4ce2-b51c-92f5c227d3b8" />

# Question 5
```jsx
SELECT ROUND(LONG_W, Z) 
FROM STATION 
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > X);

```
<img width="1704" alt="image" src="https://github.com/user-attachments/assets/c4bce846-ba6a-4cf4-8a69-c18dbd2aa996" />





