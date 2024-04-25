-- �wiczenie 5

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
WHERE stanowisko = 'Ksi�gowa';

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

SELECT 
	ksiegowosc.pensja.stanowisko,
	COUNT(ksiegowosc.premia.id_premii) AS liczba_premii
FROM ksiegowosc.wynagrodzenie
	JOIN ksiegowosc.pracownicy
ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
	JOIN ksiegowosc.premia
ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii
	JOIN ksiegowosc.pensja 
ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
GROUP BY ksiegowosc.pensja.stanowisko;

-- Zadanie 6h

-- B��d "The DELETE statement conflicted with the REFERENCE constraint", wi�c...

ALTER TABLE ksiegowosc.godziny
DROP CONSTRAINT FK__godziny__id_prac__398D8EEE;

ALTER TABLE ksiegowosc.wynagrodzenie
DROP CONSTRAINT FK__wynagrodz__id_pr__403A8C7D;

DELETE FROM ksiegowosc.pracownicy 
WHERE ksiegowosc.pracownicy.id_pracownika 
	IN ( 
		SELECT ksiegowosc.pracownicy.id_pracownika FROM ksiegowosc.wynagrodzenie
			INNER JOIN ksiegowosc.pracownicy
		ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
			INNER JOIN ksiegowosc.pensja
		ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
		WHERE ksiegowosc.pensja.kwota < 5500
	);
