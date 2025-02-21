toc.dat                                                                                             0000600 0004000 0002000 00000032000 14012154323 0014425 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           y         
   jpa_lesson    10.15    10.15 4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         !           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         "           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false         #           1262    16393 
   jpa_lesson    DATABASE     �   CREATE DATABASE jpa_lesson WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE jpa_lesson;
             postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false         $           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                     3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false         %           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1         �            1259    16396 
   categories    TABLE     e   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.categories;
       public         postgres    false    3         �            1259    16394    categories_column_1_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_column_1_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.categories_column_1_seq;
       public       postgres    false    197    3         &           0    0    categories_column_1_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.categories_column_1_seq OWNED BY public.categories.id;
            public       postgres    false    196         �            1259    16410    options    TABLE     �   CREATE TABLE public.options (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    category_id integer NOT NULL
);
    DROP TABLE public.options;
       public         postgres    false    3         �            1259    16421    options_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.options_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.options_category_id_seq;
       public       postgres    false    200    3         '           0    0    options_category_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.options_category_id_seq OWNED BY public.options.category_id;
            public       postgres    false    202         �            1259    16413    options_id_seq    SEQUENCE     �   CREATE SEQUENCE public.options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.options_id_seq;
       public       postgres    false    200    3         (           0    0    options_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.options_id_seq OWNED BY public.options.id;
            public       postgres    false    201         �            1259    16404    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    category_id integer NOT NULL,
    price numeric NOT NULL
);
    DROP TABLE public.products;
       public         postgres    false    3         �            1259    16442    products_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.products_category_id_seq;
       public       postgres    false    199    3         )           0    0    products_category_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.products_category_id_seq OWNED BY public.products.category_id;
            public       postgres    false    207         �            1259    16402    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public       postgres    false    3    199         *           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
            public       postgres    false    198         �            1259    16434    values    TABLE     �   CREATE TABLE public."values" (
    id integer NOT NULL,
    value character varying(50),
    product_id integer NOT NULL,
    option_id integer NOT NULL
);
    DROP TABLE public."values";
       public         postgres    false    3         �            1259    16428    values_id_seq    SEQUENCE     �   CREATE SEQUENCE public.values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.values_id_seq;
       public       postgres    false    3    206         +           0    0    values_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.values_id_seq OWNED BY public."values".id;
            public       postgres    false    203         �            1259    16432    values_option_id_seq    SEQUENCE     �   CREATE SEQUENCE public.values_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.values_option_id_seq;
       public       postgres    false    3    206         ,           0    0    values_option_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.values_option_id_seq OWNED BY public."values".option_id;
            public       postgres    false    205         �            1259    16430    values_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.values_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.values_product_id_seq;
       public       postgres    false    206    3         -           0    0    values_product_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.values_product_id_seq OWNED BY public."values".product_id;
            public       postgres    false    204         �
           2604    16399    categories id    DEFAULT     t   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_column_1_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    197    197         �
           2604    16415 
   options id    DEFAULT     h   ALTER TABLE ONLY public.options ALTER COLUMN id SET DEFAULT nextval('public.options_id_seq'::regclass);
 9   ALTER TABLE public.options ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200         �
           2604    16423    options category_id    DEFAULT     z   ALTER TABLE ONLY public.options ALTER COLUMN category_id SET DEFAULT nextval('public.options_category_id_seq'::regclass);
 B   ALTER TABLE public.options ALTER COLUMN category_id DROP DEFAULT;
       public       postgres    false    202    200         �
           2604    16407    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199         �
           2604    16444    products category_id    DEFAULT     |   ALTER TABLE ONLY public.products ALTER COLUMN category_id SET DEFAULT nextval('public.products_category_id_seq'::regclass);
 C   ALTER TABLE public.products ALTER COLUMN category_id DROP DEFAULT;
       public       postgres    false    207    199         �
           2604    16437 	   values id    DEFAULT     h   ALTER TABLE ONLY public."values" ALTER COLUMN id SET DEFAULT nextval('public.values_id_seq'::regclass);
 :   ALTER TABLE public."values" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    206    206         �
           2604    16438    values product_id    DEFAULT     x   ALTER TABLE ONLY public."values" ALTER COLUMN product_id SET DEFAULT nextval('public.values_product_id_seq'::regclass);
 B   ALTER TABLE public."values" ALTER COLUMN product_id DROP DEFAULT;
       public       postgres    false    206    204    206         �
           2604    16439    values option_id    DEFAULT     v   ALTER TABLE ONLY public."values" ALTER COLUMN option_id SET DEFAULT nextval('public.values_option_id_seq'::regclass);
 A   ALTER TABLE public."values" ALTER COLUMN option_id DROP DEFAULT;
       public       postgres    false    205    206    206                   0    16396 
   categories 
   TABLE DATA               .   COPY public.categories (id, name) FROM stdin;
    public       postgres    false    197       2835.dat           0    16410    options 
   TABLE DATA               8   COPY public.options (id, name, category_id) FROM stdin;
    public       postgres    false    200       2838.dat           0    16404    products 
   TABLE DATA               @   COPY public.products (id, name, category_id, price) FROM stdin;
    public       postgres    false    199       2837.dat           0    16434    values 
   TABLE DATA               D   COPY public."values" (id, value, product_id, option_id) FROM stdin;
    public       postgres    false    206       2844.dat .           0    0    categories_column_1_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.categories_column_1_seq', 2, true);
            public       postgres    false    196         /           0    0    options_category_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.options_category_id_seq', 1, false);
            public       postgres    false    202         0           0    0    options_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.options_id_seq', 7, true);
            public       postgres    false    201         1           0    0    products_category_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.products_category_id_seq', 1, false);
            public       postgres    false    207         2           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 12, true);
            public       postgres    false    198         3           0    0    values_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.values_id_seq', 25, true);
            public       postgres    false    203         4           0    0    values_option_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.values_option_id_seq', 1, false);
            public       postgres    false    205         5           0    0    values_product_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.values_product_id_seq', 3, true);
            public       postgres    false    204         �
           2606    16401    categories categories_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pk;
       public         postgres    false    197         �
           2606    16420    options options_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.options DROP CONSTRAINT options_pk;
       public         postgres    false    200         �
           2606    16409    products products_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pk;
       public         postgres    false    199         �
           2606    16441    values values_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public."values"
    ADD CONSTRAINT values_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."values" DROP CONSTRAINT values_pk;
       public         postgres    false    206        2835.dat                                                                                            0000600 0004000 0002000 00000000057 14012154323 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Процессоры
