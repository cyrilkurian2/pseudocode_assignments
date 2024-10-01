-- 1. Extract the middle 3 characters from the string 'ABCDEFG'.
SELECT x = SUBSTRING('ABCDEFG',3,3)

-- 2. From a table 'Employees' with a column 'FullName', write a query to extract the first name (assuming it's always the first word before a space).
SELECT LEFT(FullName , CHARINDEX(' ',FullName)) as FullName FROM Employees ;

-- 3. Extract the first 5 characters from the string 'SQL Server 2022'.
SELECT LEFT('SQL Server 2022',5) 

-- 4. From a 'Products' table with a 'ProductCode' column, write a query to get the first 3 characters of each product code.
SELECT Left(ProductCode),3) AS ProductCode FROM Products

-- 5. Extract the last 4 characters from the string 'ABCDEFGHIJKL'.
SELECT RIGHT('ABCDEFGHIJKL',4)

-- 6. From an 'Orders' table with an 'OrderID' column (format: ORD-YYYY-NNNN), write a query to extract just the numeric portion at the end.
SELECT RIGHT(OrderID,4) AS NUM FROM Orders

-- 7. Write a query to find the length of the string 'SQL Server Functions'.
SELECT LEN('SQL Server Functions')

-- 8. From a 'Customers' table, find customers whose names are longer than 20 characters.
SELECT * FROM Customers WHERE LEN(CustomerName) > 20

-- 9. Compare the results of character count and byte count for the string 'SQL Server' with a trailing space.
SELECT DATALENGTH('SQL Server ') as ByteCount
SELECT LEN('SQL Server ') AS CharacterLength

-- 10. Write a query to find the byte count of an empty string and explain the result.
SELECT DATALENGTH(' ') AS ByteCount, -- result is 1 as Empty string occupies 1 Byte 

-- 11. Find the position of 'Server' in the string 'Microsoft SQL Server'.
SELECT CHARINDEX('server','Microsoft SQL Server')

-- 12. From an 'Emails' table, write a query to extract the domain name from email addresses.
SELECT RIGHT(Email,CHARINDEX('@',Email)) AS Domain_name FROM Emails

-- 13. Find the position of the first number in the string 'ABC123DEF456'.
SELECT PATINDEX('%[0-9]%','ABC123DEF456')

-- 14. Write a query to find all product names from a 'Products' table that contain a number.  
SELECT ProductName from Products WHERE (PATINDEX(ProductName,%[0-9]%) != 0)

-- 15. Join the strings 'SQL', 'Server', and '2022' with spaces between them.
SELECT CONCAT_WS(' ','SQL','Server','2022') 

-- 16. From 'Employees' table with 'FirstName' and 'LastName' columns, create a 'FullName' column.
SELECT CONCAT_WS(' ',FirstName,LastName) AS FullName FROM Employees

-- 17. Join the array ('SQL', 'Server', '2022') with a hyphen as the separator.
SELECT CONCAT_WS('-','SQL', 'Server', '2022')

-- 18. From an 'Addresses' table, combine 'Street', 'City', 'State', and 'ZIP' columns into a single address string.
SELECT CONCAT_WS(' ',Street,City,State,ZIP) AS Address FROM Addresses

-- 19. Change all occurrences of 'a' to 'e' in the string 'database management'.
SELECT REPLACE('database management','a','e')

-- 20. From a 'Products' table, write a query to replace all spaces in product names with underscores.
SELECT REPLACE(ProductName,' ','-') FROM Products

-- 21. Create a string of 10 asterisks (*).
SELECT REPLICATE('*',10)

-- 22. Write a query to pad all product codes in a 'Products' table to a length of 10 characters with leading zeros.
SELECT CONCAT(REPLICATE('0',10 - DATALENGTH(ProductCode)),ProductCode) FROM Products

-- 23. Insert the string 'New ' at the beginning of 'York City'.
SELECT CONCAT_WS(' ','New','York City')
-- 24. From an 'Emails' table, mask the username part of email addresses, showing only the first and last characters.
SELECT LEFT(Email,1) + Replicate('*',CHARINDEX('@',email)-2) + RIGHT(email,len(email)-CHARINDEX('@',email)+2) FROM Email

