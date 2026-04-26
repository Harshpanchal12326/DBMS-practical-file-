-- =========================================================
-- DATABASE CREATION
-- =========================================================
CREATE DATABASE IF NOT EXISTS college_db;
USE college_db;

-- =========================================================
-- 1. DDL COMMANDS (CREATE, ALTER, DROP)
-- =========================================================

-- Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    marks INT
);

-- Modify table (Add column)
ALTER TABLE Students ADD email VARCHAR(100);

-- Modify column
ALTER TABLE Students MODIFY age INT NOT NULL;

-- Drop column
ALTER TABLE Students DROP COLUMN email;

-- =========================================================
-- 2. DML COMMANDS (INSERT, SELECT, UPDATE, DELETE)
-- =========================================================

-- Insert Data
INSERT INTO Students (student_id, name, age, department, marks) VALUES
(1, 'Amit', 20, 'CSE', 85),
(2, 'Riya', 21, 'IT', 90),
(3, 'Rahul', 22, 'ECE', 75),
(4, 'Sneha', 20, 'CSE', 88),
(5, 'Karan', 23, 'IT', 60);

-- Retrieve Data
SELECT * FROM Students;

-- Update Data
UPDATE Students 
SET marks = 95 
WHERE student_id = 2;

-- Delete Data
DELETE FROM Students 
WHERE student_id = 5;

-- =========================================================
-- 3. DCL COMMANDS (GRANT, REVOKE)
-- =========================================================

-- Create a user
CREATE USER 'test_user'@'localhost' IDENTIFIED BY 'password123';

-- Grant permissions
GRANT SELECT, INSERT 
ON college_db.* 
TO 'test_user'@'localhost';

-- Revoke permissions
REVOKE INSERT 
ON college_db.* 
FROM 'test_user'@'localhost';

-- =========================================================
-- 4. AGGREGATE FUNCTIONS
-- =========================================================

SELECT MIN(marks) AS Minimum_Marks FROM Students;
SELECT MAX(marks) AS Maximum_Marks FROM Students;
SELECT SUM(marks) AS Total_Marks FROM Students;
SELECT AVG(marks) AS Average_Marks FROM Students;
SELECT COUNT(*) AS Total_Students FROM Students;

-- =========================================================
-- 5. CONDITIONS AND SORTING
-- =========================================================

-- Greater than condition
SELECT * FROM Students WHERE marks > 80;

-- Sorting Ascending
SELECT * FROM Students ORDER BY marks ASC;

-- Sorting Descending
SELECT * FROM Students ORDER BY marks DESC;

-- =========================================================
-- 6. JOIN OPERATIONS
-- =========================================================

-- Create Departments Table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    department VARCHAR(50),
    hod VARCHAR(50)
);

INSERT INTO Departments (dept_id, department, hod) VALUES
(1, 'CSE', 'Dr. Sharma'),
(2, 'IT', 'Dr. Verma'),
(3, 'ECE', 'Dr. Singh');

-- NATURAL JOIN
SELECT * FROM Students NATURAL JOIN Departments;

-- EQUI JOIN
SELECT s.name, s.department, d.hod
FROM Students s
JOIN Departments d
ON s.department = d.department;

-- LEFT OUTER JOIN
SELECT s.name, d.hod
FROM Students s
LEFT JOIN Departments d
ON s.department = d.department;

-- RIGHT OUTER JOIN
SELECT s.name, d.hod
FROM Students s
RIGHT JOIN Departments d
ON s.department = d.department;

-- =========================================================
-- 7. SELF JOIN
-- =========================================================

-- Create Employees Table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO Employees (emp_id, name, manager_id) VALUES
(1, 'Raj', NULL),
(2, 'Aman', 1),
(3, 'Neha', 1),
(4, 'Priya', 2);

-- Self Join to find Manager
SELECT e1.name AS Employee, e2.name AS Manager
FROM Employees e1
LEFT JOIN Employees e2
ON e1.manager_id = e2.emp_id;

-- =========================================================
-- END OF FILE
-- =========================================================