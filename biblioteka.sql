--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: autorzy; Type: TABLE; Schema: public; Owner: afrankowski
--

CREATE TABLE public.autorzy (
    id_autor integer NOT NULL,
    imie character varying(20),
    nazwisko character varying(30)
);


ALTER TABLE public.autorzy OWNER TO afrankowski;

--
-- Name: czytelnicy; Type: TABLE; Schema: public; Owner: afrankowski
--

CREATE TABLE public.czytelnicy (
    id_czytelnik integer NOT NULL,
    imie character varying(20),
    nazwisko character varying(30),
    login character varying(10),
    haslo character varying(20),
    email character varying(30),
    telefon character varying(20),
    data_urodzenia date
);


ALTER TABLE public.czytelnicy OWNER TO afrankowski;

--
-- Name: kategorie; Type: TABLE; Schema: public; Owner: afrankowski
--

CREATE TABLE public.kategorie (
    id_kategoria integer NOT NULL,
    nazwa character varying(50)
);


ALTER TABLE public.kategorie OWNER TO afrankowski;

--
-- Name: ksiazki; Type: TABLE; Schema: public; Owner: afrankowski
--

CREATE TABLE public.ksiazki (
    id_ksiazka integer NOT NULL,
    isbn character varying(13),
    id_kategoria integer,
    tytul character varying(255),
    opis character varying(500),
    id_autor integer,
    id_wydawnictwo integer,
    rok_wydania integer
);


ALTER TABLE public.ksiazki OWNER TO afrankowski;

--
-- Name: pracownicy; Type: TABLE; Schema: public; Owner: afrankowski
--

CREATE TABLE public.pracownicy (
    id_pracownik integer NOT NULL,
    login character varying(10),
    haslo character varying(20),
    id_rola integer,
    CONSTRAINT login_password CHECK (((login)::text <> (haslo)::text))
);


ALTER TABLE public.pracownicy OWNER TO afrankowski;

--
-- Name: role; Type: TABLE; Schema: public; Owner: afrankowski
--

CREATE TABLE public.role (
    id_rola integer NOT NULL,
    nazwa character varying(25)
);


ALTER TABLE public.role OWNER TO afrankowski;

--
-- Name: wydawnictwa; Type: TABLE; Schema: public; Owner: afrankowski
--

CREATE TABLE public.wydawnictwa (
    id_wydawnictwo integer NOT NULL,
    nazwa character varying(30)
);


ALTER TABLE public.wydawnictwa OWNER TO afrankowski;

--
-- Name: wypozyczenia; Type: TABLE; Schema: public; Owner: afrankowski
--

CREATE TABLE public.wypozyczenia (
    id_wypozyczenie bigint NOT NULL,
    id_czytelnik integer,
    id_ksiazka integer,
    data_wypozyczenia date,
    id_pracownik_wypozyczenie integer,
    data_oddania date,
    id_pracownik_oddanie integer,
    CONSTRAINT wypozyczenia_check CHECK ((data_wypozyczenia <= data_oddania))
);


ALTER TABLE public.wypozyczenia OWNER TO afrankowski;

--
-- Data for Name: autorzy; Type: TABLE DATA; Schema: public; Owner: afrankowski
--

COPY public.autorzy (id_autor, imie, nazwisko) FROM stdin;
2	Rafał	Bobek
3	Robert	Bobekowski
4	Rafał	Bobikowski
5	Rafał	Brobek
6	Wiktor	Brudziak
7	Bolesław	Bryński
8	Jadwiga	Chrilecka
9	Liliana	Ciupała
10	Katarzyna	Dawro
11	Jadwiga	Derilecka
12	Michał	Dertucha
13	Robert	Dido
14	Michał	Dindo
15	Rafał	Dobek
16	Andrzej	Drozda
17	Wiktor	Dudziak
18	Robert	Dwernik
19	Michał	Fądecki
20	Barbara	Fibiana
21	Jadwiga	Filbrecka
22	Kalina	Filecka
23	Jolanta	Filecka
24	Jadwiga	Filoecka
25	Jadwiga	Firlecka
26	Rafał	Forbek
27	Barbara	Fornal
28	Rafał	Fraczyński
29	Jadwiga	Fulecka
30	Jadwiga	Gilecka
31	Rafał	Grater
32	Zbigniew	Grawik
33	Pelagia	Greczyn
34	Barbara	Griczan
35	Barbara	Gruda
36	Zbigniew	Hrubek
37	Wiktor	Hryczyński
38	Andrzej	Jadziak
39	Barbara	Jagiel
40	Stefan	Janicki
41	Robert	Jawlik
42	Barbara	Jelikowska
43	Wiktor	Jobda
44	Jadwiga	Jolecka
45	Wiktor	Karolik
46	Zbigniew	Kąkol
47	Barbara	Kiszewska
48	Rafał	Kobek
49	Tadeusz	Komasa
50	Michał	Komor
51	Tadeusz	Komorak
52	Tadeusz	Komorna
53	Michał	Komornicki
54	Tadeusz	Komorników
55	Michał	Komos
56	Tadeusz	Kowalski
57	Wiktor	Krupicki
58	Janusz	Kurant
59	Michał	Kureka
60	Wiktor	Labuda
61	Zbigniew	Liczaba
62	Robert	Liczak
63	Michał	Likary
64	Mateusz	Likian
65	Marek	Linda
66	Michał	Lindak
67	Franciszek	Lindarek
68	Michał	Lipecki
69	Ewa	Masztaler
70	Barbara	Mączyńska
71	Zbigniew	Mąkol
72	Jadwiga	Milecka
73	Robert	Moczydło
74	Ewa	Niemota
75	Robert	Palancik
76	Paweł	Palek
77	Krystyna	Pilecki
78	Krystyna	Policka
79	Krzysztof	Policki
80	Elwira	Policzawska
81	Paweł	Policzewski
82	Krystyna	Polkowiak
83	Wiktor	Prószak
84	Andrzej	Robek
85	Zbigniew	Rudak
86	Barbara	Sadurski
87	Marek	Sawek
88	Robert	Sulik
89	Zbigniew	Sulik
90	Robert	Sulikowski
91	Robert	Surma
92	Robert	Surmak
93	Wiktor	Suwald
94	Michał	Szerka
95	Tadeusz	Tomora
96	Zbigniew	Trewirek
97	Zbigniew	Twardzioch
98	Andrzej	Twarnowski
99	Tadeusz	Twomicki
100	Michał	Wertyk
1	Jadwiga	Bilecka
\.


--
-- Data for Name: czytelnicy; Type: TABLE DATA; Schema: public; Owner: afrankowski
--