-- 25. Convert the string 'sql server' to uppercase.
SELECT UPPER('sql server')

-- 26. Write a query to convert all customer names in a 'Customers' table to uppercase.
SELECT UPPER(CustomerName) FROM Customers

-- 27. Convert the string 'SQL SERVER' to lowercase.
SELECT LOWER('SQL SERVER')

-- 28. From a 'Products' table, write a query to convert all product descriptions to lowercase.
SELECT LOWER(ProductDes) FROM Products

-- 29. Remove trailing spaces from the string 'SQL Server    '.
SELECT RTRIM('SQL Server    ')

-- 30. Write a query to remove trailing spaces from all email addresses in an 'Employees' table.
SELECT RTRIM(Email) FROM Employees

-- 31. Remove leading spaces from the string '   SQL Server'.
SELECT LTRIM('   SQL Server')

-- 32. From a 'Comments' table, write a query to remove leading spaces from all comment texts.
SELECT LTRIM(CommentText) From Comments

-- 33. Display the current date in the format 'dd-MM-yyyy'.
SELECT Format(GETDATE(),'dd-mm-yyyy');

-- 34. From an 'Orders' table with an 'OrderTotal' column, display the total as a currency with 2 decimal places.
SELECT FORMAT(OrderTotal,'C2','en-us') AS 'OrderTotal' FROM Orders

-- 35. Separate the string 'apple,banana,cherry' into individual fruits.
SELECT value FROM STRING_SPLIT ('apple,banana,cherry',',' )

-- 36. From a 'Skills' table with a 'SkillList' column containing comma-separated skills, write a query to create a row for each individual skill.
SELECT value FROM Skills CROSS APPLY STRING_SPLIT(SkillList,',')

-- Date and Time Functions

-- 37. Write a query to display the current date and time.
SELECT GETDATE( ) AS DATE_TIME

-- 38. From an 'Orders' table, find all orders placed in the last 24 hours.
SELECT * FROM Orders WHERE OrderDate >= DATEDIFF(DAY,1,GETDATE())

-- 39. Display the current UTC date and time.
SELECT GETUTCDATE( ) AS DATE_TIME

-- 40. Write a query to show the time difference between local time and UTC time.
SELECT DATEDIFF(MINUTE,GETDATE(),GETUTCDATE( )) AS Local_and_UTC_Diff

-- 41. Convert the current date and time to 'Pacific Standard Time'.
SELECT GETDATE() AT TIME ZONE 'UTC' AT TIME ZONE 'Pacific Standard Time' AS PacificTime;

-- 42. From a 'Flights' table with a 'DepartureTime' column in UTC, convert all departure times to 'Eastern Standard Time'.
SELECT DepartureTime AT TIME ZONE 'UTC' AT TIME ZONE 'Eastern Standard Time' AS Time_IN_EST FROM Flights

-- 43. Add 3 months to the current date.
SELECT DATEADD(MONTH,3,GETDATE()) AS 3_Month_add

-- 44. From an 'Employees' table, write a query to calculate each employee's retirement date (65 years from their 'DateOfBirth').
SELECT DATEADD(YEAR,65,DateOfBirth) AS Retirement_Date FROM Employee

-- 45. Calculate the number of days between '2023-01-01' and '2023-12-31'.
SELECT DATEDIFF(DAY,'2023-01-01','2023-12-31') AS Number_of_days

-- 46. From an 'Orders' table, find the average number of days between order date and ship date.
SELECT AVG(DATADIFF(DAY,OrderDate,ShipDate)) AS average_days FROM Orders

-- 47. Extract the month number from the date '2023-09-15'.
SELECT AVG(DATEDIFF(DAY,OrderDate,ShipDate)) AS average_days FROM Orders

