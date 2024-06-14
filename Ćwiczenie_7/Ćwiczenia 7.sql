USE AdventureWorks2019;

-- Zadanie 1?
-- Napisz procedurê wypisuj¹c¹ do konsoli ci¹g Fibonacciego. 
-- Procedura musi przyjmowaæ jako argument wejœciowy liczbê n. 
-- Generowanie ci¹gu Fibonacciego musi zostaæ zaimplementowane...
-- ...jako osobna funkcja, wywo³ywana przez procedurê.

-- Procedura nic nie zwraca

CREATE OR ALTER FUNCTION PrepFibSeq (@targetNum INT) RETURNS INT
AS
BEGIN
	DECLARE @seq TABLE(el INT);
	DECLARE @i INT = 3;

	INSERT INTO @seq VALUES (1);
	INSERT INTO @seq VALUES (1);

	DECLARE @last INT = NULL;
	DECLARE @penult INT = NULL;
	
	WHILE @i <= @targetNum
	BEGIN
		WITH FibNum AS 
		(
			SELECT el, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) 
			AS rows FROM @seq
		)
		SELECT @last = el FROM FibNum
		WHERE rows = @i - 1; 

		WITH FibNum AS (
			SELECT el, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) 
			AS rows FROM @seq
		)
		SELECT @penult = el FROM FibNum
		WHERE rows = @i - 2; 

		INSERT INTO @seq VALUES (@last + @penult);
		SET @i = @i + 1;
	END

	RETURN (@last + @penult)
END;

CREATE OR ALTER PROCEDURE GenFibSeq (@n INT) AS
BEGIN
	DECLARE @res TABLE(VALUE INT);
	INSERT INTO @res EXEC PrepFibSeq @targetNum = @n;
	SELECT * FROM @res;
END

EXEC GenFibSeq @n = 10;

-- Zadanie 2
-- Napisz trigger DML, który po wprowadzeniu danych do tabeli...
-- ...Persons zmodyfikuje nazwisko tak, aby by³o napisane...
-- ...du¿ymi literami.

CREATE OR ALTER TRIGGER Uppercase 
ON Person.Person FOR UPDATE AS
BEGIN
	UPDATE Person.Person SET LastName = UPPER(LastName);
END

-- Testy:
-- INSERT INTO Person.Person 
-- VALUES (123456, 'IN', 0, NULL, 'Martin', 'Luther', 'King', NULL, 9, NULL, NULL, 'ASFSDFS34-SDVSD-RWQRW321', NULL);
-- ALTER TABLE Person.Person
-- ALTER COLUMN rowguid VARCHAR(50);

-- Zadanie 3
-- Przygotuj trigger taxRateMonitoring, który wyœwietli...
-- ...komunikat o b³êdzie, je¿eli nast¹pi zmiana...
-- ...wartoœci w polu ‘TaxRate’ o wiêcej ni¿ 30%.

CREATE OR ALTER TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate FOR UPDATE AS
BEGIN
	SELECT @new = SalexTaxRate FROM deleted;
	SELECT @old = SalexTaxRate FROM inserted;
	
	IF ABS(@old - @new) > (0.30 * @old)
	BEGIN
		RAISERROR('ERROR: It is prohibited to change TaxRate by more than 30%', 1, 1)
	END
END