COPY public.czytelnicy (id_czytelnik, imie, nazwisko, login, haslo, email, telefon, data_urodzenia) FROM stdin;
2	Łukasz	Lis	l8816i3b	sxdh6x	jcholewa@optonline.net	661-88-0492	1973-08-09
3	Ernest	Michalak	8j1mbxd6	pkvwr1	pemungkah@comcast.net	656-83-5646	1974-08-14
4	Florian	Przybylski	56225kgi	8mh386	duchamp@yahoo.ca	429-58-4624	1974-12-31
5	Cyprian	Sokołowski	nl0yvlcn	5z9a7l	danny@mac.com	408-69-7646	1975-05-12
6	Józef	Czarnecki	p8rl408c	zk3tsc	joglo@outlook.com	235-91-8472	1976-11-23
7	Jędrzej	Sikora	di4dl1vg	vjxa7w	anicolao@icloud.com	963-82-1294	1977-11-07
8	Kamil	Zieliński	iss84zb0	x9u818	jgmyers@att.net	288-14-7812	1980-02-14
9	Hubert	Adamska	as7ijsk7	36rpnc	feamster@me.com	148-63-0588	1980-03-27
10	Grzegorz	Tomaszewski	x3pu1d45	d8gsfk	karasik@gmail.com	975-26-7487	1980-09-05
11	Emanuel	Chmielewski	dalh5eh5	9pvoci	engelen@hotmail.com	483-00-4677	1986-01-15
12	Mieszko	Wróblewski	ahkx5qtj	izxzhc	noneme@optonline.net	420-94-4727	1987-10-16
13	Ignacy	Urbańska	7wej62yz	lqywy2	mleary@mac.com	548-35-3878	1988-05-09
14	Robert	Adamska	52dg5i5a	6xrmzw	tjensen@me.com	225-63-6003	1993-01-14
15	Kornel	Wiśniewski	ceqylgbw	4s7zdz	matthijs@att.net	689-67-3145	1993-04-06
16	Martin	Przybylski	1xn9aaz0	1cnu0n	grinder@comcast.net	713-54-9936	1993-04-30
17	Aleks	Kaźmierczak	1kn9vr8q	tfnjm3	caidaperl@mac.com	090-65-3254	1994-05-09
18	Arkadiusz	Kowalczyk	0udnea3c	2fc97j	aschmitz@verizon.net	314-28-2697	1996-06-18
19	Olgierd	Szymczak	hu2ht3e9	8we4mx	matthijs@yahoo.com	843-20-8191	1997-03-11
20	Mieszko	Kołodziej	yxxyop38	8mmfyl	ntegrity@optonline.net	617-67-2007	1997-04-16
21	Klaudiusz	Jakubowski	u8filqln	rp82l5	ryanvm@outlook.com	372-48-8687	1997-10-27
22	Emil	Krawczyk	ef6099m1	rhj4os	msloan@comcast.net	041-60-0982	1997-11-27
23	Robert	Zawadzki	s9rezhk2	clx3ex	gregh@gmail.com	022-58-3234	1998-07-09
24	Alojzy	Szymczak	ysv7pk4a	fvuoy5	yzheng@mac.com	784-03-2891	1998-10-23
25	Anastazy	Kaczmarczyk	v74el56s	xw4esq	oevans@verizon.net	410-68-1679	2000-07-25
26	Anatol	Szewczyk	3l86yaxr	3nkxs5	brainless@outlook.com	891-15-9473	1972-03-13
27	Maurycy	Szymczak	wpz4edpm	m83jih	jbuchana@msn.com	408-91-1101	1977-06-20
28	Kajetan	Górski	aals5fd9	tuwyke	ghost@msn.com	665-72-3891	1978-05-15
29	Jan	Cieślak	kb7usy8c	c6njjt	jwarren@verizon.net	797-90-2950	1978-06-26
30	Julian	Pietrzak	z84x4e5i	an2mmf	jaxweb@hotmail.com	443-33-4455	1979-10-31
31	Elwira	Szymańska	1q589g9g	nsu4ew	knorr@att.net	464-38-0003	1981-01-19
32	Wioletta	Michalak	va43w0z2	nylmsk	paley@mac.com	271-22-8599	1981-12-02
33	Małgorzata	Kołodziej	my22rcc2	1ahjv7	psharpe@me.com	154-65-4138	1984-01-02
34	Alisa	Woźniak	99svt0aw	xawf5e	fudrucker@gmail.com	626-06-4065	1984-10-03
35	Kornelia	Szewczyk	fyho8smc	69g3vr	sinkou@verizon.net	171-30-3153	1985-03-22
36	Andrea	Górecka	csae046y	wq4snj	sblack@verizon.net	556-01-2536	1985-04-08
37	Matylda	Urbańska	yood3lqo	y60om6	henkp@sbcglobal.net	426-02-3529	1986-05-30
38	Bogda	Baran	hf97fio8	k2si7h	houle@me.com	619-74-9065	1986-10-28
39	Eleonora	Sadowska	ttadyaam	wyefca	curly@sbcglobal.net	719-41-0674	1987-11-19
40	Liliana	Kubiak	ny3f140o	srqj3h	andrei@live.com	085-79-7050	1987-12-25
41	Amelia	Krupa	rt4bxrqd	45grwa	caidaperl@gmail.com	744-34-8968	1989-05-31
42	Florentyna	Marciniak	v6x81gn3	ccaqq9	tedrlord@yahoo.ca	843-12-6011	1991-01-01
43	Bernadetta	Górska	kb8etl5d	l4iwtk	danneng@mac.com	058-19-8341	1993-01-18
44	Bianka	Witkowska	wjs1n471	jg6jyk	vlefevre@verizon.net	282-71-6503	1993-04-06
45	Krystyna	Chmielewska	st9ara4k	lhmjqt	mcast@live.com	829-13-1843	1993-08-03
46	Adrianna	Witkowska	esgta5tn	gmfwxp	gumpish@yahoo.com	644-45-4289	1994-11-09
47	Wioletta	Mróz	omviu45b	4af4d7	hoyer@outlook.com	612-88-3544	1996-08-21
48	Aisha	Kamińska	5v8mcu89	txm2qy	sarahs@live.com	921-84-4039	1998-10-20
49	Klementyna	Jankowska	kmwbzqcg	s7pddt	madler@aol.com	357-89-2221	1999-06-15
50	Stanisława	Sadowska	k613sbmq	66527l	bolow@gmail.com	582-76-1115	2000-06-15
51	Andżelika	Piotrowska	cklnkq9g	jc7u5c	juerd@mac.com	874-20-0537	1973-03-23
52	Asia	Górecka	qykvinzg	2fctyr	dkeeler@sbcglobal.net	114-59-1948	1976-08-27
53	Wanda	Tomaszewska	ndfoewva	lr9lgw	jeffcovey@yahoo.ca	112-00-7169	1978-07-27
54	Florencja	Jaworska	5gpe4qfj	mmzcqs	ianbuck@outlook.com	273-69-3757	1979-07-16
55	Zuzanna	Malinowska	gattd6sq	6p5boy	ducasse@msn.com	486-83-5930	1980-10-10
56	Bogna	Malinowska	awd6xqkj	vz0vz3	cgcra@optonline.net	229-43-0246	1982-01-04
57	Amelia	Przybylska	i1ehnz4j	zj3bqg	dsowsy@verizon.net	099-36-9735	1983-05-20
58	Zuza	Wiśniewska	ll1rfcur	5msxe8	oechslin@optonline.net	892-57-6170	1983-06-06
59	Idalia	Urbańska	7ivxwf9g	ba921b	moinefou@hotmail.com	524-56-7592	1984-05-01
60	Kaja	Wójcik	s8iy9n2b	p38sla	camenisch@att.net	121-15-7121	1986-01-16
61	Aneta	Sokołowska	dmzn2pp0	2o0hx5	hager@aol.com	582-76-1656	1989-04-18
1	Robert	Nowak	s7h55g22	68ttr1	nowakr@o2.pl	867-83-1126	1996-07-01
\.


--
-- Data for Name: kategorie; Type: TABLE DATA; Schema: public; Owner: afrankowski
--

