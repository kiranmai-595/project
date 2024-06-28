-- Creates tables for Employees and Departments

USE [CompanyDB];
GO

-- Create Departments table
CREATE TABLE [dbo].[Departments] (
    [DepartmentID] INT PRIMARY KEY,
    [DepartmentName] NVARCHAR(50)
);
GO

-- Create Employees table
CREATE TABLE [dbo].[Employees] (
    [EmployeeID] INT PRIMARY KEY,
    [FirstName] NVARCHAR(50),
    [LastName] NVARCHAR(50),
    [DepartmentID] INT,
    CONSTRAINT [FK_Employees_Departments] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Departments]([DepartmentID])
);
GO
