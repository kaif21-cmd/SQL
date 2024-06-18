-- CREATE DATABASE JOINPRACTISE;
-- CREATING THE DATABASE
USE JOINPRACTISE;
-- CREATING TABLE
CREATE TABLE PROJECTS (
    projects_id INT PRIMARY KEY,
    ENROLLMENT_ID INT,
    PROJECT_NAME VARCHAR(255),
    PROJECT_TEACHER VARCHAR(255)
);
-- INSERTING THE RECORDS 
INSERT INTO PROJECTS (projects_id, ENROLLMENT_ID, PROJECT_NAME, PROJECT_TEACHER)
VALUES
    (101, 153, 'E-commerce_Website', 'Faraza_doja'),
    (102, 249, 'RECIPE_GENERATOR', 'NAZIYA_TASBEE'),
    (103, 207, 'SYNTACTIC_ANALYSIS', 'SYED_ALI'),
    (104, 248, 'REAL_STATE_WEBSITE', 'Faraza_doja');
    -- USE OF GROUP BY The GROUP BY statement in SQL is used to arrange identical data into groups. This can be particularly useful when you want to perform aggregate functions, like COUNT, SUM, AVG, MAX, or MIN, on each group of data.
-- GROUP BY: Used to group rows that have the same values in specified columns into summary rows.
-- Aggregate Functions: Applied to each group to get summarized information like totals, averages, etc.
-- By using GROUP BY, you can efficiently summarize and analyze data in your tables
-- KIS PROJECT PE KITNE TEACHER KAM KR Rahe hai '
-- QUESTION You want to count the number of projects each teacher is supervising
SELECT PROJECT_NAME ,COUNT(PROJECT_TEACHER) FROM PROJECTS GROUP BY PROJECT_NAME;
-- kis project pe kitne enrollment kam kr rhe hai
-- Count the Number of Students Enrolled in Each Project
SELECT PROJECT_NAME ,COUNT(ENROLLMENT_ID) FROM PROJECTS GROUP BY PROJECT_NAME;
-- Find the Projects with the Most Students Enrolled
SELECT PROJECT_NAME, COUNT(ENROLLMENT_ID) AS EnrollmentCount
FROM PROJECTS
GROUP BY PROJECT_NAME
ORDER BY EnrollmentCount DESC;
-- Calculate the Average Number of Projects Supervised by Each Teacher
SELECT PROJECT_TEACHER, COUNT(PROJECT_NAME) AS ProjectCount
FROM PROJECTS
GROUP BY PROJECT_TEACHER;
-- Get the List of Teachers with More Than One Project
SELECT PROJECT_TEACHER, COUNT(PROJECT_NAME) AS ProjectCount
FROM PROJECTS
GROUP BY PROJECT_TEACHER
HAVING COUNT(PROJECT_NAME) >= 1;
-- Determine the Teacher Supervising the Most Projects
SELECT PROJECT_TEACHER, COUNT(PROJECT_NAME) AS ProjectCount
FROM PROJECTS
GROUP BY PROJECT_TEACHER
ORDER BY ProjectCount DESC
LIMIT 1;
-- Find the Total Number of Projects and the Number of Projects Per Teacher
SELECT 'Total' AS Type, COUNT(*) AS ProjectCount
FROM PROJECTS
UNION ALL
SELECT PROJECT_TEACHER, COUNT(*) AS ProjectCount
FROM PROJECTS
GROUP BY PROJECT_TEACHER;
-- List Each Project with the Number of Students and the Teacher Supervising It
SELECT PROJECT_NAME, PROJECT_TEACHER, COUNT(ENROLLMENT_ID) AS StudentCount
FROM PROJECTS
GROUP BY PROJECT_NAME, PROJECT_TEACHER;


