--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: admins; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE admins (
    id integer NOT NULL,
    username character varying,
    password_digest character varying,
    first_name character varying,
    last_name character varying,
    department character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE admins OWNER TO sunday;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admins_id_seq OWNER TO sunday;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: adults; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE adults (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    address character varying,
    call character varying,
    zip_code character varying,
    enthicity character varying,
    district character varying,
    parish character varying,
    city character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    prefix character varying,
    nationality character varying,
    iden_number character varying,
    image character varying
);


ALTER TABLE adults OWNER TO sunday;

--
-- Name: adults_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE adults_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adults_id_seq OWNER TO sunday;

--
-- Name: adults_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE adults_id_seq OWNED BY adults.id;


--
-- Name: api_keys; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE api_keys (
    id integer NOT NULL,
    access_token character varying,
    expires_at timestamp without time zone,
    student_id integer,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    admin_id integer
);


ALTER TABLE api_keys OWNER TO sunday;

--
-- Name: api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE api_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api_keys_id_seq OWNER TO sunday;

--
-- Name: api_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE api_keys_id_seq OWNED BY api_keys.id;


--
-- Name: course_lists; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE course_lists (
    id integer NOT NULL,
    course_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    room_level character varying,
    year_room_id integer,
    full_name character varying
);


ALTER TABLE course_lists OWNER TO sunday;

--
-- Name: course_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE course_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE course_lists_id_seq OWNER TO sunday;

--
-- Name: course_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE course_lists_id_seq OWNED BY course_lists.id;


--
-- Name: course_rooms; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE course_rooms (
    id integer NOT NULL,
    course_list_id integer,
    room_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE course_rooms OWNER TO sunday;

--
-- Name: course_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE course_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE course_rooms_id_seq OWNER TO sunday;

--
-- Name: course_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE course_rooms_id_seq OWNED BY course_rooms.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE courses (
    id integer NOT NULL,
    year character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE courses OWNER TO sunday;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE courses_id_seq OWNER TO sunday;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE courses_id_seq OWNED BY courses.id;


--
-- Name: father_lists; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE father_lists (
    id integer NOT NULL,
    adult_id integer,
    student_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE father_lists OWNER TO sunday;

--
-- Name: father_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE father_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE father_lists_id_seq OWNER TO sunday;

--
-- Name: father_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE father_lists_id_seq OWNED BY father_lists.id;


--
-- Name: guardians; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE guardians (
    id integer NOT NULL,
    adult_id integer,
    student_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE guardians OWNER TO sunday;

--
-- Name: guardians_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE guardians_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guardians_id_seq OWNER TO sunday;

--
-- Name: guardians_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE guardians_id_seq OWNED BY guardians.id;


--
-- Name: mother_lists; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE mother_lists (
    id integer NOT NULL,
    adult_id integer,
    student_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE mother_lists OWNER TO sunday;

--
-- Name: mother_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE mother_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mother_lists_id_seq OWNER TO sunday;

--
-- Name: mother_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE mother_lists_id_seq OWNED BY mother_lists.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE rooms (
    id integer NOT NULL,
    name character varying,
    level character varying,
    year character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status character varying,
    year_room_id integer,
    priority integer
);


ALTER TABLE rooms OWNER TO sunday;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rooms_id_seq OWNER TO sunday;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE rooms_id_seq OWNED BY rooms.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO sunday;

--
-- Name: student_course_lists; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE student_course_lists (
    id integer NOT NULL,
    student_id integer,
    course_list_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE student_course_lists OWNER TO sunday;

--
-- Name: student_course_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE student_course_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE student_course_lists_id_seq OWNER TO sunday;

--
-- Name: student_course_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE student_course_lists_id_seq OWNED BY student_course_lists.id;


--
-- Name: student_rooms; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE student_rooms (
    id integer NOT NULL,
    student_id integer,
    room_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cr integer,
    cp integer,
    ca integer,
    gp double precision,
    gpa double precision,
    level character varying,
    status boolean DEFAULT true,
    student_status boolean DEFAULT true,
    code_number character varying
);


ALTER TABLE student_rooms OWNER TO sunday;

--
-- Name: student_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE student_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE student_rooms_id_seq OWNER TO sunday;

--
-- Name: student_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE student_rooms_id_seq OWNED BY student_rooms.id;


--
-- Name: student_subjects; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE student_subjects (
    id integer NOT NULL,
    subject_id integer,
    score1 integer DEFAULT 0,
    score2 integer DEFAULT 0,
    grade character varying DEFAULT ''::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    student_room_id integer,
    score_result double precision,
    status boolean DEFAULT true,
    status_grade boolean DEFAULT false
);


ALTER TABLE student_subjects OWNER TO sunday;

--
-- Name: student_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE student_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE student_subjects_id_seq OWNER TO sunday;

--
-- Name: student_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE student_subjects_id_seq OWNED BY student_subjects.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE students (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    gpa double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    iden_number character varying,
    code_number character varying,
    room_state boolean,
    blood character varying,
    birthdate timestamp without time zone,
    address character varying,
    call character varying,
    zip_code character varying,
    ability character varying,
    nationality character varying,
    ethnicity character varying,
    district character varying,
    parish character varying,
    city character varying,
    prefix character varying,
    delete_status character varying,
    username character varying,
    password_digest character varying,
    image character varying
);


ALTER TABLE students OWNER TO sunday;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE students_id_seq OWNER TO sunday;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE students_id_seq OWNED BY students.id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE subjects (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying,
    hour_per_year character varying,
    course_list_id integer,
    credit double precision,
    status character varying
);


ALTER TABLE subjects OWNER TO sunday;

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subjects_id_seq OWNER TO sunday;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE subjects_id_seq OWNED BY subjects.id;


--
-- Name: teacher_courses; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE teacher_courses (
    id integer NOT NULL,
    teacher_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    subject_id integer
);


ALTER TABLE teacher_courses OWNER TO sunday;

--
-- Name: teacher_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE teacher_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teacher_courses_id_seq OWNER TO sunday;

--
-- Name: teacher_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE teacher_courses_id_seq OWNED BY teacher_courses.id;


--
-- Name: teacher_rooms; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE teacher_rooms (
    id integer NOT NULL,
    teacher_id integer,
    room_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status boolean
);


ALTER TABLE teacher_rooms OWNER TO sunday;

--
-- Name: teacher_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE teacher_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teacher_rooms_id_seq OWNER TO sunday;

--
-- Name: teacher_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE teacher_rooms_id_seq OWNED BY teacher_rooms.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE teachers (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    username character varying,
    password_digest character varying,
    status character varying,
    resign boolean,
    prefix character varying,
    image character varying
);


ALTER TABLE teachers OWNER TO sunday;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teachers_id_seq OWNER TO sunday;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE teachers_id_seq OWNED BY teachers.id;


--
-- Name: year_rooms; Type: TABLE; Schema: public; Owner: sunday
--

CREATE TABLE year_rooms (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE year_rooms OWNER TO sunday;

--
-- Name: year_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: sunday
--

CREATE SEQUENCE year_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE year_rooms_id_seq OWNER TO sunday;

--
-- Name: year_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunday
--

ALTER SEQUENCE year_rooms_id_seq OWNED BY year_rooms.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY adults ALTER COLUMN id SET DEFAULT nextval('adults_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY api_keys ALTER COLUMN id SET DEFAULT nextval('api_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY course_lists ALTER COLUMN id SET DEFAULT nextval('course_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY course_rooms ALTER COLUMN id SET DEFAULT nextval('course_rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY courses ALTER COLUMN id SET DEFAULT nextval('courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY father_lists ALTER COLUMN id SET DEFAULT nextval('father_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY guardians ALTER COLUMN id SET DEFAULT nextval('guardians_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY mother_lists ALTER COLUMN id SET DEFAULT nextval('mother_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY rooms ALTER COLUMN id SET DEFAULT nextval('rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY student_course_lists ALTER COLUMN id SET DEFAULT nextval('student_course_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY student_rooms ALTER COLUMN id SET DEFAULT nextval('student_rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY student_subjects ALTER COLUMN id SET DEFAULT nextval('student_subjects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY students ALTER COLUMN id SET DEFAULT nextval('students_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY subjects ALTER COLUMN id SET DEFAULT nextval('subjects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY teacher_courses ALTER COLUMN id SET DEFAULT nextval('teacher_courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY teacher_rooms ALTER COLUMN id SET DEFAULT nextval('teacher_rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY teachers ALTER COLUMN id SET DEFAULT nextval('teachers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY year_rooms ALTER COLUMN id SET DEFAULT nextval('year_rooms_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY admins (id, username, password_digest, first_name, last_name, department, created_at, updated_at) FROM stdin;
1	canet	$2a$10$2I.5UlPaeCt.k6Fuo9buveUFgrqN6A7xoNNibjoCLzYivA4CO5Tea	Nanthipath	Pholberdee	Silpakorn University	2017-06-12 12:51:59.903879	2017-06-12 13:30:48.334042
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('admins_id_seq', 1, true);


--
-- Data for Name: adults; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY adults (id, first_name, last_name, address, call, zip_code, enthicity, district, parish, city, created_at, updated_at, prefix, nationality, iden_number, image) FROM stdin;
\.


--
-- Name: adults_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('adults_id_seq', 1, false);


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY api_keys (id, access_token, expires_at, student_id, active, created_at, updated_at, admin_id) FROM stdin;
1	6ad9a0dd8a5735c8e4d6b90524be818a	2017-06-12 13:28:32.535775	\N	\N	2017-06-12 12:58:32.211251	2017-06-12 12:58:32.536457	1
2	e58c7c87c8deb3376f960b977d2fc7cd	2017-06-12 13:30:52.196145	\N	\N	2017-06-12 13:00:51.855323	2017-06-12 13:00:52.196841	1
3	bb57aad754d1468a1d92b330581672e7	2017-06-12 13:32:24.508071	\N	\N	2017-06-12 13:02:24.302913	2017-06-12 13:02:24.508815	1
4	c1681682f0eedddc9b3e06775b7a20ec	2017-06-12 13:53:50.216908	\N	\N	2017-06-12 13:23:50.070213	2017-06-12 13:23:50.217529	1
5	42eabe619ef8d26ba4043a5f7de5174a	2017-06-12 13:54:39.247246	\N	\N	2017-06-12 13:24:38.651916	2017-06-12 13:24:39.247838	1
6	77e112ec7f748c4a2450bd2b41bb798c	2017-06-12 13:55:14.463997	\N	\N	2017-06-12 13:25:14.324699	2017-06-12 13:25:14.464643	1
7	c18b260d8d49b0e1a094fcbbec5b4ba1	2017-06-12 13:55:21.819473	\N	\N	2017-06-12 13:25:21.696611	2017-06-12 13:25:21.820078	1
8	097c3835307fe92198cec7a037f596cf	2017-06-12 13:56:23.063114	\N	\N	2017-06-12 13:26:22.878396	2017-06-12 13:26:23.063748	1
9	012d165b75a52386ce3ca183586f1cee	2017-06-12 13:58:51.720244	\N	\N	2017-06-12 13:28:51.621434	2017-06-12 13:28:51.720837	1
10	ab0602f19ef680aeb278d841a1137227	2017-06-12 14:02:05.464679	\N	\N	2017-06-12 13:32:05.4063	2017-06-12 13:32:05.465278	1
11	e8887177c6d08c4ce17fc5f268fb18ad	2017-06-12 13:33:14.952791	\N	\N	2017-06-12 13:33:11.852331	2017-06-12 13:33:14.95343	1
18	3e2066e56c3dc8779cf3c58ab6d80638	2017-06-13 12:11:23.615821	\N	\N	2017-06-13 11:41:21.908062	2017-06-13 11:41:23.616912	1
12	8bc5366489d1b7994253bc29d7fa9e32	2017-06-12 13:34:42.359081	\N	\N	2017-06-12 13:34:35.846858	2017-06-12 13:34:42.359681	1
35	9cd7eb6eb1dfba9c915144559600d025	2017-06-13 13:44:24.150914	\N	\N	2017-06-13 12:28:08.260595	2017-06-13 13:14:24.151653	1
29	9b6470948e006c2772b80f4cf7b85184	2017-06-13 11:50:16.910937	\N	\N	2017-06-13 11:47:50.299074	2017-06-13 11:50:16.911658	1
19	99b35158ab6f45eeaf434ab8e8d6007e	2017-06-13 12:12:28.232133	\N	\N	2017-06-13 11:42:15.259185	2017-06-13 11:42:28.23284	1
13	a7af2d8725ff1deb5b2e9a0f55b3766c	2017-06-12 14:05:57.157475	\N	\N	2017-06-12 13:35:23.343894	2017-06-12 13:35:57.158176	1
20	284b3836e91a178f4f59e805773c92ef	2017-06-13 11:42:47.161008	\N	\N	2017-06-13 11:42:36.672109	2017-06-13 11:42:47.161591	1
14	26e1f05a2a764bcb8ff609aca01202d5	2017-06-13 11:27:38.606812	\N	\N	2017-06-13 10:57:37.111412	2017-06-13 10:57:38.607477	1
21	4e50cd6d634859ae632687ec55128e06	2017-06-13 12:13:47.318098	\N	\N	2017-06-13 11:43:01.379466	2017-06-13 11:43:47.318692	1
31	459da3dfe23fd7df7ad09fd8462b02e1	2017-06-13 12:22:45.98283	\N	\N	2017-06-13 11:51:37.990398	2017-06-13 11:52:45.983499	1
15	3c52efcffa609fd7b4d4e12767af67bc	2017-06-13 12:10:22.307855	\N	\N	2017-06-13 11:25:43.027785	2017-06-13 11:40:22.308928	1
16	b3b899021e65167e12aca90306746237	2017-06-13 12:10:36.391963	\N	\N	2017-06-13 11:40:33.648046	2017-06-13 11:40:36.392611	1
23	36de2455d4080fddec849d4452d94162	2017-06-13 12:14:03.94347	\N	\N	2017-06-13 11:43:58.666776	2017-06-13 11:44:03.944383	1
22	5e1da1052b2117bb3c46c85b1ae05894	2017-06-13 11:44:06.610524	\N	\N	2017-06-13 11:43:13.940008	2017-06-13 11:44:06.613493	1
17	d499845205dc533051ebb05c3c5800c0	2017-06-13 12:11:02.258324	\N	\N	2017-06-13 11:40:52.724151	2017-06-13 11:41:02.258952	1
24	bc2641382b0c52e75dfdd7a2fcd5ebc6	2017-06-13 12:14:10.773701	\N	\N	2017-06-13 11:44:10.699053	2017-06-13 11:44:10.77425	1
30	226083598174eaa5c7f0f7dc62480976	2017-06-13 12:36:21.603137	\N	\N	2017-06-13 11:50:21.160114	2017-06-13 12:06:21.603668	1
32	9591313507c986fc26537b3228646143	2017-06-13 12:23:48.714464	\N	\N	2017-06-13 11:52:59.770663	2017-06-13 11:53:48.71518	1
33	113d949189290f8897fe15ede5ce6c51	2017-06-13 12:47:05.532365	\N	\N	2017-06-13 11:54:00.474046	2017-06-13 12:17:05.532992	1
25	e0331a97d1b4d933a4a9574cda108512	2017-06-13 11:46:05.600927	\N	\N	2017-06-13 11:44:17.634582	2017-06-13 11:46:05.601616	1
26	41dfd808aaf07facd413609e5a2d1bfe	2017-06-13 12:16:45.640914	\N	\N	2017-06-13 11:46:45.508074	2017-06-13 11:46:45.641518	1
27	7352f4adbb1b12dad2426866fb09af49	2017-06-13 12:16:59.475668	\N	\N	2017-06-13 11:46:59.436916	2017-06-13 11:46:59.476313	1
28	6b6de2156bb83bd45791dde704de0692	2017-06-13 12:17:17.751374	\N	\N	2017-06-13 11:47:17.708925	2017-06-13 11:47:17.752034	1
34	459d1ff239303655b1b120d5d539654a	2017-06-13 13:34:32.450118	\N	\N	2017-06-13 12:07:00.48191	2017-06-13 13:04:32.45076	1
\.


--
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('api_keys_id_seq', 35, true);


--
-- Data for Name: course_lists; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY course_lists (id, course_id, created_at, updated_at, room_level, year_room_id, full_name) FROM stdin;
1	1	2017-06-13 11:38:08.531437	2017-06-13 11:38:08.531437	ป.1	\N	ชั้นมัธยมศึกษาปีที่1
2	1	2017-06-13 11:38:08.554892	2017-06-13 11:38:08.554892	ป.2	\N	ชั้นมัธยมศึกษาปีที่2
3	1	2017-06-13 11:38:08.566762	2017-06-13 11:38:08.566762	ป.3	\N	ชั้นมัธยมศึกษาปีที่3
4	1	2017-06-13 11:38:08.581481	2017-06-13 11:38:08.581481	ป.4	\N	ชั้นมัธยมศึกษาปีที่4
5	1	2017-06-13 11:38:08.588977	2017-06-13 11:38:08.588977	ป.5	\N	ชั้นมัธยมศึกษาปีที่5
6	1	2017-06-13 11:38:08.592709	2017-06-13 11:38:08.592709	ป.6	\N	ชั้นมัธยมศึกษาปีที่6
\.


--
-- Name: course_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('course_lists_id_seq', 6, true);


--
-- Data for Name: course_rooms; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY course_rooms (id, course_list_id, room_id, created_at, updated_at) FROM stdin;
1	1	37	2017-06-13 13:03:30.4194	2017-06-13 13:03:30.4194
2	1	38	2017-06-13 13:03:34.043263	2017-06-13 13:03:34.043263
\.


--
-- Name: course_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('course_rooms_id_seq', 2, true);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY courses (id, year, created_at, updated_at) FROM stdin;
1	2559	2017-06-13 11:38:08.394664	2017-06-13 11:38:08.394664
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('courses_id_seq', 1, true);


--
-- Data for Name: father_lists; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY father_lists (id, adult_id, student_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: father_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('father_lists_id_seq', 1, false);


--
-- Data for Name: guardians; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY guardians (id, adult_id, student_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: guardians_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('guardians_id_seq', 1, false);


--
-- Data for Name: mother_lists; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY mother_lists (id, adult_id, student_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: mother_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('mother_lists_id_seq', 1, false);


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY rooms (id, name, level, year, created_at, updated_at, status, year_room_id, priority) FROM stdin;
37	พุทธรักษา	ป.1	2559	2017-06-13 13:02:47.972352	2017-06-13 13:02:47.972352	\N	6	1
38	ลีลาวดี	ป.1	2559	2017-06-13 13:02:47.976238	2017-06-13 13:02:47.976238	\N	6	2
39	กระเช้าสีดา	ป.2	2559	2017-06-13 13:02:47.98009	2017-06-13 13:02:47.98009	\N	6	3
40	จ่ามงกุฎ	ป.2	2559	2017-06-13 13:02:47.983699	2017-06-13 13:02:47.983699	\N	6	4
41	เพชรดี	ป.3	2559	2017-06-13 13:02:47.98726	2017-06-13 13:02:47.98726	\N	6	5
42	มณีงาม	ป.3	2559	2017-06-13 13:02:47.990602	2017-06-13 13:02:47.990602	\N	6	6
43	ร่มไทร	ป.4	2559	2017-06-13 13:02:47.994082	2017-06-13 13:02:47.994082	\N	6	7
44	ใบโพธิ์	ป.4	2559	2017-06-13 13:02:47.997534	2017-06-13 13:02:47.997534	\N	6	8
45	มหานที	ป.5	2559	2017-06-13 13:02:48.000937	2017-06-13 13:02:48.000937	\N	6	9
46	ปถวีธร	ป.5	2559	2017-06-13 13:02:48.004595	2017-06-13 13:02:48.004595	\N	6	10
47	แสงตะวัน	ป.6	2559	2017-06-13 13:02:48.00829	2017-06-13 13:02:48.00829	\N	6	11
48	จันทร์กระจ่าง	ป.6	2559	2017-06-13 13:02:48.011831	2017-06-13 13:02:48.011831	\N	6	12
\.


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('rooms_id_seq', 48, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY schema_migrations (version) FROM stdin;
20160610145605
20160610150138
20160610154531
20160610155535
20160610161701
20160610163109
20160610163314
20160611024747
20160611025029
20160613054143
20160613055003
20160613084559
20160613085327
20160614032914
20160614032945
20160614033817
20160614121529
20160614121733
20160716091958
20160716115514
20160718093823
20160720133511
20160804030418
20160804030742
20160804084209
20160816124726
20160816130852
20160816131151
20160817101742
20160817112819
20160818112810
20160818112825
20160822131830
20160822133958
20160830094720
20160831065634
20160831070329
20160831070404
20160831070521
20160904081657
20160904084927
20160904090638
20160913102725
20160920114434
20160924180946
20160924181225
20160924181446
20160924181943
20160924182243
20160924182616
20160924182640
20160924182918
20160925152607
20160925152835
20160928081048
20160928084827
20160928085057
20160928085358
20160928090526
20160928092151
20161006135311
20161008141024
20161008150941
20161008151154
20161020115104
20161020122005
20161020123948
20161028145036
20161028145151
20161028151124
20161029045838
20161029053337
20161030050608
20161030050654
20161105144549
20161105144625
20161106080048
20161106102957
20161106103046
20161106125518
20161210093401
20170129075813
20170129080101
20170129090248
20170129092727
20170130125141
20170131053046
20170131054831
20170131070634
20170205135835
20170508181644
20170508181704
20170508181730
\.


--
-- Data for Name: student_course_lists; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY student_course_lists (id, student_id, course_list_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: student_course_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('student_course_lists_id_seq', 1, false);


--
-- Data for Name: student_rooms; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY student_rooms (id, student_id, room_id, created_at, updated_at, cr, cp, ca, gp, gpa, level, status, student_status, code_number) FROM stdin;
1	1	37	2017-06-13 13:04:20.500287	2017-06-13 13:04:20.551592	\N	\N	\N	\N	\N	ป.1	f	t	259001
2	2	37	2017-06-13 13:04:20.631713	2017-06-13 13:04:20.668803	\N	\N	\N	\N	\N	ป.1	f	t	259002
3	3	37	2017-06-13 13:04:20.746257	2017-06-13 13:04:20.781855	\N	\N	\N	\N	\N	ป.1	f	t	259003
4	4	37	2017-06-13 13:04:20.862069	2017-06-13 13:04:20.899772	\N	\N	\N	\N	\N	ป.1	f	t	259004
5	5	37	2017-06-13 13:04:20.980028	2017-06-13 13:04:21.015611	\N	\N	\N	\N	\N	ป.1	f	t	259005
6	6	37	2017-06-13 13:04:21.097332	2017-06-13 13:04:21.133399	\N	\N	\N	\N	\N	ป.1	f	t	259006
7	7	37	2017-06-13 13:04:21.217495	2017-06-13 13:04:21.25257	\N	\N	\N	\N	\N	ป.1	f	t	259007
8	8	37	2017-06-13 13:04:21.340944	2017-06-13 13:04:21.377202	\N	\N	\N	\N	\N	ป.1	f	t	259008
9	9	37	2017-06-13 13:04:21.462148	2017-06-13 13:04:21.509375	\N	\N	\N	\N	\N	ป.1	f	t	259009
10	10	37	2017-06-13 13:04:21.589026	2017-06-13 13:04:21.625696	\N	\N	\N	\N	\N	ป.1	f	t	259069
11	11	37	2017-06-13 13:04:21.706471	2017-06-13 13:04:21.742164	\N	\N	\N	\N	\N	ป.1	f	t	259010
12	12	37	2017-06-13 13:04:21.829751	2017-06-13 13:04:21.865679	\N	\N	\N	\N	\N	ป.1	f	t	259011
13	13	37	2017-06-13 13:04:21.944445	2017-06-13 13:04:21.980009	\N	\N	\N	\N	\N	ป.1	f	t	259012
14	14	37	2017-06-13 13:04:22.059798	2017-06-13 13:04:22.095325	\N	\N	\N	\N	\N	ป.1	f	t	259013
15	15	37	2017-06-13 13:04:22.176454	2017-06-13 13:04:22.211928	\N	\N	\N	\N	\N	ป.1	f	t	259014
16	16	37	2017-06-13 13:04:22.294371	2017-06-13 13:04:22.331645	\N	\N	\N	\N	\N	ป.1	f	t	259015
17	17	37	2017-06-13 13:04:22.416026	2017-06-13 13:04:22.45145	\N	\N	\N	\N	\N	ป.1	f	t	259016
18	18	37	2017-06-13 13:04:22.536776	2017-06-13 13:04:22.572569	\N	\N	\N	\N	\N	ป.1	f	t	259017
19	19	37	2017-06-13 13:04:22.656162	2017-06-13 13:04:22.692559	\N	\N	\N	\N	\N	ป.1	f	t	259018
20	20	37	2017-06-13 13:04:22.776639	2017-06-13 13:04:22.81179	\N	\N	\N	\N	\N	ป.1	f	t	259019
21	21	37	2017-06-13 13:04:22.893622	2017-06-13 13:04:22.938581	\N	\N	\N	\N	\N	ป.1	f	t	259020
22	22	37	2017-06-13 13:04:23.021738	2017-06-13 13:04:23.056412	\N	\N	\N	\N	\N	ป.1	f	t	259021
23	23	37	2017-06-13 13:04:23.134527	2017-06-13 13:04:23.16965	\N	\N	\N	\N	\N	ป.1	f	t	259022
24	24	37	2017-06-13 13:04:23.252301	2017-06-13 13:04:23.287239	\N	\N	\N	\N	\N	ป.1	f	t	259023
25	25	37	2017-06-13 13:04:23.369259	2017-06-13 13:04:23.404324	\N	\N	\N	\N	\N	ป.1	f	t	259024
26	26	37	2017-06-13 13:04:23.489552	2017-06-13 13:04:23.523978	\N	\N	\N	\N	\N	ป.1	f	t	259025
27	27	37	2017-06-13 13:04:23.60625	2017-06-13 13:04:23.641115	\N	\N	\N	\N	\N	ป.1	f	t	259070
28	28	37	2017-06-13 13:04:23.720421	2017-06-13 13:04:23.756328	\N	\N	\N	\N	\N	ป.1	f	t	259026
29	29	37	2017-06-13 13:04:23.839909	2017-06-13 13:04:23.874596	\N	\N	\N	\N	\N	ป.1	f	t	259027
30	30	37	2017-06-13 13:04:23.958288	2017-06-13 13:04:23.993195	\N	\N	\N	\N	\N	ป.1	f	t	259029
31	31	37	2017-06-13 13:04:24.073959	2017-06-13 13:04:24.108262	\N	\N	\N	\N	\N	ป.1	f	t	259030
32	32	37	2017-06-13 13:04:24.187402	2017-06-13 13:04:24.222408	\N	\N	\N	\N	\N	ป.1	f	t	259031
33	33	37	2017-06-13 13:04:24.309039	2017-06-13 13:04:24.352923	\N	\N	\N	\N	\N	ป.1	f	t	259032
34	34	37	2017-06-13 13:04:24.434684	2017-06-13 13:04:24.470727	\N	\N	\N	\N	\N	ป.1	f	t	259033
\.


--
-- Name: student_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('student_rooms_id_seq', 34, true);


--
-- Data for Name: student_subjects; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY student_subjects (id, subject_id, score1, score2, grade, created_at, updated_at, student_room_id, score_result, status, status_grade) FROM stdin;
1	1	0	0		2017-06-13 13:04:20.520345	2017-06-13 13:04:20.520345	1	\N	t	f
2	2	0	0		2017-06-13 13:04:20.524149	2017-06-13 13:04:20.524149	1	\N	t	f
3	3	0	0		2017-06-13 13:04:20.52709	2017-06-13 13:04:20.52709	1	\N	t	f
4	4	0	0		2017-06-13 13:04:20.529859	2017-06-13 13:04:20.529859	1	\N	t	f
5	5	0	0		2017-06-13 13:04:20.532739	2017-06-13 13:04:20.532739	1	\N	t	f
6	6	0	0		2017-06-13 13:04:20.535688	2017-06-13 13:04:20.535688	1	\N	t	f
7	7	0	0		2017-06-13 13:04:20.53846	2017-06-13 13:04:20.53846	1	\N	t	f
8	8	0	0		2017-06-13 13:04:20.541037	2017-06-13 13:04:20.541037	1	\N	t	f
9	9	0	0		2017-06-13 13:04:20.543722	2017-06-13 13:04:20.543722	1	\N	t	f
10	10	0	0		2017-06-13 13:04:20.546467	2017-06-13 13:04:20.546467	1	\N	t	f
11	1	0	0		2017-06-13 13:04:20.640668	2017-06-13 13:04:20.640668	2	\N	t	f
12	2	0	0		2017-06-13 13:04:20.643509	2017-06-13 13:04:20.643509	2	\N	t	f
13	3	0	0		2017-06-13 13:04:20.646156	2017-06-13 13:04:20.646156	2	\N	t	f
14	4	0	0		2017-06-13 13:04:20.649071	2017-06-13 13:04:20.649071	2	\N	t	f
15	5	0	0		2017-06-13 13:04:20.652183	2017-06-13 13:04:20.652183	2	\N	t	f
16	6	0	0		2017-06-13 13:04:20.654892	2017-06-13 13:04:20.654892	2	\N	t	f
17	7	0	0		2017-06-13 13:04:20.657475	2017-06-13 13:04:20.657475	2	\N	t	f
18	8	0	0		2017-06-13 13:04:20.659983	2017-06-13 13:04:20.659983	2	\N	t	f
19	9	0	0		2017-06-13 13:04:20.66257	2017-06-13 13:04:20.66257	2	\N	t	f
20	10	0	0		2017-06-13 13:04:20.665099	2017-06-13 13:04:20.665099	2	\N	t	f
21	1	0	0		2017-06-13 13:04:20.753398	2017-06-13 13:04:20.753398	3	\N	t	f
22	2	0	0		2017-06-13 13:04:20.756165	2017-06-13 13:04:20.756165	3	\N	t	f
23	3	0	0		2017-06-13 13:04:20.759063	2017-06-13 13:04:20.759063	3	\N	t	f
24	4	0	0		2017-06-13 13:04:20.761838	2017-06-13 13:04:20.761838	3	\N	t	f
25	5	0	0		2017-06-13 13:04:20.764533	2017-06-13 13:04:20.764533	3	\N	t	f
26	6	0	0		2017-06-13 13:04:20.767293	2017-06-13 13:04:20.767293	3	\N	t	f
27	7	0	0		2017-06-13 13:04:20.770058	2017-06-13 13:04:20.770058	3	\N	t	f
28	8	0	0		2017-06-13 13:04:20.772747	2017-06-13 13:04:20.772747	3	\N	t	f
29	9	0	0		2017-06-13 13:04:20.775447	2017-06-13 13:04:20.775447	3	\N	t	f
30	10	0	0		2017-06-13 13:04:20.778001	2017-06-13 13:04:20.778001	3	\N	t	f
31	1	0	0		2017-06-13 13:04:20.869298	2017-06-13 13:04:20.869298	4	\N	t	f
32	2	0	0		2017-06-13 13:04:20.873084	2017-06-13 13:04:20.873084	4	\N	t	f
33	3	0	0		2017-06-13 13:04:20.875749	2017-06-13 13:04:20.875749	4	\N	t	f
34	4	0	0		2017-06-13 13:04:20.879456	2017-06-13 13:04:20.879456	4	\N	t	f
35	5	0	0		2017-06-13 13:04:20.882241	2017-06-13 13:04:20.882241	4	\N	t	f
36	6	0	0		2017-06-13 13:04:20.884744	2017-06-13 13:04:20.884744	4	\N	t	f
37	7	0	0		2017-06-13 13:04:20.887519	2017-06-13 13:04:20.887519	4	\N	t	f
38	8	0	0		2017-06-13 13:04:20.890438	2017-06-13 13:04:20.890438	4	\N	t	f
39	9	0	0		2017-06-13 13:04:20.893265	2017-06-13 13:04:20.893265	4	\N	t	f
40	10	0	0		2017-06-13 13:04:20.896017	2017-06-13 13:04:20.896017	4	\N	t	f
41	1	0	0		2017-06-13 13:04:20.98708	2017-06-13 13:04:20.98708	5	\N	t	f
42	2	0	0		2017-06-13 13:04:20.989794	2017-06-13 13:04:20.989794	5	\N	t	f
43	3	0	0		2017-06-13 13:04:20.992554	2017-06-13 13:04:20.992554	5	\N	t	f
44	4	0	0		2017-06-13 13:04:20.995238	2017-06-13 13:04:20.995238	5	\N	t	f
45	5	0	0		2017-06-13 13:04:20.997896	2017-06-13 13:04:20.997896	5	\N	t	f
46	6	0	0		2017-06-13 13:04:21.000508	2017-06-13 13:04:21.000508	5	\N	t	f
47	7	0	0		2017-06-13 13:04:21.003273	2017-06-13 13:04:21.003273	5	\N	t	f
48	8	0	0		2017-06-13 13:04:21.006138	2017-06-13 13:04:21.006138	5	\N	t	f
49	9	0	0		2017-06-13 13:04:21.008858	2017-06-13 13:04:21.008858	5	\N	t	f
50	10	0	0		2017-06-13 13:04:21.011745	2017-06-13 13:04:21.011745	5	\N	t	f
51	1	0	0		2017-06-13 13:04:21.104931	2017-06-13 13:04:21.104931	6	\N	t	f
52	2	0	0		2017-06-13 13:04:21.107824	2017-06-13 13:04:21.107824	6	\N	t	f
53	3	0	0		2017-06-13 13:04:21.110583	2017-06-13 13:04:21.110583	6	\N	t	f
54	4	0	0		2017-06-13 13:04:21.11334	2017-06-13 13:04:21.11334	6	\N	t	f
55	5	0	0		2017-06-13 13:04:21.116205	2017-06-13 13:04:21.116205	6	\N	t	f
56	6	0	0		2017-06-13 13:04:21.118717	2017-06-13 13:04:21.118717	6	\N	t	f
57	7	0	0		2017-06-13 13:04:21.121268	2017-06-13 13:04:21.121268	6	\N	t	f
58	8	0	0		2017-06-13 13:04:21.124012	2017-06-13 13:04:21.124012	6	\N	t	f
59	9	0	0		2017-06-13 13:04:21.126965	2017-06-13 13:04:21.126965	6	\N	t	f
60	10	0	0		2017-06-13 13:04:21.129696	2017-06-13 13:04:21.129696	6	\N	t	f
61	1	0	0		2017-06-13 13:04:21.224517	2017-06-13 13:04:21.224517	7	\N	t	f
62	2	0	0		2017-06-13 13:04:21.227079	2017-06-13 13:04:21.227079	7	\N	t	f
63	3	0	0		2017-06-13 13:04:21.229587	2017-06-13 13:04:21.229587	7	\N	t	f
64	4	0	0		2017-06-13 13:04:21.232305	2017-06-13 13:04:21.232305	7	\N	t	f
65	5	0	0		2017-06-13 13:04:21.235067	2017-06-13 13:04:21.235067	7	\N	t	f
66	6	0	0		2017-06-13 13:04:21.237705	2017-06-13 13:04:21.237705	7	\N	t	f
67	7	0	0		2017-06-13 13:04:21.240457	2017-06-13 13:04:21.240457	7	\N	t	f
68	8	0	0		2017-06-13 13:04:21.243339	2017-06-13 13:04:21.243339	7	\N	t	f
69	9	0	0		2017-06-13 13:04:21.246064	2017-06-13 13:04:21.246064	7	\N	t	f
70	10	0	0		2017-06-13 13:04:21.248835	2017-06-13 13:04:21.248835	7	\N	t	f
71	1	0	0		2017-06-13 13:04:21.347739	2017-06-13 13:04:21.347739	8	\N	t	f
72	2	0	0		2017-06-13 13:04:21.350619	2017-06-13 13:04:21.350619	8	\N	t	f
73	3	0	0		2017-06-13 13:04:21.353549	2017-06-13 13:04:21.353549	8	\N	t	f
74	4	0	0		2017-06-13 13:04:21.356172	2017-06-13 13:04:21.356172	8	\N	t	f
75	5	0	0		2017-06-13 13:04:21.358853	2017-06-13 13:04:21.358853	8	\N	t	f
76	6	0	0		2017-06-13 13:04:21.361447	2017-06-13 13:04:21.361447	8	\N	t	f
77	7	0	0		2017-06-13 13:04:21.364347	2017-06-13 13:04:21.364347	8	\N	t	f
78	8	0	0		2017-06-13 13:04:21.368048	2017-06-13 13:04:21.368048	8	\N	t	f
79	9	0	0		2017-06-13 13:04:21.370744	2017-06-13 13:04:21.370744	8	\N	t	f
80	10	0	0		2017-06-13 13:04:21.373563	2017-06-13 13:04:21.373563	8	\N	t	f
81	1	0	0		2017-06-13 13:04:21.469688	2017-06-13 13:04:21.469688	9	\N	t	f
82	2	0	0		2017-06-13 13:04:21.472642	2017-06-13 13:04:21.472642	9	\N	t	f
83	3	0	0		2017-06-13 13:04:21.475496	2017-06-13 13:04:21.475496	9	\N	t	f
84	4	0	0		2017-06-13 13:04:21.478288	2017-06-13 13:04:21.478288	9	\N	t	f
85	5	0	0		2017-06-13 13:04:21.480946	2017-06-13 13:04:21.480946	9	\N	t	f
86	6	0	0		2017-06-13 13:04:21.483838	2017-06-13 13:04:21.483838	9	\N	t	f
87	7	0	0		2017-06-13 13:04:21.486794	2017-06-13 13:04:21.486794	9	\N	t	f
88	8	0	0		2017-06-13 13:04:21.489375	2017-06-13 13:04:21.489375	9	\N	t	f
89	9	0	0		2017-06-13 13:04:21.49207	2017-06-13 13:04:21.49207	9	\N	t	f
90	10	0	0		2017-06-13 13:04:21.495133	2017-06-13 13:04:21.495133	9	\N	t	f
91	1	0	0		2017-06-13 13:04:21.596246	2017-06-13 13:04:21.596246	10	\N	t	f
92	2	0	0		2017-06-13 13:04:21.599136	2017-06-13 13:04:21.599136	10	\N	t	f
93	3	0	0		2017-06-13 13:04:21.601925	2017-06-13 13:04:21.601925	10	\N	t	f
94	4	0	0		2017-06-13 13:04:21.604749	2017-06-13 13:04:21.604749	10	\N	t	f
95	5	0	0		2017-06-13 13:04:21.607416	2017-06-13 13:04:21.607416	10	\N	t	f
96	6	0	0		2017-06-13 13:04:21.610089	2017-06-13 13:04:21.610089	10	\N	t	f
97	7	0	0		2017-06-13 13:04:21.612949	2017-06-13 13:04:21.612949	10	\N	t	f
98	8	0	0		2017-06-13 13:04:21.615708	2017-06-13 13:04:21.615708	10	\N	t	f
99	9	0	0		2017-06-13 13:04:21.619567	2017-06-13 13:04:21.619567	10	\N	t	f
100	10	0	0		2017-06-13 13:04:21.622268	2017-06-13 13:04:21.622268	10	\N	t	f
101	1	0	0		2017-06-13 13:04:21.713646	2017-06-13 13:04:21.713646	11	\N	t	f
102	2	0	0		2017-06-13 13:04:21.716548	2017-06-13 13:04:21.716548	11	\N	t	f
103	3	0	0		2017-06-13 13:04:21.719165	2017-06-13 13:04:21.719165	11	\N	t	f
104	4	0	0		2017-06-13 13:04:21.721927	2017-06-13 13:04:21.721927	11	\N	t	f
105	5	0	0		2017-06-13 13:04:21.72476	2017-06-13 13:04:21.72476	11	\N	t	f
106	6	0	0		2017-06-13 13:04:21.727401	2017-06-13 13:04:21.727401	11	\N	t	f
107	7	0	0		2017-06-13 13:04:21.73017	2017-06-13 13:04:21.73017	11	\N	t	f
108	8	0	0		2017-06-13 13:04:21.733024	2017-06-13 13:04:21.733024	11	\N	t	f
109	9	0	0		2017-06-13 13:04:21.735696	2017-06-13 13:04:21.735696	11	\N	t	f
110	10	0	0		2017-06-13 13:04:21.738521	2017-06-13 13:04:21.738521	11	\N	t	f
111	1	0	0		2017-06-13 13:04:21.836892	2017-06-13 13:04:21.836892	12	\N	t	f
112	2	0	0		2017-06-13 13:04:21.83973	2017-06-13 13:04:21.83973	12	\N	t	f
113	3	0	0		2017-06-13 13:04:21.842448	2017-06-13 13:04:21.842448	12	\N	t	f
114	4	0	0		2017-06-13 13:04:21.845197	2017-06-13 13:04:21.845197	12	\N	t	f
115	5	0	0		2017-06-13 13:04:21.847963	2017-06-13 13:04:21.847963	12	\N	t	f
116	6	0	0		2017-06-13 13:04:21.850759	2017-06-13 13:04:21.850759	12	\N	t	f
117	7	0	0		2017-06-13 13:04:21.85356	2017-06-13 13:04:21.85356	12	\N	t	f
118	8	0	0		2017-06-13 13:04:21.856343	2017-06-13 13:04:21.856343	12	\N	t	f
119	9	0	0		2017-06-13 13:04:21.8591	2017-06-13 13:04:21.8591	12	\N	t	f
120	10	0	0		2017-06-13 13:04:21.862055	2017-06-13 13:04:21.862055	12	\N	t	f
121	1	0	0		2017-06-13 13:04:21.951646	2017-06-13 13:04:21.951646	13	\N	t	f
122	2	0	0		2017-06-13 13:04:21.954346	2017-06-13 13:04:21.954346	13	\N	t	f
123	3	0	0		2017-06-13 13:04:21.956977	2017-06-13 13:04:21.956977	13	\N	t	f
124	4	0	0		2017-06-13 13:04:21.959736	2017-06-13 13:04:21.959736	13	\N	t	f
125	5	0	0		2017-06-13 13:04:21.962875	2017-06-13 13:04:21.962875	13	\N	t	f
126	6	0	0		2017-06-13 13:04:21.965621	2017-06-13 13:04:21.965621	13	\N	t	f
127	7	0	0		2017-06-13 13:04:21.968327	2017-06-13 13:04:21.968327	13	\N	t	f
128	8	0	0		2017-06-13 13:04:21.971018	2017-06-13 13:04:21.971018	13	\N	t	f
129	9	0	0		2017-06-13 13:04:21.973627	2017-06-13 13:04:21.973627	13	\N	t	f
130	10	0	0		2017-06-13 13:04:21.976329	2017-06-13 13:04:21.976329	13	\N	t	f
131	1	0	0		2017-06-13 13:04:22.066995	2017-06-13 13:04:22.066995	14	\N	t	f
132	2	0	0		2017-06-13 13:04:22.069713	2017-06-13 13:04:22.069713	14	\N	t	f
133	3	0	0		2017-06-13 13:04:22.07241	2017-06-13 13:04:22.07241	14	\N	t	f
134	4	0	0		2017-06-13 13:04:22.075065	2017-06-13 13:04:22.075065	14	\N	t	f
135	5	0	0		2017-06-13 13:04:22.077707	2017-06-13 13:04:22.077707	14	\N	t	f
136	6	0	0		2017-06-13 13:04:22.080432	2017-06-13 13:04:22.080432	14	\N	t	f
137	7	0	0		2017-06-13 13:04:22.083025	2017-06-13 13:04:22.083025	14	\N	t	f
138	8	0	0		2017-06-13 13:04:22.08582	2017-06-13 13:04:22.08582	14	\N	t	f
139	9	0	0		2017-06-13 13:04:22.088602	2017-06-13 13:04:22.088602	14	\N	t	f
140	10	0	0		2017-06-13 13:04:22.091397	2017-06-13 13:04:22.091397	14	\N	t	f
141	1	0	0		2017-06-13 13:04:22.183265	2017-06-13 13:04:22.183265	15	\N	t	f
142	2	0	0		2017-06-13 13:04:22.186118	2017-06-13 13:04:22.186118	15	\N	t	f
143	3	0	0		2017-06-13 13:04:22.18877	2017-06-13 13:04:22.18877	15	\N	t	f
144	4	0	0		2017-06-13 13:04:22.191582	2017-06-13 13:04:22.191582	15	\N	t	f
145	5	0	0		2017-06-13 13:04:22.194214	2017-06-13 13:04:22.194214	15	\N	t	f
146	6	0	0		2017-06-13 13:04:22.197034	2017-06-13 13:04:22.197034	15	\N	t	f
147	7	0	0		2017-06-13 13:04:22.199787	2017-06-13 13:04:22.199787	15	\N	t	f
148	8	0	0		2017-06-13 13:04:22.202801	2017-06-13 13:04:22.202801	15	\N	t	f
149	9	0	0		2017-06-13 13:04:22.20546	2017-06-13 13:04:22.20546	15	\N	t	f
150	10	0	0		2017-06-13 13:04:22.208137	2017-06-13 13:04:22.208137	15	\N	t	f
151	1	0	0		2017-06-13 13:04:22.302076	2017-06-13 13:04:22.302076	16	\N	t	f
152	2	0	0		2017-06-13 13:04:22.305211	2017-06-13 13:04:22.305211	16	\N	t	f
153	3	0	0		2017-06-13 13:04:22.30813	2017-06-13 13:04:22.30813	16	\N	t	f
154	4	0	0		2017-06-13 13:04:22.310992	2017-06-13 13:04:22.310992	16	\N	t	f
155	5	0	0		2017-06-13 13:04:22.313534	2017-06-13 13:04:22.313534	16	\N	t	f
156	6	0	0		2017-06-13 13:04:22.316382	2017-06-13 13:04:22.316382	16	\N	t	f
157	7	0	0		2017-06-13 13:04:22.319169	2017-06-13 13:04:22.319169	16	\N	t	f
158	8	0	0		2017-06-13 13:04:22.322083	2017-06-13 13:04:22.322083	16	\N	t	f
159	9	0	0		2017-06-13 13:04:22.324916	2017-06-13 13:04:22.324916	16	\N	t	f
160	10	0	0		2017-06-13 13:04:22.327888	2017-06-13 13:04:22.327888	16	\N	t	f
161	1	0	0		2017-06-13 13:04:22.422859	2017-06-13 13:04:22.422859	17	\N	t	f
162	2	0	0		2017-06-13 13:04:22.425777	2017-06-13 13:04:22.425777	17	\N	t	f
163	3	0	0		2017-06-13 13:04:22.428605	2017-06-13 13:04:22.428605	17	\N	t	f
164	4	0	0		2017-06-13 13:04:22.431333	2017-06-13 13:04:22.431333	17	\N	t	f
165	5	0	0		2017-06-13 13:04:22.434012	2017-06-13 13:04:22.434012	17	\N	t	f
166	6	0	0		2017-06-13 13:04:22.436803	2017-06-13 13:04:22.436803	17	\N	t	f
167	7	0	0		2017-06-13 13:04:22.439495	2017-06-13 13:04:22.439495	17	\N	t	f
168	8	0	0		2017-06-13 13:04:22.44216	2017-06-13 13:04:22.44216	17	\N	t	f
169	9	0	0		2017-06-13 13:04:22.444986	2017-06-13 13:04:22.444986	17	\N	t	f
170	10	0	0		2017-06-13 13:04:22.447751	2017-06-13 13:04:22.447751	17	\N	t	f
171	1	0	0		2017-06-13 13:04:22.544321	2017-06-13 13:04:22.544321	18	\N	t	f
172	2	0	0		2017-06-13 13:04:22.547058	2017-06-13 13:04:22.547058	18	\N	t	f
173	3	0	0		2017-06-13 13:04:22.549802	2017-06-13 13:04:22.549802	18	\N	t	f
174	4	0	0		2017-06-13 13:04:22.552664	2017-06-13 13:04:22.552664	18	\N	t	f
175	5	0	0		2017-06-13 13:04:22.555369	2017-06-13 13:04:22.555369	18	\N	t	f
176	6	0	0		2017-06-13 13:04:22.558147	2017-06-13 13:04:22.558147	18	\N	t	f
177	7	0	0		2017-06-13 13:04:22.560952	2017-06-13 13:04:22.560952	18	\N	t	f
178	8	0	0		2017-06-13 13:04:22.563689	2017-06-13 13:04:22.563689	18	\N	t	f
179	9	0	0		2017-06-13 13:04:22.566145	2017-06-13 13:04:22.566145	18	\N	t	f
180	10	0	0		2017-06-13 13:04:22.569022	2017-06-13 13:04:22.569022	18	\N	t	f
181	1	0	0		2017-06-13 13:04:22.663477	2017-06-13 13:04:22.663477	19	\N	t	f
182	2	0	0		2017-06-13 13:04:22.666316	2017-06-13 13:04:22.666316	19	\N	t	f
183	3	0	0		2017-06-13 13:04:22.669284	2017-06-13 13:04:22.669284	19	\N	t	f
184	4	0	0		2017-06-13 13:04:22.672077	2017-06-13 13:04:22.672077	19	\N	t	f
185	5	0	0		2017-06-13 13:04:22.674799	2017-06-13 13:04:22.674799	19	\N	t	f
186	6	0	0		2017-06-13 13:04:22.677608	2017-06-13 13:04:22.677608	19	\N	t	f
187	7	0	0		2017-06-13 13:04:22.680474	2017-06-13 13:04:22.680474	19	\N	t	f
188	8	0	0		2017-06-13 13:04:22.683328	2017-06-13 13:04:22.683328	19	\N	t	f
189	9	0	0		2017-06-13 13:04:22.686096	2017-06-13 13:04:22.686096	19	\N	t	f
190	10	0	0		2017-06-13 13:04:22.688979	2017-06-13 13:04:22.688979	19	\N	t	f
191	1	0	0		2017-06-13 13:04:22.783797	2017-06-13 13:04:22.783797	20	\N	t	f
192	2	0	0		2017-06-13 13:04:22.786828	2017-06-13 13:04:22.786828	20	\N	t	f
193	3	0	0		2017-06-13 13:04:22.7895	2017-06-13 13:04:22.7895	20	\N	t	f
194	4	0	0		2017-06-13 13:04:22.791834	2017-06-13 13:04:22.791834	20	\N	t	f
195	5	0	0		2017-06-13 13:04:22.794275	2017-06-13 13:04:22.794275	20	\N	t	f
196	6	0	0		2017-06-13 13:04:22.796928	2017-06-13 13:04:22.796928	20	\N	t	f
197	7	0	0		2017-06-13 13:04:22.799737	2017-06-13 13:04:22.799737	20	\N	t	f
198	8	0	0		2017-06-13 13:04:22.802479	2017-06-13 13:04:22.802479	20	\N	t	f
199	9	0	0		2017-06-13 13:04:22.805158	2017-06-13 13:04:22.805158	20	\N	t	f
200	10	0	0		2017-06-13 13:04:22.808037	2017-06-13 13:04:22.808037	20	\N	t	f
201	1	0	0		2017-06-13 13:04:22.900476	2017-06-13 13:04:22.900476	21	\N	t	f
202	2	0	0		2017-06-13 13:04:22.903765	2017-06-13 13:04:22.903765	21	\N	t	f
203	3	0	0		2017-06-13 13:04:22.906472	2017-06-13 13:04:22.906472	21	\N	t	f
204	4	0	0		2017-06-13 13:04:22.909052	2017-06-13 13:04:22.909052	21	\N	t	f
205	5	0	0		2017-06-13 13:04:22.911676	2017-06-13 13:04:22.911676	21	\N	t	f
206	6	0	0		2017-06-13 13:04:22.914566	2017-06-13 13:04:22.914566	21	\N	t	f
207	7	0	0		2017-06-13 13:04:22.927027	2017-06-13 13:04:22.927027	21	\N	t	f
208	8	0	0		2017-06-13 13:04:22.929564	2017-06-13 13:04:22.929564	21	\N	t	f
209	9	0	0		2017-06-13 13:04:22.932213	2017-06-13 13:04:22.932213	21	\N	t	f
210	10	0	0		2017-06-13 13:04:22.934815	2017-06-13 13:04:22.934815	21	\N	t	f
211	1	0	0		2017-06-13 13:04:23.028709	2017-06-13 13:04:23.028709	22	\N	t	f
212	2	0	0		2017-06-13 13:04:23.031624	2017-06-13 13:04:23.031624	22	\N	t	f
213	3	0	0		2017-06-13 13:04:23.034378	2017-06-13 13:04:23.034378	22	\N	t	f
214	4	0	0		2017-06-13 13:04:23.037009	2017-06-13 13:04:23.037009	22	\N	t	f
215	5	0	0		2017-06-13 13:04:23.039629	2017-06-13 13:04:23.039629	22	\N	t	f
216	6	0	0		2017-06-13 13:04:23.042325	2017-06-13 13:04:23.042325	22	\N	t	f
217	7	0	0		2017-06-13 13:04:23.044744	2017-06-13 13:04:23.044744	22	\N	t	f
218	8	0	0		2017-06-13 13:04:23.047367	2017-06-13 13:04:23.047367	22	\N	t	f
219	9	0	0		2017-06-13 13:04:23.050106	2017-06-13 13:04:23.050106	22	\N	t	f
220	10	0	0		2017-06-13 13:04:23.052868	2017-06-13 13:04:23.052868	22	\N	t	f
221	1	0	0		2017-06-13 13:04:23.141378	2017-06-13 13:04:23.141378	23	\N	t	f
222	2	0	0		2017-06-13 13:04:23.144227	2017-06-13 13:04:23.144227	23	\N	t	f
223	3	0	0		2017-06-13 13:04:23.146949	2017-06-13 13:04:23.146949	23	\N	t	f
224	4	0	0		2017-06-13 13:04:23.149549	2017-06-13 13:04:23.149549	23	\N	t	f
225	5	0	0		2017-06-13 13:04:23.15204	2017-06-13 13:04:23.15204	23	\N	t	f
226	6	0	0		2017-06-13 13:04:23.15494	2017-06-13 13:04:23.15494	23	\N	t	f
227	7	0	0		2017-06-13 13:04:23.15772	2017-06-13 13:04:23.15772	23	\N	t	f
228	8	0	0		2017-06-13 13:04:23.160454	2017-06-13 13:04:23.160454	23	\N	t	f
229	9	0	0		2017-06-13 13:04:23.163385	2017-06-13 13:04:23.163385	23	\N	t	f
230	10	0	0		2017-06-13 13:04:23.166114	2017-06-13 13:04:23.166114	23	\N	t	f
231	1	0	0		2017-06-13 13:04:23.25928	2017-06-13 13:04:23.25928	24	\N	t	f
232	2	0	0		2017-06-13 13:04:23.262104	2017-06-13 13:04:23.262104	24	\N	t	f
233	3	0	0		2017-06-13 13:04:23.264524	2017-06-13 13:04:23.264524	24	\N	t	f
234	4	0	0		2017-06-13 13:04:23.266928	2017-06-13 13:04:23.266928	24	\N	t	f
235	5	0	0		2017-06-13 13:04:23.26957	2017-06-13 13:04:23.26957	24	\N	t	f
236	6	0	0		2017-06-13 13:04:23.27235	2017-06-13 13:04:23.27235	24	\N	t	f
237	7	0	0		2017-06-13 13:04:23.275103	2017-06-13 13:04:23.275103	24	\N	t	f
238	8	0	0		2017-06-13 13:04:23.277902	2017-06-13 13:04:23.277902	24	\N	t	f
239	9	0	0		2017-06-13 13:04:23.280662	2017-06-13 13:04:23.280662	24	\N	t	f
240	10	0	0		2017-06-13 13:04:23.283317	2017-06-13 13:04:23.283317	24	\N	t	f
241	1	0	0		2017-06-13 13:04:23.37656	2017-06-13 13:04:23.37656	25	\N	t	f
242	2	0	0		2017-06-13 13:04:23.379383	2017-06-13 13:04:23.379383	25	\N	t	f
243	3	0	0		2017-06-13 13:04:23.381954	2017-06-13 13:04:23.381954	25	\N	t	f
244	4	0	0		2017-06-13 13:04:23.38458	2017-06-13 13:04:23.38458	25	\N	t	f
245	5	0	0		2017-06-13 13:04:23.387244	2017-06-13 13:04:23.387244	25	\N	t	f
246	6	0	0		2017-06-13 13:04:23.389841	2017-06-13 13:04:23.389841	25	\N	t	f
247	7	0	0		2017-06-13 13:04:23.3924	2017-06-13 13:04:23.3924	25	\N	t	f
248	8	0	0		2017-06-13 13:04:23.395094	2017-06-13 13:04:23.395094	25	\N	t	f
249	9	0	0		2017-06-13 13:04:23.39776	2017-06-13 13:04:23.39776	25	\N	t	f
250	10	0	0		2017-06-13 13:04:23.400486	2017-06-13 13:04:23.400486	25	\N	t	f
251	1	0	0		2017-06-13 13:04:23.496612	2017-06-13 13:04:23.496612	26	\N	t	f
252	2	0	0		2017-06-13 13:04:23.499347	2017-06-13 13:04:23.499347	26	\N	t	f
253	3	0	0		2017-06-13 13:04:23.501972	2017-06-13 13:04:23.501972	26	\N	t	f
254	4	0	0		2017-06-13 13:04:23.50454	2017-06-13 13:04:23.50454	26	\N	t	f
255	5	0	0		2017-06-13 13:04:23.507292	2017-06-13 13:04:23.507292	26	\N	t	f
256	6	0	0		2017-06-13 13:04:23.509945	2017-06-13 13:04:23.509945	26	\N	t	f
257	7	0	0		2017-06-13 13:04:23.512587	2017-06-13 13:04:23.512587	26	\N	t	f
258	8	0	0		2017-06-13 13:04:23.515319	2017-06-13 13:04:23.515319	26	\N	t	f
259	9	0	0		2017-06-13 13:04:23.518133	2017-06-13 13:04:23.518133	26	\N	t	f
260	10	0	0		2017-06-13 13:04:23.520643	2017-06-13 13:04:23.520643	26	\N	t	f
261	1	0	0		2017-06-13 13:04:23.613078	2017-06-13 13:04:23.613078	27	\N	t	f
262	2	0	0		2017-06-13 13:04:23.615791	2017-06-13 13:04:23.615791	27	\N	t	f
263	3	0	0		2017-06-13 13:04:23.618446	2017-06-13 13:04:23.618446	27	\N	t	f
264	4	0	0		2017-06-13 13:04:23.62111	2017-06-13 13:04:23.62111	27	\N	t	f
265	5	0	0		2017-06-13 13:04:23.623739	2017-06-13 13:04:23.623739	27	\N	t	f
266	6	0	0		2017-06-13 13:04:23.62652	2017-06-13 13:04:23.62652	27	\N	t	f
267	7	0	0		2017-06-13 13:04:23.629136	2017-06-13 13:04:23.629136	27	\N	t	f
268	8	0	0		2017-06-13 13:04:23.631905	2017-06-13 13:04:23.631905	27	\N	t	f
269	9	0	0		2017-06-13 13:04:23.634698	2017-06-13 13:04:23.634698	27	\N	t	f
270	10	0	0		2017-06-13 13:04:23.637504	2017-06-13 13:04:23.637504	27	\N	t	f
271	1	0	0		2017-06-13 13:04:23.727877	2017-06-13 13:04:23.727877	28	\N	t	f
272	2	0	0		2017-06-13 13:04:23.730722	2017-06-13 13:04:23.730722	28	\N	t	f
273	3	0	0		2017-06-13 13:04:23.73354	2017-06-13 13:04:23.73354	28	\N	t	f
274	4	0	0		2017-06-13 13:04:23.736307	2017-06-13 13:04:23.736307	28	\N	t	f
275	5	0	0		2017-06-13 13:04:23.739102	2017-06-13 13:04:23.739102	28	\N	t	f
276	6	0	0		2017-06-13 13:04:23.741617	2017-06-13 13:04:23.741617	28	\N	t	f
277	7	0	0		2017-06-13 13:04:23.74426	2017-06-13 13:04:23.74426	28	\N	t	f
278	8	0	0		2017-06-13 13:04:23.74707	2017-06-13 13:04:23.74707	28	\N	t	f
279	9	0	0		2017-06-13 13:04:23.749974	2017-06-13 13:04:23.749974	28	\N	t	f
280	10	0	0		2017-06-13 13:04:23.752736	2017-06-13 13:04:23.752736	28	\N	t	f
281	1	0	0		2017-06-13 13:04:23.84696	2017-06-13 13:04:23.84696	29	\N	t	f
282	2	0	0		2017-06-13 13:04:23.849736	2017-06-13 13:04:23.849736	29	\N	t	f
283	3	0	0		2017-06-13 13:04:23.85219	2017-06-13 13:04:23.85219	29	\N	t	f
284	4	0	0		2017-06-13 13:04:23.854714	2017-06-13 13:04:23.854714	29	\N	t	f
285	5	0	0		2017-06-13 13:04:23.857349	2017-06-13 13:04:23.857349	29	\N	t	f
286	6	0	0		2017-06-13 13:04:23.860028	2017-06-13 13:04:23.860028	29	\N	t	f
287	7	0	0		2017-06-13 13:04:23.862876	2017-06-13 13:04:23.862876	29	\N	t	f
288	8	0	0		2017-06-13 13:04:23.865716	2017-06-13 13:04:23.865716	29	\N	t	f
289	9	0	0		2017-06-13 13:04:23.868215	2017-06-13 13:04:23.868215	29	\N	t	f
290	10	0	0		2017-06-13 13:04:23.870969	2017-06-13 13:04:23.870969	29	\N	t	f
291	1	0	0		2017-06-13 13:04:23.965496	2017-06-13 13:04:23.965496	30	\N	t	f
292	2	0	0		2017-06-13 13:04:23.968328	2017-06-13 13:04:23.968328	30	\N	t	f
293	3	0	0		2017-06-13 13:04:23.971055	2017-06-13 13:04:23.971055	30	\N	t	f
294	4	0	0		2017-06-13 13:04:23.973834	2017-06-13 13:04:23.973834	30	\N	t	f
295	5	0	0		2017-06-13 13:04:23.976575	2017-06-13 13:04:23.976575	30	\N	t	f
296	6	0	0		2017-06-13 13:04:23.979177	2017-06-13 13:04:23.979177	30	\N	t	f
297	7	0	0		2017-06-13 13:04:23.981453	2017-06-13 13:04:23.981453	30	\N	t	f
298	8	0	0		2017-06-13 13:04:23.983986	2017-06-13 13:04:23.983986	30	\N	t	f
299	9	0	0		2017-06-13 13:04:23.986799	2017-06-13 13:04:23.986799	30	\N	t	f
300	10	0	0		2017-06-13 13:04:23.989777	2017-06-13 13:04:23.989777	30	\N	t	f
301	1	0	0		2017-06-13 13:04:24.080968	2017-06-13 13:04:24.080968	31	\N	t	f
302	2	0	0		2017-06-13 13:04:24.083669	2017-06-13 13:04:24.083669	31	\N	t	f
303	3	0	0		2017-06-13 13:04:24.0862	2017-06-13 13:04:24.0862	31	\N	t	f
304	4	0	0		2017-06-13 13:04:24.088979	2017-06-13 13:04:24.088979	31	\N	t	f
305	5	0	0		2017-06-13 13:04:24.091748	2017-06-13 13:04:24.091748	31	\N	t	f
306	6	0	0		2017-06-13 13:04:24.094317	2017-06-13 13:04:24.094317	31	\N	t	f
307	7	0	0		2017-06-13 13:04:24.096922	2017-06-13 13:04:24.096922	31	\N	t	f
308	8	0	0		2017-06-13 13:04:24.099318	2017-06-13 13:04:24.099318	31	\N	t	f
309	9	0	0		2017-06-13 13:04:24.102046	2017-06-13 13:04:24.102046	31	\N	t	f
310	10	0	0		2017-06-13 13:04:24.104616	2017-06-13 13:04:24.104616	31	\N	t	f
311	1	0	0		2017-06-13 13:04:24.193873	2017-06-13 13:04:24.193873	32	\N	t	f
312	2	0	0		2017-06-13 13:04:24.196541	2017-06-13 13:04:24.196541	32	\N	t	f
313	3	0	0		2017-06-13 13:04:24.199395	2017-06-13 13:04:24.199395	32	\N	t	f
314	4	0	0		2017-06-13 13:04:24.202181	2017-06-13 13:04:24.202181	32	\N	t	f
315	5	0	0		2017-06-13 13:04:24.205002	2017-06-13 13:04:24.205002	32	\N	t	f
316	6	0	0		2017-06-13 13:04:24.207811	2017-06-13 13:04:24.207811	32	\N	t	f
317	7	0	0		2017-06-13 13:04:24.210603	2017-06-13 13:04:24.210603	32	\N	t	f
318	8	0	0		2017-06-13 13:04:24.213457	2017-06-13 13:04:24.213457	32	\N	t	f
319	9	0	0		2017-06-13 13:04:24.216176	2017-06-13 13:04:24.216176	32	\N	t	f
320	10	0	0		2017-06-13 13:04:24.219027	2017-06-13 13:04:24.219027	32	\N	t	f
321	1	0	0		2017-06-13 13:04:24.3161	2017-06-13 13:04:24.3161	33	\N	t	f
322	2	0	0		2017-06-13 13:04:24.318701	2017-06-13 13:04:24.318701	33	\N	t	f
323	3	0	0		2017-06-13 13:04:24.321542	2017-06-13 13:04:24.321542	33	\N	t	f
324	4	0	0		2017-06-13 13:04:24.333814	2017-06-13 13:04:24.333814	33	\N	t	f
325	5	0	0		2017-06-13 13:04:24.336321	2017-06-13 13:04:24.336321	33	\N	t	f
326	6	0	0		2017-06-13 13:04:24.338768	2017-06-13 13:04:24.338768	33	\N	t	f
327	7	0	0		2017-06-13 13:04:24.341212	2017-06-13 13:04:24.341212	33	\N	t	f
328	8	0	0		2017-06-13 13:04:24.343877	2017-06-13 13:04:24.343877	33	\N	t	f
329	9	0	0		2017-06-13 13:04:24.346731	2017-06-13 13:04:24.346731	33	\N	t	f
330	10	0	0		2017-06-13 13:04:24.349414	2017-06-13 13:04:24.349414	33	\N	t	f
331	1	0	0		2017-06-13 13:04:24.441537	2017-06-13 13:04:24.441537	34	\N	t	f
332	2	0	0		2017-06-13 13:04:24.44439	2017-06-13 13:04:24.44439	34	\N	t	f
333	3	0	0		2017-06-13 13:04:24.447284	2017-06-13 13:04:24.447284	34	\N	t	f
334	4	0	0		2017-06-13 13:04:24.450088	2017-06-13 13:04:24.450088	34	\N	t	f
335	5	0	0		2017-06-13 13:04:24.452801	2017-06-13 13:04:24.452801	34	\N	t	f
336	6	0	0		2017-06-13 13:04:24.455683	2017-06-13 13:04:24.455683	34	\N	t	f
337	7	0	0		2017-06-13 13:04:24.458566	2017-06-13 13:04:24.458566	34	\N	t	f
338	8	0	0		2017-06-13 13:04:24.461458	2017-06-13 13:04:24.461458	34	\N	t	f
339	9	0	0		2017-06-13 13:04:24.464427	2017-06-13 13:04:24.464427	34	\N	t	f
340	10	0	0		2017-06-13 13:04:24.467087	2017-06-13 13:04:24.467087	34	\N	t	f
\.


--
-- Name: student_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('student_subjects_id_seq', 340, true);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY students (id, first_name, last_name, gpa, created_at, updated_at, iden_number, code_number, room_state, blood, birthdate, address, call, zip_code, ability, nationality, ethnicity, district, parish, city, prefix, delete_status, username, password_digest, image) FROM stdin;
1	กฤชรัช  	โชติพัฒนถาวร	\N	2017-06-13 13:04:20.486449	2017-06-13 13:04:20.486449	\N	259001	\N	\N	\N	9/9 ม.4 ถ.แสงชูโต ต.ปากแรต อ.บ้านโป่ง จ.ราชบุรี	095-6644246	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259001	$2a$10$zs2aWKjOCs6MBWETF0RCXeBNGZfGNYa1qdxo.mHqSPk7.7CtdHxae	\N
2	กานต์นิธิ  	ศักดิ์ศรียุทธนา	\N	2017-06-13 13:04:20.625214	2017-06-13 13:04:20.625214	\N	259002	\N	\N	\N	201/5 ม.4  ต.สามง่าม อ.ดอนตูม จ.นครปฐม	098-6496463	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259002	$2a$10$aM2No3KI5IfanHF87GGlVO/hIGKQvVH3X1ABr1aNSRXcCX.xEEj46	\N
3	คีรีภาร์กร  	ทองนพรัตน์	\N	2017-06-13 13:04:20.740171	2017-06-13 13:04:20.740171	\N	259003	\N	\N	\N	16/8 ม.6 ถ.พระประโทน ต.ตลาดจินดา อ.สามพราน จ.นครปฐม	083-2921688	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259003	$2a$10$7pWP6AllON3kEuSutqRKR.beSGkbDjgEpMTMpsSLM2ug/apYIKgFu	\N
4	จิณณ์ณภัทร  	พรสมบูรณ์ศิริ	\N	2017-06-13 13:04:20.855748	2017-06-13 13:04:20.855748	\N	259004	\N	\N	\N	183  ม.1 ถ.เศรษฐวิถี  ต.สามง่าม อ.ดอนตูม จ.นครปฐม	092-4939096	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259004	$2a$10$DD5LAvXNgPvc/qM7D2UXNennCkr1dDxjd/HUhPs3LUDrh43e9Mkte	\N
5	จิณณะ  	อังสุวรรณ	\N	2017-06-13 13:04:20.973899	2017-06-13 13:04:20.973899	\N	259005	\N	\N	\N	98/112 ม.7 ถ.ปลายบาง ต.มหาสวัสดิ์ อ.บางกรวย จ.นนทบุรี	096-1309010	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259005	$2a$10$z2kvQ0jTFe2dzdv80aN./eNIvLgZEEhlESlZ..kWegQwjNi3JTVZa	\N
6	จิรโรจน์	ธนโชติชัยวัฒน์	\N	2017-06-13 13:04:21.090823	2017-06-13 13:04:21.090823	\N	259006	\N	\N	\N	12/2 ม.4  ต.แหลมบัว อ.นครชัยศรี จ.นครปฐม	093-2699287	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259006	$2a$10$hiQm6cFaX66V3wKpu/qnOeOX7rUjbC5tFbu1UvJybtditFNfGe3C6	\N
7	ณัฏฐกร    	แต้มมาลา	\N	2017-06-13 13:04:21.211258	2017-06-13 13:04:21.211258	\N	259007	\N	\N	\N	1   ถ.เพชรเกษม ซ.เพชรเกษม ต.บางแขม อ.เมือง จ.นครปฐม	081-4493339	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259007	$2a$10$qdYV.f.rL8ydzdsFY6u/m.q1iIqLWFRKXTw9.Schfw/x4LT7hYmSy	\N
8	เต็มถ์ธรรม  	สถิตย์	\N	2017-06-13 13:04:21.334542	2017-06-13 13:04:21.334542	\N	259008	\N	\N	\N	1   ถ.เพชรเกษม 15  ซ.เพชรเกษม 15  ต.ห้วยจรเข้ อ.เมือง จ.นครปฐม	081-9448278	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259008	$2a$10$FKaJCOzSZSCBd4/SgoDKWuDVX9jdT8JXRABD88PjmrBiGGm2bbpDq	\N
9	ธีรัช  	วิจิตร์ปัญญารักษ์	\N	2017-06-13 13:04:21.455825	2017-06-13 13:04:21.455825	\N	259009	\N	\N	\N	194/30-31   ถ.ราชวิถึ  ต.พระปฐมเจดีย์ อ.เมือง จ.นครปฐม	088-7509380	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259009	$2a$10$YiiIBe4P.JPDPWb4QkPG7.FfWWiuUXRcpi5.l0hnRyXsFk1ihfCHu	\N
10	นันทวัฒน์	ปฐมชัยอัมพร	\N	2017-06-13 13:04:21.58267	2017-06-13 13:04:21.58267	\N	259069	\N	\N	\N	119/1   ถ.พุทธรักษา ต.ห้วยจรเข้ อ.เมือง จ.นครปฐม	084-1347292	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259069	$2a$10$Hhi30PeTgNaut88jqSU1F.UDw6vc/5IAL0ve9YENhnIuLzFIyeZ8C	\N
11	พงศ์พล   	ตั้งปริมณฑล	\N	2017-06-13 13:04:21.70034	2017-06-13 13:04:21.70034	\N	259010	\N	\N	\N	29/108 ม.5   ถ.ศาลายา-บางภาษี  ต.ศาลายา อ.พุทธมณฑล จ.นครปฐม	084-5964645	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259010	$2a$10$t4E0YPzffwliIBaKtSZp6OCaEUxYGrDpy8cgZxKgX4d/tLxOfZOLe	\N
12	พัณณพงษ์	วงศ์วรปกรณ์	\N	2017-06-13 13:04:21.823715	2017-06-13 13:04:21.823715	\N	259011	\N	\N	\N	29 ม.14   ถ.เพชรเกษม ต.หนองอ้อ อ.บ้านโป่ง จ.ราชบุรี	092-6965566	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259011	$2a$10$AXZ.7DjWSTJI6DNbJ7OmMeHRglqnTX00eNlAOBLWEETytzUcMNL4e	\N
13	ภานพ	เทียมเมธา	\N	2017-06-13 13:04:21.93853	2017-06-13 13:04:21.93853	\N	259012	\N	\N	\N	223/3 ม.3  ต.เบิกไพร อ.บ้านโป่ง จ.ราชบุรี	083-0194419	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259012	$2a$10$NYlnXkXXIUnczuzl4d0TEehzqE2TQIwWd.J8exTCTIqAPqQBbAOd6	\N
14	ภูดิศ	ไกรฤกษ์	\N	2017-06-13 13:04:22.053649	2017-06-13 13:04:22.053649	\N	259013	\N	\N	\N	223/6 ม. 10   ถ.นาขุม ซ.23  ต.พระปฐมเจดีย์ อ.เมือง จ.นครปฐม	082-4924565	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259013	$2a$10$g8ogAjc677r0gTazyG1EX.f6tytCA6Q/l9i6e5XbErTG.E2A.6Edm	\N
15	เลนนอน  	จอห์นสัน	\N	2017-06-13 13:04:22.170613	2017-06-13 13:04:22.170613	\N	259014	\N	\N	\N	28/64   ถ.ยิงเป้า ต.สนามจันทร์ อ.เมือง จ.นครปฐม	081-4026491	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259014	$2a$10$S7xBMXvJi2NIy8XcPIEWKeOJtOEhxdEOKWIq1gouSob816C6aOIxa	\N
16	วชิรวิทย์  	สมถวิล	\N	2017-06-13 13:04:22.288533	2017-06-13 13:04:22.288533	\N	259015	\N	\N	\N	13 ม.5   ต.สระกระเทียม อ.เมือง จ.นครปฐม	095-5347955	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259015	$2a$10$2DveUyDwFIWuhmzigIvVoO28.rGLcqvozu0bIL7wJMZecd3fJr/Uu	\N
17	วุฒิภัทร  	ฉายศรีศิริ	\N	2017-06-13 13:04:22.409448	2017-06-13 13:04:22.409448	\N	259016	\N	\N	\N	313/10   ถ.พิพิธประสาท ซ.25 มกราซอย9  ต.พระปฐมเจดีย์ อ.เมืองนครปฐม จ.นครปฐม	092-2765236	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259016	$2a$10$mAwe3B4dNQjkrp3qngj1r.j0AZlGoB6n/VjwhgG73kJChDjSS5h7q	\N
18	เศรษฐณัฏฐ์  	อิ่มนุกูลกิจ	\N	2017-06-13 13:04:22.53051	2017-06-13 13:04:22.53051	\N	259017	\N	\N	\N	1/22 ม.6   ม.ลีลาวดี  ต.วังตะกู อ.เมืองนครปฐม จ.นครปฐม	089-8188131	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259017	$2a$10$jASs.aGHl6mEsZeTTubFAuK1N2tR0SsSwyKp8/Nrb63I01GgCecte	\N
19	อาชวิน	เทพไชย	\N	2017-06-13 13:04:22.650074	2017-06-13 13:04:22.650074	\N	259018	\N	\N	\N	61   ซ.กุมภิล6  ต.ห้วยจรเข้ อ.เมือง จ.นครปฐม	089-1491483	\N	\N	\N	\N	\N	\N	\N	เด็กชาย	\N	259018	$2a$10$xXb/VmYdrz7f5YzNCDyXuOoJgxc3clNoSXer2IKsXfDbJbrFAJ8Y2	\N
20	กรจิรา  	นันทานิช	\N	2017-06-13 13:04:22.770817	2017-06-13 13:04:22.770817	\N	259019	\N	\N	\N	101/2 ม.4   ถ.เพชรเกษมเก่า  ต.บ้านฆ้อง อ.โพธาราม จ.ราชบุรี	094-9419416	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259019	$2a$10$8DZlmusONzU11sKa.u8LBen0Q1fRdjh/k2/wiop5PIiKNd5bV2EO.	\N
21	กวินตรา	สุขภูศรี	\N	2017-06-13 13:04:22.887999	2017-06-13 13:04:22.887999	\N	259020	\N	\N	\N	42/1 ม.3    ต.ห้วยจรเข้ อ.เมือง จ.นครปฐม	086-3353046	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259020	$2a$10$S8TmEeKePSI86g7eWddeC.oC/t/i5S.vl.CsgUUnLYU8otbsRP9Uy	\N
22	กัญจน์นิกข์	เพ็ชรละออ	\N	2017-06-13 13:04:23.015961	2017-06-13 13:04:23.015961	\N	259021	\N	\N	\N	28/4 ม.1    ต.พะเนียด อ.นครชัยศรี จ.นครปฐม	096-2499903	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259021	$2a$10$l7uujbW0vJviNmZXHKfPSOdmrlShXzIe8rjAyKxnEuq1gmXzmj4Xu	\N
23	จันทิมา	เลี้ยงอยู่	\N	2017-06-13 13:04:23.128692	2017-06-13 13:04:23.128692	\N	259022	\N	\N	\N	93/3 ม.11    ต.ตลาดจินดา อ.สามพราน จ.นครปฐม	086-6296760	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259022	$2a$10$SXdC/CYrJO9z432fqLX.cenaGWqQ0a4/dx7KIQ4crCtKkUgh.avNu	\N
24	ชญากานต์	ชำนาญกิจ	\N	2017-06-13 13:04:23.24594	2017-06-13 13:04:23.24594	\N	259023	\N	\N	\N	85/155   มบ.นันทวันอุทยาน-อักษะ ถ.อุทยาน  ต.สาลายา อ.พุทธมณฑล จ.นครปฐม	081-6296015	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259023	$2a$10$4H/sSQSFdgKVRaD9EeaMleoE2ozZJf1iQm/GhRA63Q41RZ.u3HVNy	\N
25	ณภัทรสร  	ศิลปชัย	\N	2017-06-13 13:04:23.363221	2017-06-13 13:04:23.363221	\N	259024	\N	\N	\N	272   ถ.มาลัยแมน ต.หนองปากโลง อ.เมือง จ.นครปฐม	081-8802634	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259024	$2a$10$tXiNPPIb.qrme3kxEycqseBxW54DC6AhgwhMJypRFV3A7TZAz5JHG	\N
26	ณัฐวีร์  	เจียรสมจิตร	\N	2017-06-13 13:04:23.48364	2017-06-13 13:04:23.48364	\N	259025	\N	\N	\N	6/42    ต.พระปฐมเจดีย์ อ.เมือง จ.นครปฐม	081-8505595	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259025	$2a$10$4zzxRXyO2bbhxE4XnOZh6evO9F6xjL59/steHox0cOhebbxizl/3S	\N
27	นรกมล	ชาวเฉียง	\N	2017-06-13 13:04:23.600046	2017-06-13 13:04:23.600046	\N	259070	\N	\N	\N	221 ม.8 ต.สามพราน อ.สามพราน จ.นครปฐม	092-6247993	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259070	$2a$10$oD5UXHIskOTq5glZ0rAg9u3.sjzi14cjyxCn8W2RpSq30cOosHJae	\N
28	นันนภัทร  	นิธิพงศ์ไพศาล	\N	2017-06-13 13:04:23.714282	2017-06-13 13:04:23.714282	\N	259026	\N	\N	\N	33/2 ม.4   ต.สวนกล้วย อ.บ้านโป่ง จ.ราชบุรี	089-9292956	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259026	$2a$10$Oe5SrIUESlax8NM16kKexe0fdN.Z8t3wKB7Ad.jEQ7dueyigt96o2	\N
29	นิติภา  	วัยนิพิฐพงษ์	\N	2017-06-13 13:04:23.833607	2017-06-13 13:04:23.833607	\N	259027	\N	\N	\N	13 ม.1   ถ.บ้านแพ้ว-หลักห้า ซ.เพิ่มทรัพย์ทวีโชค ต.หนองบัว อ.บ้านแพ้ว จ.สมุทรสาคร	089-8377600	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259027	$2a$10$uq9iujrwGCP5qzVDj.TXLedZjGACVFTTQ9BWfcfi8weBP2Y60EAnW	\N
30	ปวีร์รักษ์	รุจิวัฒนานนท์	\N	2017-06-13 13:04:23.952193	2017-06-13 13:04:23.952193	\N	259029	\N	\N	\N	52/25-26   ถ.ทางรถไฟตะวันตก ต.พระปฐมเจดีย์ อ.เมือง จ.นครปฐม	086-8883604	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259029	$2a$10$rFvkG/fQDyH3K8qlwTDzwewpdMDhiv83YFpXG40SiL/4TY1p8/Nea	\N
31	พริมตา  	ตั้งไพบูลย์	\N	2017-06-13 13:04:24.068059	2017-06-13 13:04:24.068059	\N	259030	\N	\N	\N	420   ถ.หน้าพระ  ต.ห้วยจรเข้ อ.เมือง จ.นครปฐม	081-8808673	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259030	$2a$10$PkPYwe7wMnv3r2TUyOWw0.ouSSeXaa4NXn5Vocv9Bo2JUoU1uKjmm	\N
32	ภคมน  	สหฤทานันท์	\N	2017-06-13 13:04:24.181777	2017-06-13 13:04:24.181777	\N	259031	\N	\N	\N	82/7   ถ.เทศา ซ.สานนท์ ต.พระปฐมเจดีย์ อ.เมือง จ.นครปฐม	088-3598988	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259031	$2a$10$qWtfLcsWzwe3wPHpSTwUlOqGcUmV3UVkNVYOmTTxkDTw86uWi2yVC	\N
33	วริษฐา  	เต็งประยูรศรี	\N	2017-06-13 13:04:24.302725	2017-06-13 13:04:24.302725	\N	259032	\N	\N	\N	16/6 ม.7   ซ.รางยอ ต.ลำพยา อ.เมือง จ.นครปฐม	081-3458556	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259032	$2a$10$N991NX3wnwANQJhPPID6EO0odExffNCOmZ0XUk2pFNq8X31bwTy9.	\N
34	สุทัตตา	ปฐมพีรกุล	\N	2017-06-13 13:04:24.428934	2017-06-13 13:04:24.428934	\N	259033	\N	\N	\N	602/7-8   ถ.ทางรถไฟตะวันตก ต.พระปฐมเจดีย์ อ.เมือง จ.นครปฐม	090-2462465	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259033	$2a$10$5sfG3mXgiMMFh1f3ptSt0eK1Te1urPMrWHBErbSUTPgZwImUAz.dK	\N
\.


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('students_id_seq', 34, true);


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY subjects (id, name, created_at, updated_at, code, hour_per_year, course_list_id, credit, status) FROM stdin;
1	ภาษาไทย 1	2017-06-13 12:05:34.336733	2017-06-13 12:05:34.336733	ท11101	200	1	5	วิชาหลัก
2	คณิตศาสตร์ 1	2017-06-13 12:07:28.609836	2017-06-13 12:07:28.609836	ค11101	200	1	5	วิชาหลัก
3	วิทยาศาสตร์ 1	2017-06-13 12:29:12.024715	2017-06-13 12:29:12.024715	ว11101	80	1	2	วิชาหลัก
4	สังคมศึกษา ศาสนา และวัฒนธรรม 1	2017-06-13 12:30:03.358182	2017-06-13 12:30:03.358182	ส11101	80	1	2	วิชาหลัก
5	สุขศึกษาและพลศึกษา 1	2017-06-13 12:30:34.086509	2017-06-13 12:30:34.086509	พ11101	80	1	2	วิชาหลัก
6	ศิลปะ 1	2017-06-13 12:31:07.859533	2017-06-13 12:31:07.859533	ศ11101	120	1	3	วิชาหลัก
7	การงานอาชีพและเทคโนโลยี 1	2017-06-13 12:31:42.566421	2017-06-13 12:31:42.566421	ง11101	40	1	1	วิชาหลัก
8	ภาษาอังกฤษ 1	2017-06-13 12:32:23.696262	2017-06-13 12:32:23.696262	อ11101	80	1	2	วิชาหลัก
9	ประวัติศาสตร์ 1	2017-06-13 12:33:42.052621	2017-06-13 12:33:42.052621	ส11102	40	1	1	วิชาหลัก
10	English Phonic Skill	2017-06-13 12:35:04.992963	2017-06-13 12:53:48.245279	อ11201	40	1	1	วิชาเพิ่มเติม
\.


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('subjects_id_seq', 10, true);


--
-- Data for Name: teacher_courses; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY teacher_courses (id, teacher_id, created_at, updated_at, subject_id) FROM stdin;
1	3	2017-06-13 12:05:42.999947	2017-06-13 12:05:42.999947	1
\.


--
-- Name: teacher_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('teacher_courses_id_seq', 1, true);


--
-- Data for Name: teacher_rooms; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY teacher_rooms (id, teacher_id, room_id, created_at, updated_at, status) FROM stdin;
\.


--
-- Name: teacher_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('teacher_rooms_id_seq', 1, false);


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY teachers (id, first_name, last_name, created_at, updated_at, username, password_digest, status, resign, prefix, image) FROM stdin;
1	อภิเษก	หงษ์วิทยากร	2017-06-12 12:56:32.563914	2017-06-12 13:33:03.762156	canet	$2a$10$gGdEPqw45hDj.A/RcyP3XuPcSDGiR6eG4wGxNVY6sirQm0Bj8cd0W	admin	t	นาย	\N
3	คณิน	มาโนช	2017-06-13 11:50:09.477344	2017-06-13 11:50:09.477344	kanin	$2a$10$SFbJ/RUZCCjEsTcUUzJisO4bakE/Srs1MBiQFfaAtogHPHrXkd0/q	teacher	t	\N	\N
4	นันทิพัฒน์	พลบดี	2017-06-13 13:14:23.25702	2017-06-13 13:14:23.25702	mannakub1	$2a$10$DzzEtt97P7Jbi/OMjZ79vuZ9h36zARD6GxaxtBRJyP/IcBsYYg86C	teacher	t	\N	\N
\.


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('teachers_id_seq', 4, true);


--
-- Data for Name: year_rooms; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY year_rooms (id, name, created_at, updated_at) FROM stdin;
6	2559	2017-06-13 13:02:47.965823	2017-06-13 13:02:47.965823
\.


--
-- Name: year_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('year_rooms_id_seq', 6, true);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: adults_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY adults
    ADD CONSTRAINT adults_pkey PRIMARY KEY (id);


--
-- Name: api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (id);


--
-- Name: course_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY course_lists
    ADD CONSTRAINT course_lists_pkey PRIMARY KEY (id);


--
-- Name: course_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY course_rooms
    ADD CONSTRAINT course_rooms_pkey PRIMARY KEY (id);


--
-- Name: courses_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: father_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY father_lists
    ADD CONSTRAINT father_lists_pkey PRIMARY KEY (id);


--
-- Name: guardians_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY guardians
    ADD CONSTRAINT guardians_pkey PRIMARY KEY (id);


--
-- Name: mother_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY mother_lists
    ADD CONSTRAINT mother_lists_pkey PRIMARY KEY (id);


--
-- Name: rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: student_course_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY student_course_lists
    ADD CONSTRAINT student_course_lists_pkey PRIMARY KEY (id);


--
-- Name: student_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY student_rooms
    ADD CONSTRAINT student_rooms_pkey PRIMARY KEY (id);


--
-- Name: student_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY student_subjects
    ADD CONSTRAINT student_subjects_pkey PRIMARY KEY (id);


--
-- Name: students_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: teacher_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY teacher_courses
    ADD CONSTRAINT teacher_courses_pkey PRIMARY KEY (id);


--
-- Name: teacher_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY teacher_rooms
    ADD CONSTRAINT teacher_rooms_pkey PRIMARY KEY (id);


--
-- Name: teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: year_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY year_rooms
    ADD CONSTRAINT year_rooms_pkey PRIMARY KEY (id);


--
-- Name: index_api_keys_on_access_token; Type: INDEX; Schema: public; Owner: sunday
--

CREATE UNIQUE INDEX index_api_keys_on_access_token ON api_keys USING btree (access_token);


--
-- Name: index_api_keys_on_student_id; Type: INDEX; Schema: public; Owner: sunday
--

CREATE INDEX index_api_keys_on_student_id ON api_keys USING btree (student_id);


--
-- Name: index_student_rooms_on_room_id; Type: INDEX; Schema: public; Owner: sunday
--

CREATE INDEX index_student_rooms_on_room_id ON student_rooms USING btree (room_id);


--
-- Name: index_student_rooms_on_student_id; Type: INDEX; Schema: public; Owner: sunday
--

CREATE INDEX index_student_rooms_on_student_id ON student_rooms USING btree (student_id);


--
-- Name: index_teacher_rooms_on_room_id; Type: INDEX; Schema: public; Owner: sunday
--

CREATE INDEX index_teacher_rooms_on_room_id ON teacher_rooms USING btree (room_id);


--
-- Name: index_teacher_rooms_on_teacher_id; Type: INDEX; Schema: public; Owner: sunday
--

CREATE INDEX index_teacher_rooms_on_teacher_id ON teacher_rooms USING btree (teacher_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: sunday
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_0cbbeee5fd; Type: FK CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY student_rooms
    ADD CONSTRAINT fk_rails_0cbbeee5fd FOREIGN KEY (student_id) REFERENCES students(id);


--
-- Name: fk_rails_5b59f33d87; Type: FK CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY student_rooms
    ADD CONSTRAINT fk_rails_5b59f33d87 FOREIGN KEY (room_id) REFERENCES rooms(id);


--
-- Name: fk_rails_f034c58d1b; Type: FK CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY teacher_rooms
    ADD CONSTRAINT fk_rails_f034c58d1b FOREIGN KEY (room_id) REFERENCES rooms(id);


--
-- Name: fk_rails_fe6ab62ca8; Type: FK CONSTRAINT; Schema: public; Owner: sunday
--

ALTER TABLE ONLY teacher_rooms
    ADD CONSTRAINT fk_rails_fe6ab62ca8 FOREIGN KEY (teacher_id) REFERENCES teachers(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: sunday
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM sunday;
GRANT ALL ON SCHEMA public TO sunday;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

