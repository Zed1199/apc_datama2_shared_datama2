--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-02 08:44:44

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 32 (class 2615 OID 16763)
-- Name: zdsabroso; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA zdsabroso;


ALTER SCHEMA zdsabroso OWNER TO datama2mi181;

SET default_tablespace = '';

--
-- TOC entry 299 (class 1259 OID 17770)
-- Name: chef; Type: TABLE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE TABLE zdsabroso.chef (
    chef_id integer NOT NULL,
    chef_position character varying(45) NOT NULL,
    chef_lname character varying(45) NOT NULL,
    chef_fname character varying(45) NOT NULL
);


ALTER TABLE zdsabroso.chef OWNER TO datama2mi181;

--
-- TOC entry 298 (class 1259 OID 17768)
-- Name: chef_chef_id_seq; Type: SEQUENCE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE SEQUENCE zdsabroso.chef_chef_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zdsabroso.chef_chef_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 298
-- Name: chef_chef_id_seq; Type: SEQUENCE OWNED BY; Schema: zdsabroso; Owner: datama2mi181
--

ALTER SEQUENCE zdsabroso.chef_chef_id_seq OWNED BY zdsabroso.chef.chef_id;


--
-- TOC entry 285 (class 1259 OID 17549)
-- Name: employee; Type: TABLE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE TABLE zdsabroso.employee (
    emp_id integer NOT NULL,
    emp_fname character varying(45) NOT NULL,
    emp_lname character varying(45) NOT NULL,
    emp_dob date,
    emp_address character varying(45) DEFAULT NULL::character varying,
    emp_date_hired date
);


ALTER TABLE zdsabroso.employee OWNER TO datama2mi181;

--
-- TOC entry 284 (class 1259 OID 17547)
-- Name: employee_emp_id_seq; Type: SEQUENCE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE SEQUENCE zdsabroso.employee_emp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zdsabroso.employee_emp_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 284
-- Name: employee_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: zdsabroso; Owner: datama2mi181
--

ALTER SEQUENCE zdsabroso.employee_emp_id_seq OWNED BY zdsabroso.employee.emp_id;


--
-- TOC entry 287 (class 1259 OID 17558)
-- Name: online_customer; Type: TABLE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE TABLE zdsabroso.online_customer (
    onl_id integer NOT NULL,
    onl_fname character varying(45) DEFAULT NULL::character varying,
    onl_lname character varying(45) DEFAULT NULL::character varying,
    onl_dob date
);


ALTER TABLE zdsabroso.online_customer OWNER TO datama2mi181;

--
-- TOC entry 286 (class 1259 OID 17556)
-- Name: online_customer_onl_id_seq; Type: SEQUENCE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE SEQUENCE zdsabroso.online_customer_onl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zdsabroso.online_customer_onl_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 286
-- Name: online_customer_onl_id_seq; Type: SEQUENCE OWNED BY; Schema: zdsabroso; Owner: datama2mi181
--

ALTER SEQUENCE zdsabroso.online_customer_onl_id_seq OWNED BY zdsabroso.online_customer.onl_id;


--
-- TOC entry 293 (class 1259 OID 17743)
-- Name: orders; Type: TABLE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE TABLE zdsabroso.orders (
    ord_id integer NOT NULL,
    ord_menu_name character varying(45) DEFAULT NULL::character varying,
    ord_amount integer,
    ord_date timestamp without time zone NOT NULL
);


ALTER TABLE zdsabroso.orders OWNER TO datama2mi181;

--
-- TOC entry 341 (class 1259 OID 22912)
-- Name: onlinecustomer_order; Type: VIEW; Schema: zdsabroso; Owner: datama2mi181
--

CREATE VIEW zdsabroso.onlinecustomer_order AS
 SELECT online_customer.onl_id,
    online_customer.onl_lname,
    online_customer.onl_fname,
    orders.ord_id,
    orders.ord_menu_name,
    orders.ord_amount
   FROM (zdsabroso.online_customer
     JOIN zdsabroso.orders ON ((online_customer.onl_id = orders.ord_id)));


ALTER TABLE zdsabroso.onlinecustomer_order OWNER TO datama2mi181;

