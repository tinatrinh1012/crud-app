--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7 (Homebrew)

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
-- Name: color; Type: TABLE; Schema: public; Owner: tinatrinh
--

CREATE TABLE public.color (
    id integer NOT NULL,
    color_num integer,
    color_name character varying(50)
);


ALTER TABLE public.color OWNER TO tinatrinh;

--
-- Name: color_id_seq; Type: SEQUENCE; Schema: public; Owner: tinatrinh
--

CREATE SEQUENCE public.color_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.color_id_seq OWNER TO tinatrinh;

--
-- Name: color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tinatrinh
--

ALTER SEQUENCE public.color_id_seq OWNED BY public.color.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: tinatrinh
--

CREATE TABLE public.jobs (
    id integer NOT NULL,
    mfr_record_id integer,
    type_record_id integer,
    style_record_id integer,
    color_record_id integer,
    size_record_id integer
);


ALTER TABLE public.jobs OWNER TO tinatrinh;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: tinatrinh
--

CREATE SEQUENCE public.jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO tinatrinh;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tinatrinh
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: mfr; Type: TABLE; Schema: public; Owner: tinatrinh
--

CREATE TABLE public.mfr (
    id integer NOT NULL,
    mfr_name character varying(80)
);


ALTER TABLE public.mfr OWNER TO tinatrinh;

--
-- Name: mfr_id_seq; Type: SEQUENCE; Schema: public; Owner: tinatrinh
--

CREATE SEQUENCE public.mfr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mfr_id_seq OWNER TO tinatrinh;

--
-- Name: mfr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tinatrinh
--

ALTER SEQUENCE public.mfr_id_seq OWNED BY public.mfr.id;


--
-- Name: size; Type: TABLE; Schema: public; Owner: tinatrinh
--

CREATE TABLE public.size (
    id integer NOT NULL,
    size character varying(50)
);


ALTER TABLE public.size OWNER TO tinatrinh;

--
-- Name: size_id_seq; Type: SEQUENCE; Schema: public; Owner: tinatrinh
--

CREATE SEQUENCE public.size_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.size_id_seq OWNER TO tinatrinh;

--
-- Name: size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tinatrinh
--

ALTER SEQUENCE public.size_id_seq OWNED BY public.size.id;


--
-- Name: style; Type: TABLE; Schema: public; Owner: tinatrinh
--

CREATE TABLE public.style (
    id integer NOT NULL,
    style_id character varying(50),
    style_name character varying(50)
);


ALTER TABLE public.style OWNER TO tinatrinh;

--
-- Name: style_id_seq; Type: SEQUENCE; Schema: public; Owner: tinatrinh
--

CREATE SEQUENCE public.style_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.style_id_seq OWNER TO tinatrinh;

--
-- Name: style_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tinatrinh
--

ALTER SEQUENCE public.style_id_seq OWNED BY public.style.id;


--
-- Name: type; Type: TABLE; Schema: public; Owner: tinatrinh
--

CREATE TABLE public.type (
    id integer NOT NULL,
    type_id integer,
    type_name character varying(50)
);


ALTER TABLE public.type OWNER TO tinatrinh;

--
-- Name: type_id_seq; Type: SEQUENCE; Schema: public; Owner: tinatrinh
--

CREATE SEQUENCE public.type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_id_seq OWNER TO tinatrinh;

--
-- Name: type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tinatrinh
--

ALTER SEQUENCE public.type_id_seq OWNED BY public.type.id;


