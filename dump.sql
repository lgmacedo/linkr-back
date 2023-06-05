--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)

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
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: cube; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- Name: dict_int; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


--
-- Name: EXTENSION dict_int; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_int IS 'text search dictionary template for integers';


--
-- Name: dict_xsyn; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_xsyn WITH SCHEMA public;


--
-- Name: EXTENSION dict_xsyn; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_xsyn IS 'text search dictionary template for extended synonym processing';


--
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgrowlocks; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrowlocks WITH SCHEMA public;


--
-- Name: EXTENSION pgrowlocks; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrowlocks IS 'show row-level locking information';


--
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


--
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: xml2; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS xml2 WITH SCHEMA public;


--
-- Name: EXTENSION xml2; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION xml2 IS 'XPath querying and XSLT';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: fmxzsltt
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    hashtag text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.hashtags OWNER TO fmxzsltt;

--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: fmxzsltt
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hashtags_id_seq OWNER TO fmxzsltt;

--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmxzsltt
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: fmxzsltt
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.likes OWNER TO fmxzsltt;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: fmxzsltt
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO fmxzsltt;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmxzsltt
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: fmxzsltt
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    link text NOT NULL,
    description text,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "identificationToken" text
);


ALTER TABLE public.posts OWNER TO fmxzsltt;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: fmxzsltt
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO fmxzsltt;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmxzsltt
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: fmxzsltt
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.sessions OWNER TO fmxzsltt;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: fmxzsltt
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO fmxzsltt;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmxzsltt
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: fmxzsltt
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    picture text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO fmxzsltt;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: fmxzsltt
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO fmxzsltt;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmxzsltt
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: fmxzsltt
--

COPY public.hashtags (id, "postId", hashtag, "createdAt") FROM stdin;
8	4	hashtag	2023-06-03 17:16:34.791366
9	15	teste	2023-06-03 18:18:07.738389
12	15	teste	2023-06-04 07:04:51.183626
17	22	calopsita	2023-06-04 07:57:28.33864
18	22	gato	2023-06-04 07:57:28.510115
19	22	arara	2023-06-04 07:57:28.681694
20	22	le	2023-06-04 07:57:28.853088
21	22	cachorro	2023-06-04 07:57:29.02193
22	22	priquito	2023-06-04 07:57:29.190462
24	24	bbbaa	2023-06-04 16:13:50.235844
25	15	teste	2023-06-04 17:09:28.886313
28	28	miau	2023-06-04 17:24:40.063999
29	28	auau	2023-06-04 17:24:40.230098
30	28	aaa	2023-06-04 17:24:40.391476
31	29	miranha	2023-06-04 18:08:46.687694
32	29	aranhaverso	2023-06-04 18:08:46.884843
37	27	teste	2023-06-05 06:49:58.445573
40	9	test	2023-06-05 07:00:03.89
46	32	testeeee	2023-06-05 07:09:41.279056
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: fmxzsltt
--

COPY public.likes (id, "postId", "userId", "createdAt") FROM stdin;
74	1	10	2023-06-03 19:21:45.45921
75	2	10	2023-06-03 19:21:46.785853
76	3	10	2023-06-03 19:21:51.388185
82	14	10	2023-06-03 22:21:48.701868
83	15	10	2023-06-03 22:22:08.47371
89	16	10	2023-06-03 23:52:59.102451
91	17	10	2023-06-04 16:03:06.176762
92	24	10	2023-06-04 17:00:20.428818
93	24	12	2023-06-04 17:01:02.785039
95	28	10	2023-06-04 17:29:37.609642
98	29	10	2023-06-04 18:10:41.795406
99	28	13	2023-06-04 18:31:42.353786
100	24	13	2023-06-04 18:32:00.872446
101	29	13	2023-06-04 18:33:13.269973
112	29	14	2023-06-05 00:15:53.351694
113	27	14	2023-06-05 00:15:57.967808
114	9	14	2023-06-05 00:16:00.420063
115	29	11	2023-06-05 00:16:10.927822
116	32	11	2023-06-05 07:09:46.334757
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: fmxzsltt
--

