CREATE DATABASE Geo;

-- Schemat znormalizowany

CREATE TABLE GeoEon (
	id_eon INT PRIMARY KEY,
	nazwa_eon VARCHAR(255) 
);

CREATE TABLE GeoEra (
	id_era INT PRIMARY KEY,
	id_eon INT,
	FOREIGN KEY(id_eon) REFERENCES GeoEon(id_eon),
	nazwa_era VARCHAR(255)
);

CREATE TABLE GeoOkres (
	id_okres INT PRIMARY KEY ,
	id_era INT, 
	FOREIGN KEY(id_era) REFERENCES GeoEra(id_era),
	nazwa_okres VARCHAR(255)
);

CREATE TABLE GeoEpoka (
	id_epoka INT PRIMARY KEY,
	id_okres INT, 
	FOREIGN key(id_okres) REFERENCES GeoOkres(id_okres),
	nazwa_epoka VARCHAR(255)
);

CREATE TABLE GeoPietro (
	id_pietro INT PRIMARY KEY,
	id_epoka INT, 
	FOREIGN KEY(id_epoka) REFERENCES GeoEpoka(id_epoka),
	nazwa_pietro VARCHAR(255)
);

INSERT INTO GeoEon (id_eon, nazwa_eon) VALUES (1, 'FANEROZOIK');

INSERT INTO GeoEra (id_era, nazwa_era, id_eon) VALUES (3, 'Kenozoik', 1);
INSERT INTO GeoEra (id_era, nazwa_era, id_eon) VALUES (2, 'Mezozoik', 1);
INSERT INTO GeoEra (id_era, nazwa_era, id_eon) VALUES (1, 'Paleozoik', 1);

INSERT INTO GeoOkres (id_okres, nazwa_okres, id_era) VALUES (9, 'Czwartorzęd', 3);
INSERT INTO GeoOkres (id_okres, nazwa_okres, id_era) VALUES (8, 'Neogen', 3);
INSERT INTO GeoOkres (id_okres, nazwa_okres, id_era) VALUES (7, 'Paleogen', 3);
INSERT INTO GeoOkres (id_okres, nazwa_okres, id_era) VALUES (6, 'Kreda', 2);
INSERT INTO GeoOkres (id_okres, nazwa_okres, id_era) VALUES (5, 'Jura', 2);
INSERT INTO GeoOkres (id_okres, nazwa_okres, id_era) VALUES (4, 'Trias', 2);
INSERT INTO GeoOkres (id_okres, nazwa_okres, id_era) VALUES (3, 'Perm', 1);
INSERT INTO GeoOkres (id_okres, nazwa_okres, id_era) VALUES (2, 'Karbon', 1);
INSERT INTO GeoOkres (id_okres, nazwa_okres, id_era) VALUES (1, 'Dewon', 1);

INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (22, 'Halocen', 9);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (21, 'Plejstocen', 9);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (20, 'Pliocen', 8);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (19, 'Miocen', 8);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (18, 'Oligocen',7);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (17, 'Eocen', 7);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (16, 'Paleocen', 7);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (15, 'Kreda Górna', 6);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (14, 'Kreda Dolna', 6);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (13, 'Jura Górna', 5);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (12, 'Jura Środkowa', 5);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (11, 'Jura Dolna', 5);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (10, 'Trias Górny', 4);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (9, 'Trias Środkowy', 4);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (8, 'Trias Dolny', 4);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (7, 'Perm Górny', 3);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (6, 'Perm Dolny', 3);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (5, 'Karbon Górny', 2);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (4, 'Karbon Dolny', 2);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (3, 'Dewon Górny', 1);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (2, 'Dewon Środkowy', 1);
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES (1, 'Dewon Dolny', 1);

INSERT INTO GeoPietro (id_pietro, nazwa_pietro, id_epoka) VALUES 
(54, 'Alb', 22),
(53, 'Apt', 22),
(52, 'Barrem', 22),
(51, 'Hoteryw', 22),
(50, 'Walanzyn', 22),
(49, 'Berias', 22),
(48, 'Tyton', 21),
(47, 'Kimeryd', 21),
(46, 'Oksford', 21),
(45, 'Kelowej', 20),
(44, 'Baton', 20),
(43, 'Bajos', 20),
(42, 'Aalen',20),
(41, 'Toark', 19),
(40, 'Pliensbach', 19),
(39, 'Synemur', 19),
(38, 'Hetang', 19),
(37, 'Retyk', 18),
(36, 'Noryk', 18),
(35, 'Karnik', 18),
(34, 'Ladyn', 17),
(33, 'Anizyk', 17),
(32, 'Scytyk', 16),
(31, 'Tatar', 15),
(30, 'Kazań', 15),
(29, 'Kungur', 15),
(28, 'Artynsk', 14),
(27, 'Sakmar', 14),
(26, 'Aselsk', 14),
(25, 'Stefan', 13),
(24, 'Westfal', 13),
(23, 'Namur', 13),
(22, 'Wizen', 12),
(21, 'Turnej', 12),
(20, 'Famen', 11),
(19, 'Fran', 11),
(18, 'Zywet', 10),
(17, 'Eifel', 10),
(16, 'Ems', 9),
(15, 'Zigen', 9),
(14, 'Żedyn', 9),
(13, 'Postludlow', 8),
(12, 'Ludlow', 8),
(11, 'Wenlok', 7),
(10, 'Landower', 7),
(9, 'Aszgil', 6),
(8, 'Karadok', 6),
(7, 'Landeil', 5),
(6, 'Landwirn', 5),
(5, 'Arenig', 4),
(4, 'Tremadok', 4),
(3, 'Potsdam', 3),
(2, 'Akad', 2),
(1, 'Georg', 1);