--
-- Name: color id; Type: DEFAULT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.color ALTER COLUMN id SET DEFAULT nextval('public.color_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: mfr id; Type: DEFAULT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.mfr ALTER COLUMN id SET DEFAULT nextval('public.mfr_id_seq'::regclass);


--
-- Name: size id; Type: DEFAULT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.size ALTER COLUMN id SET DEFAULT nextval('public.size_id_seq'::regclass);


--
-- Name: style id; Type: DEFAULT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.style ALTER COLUMN id SET DEFAULT nextval('public.style_id_seq'::regclass);


--
-- Name: type id; Type: DEFAULT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.type ALTER COLUMN id SET DEFAULT nextval('public.type_id_seq'::regclass);


--
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: tinatrinh
--

COPY public.color (id, color_num, color_name) FROM stdin;
1	51915	Charcoal
2	3308	Ash
3	67537	Dynamic Network
4	789	Worldly Gray
5	1174	Seabreeze
6	\N	Mercury
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: tinatrinh
--

COPY public.jobs (id, mfr_record_id, type_record_id, style_record_id, color_record_id, size_record_id) FROM stdin;
1	1	1	1	1	1
2	2	1	2	2	2
4	3	2	3	3	3
5	4	2	4	4	4
6	5	3	5	5	5
7	6	3	6	6	6
\.


--
-- Data for Name: mfr; Type: TABLE DATA; Schema: public; Owner: tinatrinh
--

COPY public.mfr (id, mfr_name) FROM stdin;
1	Armstrong
2	Tarkett
3	Shaw
4	Mohawk
5	Daltile
6	Transceramica
\.


--
-- Data for Name: size; Type: TABLE DATA; Schema: public; Owner: tinatrinh
--

COPY public.size (id, size) FROM stdin;
1	12 x 12
2	12 x 24
3	24 x 24
4	12' Roll Goods
5	4 x 8
6	18 x 18
\.


--
-- Data for Name: style; Type: TABLE DATA; Schema: public; Owner: tinatrinh
--

COPY public.style (id, style_id, style_name) FROM stdin;
1	n/a	Standard Excelon
2	n/a	Classic Plank
3	5T269	Convene
4	SLC46	Ivy Hall
5	n/a	Color Wheel
6	\N	Aster Maximum Fiandra
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: tinatrinh
--

COPY public.type (id, type_id, type_name) FROM stdin;
1	1	Resilient
2	2	Carpet
3	3	Ceramic Tile
\.


--
-- Name: color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tinatrinh
--

SELECT pg_catalog.setval('public.color_id_seq', 7, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tinatrinh
--

SELECT pg_catalog.setval('public.jobs_id_seq', 7, true);


--
-- Name: mfr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tinatrinh
--

SELECT pg_catalog.setval('public.mfr_id_seq', 6, true);


--
-- Name: size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tinatrinh
--

SELECT pg_catalog.setval('public.size_id_seq', 6, true);


--
-- Name: style_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tinatrinh
--

SELECT pg_catalog.setval('public.style_id_seq', 6, true);


--
-- Name: type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tinatrinh
--

SELECT pg_catalog.setval('public.type_id_seq', 3, true);


--
-- Name: color color_color_name_key; Type: CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_color_name_key UNIQUE (color_name);


--
-- Name: color color_pkey; Type: CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_pkey PRIMARY KEY (id);


--
-- Name: mfr mfr_mfr_name_key; Type: CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.mfr
    ADD CONSTRAINT mfr_mfr_name_key UNIQUE (mfr_name);


--
-- Name: mfr mfr_pkey; Type: CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.mfr
    ADD CONSTRAINT mfr_pkey PRIMARY KEY (id);


--
-- Name: size size_pkey; Type: CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.size
    ADD CONSTRAINT size_pkey PRIMARY KEY (id);


--
-- Name: size size_size_key; Type: CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.size
    ADD CONSTRAINT size_size_key UNIQUE (size);


--
-- Name: style style_pkey; Type: CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.style
    ADD CONSTRAINT style_pkey PRIMARY KEY (id);


--
-- Name: style style_style_name_key; Type: CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.style
    ADD CONSTRAINT style_style_name_key UNIQUE (style_name);


--
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);


--
-- Name: type type_type_name_key; Type: CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_type_name_key UNIQUE (type_name);


--
-- Name: jobs jobs_color_record_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_color_record_id_fkey FOREIGN KEY (color_record_id) REFERENCES public.color(id);


--
-- Name: jobs jobs_mfr_record_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_mfr_record_id_fkey FOREIGN KEY (mfr_record_id) REFERENCES public.mfr(id);


--
-- Name: jobs jobs_size_record_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_size_record_id_fkey FOREIGN KEY (size_record_id) REFERENCES public.size(id);


--
-- Name: jobs jobs_style_record_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_style_record_id_fkey FOREIGN KEY (style_record_id) REFERENCES public.style(id);


--
-- Name: jobs jobs_type_record_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_type_record_id_fkey FOREIGN KEY (type_record_id) REFERENCES public.type(id);


--
-- PostgreSQL database dump complete
--

