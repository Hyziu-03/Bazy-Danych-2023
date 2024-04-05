-- Utwórz nową bazę danych nazywając ją firma

/*
CREATE DATABASE firma;
USE firma;
CREATE SCHEMA rozliczenia;
*/

-- Dodaj nowy schemat o nazwie rozliczenia

-- Dodaj do schematu rozliczenia cztery tabele
-- Ustal typu danych, aby przetwarzanie i składowanie było optymalne
-- Zastanów się, które pola muszą przyjmować wartość NOT NULL
-- Ustaw klucz główny dla każdej tabeli

/*
CREATE TABLE rozliczenia.pracownicy (
    id_pracownika SMALLINT PRIMARY KEY NOT NULL,
    imie VARCHAR(35) NOT NULL,
    nazwisko VARCHAR(35) NOT NULL,
    adres VARCHAR(70),
    telefon VARCHAR(14)
);

CREATE TABLE rozliczenia.godziny (
    id_godziny SMALLINT PRIMARY KEY NOT NULL,
    data DATE NOT NULL,
    liczba_godzin SMALLINT,
    id_pracownika SMALLINT NOT NULL
);

CREATE TABLE rozliczenia.pensje (
    id_pensji SMALLINT PRIMARY KEY NOT NULL,
    stanowisko VARCHAR(35),
    kwota SMALLINT NOT NULL,
    id_premii SMALLINT
);

CREATE TABLE rozliczenia.premie (
    id_premii SMALLINT PRIMARY KEY NOT NULL,
    rodzaj VARCHAR(35),
    kwota SMALLINT NOT NULL
);
*/

-- Dodaj klucze obce tam gdzie występują

/*
ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika) 
REFERENCES rozliczenia.pracownicy(id_pracownika);

ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii)
REFERENCES rozliczenia.premie(id_premii);
*/

-- Wypełnij każdą tabelę 10. rekordami

/*
INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) VALUES
(1, 'Jan', 'Kowalski', 'ul. Wiejska 1, 00-001 Warszawa', '+48123456789'),
(2, 'Anna', 'Nowak', 'ul. Ogrodowa 5, 30-005 Kraków', '+48987654321'),
(3, 'Piotr', 'Wiśniewski', 'ul. Leśna 10, 50-010 Wrocław', '+48456123789'),
(4, 'Maria', 'Dąbrowska', 'ul. Szkolna 3, 20-002 Poznań', '+48789456123'),
(5, 'Krzysztof', 'Lewandowski', 'ul. Polna 8, 40-003 Gdańsk', '3+4821654987'),
(6, 'Magdalena', 'Wójcik', 'ul. Rycerska 12, 60-004 Łódź', '+48654987321'),
(7, 'Wojciech', 'Kamiński', 'ul. Podgórska 7, 70-007 Lublin', '+48159357846'),
(8, 'Aleksandra', 'Kowalczyk', 'ul. Lipowa 15, 80-008 Katowice', '+48369852147'),
(9, 'Michał', 'Zieliński', 'ul. Kwiatowa 20, 90-009 Szczecin', '+48258147369'),
(10, 'Monika', 'Woźniak', 'ul. Parkowa 25, 10-010 Bydgoszcz', '+48147258369');

INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) VALUES
(1, '2024-04-01', 87, 1),
(2, '2024-04-02', 78, 2),
(3, '2024-04-03', 96, 3),
(4, '2024-04-04', 67, 4),
(5, '2024-04-05', 89, 5),
(6, '2024-04-06', 78, 6),
(7, '2024-04-07', 97, 7),
(8, '2024-04-08', 67, 8),
(9, '2024-04-09', 86, 9),
(10, '2024-04-10', 76, 10);

INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota) VALUES
(1, 'Premia za staż pracy', 1000),
(2, 'Premia za staż pracy', 1000),
(3, 'Premia motywacyjna', 500),
(4, 'Premia za innowacje', 700),
(5, 'Premia za innowacje', 700),
(6, 'Premia motywacyjna', 500),
(7, 'Premia motywacyjna', 500),
(8, 'Premia motywacyjna', 500),
(9, 'Premia za innowacje', 700),
(10, 'Premia za innowacje', 700);

INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii) VALUES
(1, 'Programista', 12000, 1),
(2, 'Analityczka', 1100, 2),
(3, 'Księgowy', 10000, 3),
(4, 'Specjalistka ds. sprzedaży', 10000, 4),
(5, 'Administrator systemów', 12000, 5),
(6, 'Doradczyni klienta', 10000, 6),
(7, 'Inżynier oprogramowania', 13000, 7),
(8, 'Specjalistka ds. logistyki', 11000, 8),
(9, 'Projektant graficzny', 12000, 9),
(10, 'Specjalistka ds. marketingu', 11000, 10);
*/

-- Wyświetl nazwiska pracowników i ich adresy

/*
SELECT nazwisko, adres 
FROM rozliczenia.pracownicy;
*/
