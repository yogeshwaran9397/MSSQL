CREATE DATABASE VIEWDB

USE VIEWDB

-- Create Department Table
CREATE TABLE Department
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50)
)
GO

-- Populate the Department Table with test data
INSERT INTO Department VALUES(1, 'IT')
INSERT INTO Department VALUES(2, 'HR')
INSERT INTO Department VALUES(3, 'Sales')

-- Create Employee Table
CREATE TABLE Employee
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATETIME,
  Salary DECIMAL(18,2),
  DeptID INT
)
GO

-- Populate the Employee Table with test data
INSERT INTO Employee VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 25000, 1)
INSERT INTO Employee VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 30000, 2)
INSERT INTO Employee VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060',40000, 2)
INSERT INTO Employee VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 35000, 3)
INSERT INTO Employee VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 27000, 1)
INSERT INTO Employee VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 33000, 2)
GO

-- VIEW from above - ID , Name, Salary, DOB, Gender, DeptName 
CREATE VIEW vwEmployeeByDepartment 
AS
SELECT emp.ID, emp.Name, emp.Salary, emp.DOB, emp.Gender, dept.Name AS DepartmentName 
FROM  Employee emp INNER JOIN 
Department	
ON emp.DeptID = dept.ID

SELECT * FROM vwEmployeeByDepartment

Update vwEmployeeByDepartment VALUES(7, 'Her', 'Female','2000-07-12 10:53:27.060', 53000, 2) -- will throw error, as the this view is created by 2 tables 
