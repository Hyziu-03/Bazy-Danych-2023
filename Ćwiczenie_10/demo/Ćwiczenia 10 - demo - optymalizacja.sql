

USE Adventureworks2019
EXEC sp_helpindex 'Sales.SalesOrderDetail' -- procedura zwracajaca detale dotyczace indeksów

-- inny sposob wyswietlenia planu wykonania zapytania
SET SHOWPLAN_ALL ON;
GO
SELECT * FROM Sales.SalesOrderDetail WHERE ProductID = 870;
GO
SET SHOWPLAN_ALL OFF;


-- statystyki
UPDATE STATISTICS Sales.SalesOrderDetail;

-- fragmentacja
-- sprawdzenie fragmentacji
SELECT index_id, avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats (DB_ID(N'AdventureWorks2019'), OBJECT_ID(N'Sales.SalesOrderDetail'), NULL, NULL, 'DETAILED');

-- reorganizacja indeksu 
ALTER INDEX IX_ProductID ON Sales.SalesOrderDetail REORGANIZE;

-- przebudowa indeksu
ALTER INDEX IX_ProductID ON Sales.SalesOrderDetail REBUILD;


-- test wydajnosci bez indeksu / z indeksem

SELECT sod.SalesOrderID, sod.OrderQty, p.Name, p.ProductNumber
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
WHERE sod.ProductID = 870 AND sod.OrderQty > 5;

CREATE NONCLUSTERED INDEX IX_ProductID_OrderQty ON Sales.SalesOrderDetail(ProductID, OrderQty);


