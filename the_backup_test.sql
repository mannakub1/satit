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
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('admins_id_seq', 1, false);


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
\.


--
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('api_keys_id_seq', 1, false);


--
-- Data for Name: course_lists; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY course_lists (id, course_id, created_at, updated_at, room_level, year_room_id, full_name) FROM stdin;
\.


--
-- Name: course_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('course_lists_id_seq', 1, false);


--
-- Data for Name: course_rooms; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY course_rooms (id, course_list_id, room_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: course_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('course_rooms_id_seq', 1, false);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY courses (id, year, created_at, updated_at) FROM stdin;
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('courses_id_seq', 1, false);


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
\.


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('rooms_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY schema_migrations (version) FROM stdin;
20170508181730
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
20160614033817
20160614121529
20160716091958
20160716115514
20160718093823
20160720133511
20160804030418
20160804030742
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
20170129090248
20170129092727
20170130125141
20170131053046
20170131054831
20170131070634
20170205135835
20170508181644
20170508181704
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
\.


--
-- Name: student_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('student_rooms_id_seq', 1, false);


--
-- Data for Name: student_subjects; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY student_subjects (id, subject_id, score1, score2, grade, created_at, updated_at, student_room_id, score_result, status, status_grade) FROM stdin;
\.


--
-- Name: student_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('student_subjects_id_seq', 1, false);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY students (id, first_name, last_name, gpa, created_at, updated_at, iden_number, code_number, room_state, blood, birthdate, address, call, zip_code, ability, nationality, ethnicity, district, parish, city, prefix, delete_status, username, password_digest, image) FROM stdin;
\.


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('students_id_seq', 1, false);


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY subjects (id, name, created_at, updated_at, code, hour_per_year, course_list_id, credit, status) FROM stdin;
\.


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('subjects_id_seq', 1, false);


--
-- Data for Name: teacher_courses; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY teacher_courses (id, teacher_id, created_at, updated_at, subject_id) FROM stdin;
\.


--
-- Name: teacher_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('teacher_courses_id_seq', 1, false);


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
\.


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('teachers_id_seq', 1, false);


--
-- Data for Name: year_rooms; Type: TABLE DATA; Schema: public; Owner: sunday
--

COPY year_rooms (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: year_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunday
--

SELECT pg_catalog.setval('year_rooms_id_seq', 1, false);


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

