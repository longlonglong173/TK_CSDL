-- index
SELECT * INTO HumanResources.Employee_Index FROM HumanResources.Employee
USE AdventureWorksTest
GO
CREATE INDEX IndexName ON HumanResources.Employee_Index(BusinessEntityID)

--clustered index
SELECT * INTO HumanResources.Employee_Clustered_Index FROM HumanResources.Employee
USE AdventureWorksTest
GO
CREATE INDEX CulusterIndexName ON HumanResources.Employee_Clustered_Index(BusinessEntityID)

--clustered index
SELECT * INTO HumanResources.Employee_NonClustered_Index FROM HumanResources.Employee
USE AdventureWorksTest
GO
CREATE INDEX NonCulusterIndexName ON HumanResources.Employee_NonClustered_Index(BusinessEntityID)

-- non-index
SELECT * FROM HumanResources.Employee AS DATA
WHERE LOWER(DATA.JobTitle) LIKE '%design%'

--index
SELECT * FROM HumanResources.Employee_Index AS DATA
WHERE LOWER(DATA.JobTitle) LIKE '%design%'

--clustered-index
SELECT * FROM HumanResources.Employee_Clustered_Index AS DATA
WHERE LOWER(DATA.JobTitle) LIKE '%design%'

--non-clustered-index
SELECT * FROM HumanResources.Employee_Clustered_Index AS DATA
WHERE LOWER(DATA.JobTitle) LIKE '%design%'