2	Мониторы
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 2838.dat                                                                                            0000600 0004000 0002000 00000000315 14012154323 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Соотношение сторон	2
2	Производитель	2
3	Диагональ	2
4	Матрица	2
5	Количетво ядер	1
6	Сокет	1
7	Количество потоков	1
\.


                                                                                                                                                                                                                                                                                                                   2837.dat                                                                                            0000600 0004000 0002000 00000000137 14012154323 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	LG h100	2	20000
8	Acer mx22	2	50000
11	INtel Pentium g4560	1	40000
12	LG mr450	2	450000
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                 2844.dat                                                                                            0000600 0004000 0002000 00000000254 14012154323 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        6	LG	5	2
5	16:9	5	1
7	21	5	3
8	TN	5	4
9	16:9	8	1
10	Acer	8	2
11	21	8	3
12	TN + IPS	8	4
19	2	11	5
20	1151	11	6
21	4	11	7
22	21:9	12	1
23	LG	12	2
24	27	12	3
25	IPS	12	4
\.


                                                                                                                                                                                                                                                                                                                                                    restore.sql                                                                                         0000600 0004000 0002000 00000026430 14012154323 0015364 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15
-- Dumped by pg_dump version 10.15

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

ALTER TABLE ONLY public."values" DROP CONSTRAINT values_pk;
ALTER TABLE ONLY public.products DROP CONSTRAINT products_pk;
ALTER TABLE ONLY public.options DROP CONSTRAINT options_pk;
ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pk;
ALTER TABLE public."values" ALTER COLUMN option_id DROP DEFAULT;
ALTER TABLE public."values" ALTER COLUMN product_id DROP DEFAULT;
ALTER TABLE public."values" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.products ALTER COLUMN category_id DROP DEFAULT;
ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.options ALTER COLUMN category_id DROP DEFAULT;
ALTER TABLE public.options ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.values_product_id_seq;
DROP SEQUENCE public.values_option_id_seq;
DROP SEQUENCE public.values_id_seq;
DROP TABLE public."values";
DROP SEQUENCE public.products_id_seq;
DROP SEQUENCE public.products_category_id_seq;
DROP TABLE public.products;
DROP SEQUENCE public.options_id_seq;
DROP SEQUENCE public.options_category_id_seq;
DROP TABLE public.options;
DROP SEQUENCE public.categories_column_1_seq;
DROP TABLE public.categories;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


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
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_column_1_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_column_1_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_column_1_seq OWNER TO postgres;

