-- Inserts test data into Employees and Departments tables

USE [CompanyDB];
GO

-- Insert Departments
INSERT INTO [dbo].[Departments] ([DepartmentID], [DepartmentName])
VALUES (1, 'Sales'),
       (2, 'Marketing');

-- Insert Employees
INSERT INTO [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DepartmentID])
VALUES (1, 'Kiran', 'Mai', 1),
       (2, 'Janu', 'Sarma', 2);
GO