-- Schemat zdenormalizowany

CREATE TABLE GeoTabela (
   id_pietro INT PRIMARY KEY,
   nazwa_pietro VARCHAR(255),
   id_epoka INT,
   nazwa_epoka VARCHAR(255),
   id_okres INT,
   nazwa_okres VARCHAR(255),
   id_era INT,
   nazwa_era VARCHAR(255),
   id_eon INT,
   nazwa_eon VARCHAR(255)
);

INSERT INTO GeoTabela (
   id_pietro, nazwa_pietro,
   id_epoka, nazwa_epoka,
   id_okres, nazwa_okres,
   id_era, nazwa_era,
   id_eon, nazwa_eon
) 
SELECT 
   GeoPietro.id_pietro, GeoPietro.nazwa_pietro,
   GeoEpoka.id_epoka, GeoEpoka.nazwa_epoka,
   GeoOkres.id_okres, GeoOkres.nazwa_okres,
   GeoEra.id_era, GeoEra.nazwa_era,
   GeoEon.id_eon, GeoEon.nazwa_eon
FROM GeoEpoka 
	INNER JOIN GeoPietro 
ON GeoPietro.id_epoka = GeoEpoka.id_epoka
	INNER JOIN GeoOkres 
ON GeoEpoka.id_okres = GeoOkres.id_okres
	INNER JOIN GeoEra 
ON GeoOkres.id_era = GeoEra.id_era
	INNER JOIN GeoEon 
ON GeoEra.id_eon = GeoEon.id_eon;

-- Testy wydajności

CREATE TABLE Milion (
	cyfra INT,
	liczba INT,
	bit_wart INT
);

DO $$
DECLARE
    i INT := 0;
BEGIN
    WHILE i < 1000000 LOOP
        INSERT INTO Milion (cyfra, liczba, bit_wart)
        VALUES (i % 10, i, i % 10);
        
        i := i + 1;
    END LOOP;
END $$;










-- Wyniki testów

SET STATISTICS TIME ON;
SET STATISTICS TIME OFF;

-- Zapytanie 1

SELECT COUNT(*) FROM Milion 
	INNER JOIN GeoTabela 
ON (Milion.liczba % 54) = GeoTabela.id_pietro;

-- Zapytanie 2

SELECT COUNT(*) FROM Milion 
	INNER JOIN GeoPietro 
ON (Milion.liczba % 54) = GeoPietro.id_pietro 
	INNER JOIN GeoEpoka 
ON GeoPietro.id_epoka = GeoEpoka.id_epoka
	INNER JOIN GeoOkres 
ON GeoEpoka.id_okres = GeoOkres.id_okres
	INNER JOIN GeoEra 
ON GeoOkres.id_era = GeoEra.id_era
	INNER JOIN GeoEon 
ON GeoEra.id_eon = GeoEon.id_eon;
	
-- Zapytanie 3

SELECT COUNT(*) FROM Milion 
WHERE (Milion.liczba % 54) = (
	SELECT id_pietro FROM GeoTabela 
	WHERE (Milion.liczba % 54) = id_pietro
);

-- Zapytanie 4

SELECT COUNT(*) FROM Milion 
WHERE (Milion.liczba % 54) IN (
    SELECT GeoPietro.id_pietro 
    FROM GeoPietro 
		INNER JOIN GeoEpoka 
    ON GeoPietro.id_epoka = GeoEpoka.id_epoka
		INNER JOIN GeoOkres 
    ON GeoEpoka.id_okres = GeoOkres.id_okres
		INNER JOIN GeoEra 
    ON GeoOkres.id_era = GeoEra.id_era
		INNER JOIN GeoEon 
    ON GeoEra.id_eon = GeoEon.id_eon
);

-- Metadane

SET SHOWPLAN_ALL ON;
SET SHOWPLAN_ALL OFF;

SELECT index_id, avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats (
	DB_ID(N'Geo'), OBJECT_ID(N'Milion'), NULL, NULL, 'DETAILED'
);

-- Indeksy

EXEC sp_helpindex 'GeoTabela';

CREATE NONCLUSTERED INDEX Eon_Ind 
ON GeoEon(id_eon, nazwa_eon);

CREATE NONCLUSTERED INDEX Era_Ind 
ON GeoEra(id_era, id_eon, nazwa_era);

CREATE NONCLUSTERED INDEX Okres_Ind 
ON GeoOkres(id_okres, id_era, nazwa_okres);

CREATE NONCLUSTERED INDEX Epoka_Ind 
ON GeoEpoka(id_epoka, id_okres, nazwa_epoka);

CREATE NONCLUSTERED INDEX Pietro_Ind 
ON GeoPietro(id_pietro, id_epoka, nazwa_pietro);

CREATE NONCLUSTERED INDEX Tabela_Ind
ON GeoTabela (
	id_pietro, nazwa_pietro, 
	id_epoka, nazwa_epoka, 
	id_okres, nazwa_okres, 
	id_era, nazwa_era, 
	id_eon, nazwa_eon
);

CREATE NONCLUSTERED INDEX Milion_Ind
ON Milion (cyfra, liczba, bit_wart);