--
-- TOC entry 289 (class 1259 OID 17693)
-- Name: onsite_customer; Type: TABLE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE TABLE zdsabroso.onsite_customer (
    ons_id integer NOT NULL,
    ons_fname character varying(45) DEFAULT NULL::character varying,
    ons_lname character varying(45) DEFAULT NULL::character varying,
    ons_dob date
);


ALTER TABLE zdsabroso.onsite_customer OWNER TO datama2mi181;

--
-- TOC entry 288 (class 1259 OID 17691)
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE SEQUENCE zdsabroso.onsite_customer_ons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zdsabroso.onsite_customer_ons_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 288
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE OWNED BY; Schema: zdsabroso; Owner: datama2mi181
--

ALTER SEQUENCE zdsabroso.onsite_customer_ons_id_seq OWNED BY zdsabroso.onsite_customer.ons_id;


--
-- TOC entry 292 (class 1259 OID 17741)
-- Name: orders_ord_id_seq; Type: SEQUENCE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE SEQUENCE zdsabroso.orders_ord_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zdsabroso.orders_ord_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 292
-- Name: orders_ord_id_seq; Type: SEQUENCE OWNED BY; Schema: zdsabroso; Owner: datama2mi181
--

ALTER SEQUENCE zdsabroso.orders_ord_id_seq OWNED BY zdsabroso.orders.ord_id;


--
-- TOC entry 295 (class 1259 OID 17752)
-- Name: product; Type: TABLE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE TABLE zdsabroso.product (
    prod_id integer NOT NULL,
    prod_type character varying(45) DEFAULT NULL::character varying,
    prod_date date,
    prod_date_expire date,
    prod_num_items integer
);


ALTER TABLE zdsabroso.product OWNER TO datama2mi181;

--
-- TOC entry 294 (class 1259 OID 17750)
-- Name: product_prod_id_seq; Type: SEQUENCE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE SEQUENCE zdsabroso.product_prod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zdsabroso.product_prod_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 294
-- Name: product_prod_id_seq; Type: SEQUENCE OWNED BY; Schema: zdsabroso; Owner: datama2mi181
--

ALTER SEQUENCE zdsabroso.product_prod_id_seq OWNED BY zdsabroso.product.prod_id;


--
-- TOC entry 313 (class 1259 OID 17854)
-- Name: restaurant; Type: TABLE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE TABLE zdsabroso.restaurant (
    res_id integer NOT NULL,
    res_loc character varying(45) DEFAULT NULL::character varying,
    res_employed_num integer
);


ALTER TABLE zdsabroso.restaurant OWNER TO datama2mi181;

--
-- TOC entry 312 (class 1259 OID 17852)
-- Name: restaurant_res_id_seq; Type: SEQUENCE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE SEQUENCE zdsabroso.restaurant_res_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zdsabroso.restaurant_res_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 312
-- Name: restaurant_res_id_seq; Type: SEQUENCE OWNED BY; Schema: zdsabroso; Owner: datama2mi181
--

ALTER SEQUENCE zdsabroso.restaurant_res_id_seq OWNED BY zdsabroso.restaurant.res_id;


--
-- TOC entry 315 (class 1259 OID 18054)
-- Name: restaurant_supplier; Type: TABLE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE TABLE zdsabroso.restaurant_supplier (
    res_id integer NOT NULL,
    supp_id integer NOT NULL,
    integ_date timestamp without time zone
);


ALTER TABLE zdsabroso.restaurant_supplier OWNER TO datama2mi181;

