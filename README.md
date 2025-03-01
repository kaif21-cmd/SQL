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

SELECT ROUND(LONG_W, Z) 
FROM STATION 
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < X);

<img width="1703" alt="image" src="https://github.com/user-attachments/assets/bec02de6-537d-406c-ab36-aaf19f46d37f" />

