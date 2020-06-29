--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: customers; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    customer_name text NOT NULL,
    customer_email text NOT NULL,
    customer_phone text NOT NULL,
    company_name text
);


ALTER TABLE public.customers OWNER TO me;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO me;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.items (
    item_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.items OWNER TO me;

--
-- Name: items_item_id_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.items_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_item_id_seq OWNER TO me;

--
-- Name: items_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.items_item_id_seq OWNED BY public.items.item_id;


--
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.manufacturers (
    manufacturer_id integer NOT NULL,
    company_name text NOT NULL,
    contact_name text NOT NULL,
    contact_email text NOT NULL,
    contact_phone text NOT NULL
);


ALTER TABLE public.manufacturers OWNER TO me;

--
-- Name: manufacturers_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.manufacturers_manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manufacturers_manufacturer_id_seq OWNER TO me;

--
-- Name: manufacturers_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.manufacturers_manufacturer_id_seq OWNED BY public.manufacturers.manufacturer_id;


--
-- Name: purchase_items; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.purchase_items (
    id integer NOT NULL,
    item_id integer,
    purchase_id integer,
    quantity integer,
    manufacturer_id integer
);


ALTER TABLE public.purchase_items OWNER TO me;

--
-- Name: purchase_items_id_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.purchase_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_items_id_seq OWNER TO me;

--
-- Name: purchase_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.purchase_items_id_seq OWNED BY public.purchase_items.id;


--
-- Name: purchase_orders; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.purchase_orders (
    purchase_id integer NOT NULL,
    date_ordered timestamp without time zone DEFAULT now() NOT NULL,
    date_received timestamp without time zone DEFAULT now() NOT NULL,
    user_id integer
);


ALTER TABLE public.purchase_orders OWNER TO me;

--
-- Name: purchase_orders_purchase_id_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.purchase_orders_purchase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_orders_purchase_id_seq OWNER TO me;

--
-- Name: purchase_orders_purchase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.purchase_orders_purchase_id_seq OWNED BY public.purchase_orders.purchase_id;


--
-- Name: sales_items; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.sales_items (
    id integer NOT NULL,
    item_id integer,
    sales_id integer,
    quantity integer
);


ALTER TABLE public.sales_items OWNER TO me;

--
-- Name: sales_items_id_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.sales_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_items_id_seq OWNER TO me;

--
-- Name: sales_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.sales_items_id_seq OWNED BY public.sales_items.id;


--
-- Name: sales_orders; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.sales_orders (
    sales_id integer NOT NULL,
    date_ordered timestamp without time zone DEFAULT now() NOT NULL,
    date_received timestamp without time zone DEFAULT now() NOT NULL,
    customer_id integer,
    user_id integer
);


ALTER TABLE public.sales_orders OWNER TO me;

--
-- Name: sales_orders_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.sales_orders_sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_orders_sales_id_seq OWNER TO me;

--
-- Name: sales_orders_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.sales_orders_sales_id_seq OWNED BY public.sales_orders.sales_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    fname text NOT NULL,
    lname text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.users OWNER TO me;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO me;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: items item_id; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.items ALTER COLUMN item_id SET DEFAULT nextval('public.items_item_id_seq'::regclass);


--
-- Name: manufacturers manufacturer_id; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.manufacturers ALTER COLUMN manufacturer_id SET DEFAULT nextval('public.manufacturers_manufacturer_id_seq'::regclass);


--
-- Name: purchase_items id; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.purchase_items ALTER COLUMN id SET DEFAULT nextval('public.purchase_items_id_seq'::regclass);


--
-- Name: purchase_orders purchase_id; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.purchase_orders ALTER COLUMN purchase_id SET DEFAULT nextval('public.purchase_orders_purchase_id_seq'::regclass);


--
-- Name: sales_items id; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.sales_items ALTER COLUMN id SET DEFAULT nextval('public.sales_items_id_seq'::regclass);


--
-- Name: sales_orders sales_id; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.sales_orders ALTER COLUMN sales_id SET DEFAULT nextval('public.sales_orders_sales_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.customers (customer_id, customer_name, customer_email, customer_phone, company_name) FROM stdin;
1	Frank	frank@yahoo.com	555-4444	Franks Company
3	John Public	jp@yahoo.com	555-5555	Widgets
4	J Smith	jd@sdfdsf.com	55555555	Test
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.items (item_id, name, description) FROM stdin;
1	Towel	Blue Towel
2	Computer	Chromebook
3	Table	Coffee Table
4	lamp	large and purple
5	Backpack	Book Bag
6	Boots	Rain Boots
7	pillow	soft
\.


--
-- Data for Name: manufacturers; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.manufacturers (manufacturer_id, company_name, contact_name, contact_email, contact_phone) FROM stdin;
1	Amazon	B. Smith	bs@amazon.com	555-1234
2	Netflix	A. Person	ap@netflix.com	555-9999
3	Ariat	Another Person	somone@url.com	111-2222
4	Lowes	Lowes Person	somone@lowes.com	555-2222
\.


--
-- Data for Name: purchase_items; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.purchase_items (id, item_id, purchase_id, quantity, manufacturer_id) FROM stdin;
8	1	12	2	2
9	2	12	1	1
10	1	13	2	2
11	2	13	1	1
12	1	23	10	1
15	2	30	88	1
16	2	31	20	\N
17	4	32	21	\N
18	5	33	22	\N
19	5	34	23	4
20	6	35	4	2
21	6	36	34	3
22	7	37	50	1
23	4	40	1	\N
24	5	40	2	\N
25	6	42	6	\N
26	7	42	7	\N
27	2	43	5	\N
28	6	43	5	\N
29	4	44	9	2
30	6	44	11	3
31	4	45	33	1
\.


--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.purchase_orders (purchase_id, date_ordered, date_received, user_id) FROM stdin;
12	2020-06-26 15:06:46.969664	2020-06-26 15:06:46.969664	2
13	2020-06-26 15:07:25.150386	2020-06-26 15:07:25.150386	1
23	2020-06-26 16:59:26.829355	2020-06-26 16:59:26.829355	1
30	2020-06-29 10:11:39.516448	2020-06-29 10:11:39.516448	2
31	2020-06-29 11:53:01.052666	2020-06-29 11:53:01.052666	3
32	2020-06-29 11:56:57.653741	2020-06-29 11:56:57.653741	3
33	2020-06-29 11:57:37.11254	2020-06-29 11:57:37.11254	3
34	2020-06-29 12:00:17.978815	2020-06-29 12:00:17.978815	3
35	2020-06-29 12:02:48.30025	2020-06-29 12:02:48.30025	2
36	2020-06-29 12:03:51.5818	2020-06-29 12:03:51.5818	1
37	2020-06-29 12:05:33.553674	2020-06-29 12:05:33.553674	1
38	2020-06-29 16:02:44.602863	2020-06-29 16:02:44.602863	2
39	2020-06-29 16:07:56.878751	2020-06-29 16:07:56.878751	1
40	2020-06-29 16:10:41.682598	2020-06-29 16:10:41.682598	2
41	2020-06-29 16:20:08.216874	2020-06-29 16:20:08.216874	1
42	2020-06-29 16:24:29.839781	2020-06-29 16:24:29.839781	1
43	2020-06-29 16:25:40.959205	2020-06-29 16:25:40.959205	2
44	2020-06-29 16:27:22.37196	2020-06-29 16:27:22.37196	2
45	2020-06-29 16:43:11.768435	2020-06-29 16:43:11.768435	1
\.


--
-- Data for Name: sales_items; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.sales_items (id, item_id, sales_id, quantity) FROM stdin;
1	3	1	1
2	4	3	5
3	2	4	5
\.


--
-- Data for Name: sales_orders; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.sales_orders (sales_id, date_ordered, date_received, customer_id, user_id) FROM stdin;
1	2020-06-26 15:39:25.41672	2020-06-26 15:39:25.41672	1	1
2	2020-06-29 15:15:51.035162	2020-06-29 15:15:51.035162	1	2
3	2020-06-29 15:39:29.761112	2020-06-29 15:39:29.761112	3	1
4	2020-06-29 15:41:50.767407	2020-06-29 15:41:50.767407	4	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.users (user_id, fname, lname, email) FROM stdin;
1	Chris	Zell	czell@gmail.com
2	Mary	Hood	mhood@gmail.com
3	Bob	Smith	bsmith@gmail.com
\.


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 4, true);


--
-- Name: items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.items_item_id_seq', 7, true);


--
-- Name: manufacturers_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.manufacturers_manufacturer_id_seq', 4, true);


--
-- Name: purchase_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.purchase_items_id_seq', 31, true);


--
-- Name: purchase_orders_purchase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.purchase_orders_purchase_id_seq', 45, true);


--
-- Name: sales_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.sales_items_id_seq', 3, true);


--
-- Name: sales_orders_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.sales_orders_sales_id_seq', 4, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (item_id);


--
-- Name: manufacturers manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (manufacturer_id);


--
-- Name: purchase_items purchase_items_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.purchase_items
    ADD CONSTRAINT purchase_items_pkey PRIMARY KEY (id);


--
-- Name: purchase_orders purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (purchase_id);


--
-- Name: sales_items sales_items_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.sales_items
    ADD CONSTRAINT sales_items_pkey PRIMARY KEY (id);


--
-- Name: sales_orders sales_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_pkey PRIMARY KEY (sales_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: purchase_items purchase_items_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.purchase_items
    ADD CONSTRAINT purchase_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(item_id);


--
-- Name: purchase_items purchase_items_manufacturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.purchase_items
    ADD CONSTRAINT purchase_items_manufacturer_id_fkey FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(manufacturer_id);


--
-- Name: purchase_items purchase_items_purchase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.purchase_items
    ADD CONSTRAINT purchase_items_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES public.purchase_orders(purchase_id);


--
-- Name: purchase_orders purchase_orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: sales_items sales_items_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.sales_items
    ADD CONSTRAINT sales_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(item_id);


--
-- Name: sales_items sales_items_sales_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.sales_items
    ADD CONSTRAINT sales_items_sales_id_fkey FOREIGN KEY (sales_id) REFERENCES public.sales_orders(sales_id);


--
-- Name: sales_orders sales_orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: sales_orders sales_orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