--
-- TOC entry 283 (class 1259 OID 17540)
-- Name: supplier; Type: TABLE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE TABLE zdsabroso.supplier (
    supp_id integer NOT NULL,
    supp_name character varying(45) NOT NULL,
    supp_contact integer,
    supp_address character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE zdsabroso.supplier OWNER TO datama2mi181;

--
-- TOC entry 282 (class 1259 OID 17538)
-- Name: supplier_supp_id_seq; Type: SEQUENCE; Schema: zdsabroso; Owner: datama2mi181
--

CREATE SEQUENCE zdsabroso.supplier_supp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zdsabroso.supplier_supp_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 282
-- Name: supplier_supp_id_seq; Type: SEQUENCE OWNED BY; Schema: zdsabroso; Owner: datama2mi181
--

ALTER SEQUENCE zdsabroso.supplier_supp_id_seq OWNED BY zdsabroso.supplier.supp_id;


--
-- TOC entry 3167 (class 2604 OID 17773)
-- Name: chef chef_id; Type: DEFAULT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.chef ALTER COLUMN chef_id SET DEFAULT nextval('zdsabroso.chef_chef_id_seq'::regclass);


--
-- TOC entry 3155 (class 2604 OID 17552)
-- Name: employee emp_id; Type: DEFAULT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.employee ALTER COLUMN emp_id SET DEFAULT nextval('zdsabroso.employee_emp_id_seq'::regclass);


--
-- TOC entry 3157 (class 2604 OID 17561)
-- Name: online_customer onl_id; Type: DEFAULT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.online_customer ALTER COLUMN onl_id SET DEFAULT nextval('zdsabroso.online_customer_onl_id_seq'::regclass);


--
-- TOC entry 3160 (class 2604 OID 17696)
-- Name: onsite_customer ons_id; Type: DEFAULT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.onsite_customer ALTER COLUMN ons_id SET DEFAULT nextval('zdsabroso.onsite_customer_ons_id_seq'::regclass);


--
-- TOC entry 3163 (class 2604 OID 17746)
-- Name: orders ord_id; Type: DEFAULT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.orders ALTER COLUMN ord_id SET DEFAULT nextval('zdsabroso.orders_ord_id_seq'::regclass);


--
-- TOC entry 3165 (class 2604 OID 17755)
-- Name: product prod_id; Type: DEFAULT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.product ALTER COLUMN prod_id SET DEFAULT nextval('zdsabroso.product_prod_id_seq'::regclass);


--
-- TOC entry 3168 (class 2604 OID 17857)
-- Name: restaurant res_id; Type: DEFAULT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.restaurant ALTER COLUMN res_id SET DEFAULT nextval('zdsabroso.restaurant_res_id_seq'::regclass);


--
-- TOC entry 3153 (class 2604 OID 17543)
-- Name: supplier supp_id; Type: DEFAULT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.supplier ALTER COLUMN supp_id SET DEFAULT nextval('zdsabroso.supplier_supp_id_seq'::regclass);


--
-- TOC entry 3335 (class 0 OID 17770)
-- Dependencies: 299
-- Data for Name: chef; Type: TABLE DATA; Schema: zdsabroso; Owner: datama2mi181
--

INSERT INTO zdsabroso.chef VALUES (1, 'head chef', 'Bernardo', 'Herrick');
INSERT INTO zdsabroso.chef VALUES (2, 'sous chef', 'Jeremy', 'Carmack');


--
-- TOC entry 3325 (class 0 OID 17549)
-- Dependencies: 285
-- Data for Name: employee; Type: TABLE DATA; Schema: zdsabroso; Owner: datama2mi181
--



--
-- TOC entry 3327 (class 0 OID 17558)
-- Dependencies: 287
-- Data for Name: online_customer; Type: TABLE DATA; Schema: zdsabroso; Owner: datama2mi181
--



--
-- TOC entry 3329 (class 0 OID 17693)
-- Dependencies: 289
-- Data for Name: onsite_customer; Type: TABLE DATA; Schema: zdsabroso; Owner: datama2mi181
--



--
-- TOC entry 3331 (class 0 OID 17743)
-- Dependencies: 293
-- Data for Name: orders; Type: TABLE DATA; Schema: zdsabroso; Owner: datama2mi181
--



--
-- TOC entry 3333 (class 0 OID 17752)
-- Dependencies: 295
-- Data for Name: product; Type: TABLE DATA; Schema: zdsabroso; Owner: datama2mi181
--



--
-- TOC entry 3337 (class 0 OID 17854)
-- Dependencies: 313
-- Data for Name: restaurant; Type: TABLE DATA; Schema: zdsabroso; Owner: datama2mi181
--

INSERT INTO zdsabroso.restaurant VALUES (1, 'Chambersburg City', 32);
INSERT INTO zdsabroso.restaurant VALUES (2, 'Jefferson City', 32);


--
-- TOC entry 3338 (class 0 OID 18054)
-- Dependencies: 315
-- Data for Name: restaurant_supplier; Type: TABLE DATA; Schema: zdsabroso; Owner: datama2mi181
--



--
-- TOC entry 3323 (class 0 OID 17540)
-- Dependencies: 283
-- Data for Name: supplier; Type: TABLE DATA; Schema: zdsabroso; Owner: datama2mi181
--



--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 298
-- Name: chef_chef_id_seq; Type: SEQUENCE SET; Schema: zdsabroso; Owner: datama2mi181
--

SELECT pg_catalog.setval('zdsabroso.chef_chef_id_seq', 1, false);


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 284
-- Name: employee_emp_id_seq; Type: SEQUENCE SET; Schema: zdsabroso; Owner: datama2mi181
--

SELECT pg_catalog.setval('zdsabroso.employee_emp_id_seq', 1, false);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 286
-- Name: online_customer_onl_id_seq; Type: SEQUENCE SET; Schema: zdsabroso; Owner: datama2mi181
--

SELECT pg_catalog.setval('zdsabroso.online_customer_onl_id_seq', 1, false);


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 288
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE SET; Schema: zdsabroso; Owner: datama2mi181
--

SELECT pg_catalog.setval('zdsabroso.onsite_customer_ons_id_seq', 1, false);


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 292
-- Name: orders_ord_id_seq; Type: SEQUENCE SET; Schema: zdsabroso; Owner: datama2mi181
--

SELECT pg_catalog.setval('zdsabroso.orders_ord_id_seq', 1, false);


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 294
-- Name: product_prod_id_seq; Type: SEQUENCE SET; Schema: zdsabroso; Owner: datama2mi181
--

SELECT pg_catalog.setval('zdsabroso.product_prod_id_seq', 1, false);


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 312
-- Name: restaurant_res_id_seq; Type: SEQUENCE SET; Schema: zdsabroso; Owner: datama2mi181
--

SELECT pg_catalog.setval('zdsabroso.restaurant_res_id_seq', 1, false);


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 282
-- Name: supplier_supp_id_seq; Type: SEQUENCE SET; Schema: zdsabroso; Owner: datama2mi181
--

SELECT pg_catalog.setval('zdsabroso.supplier_supp_id_seq', 1, false);


--
-- TOC entry 3183 (class 2606 OID 17775)
-- Name: chef chef_pkey; Type: CONSTRAINT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.chef
    ADD CONSTRAINT chef_pkey PRIMARY KEY (chef_id);


--
-- TOC entry 3173 (class 2606 OID 17555)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);


