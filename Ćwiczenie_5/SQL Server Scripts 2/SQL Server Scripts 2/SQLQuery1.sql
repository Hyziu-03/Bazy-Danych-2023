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

-- Zadanie 6a



-- Zadanie 6b



-- Zadanie 6c



-- Zadanie 6d



-- Zadanie 6e



-- Zadanie 6f



-- Zadanie 6g



-- Zadanie 6h



-- Zadanie 6i



-- Zadanie 6j


