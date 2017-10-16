CREATE PROC usp_DeleteEmployeesFromDepartment (@departmentId INT) 
AS
BEGIN
ALTER TABLE Employees NOCHECK CONSTRAINT [FK_Employees_Departments]
ALTER TABLE Departments NOCHECK CONSTRAINT [FK_Departments_Employees]
ALTER TABLE EmployeesProjects NOCHECK CONSTRAINT [FK_EmployeesProjects_Employees]
ALTER TABLE Employees NOCHECK CONSTRAINT [FK_Employees_Employees]

DELETE FROM Employees
WHERE DepartmentID = @departmentId

DELETE FROM Departments
WHERE DepartmentID = @departmentId

SELECT COUNT(*) FROM Employees WHERE DepartmentID = @departmentId
END