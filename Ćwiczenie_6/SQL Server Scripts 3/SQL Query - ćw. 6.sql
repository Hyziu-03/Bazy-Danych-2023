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

SELECT 
	ksiegowosc.pracownicy.imie,
	ksiegowosc.pracownicy.nazwisko,	
	ksiegowosc.pensja.kwota AS pensja,
	ksiegowosc.premia.kwota AS premia
FROM ksiegowosc.wynagrodzenie w
	LEFT JOIN ksiegowosc.pracownicy 
ON w.id_pracownika = ksiegowosc.pracownicy.id_pracownika
	LEFT JOIN ksiegowosc.premia 
ON w.id_premii = ksiegowosc.premia.id_premii
	LEFT JOIN ksiegowosc.pensja 
ON w.id_pensji = ksiegowosc.pensja.id_pensji
WHERE ksiegowosc.pracownicy.id_pracownika IS NOT NULL;


-- Zadanie g

SELECT CONCAT(
	'Pracownik(ca) ', p.imie, ' ', p.nazwisko, 
	' w dniu ', g.data, 
	' otrzyma³(a) pensjê ca³kwoit¹ na kwotê ', pe.kwota + pr.kwota,
	' z³, gdzie wynagrodzenie zasadnicze wynios³o ', pe.kwota,
	' z³, premia wynios³a ', pr.kwota, 
	' z³. Pracownik(ca) przepracowa³(a) ', (g.liczba_godzin - 40), 
	' nadgodzin.'
)
FROM ksiegowosc.wynagrodzenie w
	LEFT JOIN ksiegowosc.pracownicy p 
ON w.id_pracownika = p.id_pracownika
	LEFT JOIN ksiegowosc.premia pr
ON w.id_premii = pr.id_premii
	LEFT JOIN ksiegowosc.pensja pe
ON w.id_pensji = pe.id_pensji
	LEFT JOIN ksiegowosc.godziny g
ON w.id_godziny = g.id_godziny
WHERE p.id_pracownika IS NOT NULL;