COPY public.posts (id, "userId", link, description, "createdAt", "identificationToken") FROM stdin;
1	9	https://www.youtube.com/watch?v=jfKfPfyJRdk		2023-06-02 14:45:37.411984	\N
2	9	https://www.youtube.com/shorts/HyruLXqUxMU	calça de shopping	2023-06-02 20:01:37.880348	\N
3	2	https://img.freepik.com/fotos-gratis/galo-de-tiro-no-escuro-ficar-do-lado-de-fora_23-2148580096.jpg	apenas um galo	2023-06-02 20:04:08.45087	\N
4	11	https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Number_sign.svg/180px-Number_sign.svg.png	#hashtag	2023-06-03 16:46:48.802329	\N
5	11	https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Number_sign.svg/180px-Number_sign.svg.png	#hashtag	2023-06-03 16:47:00.596288	\N
6	11	https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Number_sign.svg/180px-Number_sign.svg.png	#hashtag	2023-06-03 16:47:48.076458	\N
7	11	https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Number_sign.svg/180px-Number_sign.svg.png	aaa #hashtag	2023-06-03 16:47:54.920806	\N
8	11	https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Number_sign.svg/180px-Number_sign.svg.png	aaa #hashtag	2023-06-03 16:49:08.160928	\N
10	11	https://static3.tcdn.com.br/img/img_prod/460977/teste_100485_1_cbc226c7d23a19c784fb4752ffe61337.png	testee #teste	2023-06-03 17:12:42.792745	\N
11	11	https://static3.tcdn.com.br/img/img_prod/460977/teste_100485_1_cbc226c7d23a19c784fb4752ffe61337.png	teste 2	2023-06-03 17:14:24.584853	\N
12	11	https://static3.tcdn.com.br/img/img_prod/460977/teste_100485_1_cbc226c7d23a19c784fb4752ffe61337.png	#hashtag	2023-06-03 17:16:34.47536	\N
13	11	https://static3.tcdn.com.br/img/img_prod/460977/teste_100485_1_cbc226c7d23a19c784fb4752ffe61337.png	aa	2023-06-03 17:40:10.271258	\N
15	11	https://static3.tcdn.com.br/img/img_prod/460977/teste_100485_1_cbc226c7d23a19c784fb4752ffe61337.png	#teste	2023-06-03 18:18:07.395471	\N
16	12	https://conexaoplaneta.com.br/blog/diabo-da-tasmania-e-reintroduzido-na-australia-continental-apos-3-mil-anos/	uh vamo invadir #TasmanianDevil	2023-06-03 23:04:22.926926	\N
17	12	https://conexaoplaneta.com.br/blog/diabo-da-tasmania-e-reintroduzido-na-australia-continental-apos-3-mil-anos/	uh vamo invadir #TasmanianDevil	2023-06-03 23:04:33.953831	\N
22	11	https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Number_sign.svg/180px-Number_sign.svg.png	#calopsita #gato #arara #leão #cachorro #priquito	2023-06-04 07:57:27.997957	\N
24	11	https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Number_sign.svg/180px-Number_sign.svg.png	aaa aaa a a a a a #bbbaa	2023-06-04 16:13:49.887987	\N
28	11	https://static3.tcdn.com.br/img/img_prod/460977/teste_100485_1_cbc226c7d23a19c784fb4752ffe61337.png	#miau #auau #aaa	2023-06-04 17:24:39.738696	465896f5-62e0-4919-b495-02a65dce32ab
29	10	https://www.youtube.com/watch?v=LZBlXkDvhh4	Bom demais esse filme #miranha #aranhaverso	2023-06-04 18:08:46.303565	\N
14	11	https://static3.tcdn.com.br/img/img_prod/460977/teste_100485_1_cbc226c7d23a19c784fb4752ffe61337.png	editeii	2023-06-03 17:40:47.903862	\N
27	11	https://static3.tcdn.com.br/img/img_prod/460977/teste_100485_1_cbc226c7d23a19c784fb4752ffe61337.png	editandoo #teste	2023-06-04 17:24:13.717679	b26c9568-ea53-4bd3-995e-501de197d700
9	11	https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Number_sign.svg/180px-Number_sign.svg.png	#test	2023-06-03 16:49:36.192789	\N
32	11	https://static3.tcdn.com.br/img/img_prod/460977/teste_100485_1_cbc226c7d23a19c784fb4752ffe61337.png	aaa #testeeee	2023-06-05 07:01:25.911681	34fdef2e-0cdb-4b8b-8fc3-53e5d1729884
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: fmxzsltt
--

