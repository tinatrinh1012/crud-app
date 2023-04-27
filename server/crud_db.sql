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
-- Name: jobs; Type: TABLE; Schema: public; Owner: tinatrinh
--

CREATE TABLE public.jobs (
    job_id integer NOT NULL,
    mfr character varying(80) NOT NULL,
    type_name character varying(50) NOT NULL,
    type_id integer NOT NULL,
    style_name character varying(50) NOT NULL,
    style_id character varying(20),
    color_num integer,
    color_name character varying(50) NOT NULL,
    size character varying(50) NOT NULL
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

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.job_id;


--
-- Name: jobs job_id; Type: DEFAULT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.jobs ALTER COLUMN job_id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: tinatrinh
--

COPY public.jobs (job_id, mfr, type_name, type_id, style_name, style_id, color_num, color_name, size) FROM stdin;
1	Armstrong	Resilient	1	Standard Excelon	n/a	51915	Charcoal	12 x 12
2	Tarkett	Resilient	1	Classic Plank	n/a	3308	Ash	12 x 14
3	Shaw	Carpet	2	Convene	5T269	67537	Dynamic Network	24 x 24
17	Mohawk	Carpet	2	Ivy Hall	SLC46	789	Worldly Gray	12' Roll Goods
18	Daltile	Ceramic Tile	3	Color Wheel	n/a	1174	Seabreeze	4 x 8
19	Transceramica	Ceramic Tile	3	Aster Maximum Fiandra	\N	\N	Mercury	18 x 18
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tinatrinh
--

SELECT pg_catalog.setval('public.jobs_id_seq', 19, true);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: tinatrinh
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);


--
-- PostgreSQL database dump complete
--

