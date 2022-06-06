--#1
SELECT Title, FirstName, Middlename, LastName FROM Person.Person

--#2
ALTER TABLE Person.Person ADD PersonName AS CONCAT(Title, '-' , FirstName, '-', LastName);
SELECT Title, FirstName, LastName, PersonName FROM Person.Person;

--#3
SELECT AddressLine1, AddressLine2, City, PostalCode FROM Person.Address

--#4
SELECT DISTINCT City FROM Person.Address

--#5
SELECT TOP(10) * FROM Person.Address;

--#6
SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory;

--#7
SELECT COUNT(*) FROM HumanResources.Employee;

--#8
SELECT CustomerID, COUNT(*) AS "count_number"
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(*)>10

--#9
SELECT * FROM [AdventureWorksTest].[Production].[Product] AS product
WHERE product.ProductID IN (
( SELECT DISTINCT ProductID FROM [AdventureWorksTest].[Production].[Product]
EXCEPT
SELECT DISTINCT ProductID FROM [AdventureWorksTest].[Sales].[SalesOrderDetail] )
)

--#10

--#11
SELECT * 
INTO Production.Product_Index 
FROM Production.Product
GO
CREATE INDEX Idx_Product_Index_ProductID
ON
Production.Product_Index(ProductID)

--#11 INDEX
SELECT * FROM [AdventureWorksTest].[Production].[Product_Index] AS product
WHERE product.ProductID IN (
( SELECT DISTINCT ProductID FROM [AdventureWorksTest].[Production].[Product_Index]
EXCEPT
SELECT DISTINCT ProductID FROM [AdventureWorksTest].[Sales].[SalesOrderDetail])
)