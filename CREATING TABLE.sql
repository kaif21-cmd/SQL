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
    
-- SELECTING  QUERY
SELECT *FROM PROJECTS;
SELECT *FROM PROJECTS WHERE projects_id=103;