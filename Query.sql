CREATE DATABASE "Biblioteka"
WITH ENCODING 'WIN1250'
TEMPLATE template0
LC_COLLATE = 'Polish_Poland.1250'
LC_CTYPE = 'Polish_Poland.1250';

CREATE TABLE Kategorie
(
    id_kategoria INT PRIMARY KEY
   ,nazwa VARCHAR(46)
);

CREATE TABLE Autorzy
(
    id_autor INT  PRIMARY KEY
   ,imie VARCHAR(15)
   ,nazwisko VARCHAR(30)
);

CREATE TABLE Wydawnictwa
(
    id_wydawnictwo INT  PRIMARY KEY
   ,nazwa VARCHAR(30)
);

CREATE TABLE Ksiazki
(
    id_ksiazka INT PRIMARY KEY
   ,isbn VARCHAR(13)
   ,id_kategoria INT CONSTRAINT FK_kategoria REFERENCES Kategorie(id_kategoria)
   ,tytul VARCHAR(255)
   ,opis VARCHAR(500)
   ,id_autor INT CONSTRAINT FK_autor REFERENCES Autorzy(id_autor)
   ,id_wydawnictwo INT CONSTRAINT FK_wydawnictwo REFERENCES Wydawnictwa(id_wydawnictwo)
   ,rok_wydania INT
);   

CREATE TABLE Czytelnicy
(
    id_czytelnik INT PRIMARY KEY
	,imie VARCHAR(20)
	,nazwisko VARCHAR(30)
   ,login VARCHAR(10)
   ,haslo VARCHAR(20)
   ,email VARCHAR(30)
   ,telefon VARCHAR(20)
   ,data_urodzenia DATE
);

CREATE TABLE Role
(
    id_rola INT PRIMARY KEY
   ,nazwa VARCHAR(50)
);

CREATE TABLE Pracownicy
(
    id_pracownik INT PRIMARY KEY
   ,login VARCHAR(10)
   ,haslo VARCHAR(20)
   ,id_rola INT CONSTRAINT FK_rola REFERENCES Role(id_rola)
);   

CREATE TABLE Wypozyczenia
(
    id_wypozyczenie BIGINT PRIMARY KEY
   ,id_czytelnik INT CONSTRAINT FK_czytelnik REFERENCES Czytelnicy(id_czytelnik)
   ,id_ksiazka INT CONSTRAINT FK_ksiazka REFERENCES Ksiazki(id_ksiazka)
   ,data_wypozyczenia DATE
   ,id_pracownik_wypozyczenie INT CONSTRAINT FK_pracownik_wypozyczenie REFERENCES Pracownicy(id_pracownik)
   ,data_oddania DATE
   ,id_pracownik_oddanie INT CONSTRAINT FK_pracownik_oddanie REFERENCES Pracownicy(id_pracownik)
);

SELECT * FROM kategorie;
SELECT * FROM autorzy;
SELECT * FROM wydawnictwa;
SELECT * FROM ksiazki;
SELECT * FROM czytelnicy;
SELECT * FROM role;
SELECT * FROM pracownicy;
SELECT * FROM wypozyczenia;

copy public.kategorie (id_kategoria, nazwa) FROM 'D:/UG - Matematyka/Bazy danych/Baza danych na zaliczenie/CSV/kategorie.csv' DELIMITER ';';
copy public.autorzy (id_autor, imie, nazwisko) FROM 'D:/UG - Matematyka/Bazy danych/Baza danych na zaliczenie/CSV/autorzy.csv' DELIMITER ';';
copy public.wydawnictwa (id_wydawnictwo, nazwa) FROM 'D:/UG - Matematyka/Bazy danych/Baza danych na zaliczenie/CSV/wydawnictwa.csv' DELIMITER ';';
copy public.ksiazki (id_ksiazka, isbn, id_kategoria, tytul, opis, id_autor, id_wydawnictwo, rok_wydania) FROM 'D:/UG - Matematyka/Bazy danych/Baza danych na zaliczenie/CSV/książki.csv' DELIMITER ';';
copy public.czytelnicy (id_czytelnik, imie, nazwisko, login, haslo, email, telefon, data_urodzenia) FROM 'D:/UG - Matematyka/Bazy danych/Baza danych na zaliczenie/CSV/czytelnicy.csv' DELIMITER ';';
copy public.role (id_rola, nazwa) FROM 'D:/UG - Matematyka/Bazy danych/Baza danych na zaliczenie/CSV/role.csv' DELIMITER ';';
copy public.pracownicy (id_pracownik, login, haslo, id_rola) FROM 'D:/UG - Matematyka/Bazy danych/Baza danych na zaliczenie/CSV/pracownicy.csv' DELIMITER ';';
copy public.wypozyczenia (id_wypozyczenie, id_czytelnik, id_ksiazka, data_wypozyczenia, id_pracownik_wypozyczenie, data_oddania, id_pracownik_oddanie) FROM 'D:/UG - Matematyka/Bazy danych/Baza danych na zaliczenie/CSV/wypożyczenia.csv' DELIMITER ';';

-- (1) Pokaż 10 najczęścieiej wypożyczających czytelników.
create view top_czytelnicy as select
     C.imie
    ,C.nazwisko
    ,COUNT(*) as Liczba_wypozyczen

from
    Wypozyczenia W
    join Czytelnicy C on W.id_czytelnik = C.id_czytelnik

group by
    C.login, C.imie, C.nazwisko

order by
    COUNT(*) desc limit 10;
	
SELECT * FROM top_czytelnicy;

-- (2) Pokaż 10 najczęściej wypożyczanych książek.
create view top_ksiazka as select 
    K.tytul
   ,count(*) as liczba_wypozyczen

from 
    wypozyczenia W 
    join ksiazki K on W.id_ksiazka = K.id_ksiazka

group by
    K.tytul order by count(*) desc limit 10;
	
SELECT * FROM top_ksiazka;

-- (3) Wyświetl 10 najpopularniejeszych kategorii książek
create view top_kategoria as

select
    KA.nazwa as kategoria, count(*) as ilosc_ksiazek
from
    ksiazki KS join kategorie KA on KS.id_kategoria = KA.id_kategoria
group by
    KA.id_kategoria, KA.nazwa
order by
    count(*) desc limit 10;
	
SELECT * FROM top_kategoria;

-- (1) funkcja znajdująca książkę
create function znajdzk(varchar) returns setof ksiazki as $$ select * from ksiazki where tytul like '%'||$1||'%' $$ language sql;

SELECT * FROM znajdzk('The');

-- (2) funkcja znajdująca autora
create function znajdza(varchar) returns setof autorzy as $$ select * from autorzy where imie like '%'||$1||'%' or nazwisko like '%'||$1||'%' $$ language sql;

SELECT * FROM znajdza('Rafał');