--
-- TOC entry 3175 (class 2606 OID 17565)
-- Name: online_customer online_customer_pkey; Type: CONSTRAINT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.online_customer
    ADD CONSTRAINT online_customer_pkey PRIMARY KEY (onl_id);


--
-- TOC entry 3177 (class 2606 OID 17700)
-- Name: onsite_customer onsite_customer_pkey; Type: CONSTRAINT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.onsite_customer
    ADD CONSTRAINT onsite_customer_pkey PRIMARY KEY (ons_id);


--
-- TOC entry 3179 (class 2606 OID 17749)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (ord_id);


--
-- TOC entry 3181 (class 2606 OID 17758)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (prod_id);


--
-- TOC entry 3185 (class 2606 OID 17860)
-- Name: restaurant restaurant_pkey; Type: CONSTRAINT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (res_id);


--
-- TOC entry 3187 (class 2606 OID 18058)
-- Name: restaurant_supplier restaurant_supplier_id; Type: CONSTRAINT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.restaurant_supplier
    ADD CONSTRAINT restaurant_supplier_id PRIMARY KEY (res_id, supp_id);


--
-- TOC entry 3171 (class 2606 OID 17546)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supp_id);


--
-- TOC entry 3188 (class 2606 OID 18059)
-- Name: restaurant_supplier restaurant_supplier_res_id_fkey; Type: FK CONSTRAINT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.restaurant_supplier
    ADD CONSTRAINT restaurant_supplier_res_id_fkey FOREIGN KEY (res_id) REFERENCES zdsabroso.restaurant(res_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3189 (class 2606 OID 18064)
-- Name: restaurant_supplier restaurant_supplier_supp_id_fkey; Type: FK CONSTRAINT; Schema: zdsabroso; Owner: datama2mi181
--

ALTER TABLE ONLY zdsabroso.restaurant_supplier
    ADD CONSTRAINT restaurant_supplier_supp_id_fkey FOREIGN KEY (supp_id) REFERENCES zdsabroso.supplier(supp_id) ON UPDATE CASCADE;


-- Completed on 2019-12-02 08:44:44

--
-- PostgreSQL database dump complete
--

