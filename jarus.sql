--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: rcs_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rcs_data (
    rcs_sub_title_id smallint NOT NULL,
    id smallint NOT NULL,
    name_id smallint NOT NULL,
    kr boolean NOT NULL,
    kn boolean NOT NULL,
    is_kn boolean NOT NULL,
    descriptions character varying(256) DEFAULT NULL::character varying,
    sta_id integer NOT NULL
);


ALTER TABLE public.rcs_data OWNER TO postgres;

--
-- Name: seq_rcs_name; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_rcs_name
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_rcs_name OWNER TO postgres;

--
-- Name: rcs_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rcs_name (
    id smallint DEFAULT nextval('public.seq_rcs_name'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    descriptions character varying(256)
);


ALTER TABLE public.rcs_name OWNER TO postgres;

--
-- Name: seq_rcs_subtitle; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_rcs_subtitle
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_rcs_subtitle OWNER TO postgres;

--
-- Name: rcs_subtitle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rcs_subtitle (
    id smallint DEFAULT nextval('public.seq_rcs_subtitle'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    descriptions character varying(256),
    rcs_title_id smallint NOT NULL
);


ALTER TABLE public.rcs_subtitle OWNER TO postgres;

--
-- Name: seq_rcs_title; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_rcs_title
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_rcs_title OWNER TO postgres;

--
-- Name: rcs_title; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rcs_title (
    id smallint DEFAULT nextval('public.seq_rcs_title'::regclass) NOT NULL,
    name character varying(50),
    descriptions character varying(256)
);


ALTER TABLE public.rcs_title OWNER TO postgres;

--
-- Name: ruas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ruas (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    descriptions character varying(256)
);


ALTER TABLE public.ruas OWNER TO postgres;

--
-- Name: seq_sta; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_sta
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_sta OWNER TO postgres;

--
-- Name: seq_tipe_jalan; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tipe_jalan
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_tipe_jalan OWNER TO postgres;

--
-- Name: sta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sta (
    ruas_id integer NOT NULL,
    id integer DEFAULT nextval('public.seq_sta'::regclass) NOT NULL,
    survey_date timestamp without time zone NOT NULL,
    length_from integer NOT NULL,
    length_to integer NOT NULL,
    surveyor1 character varying(50) NOT NULL,
    surveyor2 character varying(50) NOT NULL,
    descriptions character varying(256),
    sta_start integer NOT NULL,
    sta_end integer NOT NULL,
    tipe_jalan_id smallint NOT NULL
);


ALTER TABLE public.sta OWNER TO postgres;

--
-- Name: tipe_jalan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipe_jalan (
    id smallint DEFAULT nextval('public.seq_tipe_jalan'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    descriptions character varying(256)
);


ALTER TABLE public.tipe_jalan OWNER TO postgres;

--
-- Data for Name: rcs_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rcs_data (rcs_sub_title_id, id, name_id, kr, kn, is_kn, descriptions, sta_id) FROM stdin;
6	1	3	f	f	f	\N	14
6	2	17	f	f	f	\N	14
4	1	5	f	f	f	\N	14
4	2	9	t	f	f	\N	14
2	1	3	f	f	f	\N	14
2	2	7	t	f	f	\N	14
1	1	17	f	f	f	\N	17
18	1	8	t	f	f	\N	17
1	1	20	t	f	f	\N	14
1	4	17	f	f	f	\N	14
16	1	16	f	f	f	\N	14
16	2	1	t	f	f	\N	14
2	1	8	f	f	f	\N	17
2	2	17	f	f	f	\N	17
2	3	7	f	f	f	\N	17
2	4	20	f	f	f	\N	17
16	1	1	f	f	f	\N	17
16	2	7	t	f	f	\N	17
\.


--
-- Data for Name: rcs_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rcs_name (id, name, descriptions) FROM stdin;
1	Baik / Rapat	\N
2	Kasar	\N
3	Baik / Tidak Ada Kelainan	\N
4	Rusak	\N
5	Lepas-lepas	\N
6	Hancur	\N
7	Tidak ada	\N
8	< 10% Luas	\N
9	10% - 30% Luas	\N
10	> 30% Luas	\N
16	Tidak Berhubungan	\N
17	Saling Berhubungan	\N
19	> 5%	\N
20	2% - 3%	\N
21	10% - 30%	\N
\.


--
-- Data for Name: rcs_subtitle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rcs_subtitle (id, name, descriptions, rcs_title_id) FROM stdin;
2	Kondisi / Keadaan	\N	1
4	% Tambahan	\N	1
5	Jenis	\N	1
6	Lebar Retak	\N	1
8	Jumlah Lubang	\N	1
10	Bekas Roda	\N	1
11	Kerusakan Tepi	\N	1
12	Kondisi Bahu	\N	1
13	Permukaan Bahu	\N	1
14	Kondisi Saluran Samping	\N	1
15	Kerusakan Lereng	\N	1
16	Trotoar	\N	1
1	Kemiringin Melintang	\N	1
9	Ukuran Lubang	\N	2
18	Well Done!	\N	6
7	% Luas	qwewqe	1
3	% Penurunan	\N	1
\.


--
-- Data for Name: rcs_title; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rcs_title (id, name, descriptions) FROM stdin;
2	Retak-Retak	
4	Bahu, Saluran Samping, dan Lain-Lain	
3	Kerusakan Lain	
1	Permukaan Perkerasan	\N
6	Welcome to the jungle	\N
\.


--
-- Data for Name: ruas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ruas (id, name, status, descriptions) FROM stdin;
21	Plumbon - Telukagung	K	\N
22	Telukagung ~ Lohbener	K	\N
\.


--
-- Data for Name: sta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sta (ruas_id, id, survey_date, length_from, length_to, surveyor1, surveyor2, descriptions, sta_start, sta_end, tipe_jalan_id) FROM stdin;
21	17	2021-04-07 00:00:00	0	0	12323	12323	\N	0	0	1
22	14	2021-07-01 00:00:00	0	100	Jaman	Wibisono	679879 qwewe wqewqe	0	0	1
\.


--
-- Data for Name: tipe_jalan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipe_jalan (id, name, descriptions) FROM stdin;
1	Aspal	\N
2	Non Aspal	\N
\.


--
-- Name: seq_rcs_name; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_rcs_name', 22, true);


--
-- Name: seq_rcs_subtitle; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_rcs_subtitle', 19, true);


--
-- Name: seq_rcs_title; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_rcs_title', 6, true);


--
-- Name: seq_sta; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_sta', 18, true);


--
-- Name: seq_tipe_jalan; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tipe_jalan', 2, true);


--
-- Name: rcs_data pk_rcs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rcs_data
    ADD CONSTRAINT pk_rcs PRIMARY KEY (sta_id, rcs_sub_title_id, id);


--
-- Name: rcs_name pk_rcs_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rcs_name
    ADD CONSTRAINT pk_rcs_name PRIMARY KEY (id);


--
-- Name: rcs_subtitle pk_rcs_subtitle; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rcs_subtitle
    ADD CONSTRAINT pk_rcs_subtitle PRIMARY KEY (id);


--
-- Name: rcs_title pk_rcs_title; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rcs_title
    ADD CONSTRAINT pk_rcs_title PRIMARY KEY (id);


--
-- Name: ruas pk_ruas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruas
    ADD CONSTRAINT pk_ruas PRIMARY KEY (id);


--
-- Name: sta pk_sta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sta
    ADD CONSTRAINT pk_sta PRIMARY KEY (id);


--
-- Name: tipe_jalan pk_tipe_jalan; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipe_jalan
    ADD CONSTRAINT pk_tipe_jalan PRIMARY KEY (id);


--
-- Name: uq_rcs_subtitle_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_rcs_subtitle_name ON public.rcs_subtitle USING btree (name);


--
-- Name: uq_rcs_title_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_rcs_title_name ON public.rcs_title USING btree (name);


--
-- Name: uq_tipe_jalan_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_tipe_jalan_name ON public.tipe_jalan USING btree (name);


--
-- Name: sta fk_jalan_sta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sta
    ADD CONSTRAINT fk_jalan_sta FOREIGN KEY (tipe_jalan_id) REFERENCES public.tipe_jalan(id) ON DELETE CASCADE;


--
-- Name: rcs_data fk_rcs_name_data; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rcs_data
    ADD CONSTRAINT fk_rcs_name_data FOREIGN KEY (name_id) REFERENCES public.rcs_name(id) ON UPDATE CASCADE;


--
-- Name: rcs_subtitle fk_rcs_sub_title; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rcs_subtitle
    ADD CONSTRAINT fk_rcs_sub_title FOREIGN KEY (rcs_title_id) REFERENCES public.rcs_title(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rcs_data fk_rcs_subtitle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rcs_data
    ADD CONSTRAINT fk_rcs_subtitle FOREIGN KEY (rcs_sub_title_id) REFERENCES public.rcs_subtitle(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sta fk_ruas_sta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sta
    ADD CONSTRAINT fk_ruas_sta FOREIGN KEY (ruas_id) REFERENCES public.ruas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rcs_data fk_sta_rcs_data; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rcs_data
    ADD CONSTRAINT fk_sta_rcs_data FOREIGN KEY (sta_id) REFERENCES public.sta(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
