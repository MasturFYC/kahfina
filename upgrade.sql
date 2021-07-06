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

-- tambahkan kolom nomor ruas lama ke table ruas
ALTER TABLE public.ruas add column old_id integer not null default 0;
ALTER TABLE public.sta add column odo_meter decimal(12,2) not null default 0;
ALTER TABLE public.sta add column rc1 decimal(10,2) not null default 0;
ALTER TABLE public.sta add column rc2 decimal(10,2) not null default 0;
ALTER TABLE public.sta add column rc3 decimal(10,2) not null default 0;

CREATE SEQUENCE public.seq_io_rekom
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    
ALTER TABLE public.seq_io_rekom OWNER TO postgres;

CREATE SEQUENCE public.seq_kategori_usulan
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
        
CREATE SEQUENCE public.seq_rekom_desa
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    
ALTER TABLE public.seq_rekom_desa OWNER TO postgres;

CREATE SEQUENCE public.seq_skpd_target
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE public.seq_musrembang
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.seq_musrembang OWNER TO postgres;

CREATE SEQUENCE public.seq_usulan
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.seq_usulan OWNER TO postgres;


CREATE SEQUENCE public.seq_rekom_bappeda
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.seq_rekom_bappeda OWNER TO postgres;

CREATE SEQUENCE public.seq_rekom_kecamatan
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE public.seq_rekom_skpd
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.seq_rekom_skpd OWNER TO postgres;


CREATE SEQUENCE public.seq_desa
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.seq_desa OWNER TO postgres;

CREATE TABLE public.rekom_kecamatan (
  id integer DEFAULT nextval('public.seq_rekom_kecamatan'::regclass) NOT NULL,
  usulan_id integer NOT NULL,
  koefisien integer DEFAULT 0 NOT NULL,
  anggaran integer DEFAULT 0 NOT NULL,
  descriptions character varying(256)
);
ALTER TABLE public.rekom_kecamatan OWNER TO postgres;

CREATE TABLE public.skpd_target (
  id smallint DEFAULT nextval('public.seq_skpd_target'::regclass) NOT NULL,
  name character varying(128) NOT NULL,
  descriptions character varying(256)
);
ALTER TABLE public.skpd_target OWNER TO postgres;


CREATE TABLE rekom_bappeda (
  id integer DEFAULT nextval('public.seq_rekom_bappeda'::regclass) NOT NULL,
  usulan_id integer NOT NULL,
  koefisien integer DEFAULT 0 NOT NULL,
  anggaran integer DEFAULT 0 NOT NULL,
  descriptions character varying(256)
);
ALTER TABLE public.rekom_bappeda OWNER TO postgres;

CREATE TABLE public.rekom_skpd (
  id integer DEFAULT nextval('public.seq_rekom_skpd'::regclass) NOT NULL,
  usulan_id integer NOT NULL,
  koefisien integer DEFAULT 0 NOT NULL,
  anggaran integer DEFAULT 0 NOT NULL,
  descriptions character varying(256)
);
ALTER TABLE public.rekom_skpd OWNER TO postgres;

CREATE TABLE public.rekom_desa (
  id integer DEFAULT nextval('public.seq_rekom_desa'::regclass) NOT NULL,
  usulan_id integer NOT NULL,
  koefisien integer DEFAULT 0 NOT NULL,
  anggaran integer DEFAULT 0 NOT NULL,
  descriptions character varying(256)
);
ALTER TABLE public.rekom_desa OWNER TO postgres;

CREATE TABLE public.io_rekom (
  id integer DEFAULT nextval('public.seq_io_rekom'::regclass) NOT NULL,
  pemeliharaan_rutin boolean DEFAULT false NOT NULL,
  pemeliharaan_berkala boolean DEFAULT false NOT NULL,
  rehabilitasi_jalan boolean DEFAULT false NOT NULL,
  pembangunan boolean DEFAULT false NOT NULL,
  musrembang_id integer not null,
  descriptions character varying(256)
);
ALTER TABLE public.io_rekom OWNER TO postgres;

