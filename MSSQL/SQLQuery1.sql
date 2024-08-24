--Create DB
Create database School

--USE DB
USE School

--Create table 
Create table Students(
No INT,
Name VARCHAR(10)
)

--Alter 
alter table Students alter column Name VARCHAR(20)

alter table Students alter column Name NVARCHAR(20)

alter table Students alter column No INT NOT NULL

alter table Students ADD Branch VARCHAR(10)

alter table Students DROP column Branch 

SP_RENAME 'Students.Name','StudentName' 
SP_RENAME 'Students.StudentName','Name' 


USE School

CREATE TABLE Employee (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Mumbai',
    DateOfBirth date DEFAULT GETDATE(),
    Salary   DECIMAL (18, 2) DEFAULT 5000.00
)

Insert into Employee (ID, LastName, Age) values(1, 'Rout', 30)

Select * from Employee

select LastName from Employee

CREATE Database SampleDB

CREATE TABLE Department(
DNO INT,
DNAME VARCHAR(10)
)

ALTER TABLE Department ALTER column DNO INT NOT NULL

ALTER TABLE Department ADD CONSTRAINT PK_Department_DNO PRIMARY KEY (DNO);

INSERT Department VALUES (10,'CS')
INSERT Department VALUES (20,'ECE')


CREATE TABLE EmployeeForeign 
( 
    Eid    INT PRIMARY KEY, 
    Ename  VARCHAR(30), 
    Salary MONEY, 
    Dno    INT FOREIGN KEY REFERENCES Department(Dno) 
) 

INSERT into EmployeeForeign VALUES (101,'AA', 25000, 10) -- Allowed
INSERT into EmployeeForeign VALUES (102,'BB', 32000, 20) -- Allowed
INSERT into EmployeeForeign VALUES (103,'CC', 52000, 40) -- Not Allowed


--------------------------------------------------------------------------------------------------------------------------------------------
CREATE DATABASE Cmpy

USE Cmpy

CREATE TABLE Departments (
    DNO INT PRIMARY KEY,            -- Department Number (Primary Key)
    DNAME VARCHAR(50) NOT NULL     -- Department Name
);


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,     -- Employee ID (Primary Key)
    FirstName VARCHAR(50) NOT NULL, -- First Name
    LastName VARCHAR(50) NOT NULL,  -- Last Name
    HireDate DATE NOT NULL,         -- Hire Date
    Salary DECIMAL(10, 2) NOT NULL, -- Salary
    DNO INT,                        -- Department Number (Foreign Key)
    FOREIGN KEY (DNO) REFERENCES Departments(DNO) -- Foreign Key Reference
);


INSERT INTO Departments (DNO, DNAME) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Sales');


INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Salary, DNO) VALUES
(1, 'John', 'Doe', '2021-05-15', 60000.00, 1),
(2, 'Jane', 'Smith', '2020-03-20', 75000.00, 2),
(3, 'Emily', 'Johnson', '2022-07-11', 80000.00, 3),
(4, 'Michael', 'Brown', '2019-12-01', 55000.00, 4),
(5, 'Linda', 'Davis', '2023-01-10', 72000.00, 1),
(6, 'James', 'Wilson', '2018-04-25', 90000.00, 2),
(7, 'Patricia', 'Garcia', '2020-06-30', 95000.00, 3),
(8, 'David', 'Martinez', '2021-09-15', 53000.00, 4),
(9, 'Jennifer', 'Hernandez', '2023-02-28', 61000.00, 5),
(10, 'William', 'Lopez', '2020-11-12', 67000.00, 5);

INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Salary, DNO) VALUES
(11,'Yogesh','V','2024-03-09', 1000000,3)

INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Salary, DNO) VALUES
(12,'Yogesh','V','2024-03-09', 1000000,3)

SELECT EmployeeID, FirstName, LastName, HireDate, Salary, DNO FROM
Employees WHERE FirstName = 'Yogesh'

DELETE FROM Employees WHERE FirstName = 'Yogesh' AND EmployeeID = 12

UPDATE Employees SET FirstName = 'Yogeshwaran' WHERE EmployeeID=11

SELECT EmployeeID, FirstName, LastName, HireDate, Salary, DNO FROM
Employees WHERE EmployeeID = 11

SELECT * FROM Employees ORDER BY FirstName

SELECT EmployeeID, FirstName FROM Employees

SELECT TOP(3) EmployeeID, FirstName, LastName, HireDate, Salary, DNO FROM Employees --ORDER BY FirstName ASC --OFFSET 4 ROWS

SELECT SUM(Salary) AS TotalSalary FROM Employees

SELECT SUM(Salary) AS TOPSALARY FROM (SELECT TOP(3) Salary FROM Employees) AS TOPSALARY

CREATE NONClustered INDEX ID_INDEX ON Employees(EmployeeID)
CREATE Clustered INDEX Name_INDEX ON Employees(FirstName)





