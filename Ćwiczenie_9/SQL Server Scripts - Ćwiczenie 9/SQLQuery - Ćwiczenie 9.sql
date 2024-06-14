-- Zadanie 1

USE AdventureWorks2019;

-- SELECT ListPrice FROM Production.Product WHERE ProductID = 680;

BEGIN TRANSACTION;

UPDATE Production.Product 
SET ListPrice = 1.1 * ListPrice 
WHERE ProductID = 680;

COMMIT;





-- Zadanie 2

-- SELECT * FROM Production.Product WHERE ProductID = 707;

BEGIN TRANSACTION;

DELETE FROM Production.Product 
WHERE ProductID = 707;

ROLLBACK;





-- Zadanie 3

BEGIN TRANSACTION;

INSERT INTO Production.Product
(
    Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel,
    ReorderPoint, StandardCost, ListPrice, DaysToManufacture,
	ProductSubcategoryID, ProductModelID, SellStartDate, rowguid,
    ModifiedDate
)
VALUES
(
    'Aerostatic orange pilot jacket', 'DE-001', 1, 1, 1000, 750, 20.00, 
	50.00, 5, 1, 1, GETDATE(), NEWID(), GETDATE()              
);

COMMIT;





-- Zadanie 4

BEGIN TRANSACTION;

-- SELECT SUM(StandardCost) AS sum FROM Production.Product;

UPDATE Production.Product
SET StandardCost = 1.1 * StandardCost;

DECLARE @StandardCostSum MONEY;
SELECT @StandardCostSum = SUM(StandardCost) FROM Production.Product;

IF @StandardCostSum <= 50000
	BEGIN 
		COMMIT
		PRINT 'Transakcja zosta³a zatwierdzona';
	END
ELSE
	BEGIN
		ROLLBACK
		PRINT 'Transakcja zosta³a wycofana';
	END





-- Zadanie 5

-- SELECT * FROM ProductNumbers;

CREATE TABLE ProductNumbers (
	pn VARCHAR
);

ALTER TABLE ProductNumbers
ALTER COLUMN pn VARCHAR(10);

-- Pocz¹tek transakcji

BEGIN TRANSACTION;

DECLARE @pn VARCHAR;
SET @pn = 'DE-001';

INSERT INTO Production.Product
(
    Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel,
    ReorderPoint, StandardCost, ListPrice, DaysToManufacture,
	ProductSubcategoryID, ProductModelID, SellStartDate, rowguid,
    ModifiedDate
)
VALUES
(
    'Aerostatic orange pilot jacket', @pn, 1, 1, 1000, 750, 20.00, 
	50.00, 5, 1, 1, GETDATE(), NEWID(), GETDATE()              
);

TRUNCATE TABLE ProductNumbers;

INSERT INTO ProductNumbers (pn)
SELECT ProductNumber
FROM Production.Product;

IF @pn IN (SELECT pn FROM ProductNumbers)
	BEGIN
		ROLLBACK
		PRINT 'Transakcja zosta³a wycofana';
	END
ELSE
	BEGIN
		COMMIT
		PRINT 'Transakcja zosta³a zatwierdzona';
	END

-- Koniec transakcji





-- Zadanie 6

-- SELECT * FROM Sales.SalesOrderDetail;

CREATE TABLE OrderDetail (
	Qty INT
);

-- Pocz¹tek transakcji

BEGIN TRANSACTION;

UPDATE Sales.SalesOrderDetail
SET OrderQty = OrderQty + 1;

TRUNCATE TABLE OrderDetail;

INSERT INTO OrderDetail(Qty)
SELECT OrderQty
FROM Sales.SalesOrderDetail;

IF 0 IN (SELECT Qty FROM OrderDetail)
	BEGIN
		ROLLBACK
		PRINT 'Transakcja zosta³a wycofana';
	END
ELSE
	BEGIN
		COMMIT
		PRINT 'Transakcja zosta³a zatwierdzona';
	END

-- Koniec transakcji

-- Completion time: 00:00:38





-- Zadanie 7

DECLARE @AvgPrice FLOAT;

CREATE TABLE Price(
	average FLOAT
);

TRUNCATE TABLE Price;

INSERT INTO Price(average) 
SELECT AVG(StandardCost) AS AvgPrice 
FROM Production.Product;

-- SELECT average FROM Price;

BEGIN TRANSACTION;

DELETE FROM Production.Product 
WHERE Production.Product.StandardCost > (SELECT average FROM Price);

IF @@ROWCOUNT > 10
	BEGIN
		ROLLBACK
		PRINT 'Transakcja zosta³a anulowana';
	END
ELSE
	BEGIN
		COMMIT
		PRINT 'Transakcja zosta³a zatwierdzona';
	END
