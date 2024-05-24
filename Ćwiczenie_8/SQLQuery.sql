-- Zadanie 1

USE AdventureWorks2019;

WITH GetEmpInfo AS (
	SELECT 
		eph.BusinessEntityID, eph.Rate, eph.PayFrequency,
		emp.BirthDate, emp.MaritalStatus, emp.Gender,
		pp.FirstName, pp.MiddleName, pp.LastName
	FROM HumanResources.EmployeePayHistory eph
		JOIN Person.Person pp
	ON eph.BusinessEntityID = pp.BusinessEntityID
		JOIN HumanResources.Employee emp
	ON emp.BusinessEntityID = eph.BusinessEntityID 
)
SELECT * FROM GetEmpInfo;

-- Zadanie 2

USE AdventureWorksLT2022;

WITH GetContRev AS (
	SELECT 
		SalesLT.Customer.CompanyName AS CompanyContact, 
		soh.TotalDue AS Revenue 
	FROM SalesLT.Customer
		JOIN SalesLT.SalesOrderHeader soh
	ON SalesLT.Customer.CustomerID = soh.CustomerID
) 
SELECT * FROM GetContRev 
ORDER BY CompanyContact ASC;

-- Zadanie 3

WITH GetCatSalesVal AS (
	SELECT 
		pc.Name AS Category, 
		SUM(soh.TotalDue) AS SalesValue
	FROM SalesLT.SalesOrderDetail
		JOIN SalesLT.SalesOrderHeader soh
	ON SalesLT.SalesOrderDetail.SalesOrderID = soh.SalesOrderID
		JOIN SalesLT.Product 
	ON SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID
		JOIN SalesLT.ProductCategory pc
	ON pc.ProductCategoryID = SalesLT.Product.ProductCategoryID
	GROUP BY pc.Name
) SELECT * FROM GetCatSalesVal;