-- 48. From a 'Sales' table, write a query to group total sales by the quarter of the sale date.
SELECT DATEPART(QUARTER,SaleDate) AS Quarter,DATEPART(YEAR,SaleDate) AS Year,SUM(Quantity) AS Total_Sales FROM Sales GROUP BY DATEPART(QUARTER,SaleDate),DATEPART(YEAR,SaleDate)

-- 49. Extract the year from the current date.
SELECT DATEPART(YEAR,GETDATE()) AS Current_Year

-- 50. From an 'Employees' table, find all employees hired in the year 2022.
SELECT * FROM Employee WHERE DATEPART(YEAR,HireDate)=2022

-- 51. Check if '2023-02-30' is a valid date.
IF ISDATE('2023-02-30') = 1  PRINT 'VALID' ELSE PRINT 'INVALID';

-- 52. Write a query to find all rows in a 'UserInputs' table where the 'EnteredDate' column contains invalid dates.
SELECT EnteredDateString FROM UserInputs WHERE ISDATE(EnteredDateString) = 0;

-- 53. Find the last day of the current month.
SELECT EOMONTH(GETDATE()) AS Last_day_month

-- 54. From a 'Subscriptions' table, write a query to extend all subscription end dates to the end of their respective months.
SELECT EOMONTH(End_Date) FROM Subscriptions 

-- 55. Display the current date and time.
SELECT GETDATE() AT TIME ZONE 'UTC' AT TIME ZONE 'India Standard Time' AS Current_date_time

-- 56. Compare the results of two different methods to get the current timestamp - are they always the same?
SELECT GETDATE() AS GETDATE_TIME
SELECT SYSDATETIME() AS SYSDATETIME -- SYSDATETIME() has higher precision


-- 57. Get the current date and time with higher precision than standard methods.
SELECT SYSDATETIME() AS Time_with_precision

-- 58. Write a query to insert the current high-precision timestamp into a 'Logs' table.
INSERT INTO Logs values(1,SYSDATETIME() AT TIME ZONE 'UTC' AT TIME ZONE 'India Standard Time')

-- 59. Display the current UTC date and time with high precision.
SELECT SYSDATETIMEOFFSET() AT TIME ZONE 'India Standard Time' AS Time_with_precision

-- 60. Calculate the difference in microseconds between the current local time and UTC time.
SELECT DATEDIFF(microsecond, GETDATE(), SYSDATETIME() AT TIME ZONE 'UTC')

-- 61. Get the current date, time, and time zone offset.
select SYSDATETIMEOFFSET() as Date_Time_Offset

-- 62. From a 'GlobalEvents' table, convert all event times to include time zone offset information.
SELECT EventTime, EventTime AT TIME ZONE 'UTC' AS Utc_Event_Time FROM GlobalEvents

-- 63. Extract the month number from the date '2023-12-25'.
SELECT MONTH('2023-12-25') as Month_Number

-- 64. From a 'Sales' table, find the total sales for each month of the previous year.
SELECT MONTH(SaleDate) as Month_Num,COUNT(SaleId) as Total_Count FROM Sales WHERE DATEDIFF(YEAR,SaleDate,GETDATE())=1 GROUP BY MONTH(SaleDate)

-- 65. Extract the day of the month from '2023-03-15'.
SELECT DATENAME(WEEKDAY,'2023-03-15') AS DAYNAME

-- 66. Write a query to find all orders from an 'Orders' table that were placed on the 15th day of any month.
SELECT * FROM Orders WHERE DAY(Orderdate) = 15

-- 67. Get the name of the month for the date '2023-09-01'.
SELECT DATENAME(month,'2023-09-01') as Month_Name


-- 68. From an 'Events' table, write a query to display the day of the week (in words) for each event date.
SELECT Eventdate,DATENAME(WEEKDAY,Eventdate) as Day_Name from Events

-- 69. Create a date for Christmas Day 2023.
SELECT CAST('2023-12-25' AS DATE) as Christmas

-- 70. Write a query to convert separate year, month, and day columns from a 'Dates' table into a single DATE column.
UPDATE Dates set Date_complete=DATEFROMPARTS(year,month,day)