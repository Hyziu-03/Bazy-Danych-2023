USE firma;

-- Æwiczenie 6b

-- Zadanie a

ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon VARCHAR(20);

UPDATE ksiegowosc.pracownicy
SET telefon = '(+48) ' + telefon;

-- Zadanie b

UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT(
	SUBSTRING(telefon, 1, 5), 
	' ',
	SUBSTRING(telefon, 7, 3),
	' ',
	SUBSTRING(telefon, 11, 3),
	' ',
	SUBSTRING(telefon, 15, 3)
);

-- Zadanie c 

SELECT * FROM ksiegowosc.pracownicy
WHERE nazwisko IN (
	SELECT MAX(nazwisko) FROM ksiegowosc.pracownicy
);

-- Zadanie d

SELECT 
	HASHBYTES('md5', imie) AS imie,
	HASHBYTES('md5', nazwisko) AS nazwisko,
	HASHBYTES('md5', adres) AS adres,
	HASHBYTES('md5', telefon) AS telefon,
	HASHBYTES('md5', CONVERT(
		VARCHAR, ksiegowosc.pracownicy.id_pracownika
	)) AS id_pracownika,
	HASHBYTES('md5', CONVERT(
		VARCHAR, ksiegowosc.pensja.id_pensji
	)) AS id_pensji,
	HASHBYTES('md5', CONVERT(
		VARCHAR, ksiegowosc.pensja.kwota
	)) AS kwota,
	HASHBYTES('md5', stanowisko) AS stanowisko
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pracownicy
ON w.id_pracownika = ksiegowosc.pracownicy.id_pracownika
JOIN ksiegowosc.pensja
ON w.id_pensji = ksiegowosc.pensja.id_pensji;

-- Zadanie f



-- Zadanie g