COPY public.kategorie (id_kategoria, nazwa) FROM stdin;
1	audiobooki
2	biografie
3	biznes ekonomia marketing
4	dla dzieci
5	dla młodzieży
6	fantasy
7	historia
8	horror
9	informatyka
10	komiks
11	kryminał, sensacja, thriller
12	książka regionalna
13	kuchnia i diety
14	lektury, pomoce szkolne
15	literatura faktu, reportaż
16	literatura obyczajowa
17	literatura piękna obca
18	literatura piękna polska
19	nauka języków
20	nauki społeczne i humanistyczne
21	nauki ścisłe, medycyna
22	obcojęzyczne
23	podręczniki akademickie
24	podręczniki szkolne, edukacja
25	poezja, aforyzm, dramat
26	poradniki
27	prawo
28	religie i wyznania
29	rozwój osobisty
30	science fiction
31	sport i wypoczynek
32	sztuka
33	turystyka i podróże
34	zdrowie, rodzina, związki
\.


--
-- Data for Name: ksiazki; Type: TABLE DATA; Schema: public; Owner: afrankowski
--

COPY public.ksiazki (id_ksiazka, isbn, id_kategoria, tytul, opis, id_autor, id_wydawnictwo, rok_wydania) FROM stdin;
2	9780790731049	30	Flu: The Story of the Great Influenza Pandemic of 1918 and the Search for the Virus That Caused It	opis	3	74	1978
3	9781429901345	31	The Kitchen God's Wife	opis	69	85	1973
4	9780739330005	17	The Testament	opis	100	74	1989
5	9780807062661	1	Beloved (Plume Contemporary Fiction)	opis	24	17	1967
6	9780547671338	9	Our Dumb Century: The Onion Presents 100 Years of Headlines from America's Finest News Source	opis	6	45	1906
7	9781415901441	13	New Vegetarian: Bold and Beautiful Recipes for Every Occasion	opis	10	58	1958
8	9780553280340	24	Wild Animus	opis	15	82	2001
9	9780805016321	29	Airframe	opis	12	67	1900
10	9780553260618	30	Timeline	opis	97	44	1963
11	9780030018893	18	Prague : A Novel	opis	2	66	1967
12	9780312939007	4	Lying Awake	opis	79	66	1960
13	9781250020246	24	To Kill a Mockingbird	opis	40	86	1905
14	9781410406828	6	Seabiscuit: An American Legend	opis	78	51	1938
15	9780816151455	18	Pigs in Heaven	opis	58	18	1977
16	9780708917862	14	Downtown	opis	95	80	1911
17	9780965925853	7	Icebound	opis	21	58	1936
18	9780792755739	16	I'll Be Seeing You	opis	2	77	1935
19	9781564026811	29	From the Corner of His Eye	opis	76	18	2012
20	9780763602765	32	Isle of Dogs	opis	21	46	1915
21	9780688118082	7	Purity in Death	opis	3	26	2000
22	9780688118099	7	This Year It Will Be Different: And Other Stories	opis	35	2	1912
23	9780030018886	30	Left Behind: A Novel of the Earth's Last Days (Left Behind #1)	opis	88	78	1949
24	9781410406835	6	The Street Lawyer	opis	69	66	1922
25	9780708918982	10	A Soldier of the Great War	opis	51	84	1976
26	9780805028188	17	LONESOME DOVE	opis	23	88	1971
27	9781250020253	17	Shabanu: Daughter of the Wind (Border Trilogy)	opis	80	78	1957
28	9780553280364	31	The Dragons of Eden: Speculations on the Evolution of Human Intelligence	opis	50	13	1937
29	9780816151462	14	Breathing Lessons	opis	48	31	1970
30	9781429922371	23	The Joy Luck Club	opis	47	48	2005
31	9780312939014	17	Heart of Darkness (Wordsworth Collection)	opis	8	74	2016
32	9781415901458	6	Tess of the D'Urbervilles (Wordsworth Classics)	opis	40	73	1960
33	9780739330029	17	The Accidental Virgin	opis	60	79	1930
34	9780553271638	3	The Tao of Pooh	opis	80	31	1923
35	9781250020260	22	Seabiscuit	opis	25	19	1967
36	9780805002485	20	Life's Little Instruction Book (Life's Little Instruction Books (Paperback))	opis	23	88	1913
37	9781429909327	8	Starship Troopers	opis	80	30	1906
38	9780312939021	10	The Ruby in the Smoke (Sally Lockhart Trilogy, Book 1)	opis	14	2	1927
39	9780786456048	22	Anil's Ghost	opis	62	48	1928
40	9781429909389	5	Turning Thirty	opis	24	51	1901
41	9781410418272	25	The Catcher in the Rye	opis	30	39	1935
42	9780816147151	1	El Senor De Los Anillos: LA Comunidad Del Anillo (Lord of the Rings (Spanish))	opis	56	20	2009
43	9780525469063	12	Midnight in the Garden of Good and Evil: A Savannah Story	opis	35	68	1937
44	9780739330340	31	Pretend You Don't See Her	opis	47	65	1939
45	9780152057251	31	Fast Women	opis	90	16	1916
46	9781250025463	33	Female Intelligence	opis	1	28	1941
47	9780805004618	20	Pasquale's Nose: Idle Days in an Italian Town	opis	17	20	1966
48	9780449219362	17	Rich Dad, Poor Dad: What the Rich Teach Their Kids About Money--That the Poor and Middle Class Do Not!	opis	17	61	2010
49	9780312946203	23	The Pillars of the Earth	opis	15	38	1966
50	9780449000625	26	Corelli's Mandolin : A Novel	opis	83	53	2013
51	9780739330036	16	The Five People You Meet in Heaven	opis	95	12	1975
52	9780312945657	6	Relics (Star Trek: The Next Generation)	opis	5	16	1934
53	9781250029645	9	Blood Oath	opis	36	35	1999
54	9781410418241	21	The Alibi	opis	35	71	2004
55	9780805010848	19	The Beach House	opis	90	77	1911
56	9780739330050	5	A Kiss Remembered	opis	46	70	1993
57	9780736945486	18	The Short Forever	opis	96	57	1955
58	9780399178573	4	Dead Aim	opis	8	29	1996
59	9780763601256	7	Angels &amp; Demons	opis	53	63	1996
60	9781564028075	7	All He Ever Wanted: A Novel	opis	6	66	1981
61	9781586420772	27	Every Breath You Take : A True Story of Obsession, Revenge, and Murder	opis	85	56	1958
62	9781586420895	1	The Mosquito Coast	opis	44	65	2012
63	9780762439768	29	The Girl Who Loved Tom Gordon	opis	34	66	1941
64	9781250029652	3	Bringing Down the House: The Inside Story of Six M.I.T. Students Who Took Vegas for Millions	opis	8	79	1983
65	9780449221518	28	The Sum of All Fears	opis	53	71	1931
66	9780613654890	3	Care Packages : Letters to Christopher Reeve from Strangers and Other Friends	opis	19	81	1958
67	9780345503114	23	One Hundred Years of Solitude	opis	60	32	1975
68	9780805010855	29	Little Altars Everywhere: A Novel	opis	24	80	1932
69	9780312945268	16	Coyote Waits (Joe Leaphorn/Jim Chee Novels)	opis	70	49	1961
70	9781415901717	17	Before I Say Good-Bye	opis	55	66	1947
71	9781423113003	17	Slow Waltz in Cedar Bend	opis	27	61	2018
72	9780688068134	11	Atonement : A Novel	opis	20	43	1919
73	9780688068127	12	Gangster	opis	91	78	1977
74	9780440411642	2	Hush	opis	20	5	2017
75	9780312945275	13	Whisper of Evil (Hooper, Kay. Evil Trilogy.)	opis	100	2	1933
76	9780805019353	20	Rebecca	opis	14	37	1956
77	9780345503121	15	Scarlet Letter	opis	58	47	1930
78	9781250035820	4	Diary of a Mad Mom-To-Be	opis	9	21	1904
79	9780449221488	28	Locked in Time (Laurel Leaf Books)	opis	52	26	1926
80	9781415946664	8	Through Wolf's Eyes (Wolf)	opis	30	15	1928
81	9781250035837	1	Puerto Vallarta Squeeze	opis	72	83	2008
82	9780449221501	29	Tree Grows In Brooklyn	opis	18	78	1948
83	9780312373122	30	Wish You Well	opis	5	61	1983
84	9780805019360	21	The Hitchhiker's Guide to the Galaxy	opis	96	44	1900
85	9781415946671	22	Crow Lake (Today Show Book Club #7)	opis	62	31	1923
86	9780449221495	22	My Antonia	opis	58	23	1957
87	9780805019377	1	Pen Pals	opis	70	81	1934
88	9781250041883	19	Bridget Jones's Diary	opis	12	71	1978
89	9780783813837	7	Pride and Prejudice (Dover Thrift Editions)	opis	30	74	1938
90	9781410487513	23	The Cat Who Came to Breakfast (Cat Who... (Hardcover))	opis	75	35	1990
91	9780312373139	33	Night Mare (Xanth Novels (Paperback))	opis	46	26	1950
92	9780783813820	28	The Martian Chronicles	opis	52	20	1929
93	9781415946688	3	Fahrenheit 451	opis	63	10	2008
94	9781429911924	7	Veronika Deschliesst Zu Sterben / Vernika Decides to Die	opis	33	15	1927
95	9781413158656	8	Quersch??�?sse - Downsize This!	opis	22	55	1994
96	9780763614522	15	Die Korrekturen.	opis	28	81	1932
97	9781429913058	24	The God of Small Things	opis	5	48	1911
98	9780783818337	5	The Big Bad Wolf: A Novel	opis	38	37	1956
99	9780783818344	24	Four Blind Mice	opis	69	81	1947
100	9781410487520	24	Private Screening	opis	1	44	1981
101	9780394528748	30	Congo	opis	18	14	1950
102	9780307475206	33	Protect and Defend	opis	98	19	1935
103	9780688091736	2	The Tall Pine Polka	opis	14	27	1974
104	9780688147365	21	Memoirs of a Geisha	opis	15	61	1955
105	9780688091743	17	Plainsong (Vintage Contemporaries)	opis	73	58	1962
106	9781631490781	33	Body of Evidence (Kay Scarpetta Mysteries (Paperback))	opis	39	66	1986
107	9780871404428	1	All That Remains (Kay Scarpetta Mysteries (Paperback))	opis	33	65	1958
108	9781482930351	15	Petals on the River	opis	59	24	1903
109	9780306822414	21	The Elusive Flame	opis	30	76	1933
110	9780822578192	31	Legacy of Silence	opis	35	53	1968
111	9781595580467	19	The Brethren	opis	99	77	1976
112	9781250006493	16	The King of Torts	opis	33	19	1919
113	9781250050335	14	The Curious Incident of the Dog in the Night-Time : A Novel	opis	7	48	1955
114	9781250005274	17	Bleachers	opis	87	40	1985
115	9780805036503	32	Sisterhood of the Traveling Pants	opis	69	27	1903
116	9781429913430	4	Only Love (Magical Love)	opis	35	9	1955
117	9780449223611	16	Roses Are Red (Alex Cross Novels)	opis	49	61	1925
118	9781415964033	3	The Rescue	opis	13	19	1938
119	9781415901762	25	Manhattan Hunt Club	opis	66	56	1979
120	9780688057886	11	Patty Jane's House of Curl (Ballantine Reader's Circle)	opis	96	65	1975
121	9780817235215	34	Pet Sematary	opis	15	60	1992
122	9781429913492	3	Silent Snow	opis	5	14	1973
123	9781415951316	2	Girl with a Pearl Earring	opis	96	32	2007
124	9780805059557	7	Summer of Storms	opis	24	73	1996
125	9780449003787	19	The Patient	opis	78	51	1942
126	9781564026477	5	Clifford's Sports Day	opis	45	12	2008
127	9780735218529	7	Postmortem (Kay Scarpetta Mysteries (Paperback))	opis	24	40	1909
128	9780786229314	18	Deception Point	opis	98	5	1925
129	9780786229482	3	Tis : A Memoir	opis	85	87	1965
130	9780449003794	18	Angels &amp; Demons	opis	12	87	1948
131	9780399147197	27	A Monk Swimming	opis	1	45	1908
132	9780736694544	32	The Silent Cry (William Monk Novels (Paperback))	opis	18	48	1969
133	9780807882771	12	The Kalahari Typing School for Men (No. 1 Ladies' Detective Agency)	opis	13	11	1957
134	9780425239001	19	Chicken Soup for the Soul (Chicken Soup for the Soul)	opis	8	9	1960
135	9780425192726	15	Wicked: The Life and Times of the Wicked Witch of the West	opis	14	34	1971
136	9780739429334	1	Life of Pi	opis	17	87	1928
137	9781410401632	7	A Judgement in Stone	opis	48	52	1998
138	9780786243709	24	Lies and the Lying Liars Who Tell Them: A Fair and Balanced Look at the Right	opis	86	60	1944
139	9780425189771	16	Secret History	opis	46	49	1938
140	9780425220191	6	Chicken Soup for the Woman's Soul (Chicken Soup for the Soul Series (Paper))	opis	62	7	1920
141	9780399575181	14	The Weight of Water	opis	34	77	2006
142	9780399149153	30	Moving Pictures (Discworld Novels (Paperback))	opis	53	81	2016
143	9781415951323	30	Night Watch	opis	86	81	1988
144	9780739444283	23	Thief of Time	opis	91	68	1909
145	9780399152283	7	Peter Pan: The Original Story (Peter Pan)	opis	98	15	1995
146	9780399575198	22	On the Bright Side, I'm Now the Girlfriend of a Sex God: Further Confessions of Georgia Nicolson	opis	32	82	1913
147	9780786266340	33	Mansfield Park (Penguin Popular Classics)	opis	68	66	1927
148	9780425203866	31	The Winter King: A Novel of Arthur (The Warlord Chronicles: I)	opis	89	79	1970
149	9781594130878	6	Moonheart (Newford)	opis	46	37	2012
150	9780425241219	32	The Picture of Dorian Gray (Modern Library (Paperback))	opis	30	12	1903
151	9780739345900	4	The Golden Compass (His Dark Materials, Book 1)	opis	3	58	1976
152	9781415902912	22	The Adrian Mole Diaries : The Secret Diary of Adrian Mole, Aged 13 3/4 : The Growing Pains of Adrian Mole	opis	30	45	1996
153	9780739314371	9	Born Confused	opis	30	78	1920
154	9781452037660	30	Confessions of a Shopaholic	opis	39	33	1928
155	9781439125649	5	Making Minty Malone	opis	73	49	1970
156	9780545823524	27	Little Women (Signet Classic)	opis	52	51	1955
157	9780316123068	16	Emma (Signet Classics (Paperback))	opis	67	49	1901
158	9780316380607	21	Animal Farm	opis	37	61	1908
159	9781478956631	16	Eva Luna	opis	50	44	1917
160	9780605373877	13	Poisonwood Bible Edition Uk	opis	44	36	1911
161	9780399239540	18	Angels &amp; Insects : Two Novellas	opis	68	53	1945
162	9781413102932	3	Catch 22	opis	24	85	2005
163	9780895654014	23	The Forsyte Saga : The Man of Property and In Chancery	opis	39	44	1997
164	9780895656964	6	The League of Extraordinary Gentlemen, Vol. 1	opis	90	22	1993
165	9780516057231	6	A Man in Full	opis	27	60	2016
166	9780688093396	19	The Miracle Life of Edgar Mint: A Novel	opis	67	74	1990
167	9780688093389	28	October Sky: A Memoir	opis	7	71	1904
168	9781524243456	30	A Painted House	opis	18	69	1985
169	9780393339857	19	The Romance Reader	opis	57	81	1912
170	9780393019216	7	Far from the Madding Crowd (Wordsworth Classics)	opis	94	57	1934
171	9780393316049	2	The Perfect Storm : A True Story of Men Against the Sea	opis	3	42	2006
172	9780786196197	10	The Postman (Bantam Classics)	opis	87	2	1906
173	9780792848752	5	Angel of Hope (Mercy Trilogy)	opis	43	12	1994
174	9780609608692	33	The Breach	opis	93	16	2017
175	9781617493812	6	Neanderthal: A Novel	opis	55	34	1950
176	9781609803643	9	Babyhood	opis	93	52	1950
177	9781609803636	7	Dave Barry in Cyberspace	opis	36	21	1956
178	9780807041567	10	Waiting	opis	8	83	1923
179	9780807057162	21	Frankenstein (Dover Thrift Editions)	opis	32	55	1919
180	9780807003336	29	ALL THAT REMAINS	opis	66	26	1929
181	9780789450739	9	Last Chance to See	opis	74	81	1961
182	9780399575235	5	Vinegar Hill (Oprah's Book Club (Paperback))	opis	61	23	1951
183	9780425250563	32	Affinity	opis	43	80	1969
184	9780399157868	19	The Best Democracy Money Can Buy: The Truth About Corporate Cons, Globalization and High-Finance Fraudsters	opis	51	71	1962
185	9780307704283	6	The Hunt for Red October	opis	42	72	1974
186	9781410440648	24	Liberty Falling (Anna Pigeon Mysteries (Paperback))	opis	81	55	1961
187	9780803723573	5	El Palacio de La Luna	opis	82	67	1920
188	9780807081785	16	Trying to Save Piggy Sneed	opis	21	69	1976
189	9780743254687	18	Herr Der Fliegen (Fiction, Poetry and Drama)	opis	38	65	1933
190	9780393079814	2	Bel Canto	opis	15	19	1966
191	9781596915213	23	James and the Giant Peach	opis	73	42	2001
192	9780765305268	8	The Secret Life of Bees	opis	22	25	1911
193	9780316262910	17	Digital Fortress : A Thriller	opis	83	80	1933
194	9780316123082	25	The Ladies of Missalonghi	opis	52	18	1983
195	9780316335478	3	Blackberry Wine : A Novel	opis	72	49	1954
196	9781478935650	6	The Firm	opis	20	78	1900
197	9780316279734	4	How the Irish Saved Civilization: The Untold Story of Ireland's Heroic Role from the Fall of Rome to the Rise of Medieval Europe (Hinges of History)	opis	46	88	1977
198	9780316225052	30	The Client	opis	99	9	1967
199	9780316380621	17	Horse Heaven (Ballantine Reader's Circle)	opis	48	84	2019
200	9780316123044	30	Danger	opis	2	1	1913
1	7583410965483	7	Adventure	opis	5	10	2005
\.


--
-- Data for Name: pracownicy; Type: TABLE DATA; Schema: public; Owner: afrankowski
--

COPY public.pracownicy (id_pracownik, login, haslo, id_rola) FROM stdin;
2	39bbl40	g)deSJvqWr	6
3	0ph12kd	y3bxLI[JoF	12
4	8crer20	$0NW7x~Lig	5
5	wxyddis	C!ogBM~zH,	3
6	j2b21vb	@j?dRAjl\\9	4
7	960145s	V|9;Llu|#P	9
8	2fvaw0q	n\\-^/%m6']	6
9	b4ffda1	Kx2i>4E`"(	7
10	ecp04tf	|t!TzY@`&3	5
11	bpox9yt	R;~eXF`xAJ	7
12	mcinab1	L}.vtfuRXS	2
13	kprqzpv	>-hqAXku'*	5
14	wcod0q8	2DJLD0<kIU	3
15	cw2ylkn	lY"[(RT7:^	9
16	fhz0rlr	xFX[Ej7ViL	3
17	39n9u99	PKZvk0;V2@	6
18	chvyjjj	g7x`uIQSOG	10
19	hnm3uso	X*7#A0>=a]	2
20	xztosvi	X$|+T(iHv5	9
1	3rt5f6y	h(gY32*m@n	1
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: afrankowski
--

COPY public.role (id_rola, nazwa) FROM stdin;
1	Pracownik magazynowy
2	Obsługa klienta
3	Kustosz
5	Młodszy Bibliotekarz
6	Bibliotekarz
7	Starszy Bibliotekarz
8	Introligator
9	Starszy Introligator
10	Dyrektor Biblioteki
11	Magazynier
12	Starszy Magazynier
4	Starszy Kustosz
\.


--
-- Data for Name: wydawnictwa; Type: TABLE DATA; Schema: public; Owner: afrankowski
--

COPY public.wydawnictwa (id_wydawnictwo, nazwa) FROM stdin;
1	Andromeda
2	Antlia
3	Apus
4	Aquarius
5	Aquila
6	Ara
7	Aries
8	Auriga
9	Bootes
10	Caelum
11	Camelopardalis
12	Cancer
13	Canes Venatici
14	Canis Maior
15	Canis Minor
16	Capricornus
17	Carina
18	Cassiopeia
19	Centaurus
20	Cepheus
21	Cetus
22	Chamaeleon
23	Circinus
24	Columba
25	Coma Berenices
26	Corona Australis
27	Corona Borealis
28	Corvus
29	Crater
30	Crux
31	Cygnus
32	Delphinus
33	Dorado
34	Draco
35	Equuleus
36	Eridanus
37	Fornax
38	Gemini
39	Grus
40	Hercules
41	Horologium
42	Hydra
43	Hydrus
44	Indus
45	Lacerta
46	Leo
47	Leo Minor
48	Lepus
49	Libra
50	Lupus
51	Lynx
52	Lyra
53	Mensa
54	Microscopium
55	Monoceros
56	Musca
57	Norma
58	Octans
59	Ophiuchus
60	Orion
61	Pavo
62	Pegasus
63	Perseus
64	Phoenix
65	Pictor
66	Pisces
67	Piscis Austrinus
68	Puppis
69	Pyxis
70	Reticulum
71	Sagitta
72	Sagittarius
73	Scorpius
74	Sculptor
75	Scutum
76	Serpens
77	Sextans
78	Taurus
79	Telescopium
80	Triangulum
81	Triangulum Australe
82	Tucana
83	Ursa Maior
84	Ursa Minor
85	Vela
86	Virgo
87	Volans
88	Vulpecula
\.


--
-- Data for Name: wypozyczenia; Type: TABLE DATA; Schema: public; Owner: afrankowski
--

COPY public.wypozyczenia (id_wypozyczenie, id_czytelnik, id_ksiazka, data_wypozyczenia, id_pracownik_wypozyczenie, data_oddania, id_pracownik_oddanie) FROM stdin;
2	16	177	1956-12-17	17	1958-08-27	17
3	56	67	2009-09-03	16	2011-09-16	1
4	16	158	1998-11-18	9	2000-11-10	5
5	41	125	1978-03-10	9	1982-11-17	16
6	32	108	2003-06-18	14	2007-10-25	18
7	40	27	1960-07-17	3	1963-03-02	16
8	5	163	1971-04-03	1	1974-11-05	7
9	60	198	1971-02-18	6	1973-05-27	11
10	23	87	2004-04-12	5	2007-04-17	13
11	8	122	1970-02-10	6	1971-08-24	2
12	5	60	1980-02-21	11	1983-10-19	7
13	23	187	1999-01-05	14	2002-03-22	6
14	56	101	2001-08-12	13	2005-06-26	8
15	37	116	1980-07-16	19	1983-04-14	15
16	40	195	1976-01-07	10	1978-11-19	16
17	36	41	2008-11-21	14	2010-05-05	9
18	2	185	2007-10-22	9	2011-05-13	16
19	49	128	1986-06-06	16	1990-11-20	13
20	54	144	1990-05-09	13	1993-05-05	19
21	27	104	1960-03-06	10	1963-05-14	6
22	49	148	1965-11-22	13	1968-11-04	3
23	13	5	1978-03-24	11	1979-02-11	19
24	28	94	1963-04-24	13	1965-06-14	4
25	32	67	1980-11-06	7	1981-03-19	11
26	27	179	1964-07-19	7	1968-10-12	10
27	37	170	1952-01-18	18	1954-07-23	9
28	20	17	1958-10-16	6	1959-12-26	18
29	40	118	1998-11-22	6	2001-01-23	12
30	55	151	1981-09-19	3	1985-03-12	5
31	23	65	1971-02-21	17	1974-01-17	12
32	11	133	1986-06-04	16	1988-11-15	1
33	56	136	1952-07-21	3	1956-08-21	15
34	14	98	1963-08-19	3	1966-01-14	18
35	18	134	1962-02-12	13	1964-07-15	14
36	7	176	1961-08-16	6	1965-02-28	5
37	16	87	1982-11-21	10	1985-08-13	9
38	15	191	1992-07-23	18	1996-08-23	17
39	37	29	1964-08-23	1	1965-02-22	4
40	29	24	2009-09-01	13	2011-05-14	6
41	17	173	1972-04-23	6	1975-06-17	12
42	16	149	1952-03-03	7	1955-08-16	18
43	42	72	1977-07-13	4	1978-12-28	10
44	21	67	1990-04-20	11	1992-04-08	3
45	47	42	1985-07-12	19	1989-03-12	10
46	12	71	1988-04-16	17	1991-11-23	13
47	52	50	2010-06-09	5	2014-09-26	3
48	47	4	1998-04-11	3	2000-06-08	13
49	34	124	1986-04-27	10	1987-11-10	4
50	24	123	1987-10-17	16	1988-05-07	7
51	49	170	2002-11-19	3	2004-07-26	11
52	35	11	1992-08-06	19	1994-10-11	4
53	45	4	1997-09-06	18	2001-05-12	12
54	30	121	2008-01-04	8	2011-06-23	13
55	24	195	1973-03-02	17	1975-03-20	7
56	24	4	1994-09-10	7	1997-12-03	11
57	4	178	1980-01-04	15	1982-03-09	19
58	46	166	2006-03-15	17	2009-01-13	6
59	4	108	1966-05-25	11	1968-04-17	5
60	10	35	2006-10-11	4	2009-11-21	1
61	24	139	1970-11-07	17	1972-07-07	10
62	7	187	1956-11-24	5	1959-03-23	17
63	9	89	1970-06-20	3	1972-06-10	6
64	51	175	1970-10-07	2	1973-11-18	16
65	21	144	1982-12-02	14	1984-03-10	7
66	35	97	1962-12-06	13	1966-07-06	19
67	3	156	1987-04-08	4	1990-07-07	17
68	19	155	1965-09-25	3	1967-02-20	18
69	10	154	2000-10-10	9	2004-05-20	14
70	11	169	1987-09-08	1	1990-02-04	2
71	22	21	2005-03-13	15	2008-02-24	14
72	22	133	1975-09-22	10	1979-05-06	11
73	11	194	1997-08-05	15	2000-02-28	17
74	43	120	1961-04-27	3	1965-03-23	7
75	54	193	1965-03-10	14	1969-02-28	17
76	4	49	2004-02-08	8	2006-10-10	8
77	41	153	1973-05-05	9	1976-02-09	14
78	6	198	1999-07-07	14	2001-08-05	14
79	13	87	2003-10-09	19	2006-10-03	13
80	3	97	1965-03-13	17	1968-02-07	7
81	56	54	1994-10-03	17	1995-06-08	17
82	26	180	2004-06-27	13	2006-03-20	17
83	42	96	2007-05-10	5	2009-04-27	9
84	5	66	2007-10-23	16	2009-10-09	1
85	27	65	1998-04-19	4	1999-01-05	11
86	12	107	1974-05-26	13	1978-02-13	3
87	10	2	1981-08-10	10	1984-06-12	5
88	21	59	1981-12-25	14	1983-10-08	15
89	10	89	1969-01-19	16	1971-02-14	16
90	57	153	1958-07-26	16	1961-02-13	12
91	55	110	2001-09-08	6	2003-06-21	11
92	29	95	1972-05-03	9	1975-01-14	8
93	58	27	2007-09-12	7	2009-04-08	8
94	57	26	1951-07-09	9	1952-06-07	18
95	38	8	1992-03-14	8	1994-08-04	1
96	2	39	1984-01-05	11	1987-10-07	12
97	54	78	1989-01-23	6	1992-04-22	7
98	19	75	1959-06-10	17	1960-06-21	4
99	14	171	1961-08-23	17	1963-10-12	5
100	45	181	1966-05-08	11	1969-07-15	5
101	8	2	1974-11-03	5	1976-12-12	12
102	29	66	1958-07-24	2	1960-03-06	8
103	27	43	1972-08-04	15	1974-04-12	6
104	47	177	2005-11-02	6	2007-10-13	9
105	2	185	1978-10-26	3	1982-10-21	12
106	4	115	1961-08-10	2	1962-05-27	7
107	17	61	1984-10-03	4	1986-09-17	14
108	58	180	1982-09-22	8	1984-03-23	5
109	43	99	1953-02-18	17	1957-10-01	7
110	31	33	1987-04-22	13	1988-10-09	15
111	39	79	1991-08-11	18	1993-07-27	10
112	4	20	1955-08-23	10	1958-08-11	6
113	9	12	1997-08-18	6	2000-06-04	15
114	4	167	1987-08-11	12	1988-10-15	13
115	8	113	1968-05-17	5	1970-05-13	15
116	41	179	1984-08-21	10	1985-05-11	6
117	48	82	2005-10-21	1	2008-06-27	4
118	23	19	1983-02-25	7	1985-12-08	5
119	10	56	1974-10-05	1	1976-11-07	2
120	23	10	1998-04-25	10	2001-09-17	5
121	48	96	1960-05-13	17	1963-09-28	19
122	46	138	1990-05-06	2	1993-12-02	8
123	44	26	1973-07-17	19	1976-09-18	3
124	33	186	1978-03-23	6	1980-02-27	14
125	21	136	1991-06-25	12	1994-02-16	13
126	41	84	1986-07-23	13	1988-10-26	17
127	38	33	2000-04-09	16	2003-06-21	5
128	49	100	1994-02-03	3	1998-07-08	16
129	53	53	1956-05-11	6	1958-08-08	10
130	45	68	1982-05-21	8	1984-12-23	11
131	44	189	2004-05-15	6	2008-06-09	8
132	48	36	1970-10-11	3	1974-03-01	11
133	50	165	1988-09-27	3	1992-04-12	14
134	4	75	1967-09-26	7	1970-07-27	11
135	38	123	1964-05-03	17	1968-08-14	3
136	17	141	1999-11-11	9	2001-02-26	9
137	4	21	1964-04-05	5	1966-05-23	14
138	16	53	1995-02-25	16	1997-03-10	7
139	41	120	1955-05-23	3	1959-10-14	6
140	24	142	1969-12-02	2	1972-05-03	9
141	17	30	2003-01-24	16	2007-05-18	1
142	28	43	1983-09-14	15	1985-07-07	8
143	27	83	1985-05-19	14	1989-06-04	15
144	54	79	1983-11-20	15	1986-04-08	11
145	11	136	1976-03-13	8	1979-05-11	8
146	10	133	1999-06-17	18	2002-12-07	10
147	10	131	1996-09-11	12	1999-05-13	5
148	47	30	1999-02-09	3	2002-10-23	8
149	14	99	1963-07-02	18	1967-07-19	2
150	3	97	1968-02-22	8	1971-06-23	9
151	55	187	1977-09-27	2	1979-08-13	7
152	17	82	1961-09-05	2	1964-10-08	14
153	13	150	1986-03-21	3	1988-07-12	17
154	37	101	1969-03-15	5	1971-07-06	16
155	9	41	1959-04-18	11	1961-12-11	11
156	21	34	1963-10-16	2	1965-02-12	15
157	8	144	1989-07-12	4	1991-02-08	13
158	54	105	1972-03-09	11	1974-12-04	12
159	32	75	1956-11-10	14	1957-06-17	6
160	59	137	1968-05-21	7	1969-06-08	4
161	22	159	2001-03-13	8	2004-09-23	9
162	2	88	1993-01-08	7	1994-01-24	7
163	44	141	1970-07-18	13	1972-10-09	11
164	23	115	1997-04-21	9	1998-10-24	10
165	38	26	1960-03-16	6	1963-01-01	8
166	31	149	1974-12-18	4	1976-08-08	6
167	50	31	1958-06-14	4	1959-04-13	10
168	8	183	1964-11-17	11	1966-06-08	14
169	53	147	2004-02-02	10	2006-05-05	5
170	41	61	1964-08-19	8	1967-06-20	12
171	47	41	1954-10-09	16	1956-05-05	6
172	45	11	1993-07-18	8	1995-07-10	5
173	20	70	1958-12-07	3	1960-02-25	19
174	52	123	2004-06-28	10	2005-12-16	6
175	24	187	1969-09-01	7	1971-07-19	7
176	54	74	1968-06-10	10	1972-11-28	18
177	5	124	1991-01-18	2	1993-09-26	4
178	59	175	1970-11-07	11	1973-09-14	11
179	56	100	1985-04-17	4	1987-02-08	14
180	36	185	1961-11-17	9	1963-09-04	15
181	19	81	1970-01-22	4	1972-12-13	13
182	22	175	1959-08-22	17	1962-04-03	13
183	15	48	2003-03-06	11	2006-03-20	9
184	44	47	1959-07-07	10	1960-06-19	15
185	5	108	1960-07-16	8	1961-02-01	2
186	27	108	1962-09-06	7	1964-06-03	2
187	23	89	1957-09-24	8	1961-12-27	18
188	46	175	1951-06-11	15	1953-07-05	6
189	56	5	2003-02-05	6	2006-11-26	2
190	15	130	1995-12-10	15	1996-09-28	14
191	9	86	1960-07-19	14	1963-09-14	7
192	56	108	1995-09-02	2	1997-06-12	3
193	17	48	1960-07-18	13	1964-05-26	18
194	6	110	1968-04-12	17	1972-09-24	16
195	40	39	1976-02-23	3	1979-07-24	11
196	24	17	1953-04-15	4	1957-05-04	16
197	31	115	1958-04-26	16	1960-01-03	18
198	6	123	1958-10-19	14	1960-02-19	1
199	33	86	1996-02-03	12	1998-07-02	13
200	34	88	2010-03-01	5	2011-03-26	2
201	15	13	1963-08-25	13	1964-01-11	13
202	23	165	2002-08-05	6	2003-07-08	3
203	34	172	1977-08-24	7	1980-07-06	11
204	13	10	2010-02-14	14	2012-10-08	16
205	24	107	1977-02-07	2	1980-09-26	8
206	35	146	2008-04-09	7	2012-04-16	11
207	44	69	1961-07-02	14	1964-05-17	2
208	46	129	1980-10-07	4	1982-02-24	14
209	34	167	1975-03-16	15	1978-12-12	4
210	37	61	1954-01-15	3	1956-10-11	1
211	38	68	2007-10-06	5	2011-08-18	13
212	9	128	1953-06-07	12	1955-03-15	19
213	23	1	2001-04-23	11	2003-04-23	18
214	59	161	1980-01-03	3	1981-08-08	2
215	31	125	1952-09-08	5	1955-02-06	18
216	50	142	1956-01-08	2	1959-02-11	12
217	24	57	2008-07-21	18	2011-07-14	9
218	12	199	1975-02-11	3	1977-01-07	10
219	5	82	1960-08-26	15	1963-07-14	2
220	8	30	1969-01-03	16	1972-08-06	14
221	9	81	1967-10-17	9	1968-07-10	18
222	33	155	1988-05-23	17	1991-05-17	12
223	16	43	1974-04-19	4	1977-10-17	3
224	52	149	1958-02-14	3	1961-07-25	16
225	2	128	2003-04-23	8	2005-05-15	3
226	50	69	1977-10-13	13	1980-08-03	10
227	35	23	1991-08-07	8	1993-08-23	4
228	9	87	1971-07-24	9	1974-02-17	8
229	11	25	1986-04-22	14	1988-06-22	5
230	34	58	1980-10-17	4	1983-02-15	5
231	15	131	1968-04-06	11	1969-03-05	2
232	40	182	1953-03-22	2	1956-11-08	7
233	58	90	1987-11-24	14	1988-10-19	10
234	31	33	1988-05-14	12	1990-07-26	7
235	59	10	1967-04-05	6	1971-05-24	9
236	55	159	1969-12-04	6	1972-09-22	16
237	10	76	1998-02-28	11	2002-09-10	5
238	48	44	1971-10-14	12	1973-08-12	1
239	21	48	1973-04-08	4	1976-02-15	11
240	54	158	2005-04-15	4	2007-02-19	17
241	21	123	2006-06-13	7	2008-09-19	6
242	27	38	2009-05-11	5	2010-06-12	18
243	25	189	1974-11-11	7	1978-03-25	12
244	11	89	2007-11-06	16	2008-09-21	5
245	44	175	1960-10-17	9	1961-08-12	16
246	37	191	1983-11-02	14	1985-03-06	8
247	52	185	1964-11-03	13	1965-11-23	16
248	44	136	1974-09-09	10	1977-01-14	17
249	25	28	2004-04-18	7	2007-02-10	12
250	38	194	1951-01-02	19	1954-05-04	18
251	7	171	1956-12-12	6	1957-08-06	17
252	59	192	1952-05-26	9	1953-10-11	17
253	28	121	1986-07-04	4	1989-01-18	16
254	34	66	1959-12-17	6	1963-03-26	12
255	50	45	1958-08-12	18	1960-09-25	5
256	7	178	2002-09-14	6	2003-05-15	14
257	36	88	2009-02-26	12	2013-06-28	5
258	50	50	1964-11-01	16	1966-02-24	9
259	43	69	1966-02-24	4	1969-10-18	18
260	21	133	1974-07-18	14	1978-04-28	6
261	26	63	1959-09-06	16	1962-03-10	1
262	58	14	1983-02-26	13	1986-08-11	9
263	46	14	2003-11-19	16	2004-09-16	17
264	1	37	1965-06-25	17	1966-11-13	6
265	47	83	2005-06-22	8	2008-04-19	3
266	52	94	1988-06-16	17	1990-02-10	5
267	47	186	1988-03-12	2	1990-09-05	6
268	22	101	1964-04-20	3	1966-06-09	9
269	57	57	1995-05-20	10	1998-09-02	16
270	53	7	1956-08-08	19	1959-10-27	1
271	41	3	1955-10-21	8	1957-11-06	5
272	9	62	2006-10-25	10	2009-08-19	11
273	3	68	2010-08-12	4	2013-03-21	9
274	29	59	1954-05-03	5	1958-01-09	12
275	44	102	2002-05-21	14	2006-11-23	12
276	46	80	1990-11-19	18	1994-10-27	2
277	12	68	1981-07-22	1	1984-03-16	6
278	57	198	2009-09-19	1	2012-02-14	7
279	15	135	2007-06-11	17	2008-09-03	5
280	19	142	1998-02-11	2	2000-03-11	17
281	43	104	1984-03-16	2	1985-08-01	12
282	28	15	1952-01-02	15	1956-08-01	17
283	58	125	1955-11-05	9	1957-08-25	12
284	53	103	1987-06-13	9	1989-10-12	1
285	21	74	2000-04-19	7	2001-03-15	2
286	15	128	2000-11-13	13	2002-08-27	2
287	10	144	1965-10-01	13	1966-02-19	8
288	2	166	2008-05-07	1	2011-08-27	5
289	48	22	1984-02-21	13	1986-02-24	6
290	53	196	1992-07-02	4	1995-03-02	2
291	6	160	1986-08-26	10	1987-12-20	18
292	21	136	1987-08-12	14	1988-05-28	16
293	16	25	1967-05-18	8	1968-07-05	16
294	37	147	2005-06-19	6	2009-07-12	2
295	5	2	1964-05-06	9	1966-09-25	15
296	53	120	1967-10-19	16	1970-04-20	13
297	12	194	1993-02-14	11	1995-03-18	17
298	3	190	1955-11-26	9	1958-05-04	10
299	11	181	1998-05-13	6	2000-03-02	2
300	25	108	2002-09-15	10	2005-04-07	1
301	41	139	1999-02-01	4	2000-07-03	16
\.


--
-- Name: autorzy autorzy_pkey; Type: CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.autorzy
    ADD CONSTRAINT autorzy_pkey PRIMARY KEY (id_autor);


--
-- Name: czytelnicy czytelnicy_pkey; Type: CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.czytelnicy
    ADD CONSTRAINT czytelnicy_pkey PRIMARY KEY (id_czytelnik);


--
-- Name: kategorie kategorie_pkey; Type: CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.kategorie
    ADD CONSTRAINT kategorie_pkey PRIMARY KEY (id_kategoria);


--
-- Name: ksiazki ksiazki_pkey; Type: CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.ksiazki
    ADD CONSTRAINT ksiazki_pkey PRIMARY KEY (id_ksiazka);


--
-- Name: pracownicy pracownicy_pkey; Type: CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.pracownicy
    ADD CONSTRAINT pracownicy_pkey PRIMARY KEY (id_pracownik);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_rola);


--
-- Name: wydawnictwa wydawnictwa_pkey; Type: CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.wydawnictwa
    ADD CONSTRAINT wydawnictwa_pkey PRIMARY KEY (id_wydawnictwo);


--
-- Name: wypozyczenia wypozyczenia_pkey; Type: CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.wypozyczenia
    ADD CONSTRAINT wypozyczenia_pkey PRIMARY KEY (id_wypozyczenie);


--
-- Name: ksiazki fk_autor; Type: FK CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.ksiazki
    ADD CONSTRAINT fk_autor FOREIGN KEY (id_autor) REFERENCES public.autorzy(id_autor);


--
-- Name: wypozyczenia fk_czytelnik; Type: FK CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.wypozyczenia
    ADD CONSTRAINT fk_czytelnik FOREIGN KEY (id_czytelnik) REFERENCES public.czytelnicy(id_czytelnik);


--
-- Name: ksiazki fk_kategoria; Type: FK CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.ksiazki
    ADD CONSTRAINT fk_kategoria FOREIGN KEY (id_kategoria) REFERENCES public.kategorie(id_kategoria);


--
-- Name: wypozyczenia fk_ksiazka; Type: FK CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.wypozyczenia
    ADD CONSTRAINT fk_ksiazka FOREIGN KEY (id_ksiazka) REFERENCES public.ksiazki(id_ksiazka);


--
-- Name: wypozyczenia fk_pracownik_oddanie; Type: FK CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.wypozyczenia
    ADD CONSTRAINT fk_pracownik_oddanie FOREIGN KEY (id_pracownik_oddanie) REFERENCES public.pracownicy(id_pracownik);


--
-- Name: wypozyczenia fk_pracownik_wypozyczenie; Type: FK CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.wypozyczenia
    ADD CONSTRAINT fk_pracownik_wypozyczenie FOREIGN KEY (id_pracownik_wypozyczenie) REFERENCES public.pracownicy(id_pracownik);


--
-- Name: pracownicy fk_rola; Type: FK CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.pracownicy
    ADD CONSTRAINT fk_rola FOREIGN KEY (id_rola) REFERENCES public.role(id_rola);


--
-- Name: ksiazki fk_wydawnictwo; Type: FK CONSTRAINT; Schema: public; Owner: afrankowski
--

ALTER TABLE ONLY public.ksiazki
    ADD CONSTRAINT fk_wydawnictwo FOREIGN KEY (id_wydawnictwo) REFERENCES public.wydawnictwa(id_wydawnictwo);


--
-- PostgreSQL database dump complete
--

