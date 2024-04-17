-- Zadanie 1

CREATE DATABASE firma;

-- Zadanie 2

CREATE SCHEMA ksiegowosc;

-- Zadanie 4

CREATE TABLE ksiegowosc.pracownicy (
	id_pracownika SMALLINT PRIMARY KEY, 
	imie VARCHAR(35), 
	nazwisko VARCHAR(35), 
	adres VARCHAR(70), 
	telefon VARCHAR(14)
);

CREATE TABLE ksiegowosc.godziny (
	id_godziny SMALLINT PRIMARY KEY,  
	data DATE, 
	liczba_godzin SMALLINT, 
	id_pracownika SMALLINT FOREIGN KEY REFERENCES ksiegowosc.pracownicy(id_pracownika)
);

CREATE TABLE ksiegowosc.pensja (
	id_pensji SMALLINT PRIMARY KEY, 
	stanowisko VARCHAR(35),
	kwota SMALLINT
); 

CREATE TABLE ksiegowosc.premia (
	id_premii SMALLINT PRIMARY KEY, 
	rodzaj VARCHAR(35), 
	kwota SMALLINT
);

CREATE TABLE ksiegowosc.wynagrodzenie ( 
	id_wynagrodzenia SMALLINT PRIMARY KEY, 
	data DATE, 
	id_pracownika SMALLINT FOREIGN KEY REFERENCES ksiegowosc.pracownicy(id_pracownika),
	id_godziny SMALLINT FOREIGN KEY REFERENCES ksiegowosc.godziny(id_godziny), 
	id_pensji SMALLINT FOREIGN KEY REFERENCES ksiegowosc.pensja(id_pensji), 
	id_premii SMALLINT FOREIGN KEY REFERENCES ksiegowosc.premia(id_premii)
);

EXEC sys.sp_addextendedproperty 
    @name = N'Pracownicy', 
    @value = N'Tabela zawiera informacje nt. pracowników';

EXEC sys.sp_addextendedproperty 
    @name = N'Godziny', 
    @value = N'Tabela zawiera informacje nt. terminu wyp³acenia wynagrodzenia';

EXEC sys.sp_addextendedproperty 
    @name = N'Pensja', 
    @value = N'Tabela zawiera informacje nt. pensji';

EXEC sys.sp_addextendedproperty 
    @name = N'Premia', 
    @value = N'Tabela zawiera informacje nt. premii';

EXEC sys.sp_addextendedproperty 
    @name = N'Wynagrodzenie', 
    @value = N'Tabela zawiera pe³n¹ informacjê nt. wynagrodzenia';

-- Zadanie 5

INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
    (1, 'Jan', 'Kowalski', 'ul. Wiejska 1, 00-001 Bydgoszcz', '123-456-789'),
    (2, 'Anna', 'Nowak', 'ul. Kwiatowa 5, 30-010 Kraków', '987-654-321'),
    (3, 'Marek', 'Wiœniewski', 'ul. Szkolna 10, 40-020 Poznañ', '111-222-333'),
    (4, 'Ewa', 'D¹browska', 'ul. Leœna 15, 50-030 Wroc³aw', '444-555-666'),
    (5, 'Piotr', 'Lewandowski', 'ul. Polna 20, 70-040 Szczecin', '777-888-999'),
    (6, 'Magda', 'Wójcik', 'ul. Ogrodowa 25, 60-050 Gdañsk', '222-333-444'),
    (7, 'Grzegorz', 'Kamiñski', 'ul. Zielona 30, 40-060 Lublin', '555-666-777'),
    (8, 'Barbara', 'Zieliñska', 'ul. Weso³a 35, 90-070 Gdynia', '888-999-000'),
    (9, 'Tomasz', 'Szymañski', 'ul. Cicha 40, 80-080 Katowice', '333-444-555'),
    (10, 'Alicja', 'WoŸniak', 'ul. S³oneczna 45, 00-090 Rzeszów', '999-000-111');

INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
    (1, '2024-04-01', 40, 1),
    (2, '2024-04-02', 50, 2),
    (3, '2024-04-03', 60, 3),
    (4, '2024-04-04', 40, 4),
    (5, '2024-04-05', 45, 5),
    (6, '2024-04-06', 40, 6),
    (7, '2024-04-07', 50, 7),
    (8, '2024-04-08', 40, 8),
    (9, '2024-04-09', 60, 9),
    (10, '2024-04-10', 50, 10);

INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota)
VALUES
    (1, 'Pracownik biurowy', 6000),
    (2, 'Ksiêgowa', 6500),
    (3, 'Specjalista ds. marketingu', 5000),
    (4, 'Programistka', 5500),
    (5, 'Manager', 5000),
    (6, 'Kierowniczka dzia³u', 5500),
    (7, 'Dyrektor', 6000),
    (8, 'Analityczka finansowa', 5500),
    (9, 'Administrator sieci', 5000),
    (10, 'Specjalistka ds. HR', 5500);

INSERT INTO ksiegowosc.premia (id_premii, rodzaj, kwota)
VALUES
    (1, 'Premia za sta¿ pracy', 500),
    (2, 'Premia za innowacje', 1000),
    (3, 'Premia za sta¿ pracy', 300),
    (4, 'Premia za innowacje', 800),
    (5, 'Premia motywacyjna', 200),
    (6, 'Premia za sta¿ pracy', 700),
    (7, 'Premia motywacyjna', 600),
    (8, 'Premia za innowacje', 400),
    (9, 'Premia motywacyjna', 900),
    (10, 'Premia za sta¿ pracy', 1000);

INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES
    (1, '2024-04-01', 1, 1, 1, 1),
    (2, '2024-04-02', 2, 2, 2, 2),
    (3, '2024-04-03', 3, 3, 3, 3),
    (4, '2024-04-04', 4, 4, 4, 4),
    (5, '2024-04-05', 5, 5, 5, 5),
    (6, '2024-04-06', 6, 6, 6, 6),
    (7, '2024-04-07', 7, 7, 7, 7),
    (8, '2024-04-08', 8, 8, 8, 8),
    (9, '2024-04-09', 9, 9, 9, 9),
    (10, '2024-04-10', 10, 10, 10, 10);

-- Zadanie 6a

SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

-- Zadanie 6b

-- 5000 zamiast 1000, ¿eby polecenie wypisywa³o wynik

SELECT ksiegowosc.wynagrodzenie.id_pracownika
FROM ksiegowosc.wynagrodzenie
INNER JOIN ksiegowosc.pensja 
ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensja.id_pensji
WHERE pensja.kwota > 5000;

-- Zadanie 6c

SELECT ksiegowosc.wynagrodzenie.id_pracownika
FROM ksiegowosc.wynagrodzenie
INNER JOIN ksiegowosc.pensja 
ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensja.id_pensji
WHERE pensja.kwota > 2000 AND id_premii IS NULL;

-- Zadanie 6d

SELECT * FROM ksiegowosc.pracownicy
WHERE SUBSTRING(imie, 1, 1) = 'J';

-- Zadanie 6e

SELECT * FROM ksiegowosc.pracownicy
WHERE RIGHT(imie, 1) = 'a' AND nazwisko LIKE '%w%';

-- 'w' zamiast 'n', aby polecenie wypisywa³o wynik

-- Zadanie 6f

-- 50, aby polecenie wypisywa³o wynik

SELECT 
ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, 
(godziny.liczba_godzin - 50) AS nadgodziny
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.godziny 
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
WHERE liczba_godzin > 50;

-- Zadanie 6g

SELECT pracownicy.imie, pracownicy.nazwisko, pensja.kwota
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie
ON pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensja
ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
WHERE ksiegowosc.pensja.kwota BETWEEN 5500 AND 6500;

-- Wide³ki 5500 i 6500, aby polecenie wypisywa³o wynik

-- Zadanie 6h

SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.godziny 
ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.godziny.id_pracownika
INNER JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
INNER JOIN ksiegowosc.premia
ON ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii
WHERE liczba_godzin > 50 AND ksiegowosc.premia.id_premii IS NULL;

-- Zadanie 6i

SELECT *
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
INNER JOIN ksiegowosc.pensja
ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
ORDER BY ksiegowosc.pensja.kwota;

-- Zadanie 6j

SELECT *
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
INNER JOIN ksiegowosc.pensja
ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
INNER JOIN ksiegowosc.premia
ON ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii
ORDER BY ksiegowosc.pensja.kwota DESC, ksiegowosc.premia.kwota DESC;
