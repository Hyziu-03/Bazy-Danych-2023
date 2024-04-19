USE firma;

-- Poprawki

UPDATE ksiegowosc.pensja 
SET stanowisko = 'Administrator sieci'
WHERE stanowisko = 'Specjalista ds. marketingu';

UPDATE ksiegowosc.pensja 
SET stanowisko = 'Manager'
WHERE stanowisko = 'Dyrektor';

UPDATE ksiegowosc.pensja 
SET stanowisko = 'Analityczka finansowa'
WHERE stanowisko = 'Ksiêgowa';

UPDATE ksiegowosc.pensja 
SET stanowisko = 'Administrator sieci'
WHERE stanowisko = 'Programistka';

-- Zadanie 6k

CREATE VIEW zestawienie_stanowisk AS SELECT 
	ksiegowosc.pracownicy.id_pracownika, 
	ksiegowosc.pracownicy.imie, 
	ksiegowosc.pracownicy.nazwisko, 
	ksiegowosc.pensja.stanowisko,
	ksiegowosc.pensja.kwota
FROM ksiegowosc.pracownicy
	INNER JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
	INNER JOIN ksiegowosc.pensja
ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji;

SELECT 
	COUNT(stanowisko) AS stan, 
	stanowisko
FROM zestawienie_stanowisk
GROUP BY stanowisko;

-- Zadanie 6l

SELECT
	MIN(kwota) AS minimalne_wynagrodzenie,
	MAX(kwota) AS maksymalne_wynagrodzenie,
	AVG(kwota) AS srednie_wynagrodzenie
FROM zestawienie_stanowisk
WHERE stanowisko = 'Manager';

-- Zadanie 6m

SELECT 
	SUM(kwota) AS suma_wynagrodzen
FROM zestawienie_stanowisk;

-- Zadanie 6f

SELECT 
	SUM(kwota) AS suma_wynagrodzen,
	stanowisko
FROM zestawienie_stanowisk
GROUP BY stanowisko;

-- Zadanie 6g



-- Zadanie 6h?

SELECT * FROM ksiegowosc.pracownicy
	INNER JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
	INNER JOIN ksiegowosc.pensja
ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji;
