-- Integration test script for Departments table

USE [CompanyDB];
GO

-- Count rows in Departments table
DECLARE @RowCount INT;
SELECT @RowCount = COUNT(*) FROM [dbo].[Departments];

-- Check if there are expected rows
IF @RowCount = 2
BEGIN
    PRINT 'Integration test for Departments table: Passed';
END
ELSE
BEGIN
    PRINT 'Integration test for Departments table: Failed';
END
GO
