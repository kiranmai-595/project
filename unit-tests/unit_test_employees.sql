-- Unit test script for Employees table

USE [CompanyDB];
GO

-- Check if Employees table exists
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
BEGIN
    PRINT 'Unit test for Employees table: Passed';
END
ELSE
BEGIN
    PRINT 'Unit test for Employees table: Failed';
END
GO