--
-- Name: categories_column_1_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_column_1_seq OWNED BY public.categories.id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.options (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.options OWNER TO postgres;

--
-- Name: options_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.options_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.options_category_id_seq OWNER TO postgres;

--
-- Name: options_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.options_category_id_seq OWNED BY public.options.category_id;


--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.options_id_seq OWNER TO postgres;

--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.options_id_seq OWNED BY public.options.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    category_id integer NOT NULL,
    price numeric NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_id_seq OWNER TO postgres;

--
-- Name: products_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_category_id_seq OWNED BY public.products.category_id;


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."values" (
    id integer NOT NULL,
    value character varying(50),
    product_id integer NOT NULL,
    option_id integer NOT NULL
);


ALTER TABLE public."values" OWNER TO postgres;

--
-- Name: values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.values_id_seq OWNER TO postgres;

--
-- Name: values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.values_id_seq OWNED BY public."values".id;


--
-- Name: values_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.values_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.values_option_id_seq OWNER TO postgres;

--
-- Name: values_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.values_option_id_seq OWNED BY public."values".option_id;


--
-- Name: values_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.values_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.values_product_id_seq OWNER TO postgres;

--
-- Name: values_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.values_product_id_seq OWNED BY public."values".product_id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_column_1_seq'::regclass);


--
-- Name: options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options ALTER COLUMN id SET DEFAULT nextval('public.options_id_seq'::regclass);


--
-- Name: options category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options ALTER COLUMN category_id SET DEFAULT nextval('public.options_category_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN category_id SET DEFAULT nextval('public.products_category_id_seq'::regclass);


--
-- Name: values id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."values" ALTER COLUMN id SET DEFAULT nextval('public.values_id_seq'::regclass);


--
-- Name: values product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."values" ALTER COLUMN product_id SET DEFAULT nextval('public.values_product_id_seq'::regclass);


--
-- Name: values option_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."values" ALTER COLUMN option_id SET DEFAULT nextval('public.values_option_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
\.
COPY public.categories (id, name) FROM '$$PATH$$/2835.dat';

--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.options (id, name, category_id) FROM stdin;
\.
COPY public.options (id, name, category_id) FROM '$$PATH$$/2838.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, category_id, price) FROM stdin;
\.
COPY public.products (id, name, category_id, price) FROM '$$PATH$$/2837.dat';

--
-- Data for Name: values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."values" (id, value, product_id, option_id) FROM stdin;
\.
COPY public."values" (id, value, product_id, option_id) FROM '$$PATH$$/2844.dat';

--
-- Name: categories_column_1_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_column_1_seq', 2, true);


--
-- Name: options_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.options_category_id_seq', 1, false);


--
-- Name: options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.options_id_seq', 7, true);


--
-- Name: products_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_category_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 12, true);


--
-- Name: values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.values_id_seq', 25, true);


--
-- Name: values_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.values_option_id_seq', 1, false);


--
-- Name: values_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.values_product_id_seq', 3, true);


--
-- Name: categories categories_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pk PRIMARY KEY (id);


--
-- Name: options options_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pk PRIMARY KEY (id);


--
-- Name: products products_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pk PRIMARY KEY (id);


--
-- Name: values values_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."values"
    ADD CONSTRAINT values_pk PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        