COPY public.sessions (id, token, "userId", "createdAt") FROM stdin;
1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjg1NjQ4Njg4LCJleHAiOjE2ODU3MzUwODh9.iE005_0GJ91MnWEjw1Qa-ZoBj4sB6JoXDgPQt4-smwg	1	2023-06-01 19:44:48.751835
2	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwicGljdHVyZSI6Imh0dHBzOi8vaG9vcHNoeXBlLmNvbS93cC1jb250ZW50L3VwbG9hZHMvc2l0ZXMvOTIvMjAyMC8wNC9yb2RtYW4taGFpci5qcGciLCJpYXQiOjE2ODU3MTMxNjAsImV4cCI6MTY4NTc5OTU2MH0.T4WoMPXfpStreghIquXa30Fg4DqePffvyujjGXG5At8	2	2023-06-02 13:39:20.230335
3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwicGljdHVyZSI6Imh0dHBzOi8vaG9vcHNoeXBlLmNvbS93cC1jb250ZW50L3VwbG9hZHMvc2l0ZXMvOTIvMjAyMC8wNC9yb2RtYW4taGFpci5qcGciLCJpYXQiOjE2ODU3MTU4NTl9.pvLvQlFHcc-rXq6m0ZjYtqJcU-cQ3UprrO5bPn5xuNc	2	2023-06-02 14:24:19.939627
4	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwicGljdHVyZSI6Imh0dHBzOi8vaG9vcHNoeXBlLmNvbS93cC1jb250ZW50L3VwbG9hZHMvc2l0ZXMvOTIvMjAyMC8wNC9yb2RtYW4taGFpci5qcGciLCJpYXQiOjE2ODU3MTYzOTl9.ncjAy7P2MKcEFefp6_ZsTnFJou12iozc2skMTAud2Hk	2	2023-06-02 14:33:19.93864
5	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwicGljdHVyZSI6Imh0dHBzOi8vaW1nLmZyZWVwaWsuY29tL2ZvdG9zLWdyYXRpcy9vLWdhdG8tdmVybWVsaG8tb3UtYnJhbmNvLWV1LW5vLWVzdHVkaW8tYnJhbmNvXzE1NTAwMy0xMzE4OS5qcGc_dz0yMDAwIiwiaWF0IjoxNjg1NzE2NTAwfQ.BWCHT8Lo6JW6sqd1o7bAOU7YjTZLeiNc7OKdm6fmrj4	9	2023-06-02 14:35:00.047975
6	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwicGljdHVyZSI6Imh0dHBzOi8vaW1nLmZyZWVwaWsuY29tL2ZvdG9zLWdyYXRpcy9vLWdhdG8tdmVybWVsaG8tb3UtYnJhbmNvLWV1LW5vLWVzdHVkaW8tYnJhbmNvXzE1NTAwMy0xMzE4OS5qcGc_dz0yMDAwIiwiaWF0IjoxNjg1NzE2NTMxfQ.WalbtWpiDTwGClTlhuhBRouUoVElFVjCyWlanCRQFgE	9	2023-06-02 14:35:31.547962
7	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwicGljdHVyZSI6Imh0dHBzOi8vaG9vcHNoeXBlLmNvbS93cC1jb250ZW50L3VwbG9hZHMvc2l0ZXMvOTIvMjAyMC8wNC9yb2RtYW4taGFpci5qcGciLCJpYXQiOjE2ODU3MTgxOTR9.kjHfzFwWwTnusbbVwz5SOQEXYzxkrGWmpzj87rV6Dvk	2	2023-06-02 15:03:14.824866
8	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwicGljdHVyZSI6Imh0dHBzOi8vaW1nLmZyZWVwaWsuY29tL2ZvdG9zLWdyYXRpcy9vLWdhdG8tdmVybWVsaG8tb3UtYnJhbmNvLWV1LW5vLWVzdHVkaW8tYnJhbmNvXzE1NTAwMy0xMzE4OS5qcGc_dz0yMDAwIiwiaWF0IjoxNjg1NzMwNzI4fQ.kmbQvMil2gup5TPsEeS0tFnrnMmRzZVMTASWlEZZ7PE	9	2023-06-02 18:32:08.679464
9	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwicGljdHVyZSI6Imh0dHBzOi8vaW1nLmZyZWVwaWsuY29tL2ZvdG9zLWdyYXRpcy9vLWdhdG8tdmVybWVsaG8tb3UtYnJhbmNvLWV1LW5vLWVzdHVkaW8tYnJhbmNvXzE1NTAwMy0xMzE4OS5qcGc_dz0yMDAwIiwiaWF0IjoxNjg1NzMzNDExfQ.pviX6-Gfd8Dm0NH0Lw9iGBf-UnoYAPBlvhIYChdvhs0	9	2023-06-02 19:16:51.448782
10	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwicGljdHVyZSI6Imh0dHBzOi8vaG9vcHNoeXBlLmNvbS93cC1jb250ZW50L3VwbG9hZHMvc2l0ZXMvOTIvMjAyMC8wNC9yb2RtYW4taGFpci5qcGciLCJpYXQiOjE2ODU3MzYyMjV9.6_4ZYZwPxmTy9dErhbPaOoiPzTkAJwXgbtgF03jrcC0	2	2023-06-02 20:03:45.36695
11	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInBpY3R1cmUiOiJodHRwczovL2ltZy5lbG83LmNvbS5ici9wcm9kdWN0L3pvb20vM0VFQ0I3MS9kZXNlbmhvLXBlcnNvbmFsaXphZG8tcGFyYS11c2FyLWRlLWZvdG8tZGUtcGVyZmlsLWUtZXRjLXBlcnNvbmFsaXphZG8uanBnIiwiaWF0IjoxNjg1NzM4Nzk2fQ.DrF3wuQGB9HkmFDO6eGUigsprNvOwUemXmCV74kktO0	10	2023-06-02 20:46:36.529609
12	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwicGljdHVyZSI6Imh0dHBzOi8vaG9vcHNoeXBlLmNvbS93cC1jb250ZW50L3VwbG9hZHMvc2l0ZXMvOTIvMjAyMC8wNC9yb2RtYW4taGFpci5qcGciLCJpYXQiOjE2ODU3NDA0OTl9.JqY4GkqVDtJjxrVGEjftMEC9ouhSCYrWmZHSvl0Zyx8	2	2023-06-02 21:14:59.501002
13	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwicGljdHVyZSI6Imh0dHBzOi8vaW1nLmZyZWVwaWsuY29tL2ZvdG9zLWdyYXRpcy9vLWdhdG8tdmVybWVsaG8tb3UtYnJhbmNvLWV1LW5vLWVzdHVkaW8tYnJhbmNvXzE1NTAwMy0xMzE4OS5qcGc_dz0yMDAwIiwiaWF0IjoxNjg1NzQ4MTI4fQ.rhAuqrAvgqhjLUHud2FtLi2aqaa06KvAo5S9l2d6nuw	9	2023-06-02 23:22:08.844947
14	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInBpY3R1cmUiOiJodHRwczovL2ltZy5lbG83LmNvbS5ici9wcm9kdWN0L3pvb20vM0VFQ0I3MS9kZXNlbmhvLXBlcnNvbmFsaXphZG8tcGFyYS11c2FyLWRlLWZvdG8tZGUtcGVyZmlsLWUtZXRjLXBlcnNvbmFsaXphZG8uanBnIiwiaWF0IjoxNjg1NzU5Njc0fQ.l1lcMCd_GGsK7DwoOyAttT3BipA3A2Hiy_kikfibBmc	10	2023-06-03 02:34:34.563979
15	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInBpY3R1cmUiOiJodHRwczovL2ltZy5lbG83LmNvbS5ici9wcm9kdWN0L3pvb20vM0VFQ0I3MS9kZXNlbmhvLXBlcnNvbmFsaXphZG8tcGFyYS11c2FyLWRlLWZvdG8tZGUtcGVyZmlsLWUtZXRjLXBlcnNvbmFsaXphZG8uanBnIiwiaWF0IjoxNjg1NzYzMTAwfQ.43IiUIzD7PJEBbvo-Gtqy0Vd0GTEjUE2O4Y2pYcKxtU	10	2023-06-03 03:31:39.672766
16	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInBpY3R1cmUiOiJodHRwczovL2ltZy5lbG83LmNvbS5ici9wcm9kdWN0L3pvb20vM0VFQ0I3MS9kZXNlbmhvLXBlcnNvbmFsaXphZG8tcGFyYS11c2FyLWRlLWZvdG8tZGUtcGVyZmlsLWUtZXRjLXBlcnNvbmFsaXphZG8uanBnIiwiaWF0IjoxNjg1NzY3MDgyfQ.ZAXS4RSI5pIcAWF24vVx_1umhq9um0pcJd7b50_eX-k	10	2023-06-03 04:38:02.501455
17	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInBpY3R1cmUiOiJodHRwczovL2ltZy5lbG83LmNvbS5ici9wcm9kdWN0L3pvb20vM0VFQ0I3MS9kZXNlbmhvLXBlcnNvbmFsaXphZG8tcGFyYS11c2FyLWRlLWZvdG8tZGUtcGVyZmlsLWUtZXRjLXBlcnNvbmFsaXphZG8uanBnIiwiaWF0IjoxNjg1NzY3MTkzfQ.eIxTpMwDDRWAsO6EgBeAfQB9XvvUsXRgzvctGiMOWjA	10	2023-06-03 04:39:53.563989
18	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInBpY3R1cmUiOiJodHRwczovL2ltZy5lbG83LmNvbS5ici9wcm9kdWN0L3pvb20vM0VFQ0I3MS9kZXNlbmhvLXBlcnNvbmFsaXphZG8tcGFyYS11c2FyLWRlLWZvdG8tZGUtcGVyZmlsLWUtZXRjLXBlcnNvbmFsaXphZG8uanBnIiwiaWF0IjoxNjg1NzcyNTc3fQ.wVceMHK3JDlY5TjsUnTkNahilQQt7dQzWoDzaBdxHQ0	10	2023-06-03 06:09:36.735475
19	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsInBpY3R1cmUiOiJodHRwczovL2VuY3J5cHRlZC10Ym4wLmdzdGF0aWMuY29tL2ltYWdlcz9xPXRibjpBTmQ5R2NSbWJRVXpiSEdqd3VsUWZRQ0JlT3hnQkx4bmFkWnIzS2MyREFEUU1RbnhZdyZzIiwiaWF0IjoxNjg1ODEwNzM0fQ.izatsrkLFacVQAVIg3P96sVHSqpqXoCYuh_89CJpoYY	11	2023-06-03 16:45:40.296935
20	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInBpY3R1cmUiOiJodHRwczovL2ltZy5lbG83LmNvbS5ici9wcm9kdWN0L3pvb20vM0VFQ0I3MS9kZXNlbmhvLXBlcnNvbmFsaXphZG8tcGFyYS11c2FyLWRlLWZvdG8tZGUtcGVyZmlsLWUtZXRjLXBlcnNvbmFsaXphZG8uanBnIiwiaWF0IjoxNjg1ODEzNTg0fQ.wkhocAKeyvUMOtvcVZEKAOwvgC4awbV36MSQLMRFlCk	10	2023-06-03 17:33:04.224103
21	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInBpY3R1cmUiOiJodHRwczovL2ltZy5lbG83LmNvbS5ici9wcm9kdWN0L3pvb20vM0VFQ0I3MS9kZXNlbmhvLXBlcnNvbmFsaXphZG8tcGFyYS11c2FyLWRlLWZvdG8tZGUtcGVyZmlsLWUtZXRjLXBlcnNvbmFsaXphZG8uanBnIiwiaWF0IjoxNjg1ODE2NDg0fQ.JXrY3G8wHHXlUz5cAj7pYFW51mCjycz4XDzn0F0b5fA	10	2023-06-03 18:21:24.003067
22	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInBpY3R1cmUiOiJodHRwczovL2ltZy5lbG83LmNvbS5ici9wcm9kdWN0L3pvb20vM0VFQ0I3MS9kZXNlbmhvLXBlcnNvbmFsaXphZG8tcGFyYS11c2FyLWRlLWZvdG8tZGUtcGVyZmlsLWUtZXRjLXBlcnNvbmFsaXphZG8uanBnIiwiaWF0IjoxNjg1ODE5NDIzfQ.maBBnl8p_dOTZHTwsrOpquny9sHX3g0NWLHi8YFYO94	10	2023-06-03 19:10:22.738607
23	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInBpY3R1cmUiOiJodHRwczovL3N1cGVyLmFicmlsLmNvbS5ici93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wNy81MmViZWJmYzk4Mjc2ODM1NGUwMDAyNGE2NjdweC15b3VuZ190YXNtYW5pYW5fZGV2aWwuanBlZyIsImlhdCI6MTY4NTgzMzM0M30.YDaqO9vd5dsjTY3vBrbBuBA0mlpqisncNx06ltPKikU	12	2023-06-03 23:02:23.504794
24	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInBpY3R1cmUiOiJodHRwczovL3N1cGVyLmFicmlsLmNvbS5ici93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wNy81MmViZWJmYzk4Mjc2ODM1NGUwMDAyNGE2NjdweC15b3VuZ190YXNtYW5pYW5fZGV2aWwuanBlZyIsImlhdCI6MTY4NTgzMzQ5N30.NZ1zMMHS3vcP30q7vs8z25kVn0JoNODFPvftK0IEyz0	12	2023-06-03 23:04:57.183604
25	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInBpY3R1cmUiOiJodHRwczovL2ltZy5lbG83LmNvbS5ici9wcm9kdWN0L3pvb20vM0VFQ0I3MS9kZXNlbmhvLXBlcnNvbmFsaXphZG8tcGFyYS11c2FyLWRlLWZvdG8tZGUtcGVyZmlsLWUtZXRjLXBlcnNvbmFsaXphZG8uanBnIiwiaWF0IjoxNjg1ODM2MzY1fQ.BRgf5O4fo5bJZ9A9oQavlRV_c5hL4x2v4sARD7Jl1ZA	10	2023-06-03 23:52:45.406436
26	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInBpY3R1cmUiOiJodHRwczovL2ltZy5lbG83LmNvbS5ici9wcm9kdWN0L3pvb20vM0VFQ0I3MS9kZXNlbmhvLXBlcnNvbmFsaXphZG8tcGFyYS11c2FyLWRlLWZvdG8tZGUtcGVyZmlsLWUtZXRjLXBlcnNvbmFsaXphZG8uanBnIiwiaWF0IjoxNjg1ODk0NTUwfQ.UNyP9O6SP1GgvziERAcvyYV2eUzQX0SEcW1FOrS1SPE	10	2023-06-04 16:02:31.359132
27	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwicGljdHVyZSI6Imh0dHBzOi8vaW1nLmZyZWVwaWsuY29tL2ZvdG9zLWdyYXRpcy9vLWdhdG8tdmVybWVsaG8tb3UtYnJhbmNvLWV1LW5vLWVzdHVkaW8tYnJhbmNvXzE1NTAwMy0xMzE4OS5qcGc_dz0yMDAwIiwiaWF0IjoxNjg1ODk2NjMwfQ.FAy-0JGh9gbQnnUK5xEJ7Oh8N8FpjdQAP-AiH1Q8_0g	9	2023-06-04 16:37:10.459395
28	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInBpY3R1cmUiOiJodHRwczovL3N1cGVyLmFicmlsLmNvbS5ici93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wNy81MmViZWJmYzk4Mjc2ODM1NGUwMDAyNGE2NjdweC15b3VuZ190YXNtYW5pYW5fZGV2aWwuanBlZyIsImlhdCI6MTY4NTg5ODA1NX0.IhEvJPMtOv3Xj3CbaREFlZXaE10SuzBw3G0K6bNEONU	12	2023-06-04 17:00:55.611119
29	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInBpY3R1cmUiOiJodHRwczovL2ltZy5lbG83LmNvbS5ici9wcm9kdWN0L3pvb20vM0VFQ0I3MS9kZXNlbmhvLXBlcnNvbmFsaXphZG8tcGFyYS11c2FyLWRlLWZvdG8tZGUtcGVyZmlsLWUtZXRjLXBlcnNvbmFsaXphZG8uanBnIiwiaWF0IjoxNjg1ODk4MzYzfQ.qeoQvBX7FHTfEskhaVqm31DgPCodc0G4WZaln4kgbbw	10	2023-06-04 17:06:03.553021
30	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsInBpY3R1cmUiOiJodHRwczovL3NtLmlnbi5jb20vaWduX2JyL2NvdmVyL3Mvc2FtdWVsLWwtai9zYW11ZWwtbC1qYWNrc29uXzFwNW0uanBnIiwiaWF0IjoxNjg1OTAzNDgzfQ.fsEhoScVyr3irOSCPEubFmu5JWpwMQ3n0JRKF5X6iyA	13	2023-06-04 18:31:24.130227
31	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTQsInBpY3R1cmUiOiJodHRwczovL2hpcGVyaWRlYWwudnRleGltZy5jb20uYnIvYXJxdWl2b3MvaWRzLzE2NzY2MC8yNzUwMi5qcGc_dj02MzY2MTU4MTYxNDcwMzAwMDAiLCJpYXQiOjE2ODU5MjQxMzR9.yREqYB0ctGh4Sld0JnX_Uj1WB4ZyXirVhnRcn6zNheg	14	2023-06-05 00:15:46.082755
32	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsInBpY3R1cmUiOiJodHRwczovL2VuY3J5cHRlZC10Ym4wLmdzdGF0aWMuY29tL2ltYWdlcz9xPXRibjpBTmQ5R2NSbWJRVXpiSEdqd3VsUWZRQ0JlT3hnQkx4bmFkWnIzS2MyREFEUU1RbnhZdyZzIiwiaWF0IjoxNjg1OTI0MTU0fQ.UUSbl8LEkCyvym2qIyuWD1A3dObOuqs_cQ3RrwUKKYA	11	2023-06-05 00:16:06.768178
33	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwicGljdHVyZSI6Imh0dHBzOi8vaW1nLmZyZWVwaWsuY29tL2ZvdG9zLWdyYXRpcy9vLWdhdG8tdmVybWVsaG8tb3UtYnJhbmNvLWV1LW5vLWVzdHVkaW8tYnJhbmNvXzE1NTAwMy0xMzE4OS5qcGc_dz0yMDAwIiwiaWF0IjoxNjg1OTY5NTkxfQ.eQ2CR4LLRjya6ZAxKIJDGrqsKrRokmMqrp3hLVEuJFo	9	2023-06-05 12:53:11.729602
34	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwicGljdHVyZSI6Imh0dHBzOi8vaW1nLmZyZWVwaWsuY29tL2ZvdG9zLWdyYXRpcy9vLWdhdG8tdmVybWVsaG8tb3UtYnJhbmNvLWV1LW5vLWVzdHVkaW8tYnJhbmNvXzE1NTAwMy0xMzE4OS5qcGc_dz0yMDAwIiwiaWF0IjoxNjg1OTczNDkzfQ.9g-gwVWv2QYlZQI24i1yCL6G-hAvU_-RQ3GK0P-Ilow	9	2023-06-05 13:58:13.979469
35	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwicGljdHVyZSI6Imh0dHBzOi8vaW1nLmZyZWVwaWsuY29tL2ZvdG9zLWdyYXRpcy9vLWdhdG8tdmVybWVsaG8tb3UtYnJhbmNvLWV1LW5vLWVzdHVkaW8tYnJhbmNvXzE1NTAwMy0xMzE4OS5qcGc_dz0yMDAwIiwiaWF0IjoxNjg1OTc1MTU4fQ.dBc3wNvfjuLx8404wo3MQ0ywFqEQAUbohSkLwE_f8S4	9	2023-06-05 14:25:59.014576
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: fmxzsltt
--

