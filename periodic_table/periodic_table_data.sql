--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Data for Name: elements; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.elements (atomic_number, symbol, name) FROM stdin;
1	H	Hydrogen
2	he	Helium
3	li	Lithium
4	Be	Beryllium
5	B	Boron
6	C	Carbon
7	N	Nitrogen
8	O	Oxygen
1000	mT	moTanium
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.properties (atomic_number, type, weight, melting_point, boiling_point) FROM stdin;
1	nonmetal	1.008000	-259.1	-252.9
2	nonmetal	4.002600	-272.2	-269
3	metal	6.940000	180.54	1342
4	metal	9.012200	1287	2470
5	metalloid	10.810000	2075	4000
6	nonmetal	12.011000	3550	4027
7	nonmetal	14.007000	-210.1	-195.8
8	nonmetal	15.999000	-218	-183
1000	metalloid	1.000000	10	100
\.


--
-- PostgreSQL database dump complete
--

