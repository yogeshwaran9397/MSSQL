USE Company;
SELECT * FROM Employee;

-- SP for selecting all Employee
CREATE PROCEDURE sp_selectAllEmployee
AS
BEGIN 
	SELECT * FROM Employee;
END

sp_selectAllEmployee

-- SP for selecting all Male Employee

CREATE PROCEDURE sp_selectMaleEmployee
AS
BEGIN 
	SELECT * FROM Employee WHERE Gender = 'Male';
END

sp_selectMaleEmployee


-- SP for selecting Employee based on spec gender 

CREATE PROCEDURE sp_selectEmployeeBasedOnInput(@gender varChar(45))
AS
BEGIN 
	SELECT * FROM Employee WHERE Gender = @gender;
END

sp_selectEmployeeBasedOnInput 'Male'
GO
sp_selectEmployeeBasedOnInput 'Female'

-- SP for getting the count of Employee based on spec gender

CREATE PROCEDURE sp_GetEmployeeCountBasedOnInput(@gender varChar(45), @employeeCount Int Output)
AS
BEGIN 
	SELECT @employeeCount = COUNT(Id)
	FROM Employee 
	WHERE Gender = @gender;
END

DECLARE @EmployeeCount INT;
EXEC sp_GetEmployeeCountBasedOnInput 'Male', @EmployeeCount OUTPUT;
PRINT @EmployeeCount;