COPY public.users (id, username, email, password, picture, "createdAt") FROM stdin;
1	sica	sica@hotmail.com	$2b$10$ElBV0jREJxCA7WKlvCNwneMKvj8IGIF/NRjrDuS6U8OHGeRM0zt2a	https://static.nationalgeographicbrasil.com/files/styles/image_3200/public/75552.jpg?w=1600&h=1067	2023-06-01 19:44:40.367663
2	lucas	lucas@gmail.com	$2b$10$SGET3O9CTgRTni0mlBLvcecVORkeEmBDXu8hgmfCqzka.zHOBrhU2	https://hoopshype.com/wp-content/uploads/sites/92/2020/04/rodman-hair.jpg	2023-06-02 13:39:01.732256
8	novouser	novouser@gmail.com	$2b$10$Ex3EPLdSco5jE447ht5.6e95uj/7CIQKmFwkRxBzFl2ZT7Hp35XVO	https://merriam-webster.com/assets/mw/images/article/art-wap-article-main/egg-3442-e1f6463624338504cd021bf23aef8441@1x.jpg	2023-06-02 14:34:42.362341
9	gess	gess@gess.com	$2b$10$ukyfKEmXuS7jz0nqIlewLuC4T7IWNbZSAU9vqV7ecS7UpFpsBn2Ma	https://img.freepik.com/fotos-gratis/o-gato-vermelho-ou-branco-eu-no-estudio-branco_155003-13189.jpg?w=2000	2023-06-02 14:34:54.334755
10	maria	maria@email.com	$2b$10$9FfNbi28Vev4f7yYXQ6rG.sBW3MhEVqvUylxpmmmxZZ9ZxESZc/YC	https://img.elo7.com.br/product/zoom/3EECB71/desenho-personalizado-para-usar-de-foto-de-perfil-e-etc-personalizado.jpg	2023-06-02 20:46:27.850735
11	kalsio	kassioluna@gmail.com	$2b$10$.xmRkV215lWHCKC.J7fvJe8r.fSyLatAk8Rpsx43igT/Yu6/a.bva	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmbQUzbHGjwulQfQCBeOxgBLxnadZr3Kc2DADQMQnxYw&s	2023-06-03 16:40:07.816274
12	tasmania	abluble@gmail.com	$2b$10$6TsUWpy2s5WS2qNgZJfAmuazbvA7a4ZujmfAmzDqNqMfP3E.5aS6y	https://super.abril.com.br/wp-content/uploads/2018/07/52ebebfc982768354e00024a667px-young_tasmanian_devil.jpeg	2023-06-03 23:01:59.728034
13	samuel	samuel@email.com.br	$2b$10$BZoB1OWMiMK2Cl00pvEYMuYewu.RJoi8Wo2CXnkb6/yXtnGctY2mO	https://sm.ign.com/ign_br/cover/s/samuel-l-j/samuel-l-jackson_1p5m.jpg	2023-06-04 18:31:07.504387
14	batata	batata@gmail.com	$2b$10$XU2mpm79VvpDN93y1WXif..e25Xl6Ngv7H.AIAUL245OgmwIoJuR2	https://hiperideal.vteximg.com.br/arquivos/ids/167660/27502.jpg?v=636615816147030000	2023-06-05 00:15:42.714914
\.


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmxzsltt
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 46, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmxzsltt
--

SELECT pg_catalog.setval('public.likes_id_seq', 116, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmxzsltt
--

SELECT pg_catalog.setval('public.posts_id_seq', 32, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmxzsltt
--

SELECT pg_catalog.setval('public.sessions_id_seq', 35, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmxzsltt
--

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: hashtags hashtags_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT "hashtags_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmxzsltt
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

