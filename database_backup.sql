--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: senyawebster
--

CREATE TABLE authors (
    id integer NOT NULL,
    author character varying
);


ALTER TABLE authors OWNER TO senyawebster;

--
-- Name: author_name_id_seq; Type: SEQUENCE; Schema: public; Owner: senyawebster
--

CREATE SEQUENCE author_name_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE author_name_id_seq OWNER TO senyawebster;

--
-- Name: author_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: senyawebster
--

ALTER SEQUENCE author_name_id_seq OWNED BY authors.id;


--
-- Name: author_title; Type: TABLE; Schema: public; Owner: senyawebster
--

CREATE TABLE author_title (
    id integer NOT NULL,
    author_id integer,
    title character varying
);


ALTER TABLE author_title OWNER TO senyawebster;

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: senyawebster
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book_id_seq OWNER TO senyawebster;

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: senyawebster
--

ALTER SEQUENCE book_id_seq OWNED BY author_title.id;


--
-- Name: checkouts; Type: TABLE; Schema: public; Owner: senyawebster
--

CREATE TABLE checkouts (
    id integer NOT NULL,
    book_id integer,
    patron_id integer,
    return date
);


ALTER TABLE checkouts OWNER TO senyawebster;

--
-- Name: checkouts_id_seq; Type: SEQUENCE; Schema: public; Owner: senyawebster
--

CREATE SEQUENCE checkouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE checkouts_id_seq OWNER TO senyawebster;

--
-- Name: checkouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: senyawebster
--

ALTER SEQUENCE checkouts_id_seq OWNED BY checkouts.id;


--
-- Name: patrons; Type: TABLE; Schema: public; Owner: senyawebster
--

CREATE TABLE patrons (
    id integer NOT NULL,
    patron character varying
);


ALTER TABLE patrons OWNER TO senyawebster;

--
-- Name: patrons_id_seq; Type: SEQUENCE; Schema: public; Owner: senyawebster
--

CREATE SEQUENCE patrons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patrons_id_seq OWNER TO senyawebster;

--
-- Name: patrons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: senyawebster
--

ALTER SEQUENCE patrons_id_seq OWNED BY patrons.id;


--
-- Name: author_title id; Type: DEFAULT; Schema: public; Owner: senyawebster
--

ALTER TABLE ONLY author_title ALTER COLUMN id SET DEFAULT nextval('book_id_seq'::regclass);


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: senyawebster
--

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('author_name_id_seq'::regclass);


--
-- Name: checkouts id; Type: DEFAULT; Schema: public; Owner: senyawebster
--

ALTER TABLE ONLY checkouts ALTER COLUMN id SET DEFAULT nextval('checkouts_id_seq'::regclass);


--
-- Name: patrons id; Type: DEFAULT; Schema: public; Owner: senyawebster
--

ALTER TABLE ONLY patrons ALTER COLUMN id SET DEFAULT nextval('patrons_id_seq'::regclass);


--
-- Name: author_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: senyawebster
--

SELECT pg_catalog.setval('author_name_id_seq', 1, false);


--
-- Data for Name: author_title; Type: TABLE DATA; Schema: public; Owner: senyawebster
--

COPY author_title (id, author_id, title) FROM stdin;
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: senyawebster
--

COPY authors (id, author) FROM stdin;
\.


--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: senyawebster
--

SELECT pg_catalog.setval('book_id_seq', 2, true);


--
-- Data for Name: checkouts; Type: TABLE DATA; Schema: public; Owner: senyawebster
--

COPY checkouts (id, book_id, patron_id, return) FROM stdin;
\.


--
-- Name: checkouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: senyawebster
--

SELECT pg_catalog.setval('checkouts_id_seq', 1, false);


--
-- Data for Name: patrons; Type: TABLE DATA; Schema: public; Owner: senyawebster
--

COPY patrons (id, patron) FROM stdin;
\.


--
-- Name: patrons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: senyawebster
--

SELECT pg_catalog.setval('patrons_id_seq', 1, false);


--
-- Name: authors author_name_pkey; Type: CONSTRAINT; Schema: public; Owner: senyawebster
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT author_name_pkey PRIMARY KEY (id);


--
-- Name: author_title book_pkey; Type: CONSTRAINT; Schema: public; Owner: senyawebster
--

ALTER TABLE ONLY author_title
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: checkouts checkouts_pkey; Type: CONSTRAINT; Schema: public; Owner: senyawebster
--

ALTER TABLE ONLY checkouts
    ADD CONSTRAINT checkouts_pkey PRIMARY KEY (id);


--
-- Name: patrons patrons_pkey; Type: CONSTRAINT; Schema: public; Owner: senyawebster
--

ALTER TABLE ONLY patrons
    ADD CONSTRAINT patrons_pkey PRIMARY KEY (id);


--
-- Name: author_title book_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: senyawebster
--

ALTER TABLE ONLY author_title
    ADD CONSTRAINT book_author_id_fkey FOREIGN KEY (author_id) REFERENCES authors(id);


--
-- Name: checkouts checkouts_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: senyawebster
--

ALTER TABLE ONLY checkouts
    ADD CONSTRAINT checkouts_book_id_fkey FOREIGN KEY (book_id) REFERENCES author_title(id);


--
-- Name: checkouts checkouts_patron_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: senyawebster
--

ALTER TABLE ONLY checkouts
    ADD CONSTRAINT checkouts_patron_id_fkey FOREIGN KEY (patron_id) REFERENCES patrons(id);


--
-- PostgreSQL database dump complete
--