CREATE TABLE public.musrembang (
  id integer DEFAULT nextval('public.seq_musrembang'::regclass) NOT NULL,
  name character varying(50) NOT NULL,
  usulan_id integer NOT NULL,
  jalan_provinsi character varying(50),
  jalan_nasional character varying(50),
  descriptions character varying(256)
);
ALTER TABLE public.musrembang OWNER TO postgres;

CREATE TABLE public.kategori_usulan (
  id integer DEFAULT nextval('seq_kategori_usulan'::regclass) NOT NULL,
  name character varying(50) NOT NULL,
  descriptions character varying(256)
);
ALTER TABLE public.kategori_usulan OWNER TO postgres;


CREATE TABLE public.usulan (
  id integer DEFAULT nextval('public.seq_usulan'::regclass) NOT NULL,
  tgl_usul timestamp NOT NULL,
  tgl_ajuan timestamp NOT NULL,
  pengusul character varying(50) NOT NULL,
  profile_pengusul character varying(50) NOT NULL,
  masalah character varying(256) NOT NULL,
  usulan character varying(128) NOT NULL,
  urusan character varying(128) NOT NULL,
  alamat character varying(128) NOT NULL,
  skpd_target_id integer NOT NULL,
  kategori_id smallint NOT NULL,
  koefisien integer NOT NULL,
  sta_id integer NOT NULL,
  descriptions character varying(256) NOT NULL
);
ALTER TABLE public.usulan OWNER TO postgres;

ALTER TABLE ONLY public.usulan ADD CONSTRAINT pk_usulan PRIMARY KEY (id);
ALTER TABLE ONLY public.rekom_kecamatan  ADD CONSTRAINT pk_kecamatan PRIMARY KEY (id);
ALTER TABLE ONLY public.rekom_bappeda  ADD CONSTRAINT pk_bappeda PRIMARY KEY (id);
ALTER TABLE ONLY public.rekom_skpd  ADD CONSTRAINT pk_skpd PRIMARY KEY (id);
ALTER TABLE ONLY public.rekom_desa  ADD CONSTRAINT pk_desa PRIMARY KEY (id);
ALTER TABLE ONLY public.io_rekom  ADD CONSTRAINT pk_io_rekom PRIMARY KEY (id);
ALTER TABLE ONLY public.musrembang  ADD CONSTRAINT pk_musrembang PRIMARY KEY (id);
ALTER TABLE ONLY public.kategori_usulan  ADD CONSTRAINT pk_kategori_usulan PRIMARY KEY (id);
ALTER TABLE ONLY public.skpd_target  ADD CONSTRAINT pk_skpd_target PRIMARY KEY (id);

ALTER TABLE ONLY public.rekom_bappeda ADD CONSTRAINT fk_rekom_bappeda FOREIGN KEY (usulan_id) REFERENCES public.usulan(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.rekom_kecamatan ADD CONSTRAINT fk_rekom_kecamatan FOREIGN KEY (usulan_id) REFERENCES public.usulan(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.rekom_skpd ADD CONSTRAINT fk_rekom_skpd FOREIGN KEY (usulan_id) REFERENCES public.usulan(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.rekom_desa ADD CONSTRAINT fk_rekom_desa FOREIGN KEY (usulan_id) REFERENCES public.usulan(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.usulan ADD CONSTRAINT fk_rekom_kategori FOREIGN KEY (kategori_id) REFERENCES public.kategori_usulan(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.io_rekom ADD CONSTRAINT fk_musrembang_rekom FOREIGN KEY (musrembang_id) REFERENCES public.musrembang(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.musrembang ADD CONSTRAINT fk_musrembang_usulan FOREIGN KEY (usulan_id) REFERENCES public.usulan(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.usulan ADD CONSTRAINT fk_sta_usulan FOREIGN KEY (sta_id) REFERENCES public.sta(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.usulan ADD CONSTRAINT fk_skpd_target FOREIGN KEY (skpd_target_id) REFERENCES public.skpd_target(id) ON UPDATE CASCADE ON DELETE RESTRICT;
