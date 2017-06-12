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

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.teacher_rooms DROP CONSTRAINT fk_rails_fe6ab62ca8;
ALTER TABLE ONLY public.teacher_rooms DROP CONSTRAINT fk_rails_f034c58d1b;
ALTER TABLE ONLY public.student_rooms DROP CONSTRAINT fk_rails_5b59f33d87;
ALTER TABLE ONLY public.student_rooms DROP CONSTRAINT fk_rails_0cbbeee5fd;
DROP INDEX public.unique_schema_migrations;
DROP INDEX public.index_teacher_rooms_on_teacher_id;
DROP INDEX public.index_teacher_rooms_on_room_id;
DROP INDEX public.index_student_rooms_on_student_id;
DROP INDEX public.index_student_rooms_on_room_id;
DROP INDEX public.index_api_keys_on_student_id;
DROP INDEX public.index_api_keys_on_access_token;
ALTER TABLE ONLY public.year_rooms DROP CONSTRAINT year_rooms_pkey;
ALTER TABLE ONLY public.teachers DROP CONSTRAINT teachers_pkey;
ALTER TABLE ONLY public.teacher_rooms DROP CONSTRAINT teacher_rooms_pkey;
ALTER TABLE ONLY public.teacher_courses DROP CONSTRAINT teacher_courses_pkey;
ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_pkey;
ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
ALTER TABLE ONLY public.student_subjects DROP CONSTRAINT student_subjects_pkey;
ALTER TABLE ONLY public.student_rooms DROP CONSTRAINT student_rooms_pkey;
ALTER TABLE ONLY public.student_course_lists DROP CONSTRAINT student_course_lists_pkey;
ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_pkey;
ALTER TABLE ONLY public.mother_lists DROP CONSTRAINT mother_lists_pkey;
ALTER TABLE ONLY public.guardians DROP CONSTRAINT guardians_pkey;
ALTER TABLE ONLY public.father_lists DROP CONSTRAINT father_lists_pkey;
ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_pkey;
ALTER TABLE ONLY public.course_rooms DROP CONSTRAINT course_rooms_pkey;
ALTER TABLE ONLY public.course_lists DROP CONSTRAINT course_lists_pkey;
ALTER TABLE ONLY public.api_keys DROP CONSTRAINT api_keys_pkey;
ALTER TABLE ONLY public.adults DROP CONSTRAINT adults_pkey;
ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
ALTER TABLE public.year_rooms ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.teachers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.teacher_rooms ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.teacher_courses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.subjects ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.students ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.student_subjects ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.student_rooms ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.student_course_lists ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.rooms ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.mother_lists ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.guardians ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.father_lists ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.courses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.course_rooms ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.course_lists ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.api_keys ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.adults ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.admins ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.year_rooms_id_seq;
DROP TABLE public.year_rooms;
DROP SEQUENCE public.teachers_id_seq;
DROP TABLE public.teachers;
DROP SEQUENCE public.teacher_rooms_id_seq;
DROP TABLE public.teacher_rooms;
DROP SEQUENCE public.teacher_courses_id_seq;
DROP TABLE public.teacher_courses;
DROP SEQUENCE public.subjects_id_seq;
DROP TABLE public.subjects;
DROP SEQUENCE public.students_id_seq;
DROP TABLE public.students;
DROP SEQUENCE public.student_subjects_id_seq;
DROP TABLE public.student_subjects;
DROP SEQUENCE public.student_rooms_id_seq;
DROP TABLE public.student_rooms;
DROP SEQUENCE public.student_course_lists_id_seq;
DROP TABLE public.student_course_lists;
DROP TABLE public.schema_migrations;
DROP SEQUENCE public.rooms_id_seq;
DROP TABLE public.rooms;
DROP SEQUENCE public.mother_lists_id_seq;
DROP TABLE public.mother_lists;
DROP SEQUENCE public.guardians_id_seq;
DROP TABLE public.guardians;
DROP SEQUENCE public.father_lists_id_seq;
DROP TABLE public.father_lists;
DROP SEQUENCE public.courses_id_seq;
DROP TABLE public.courses;
DROP SEQUENCE public.course_rooms_id_seq;
DROP TABLE public.course_rooms;
DROP SEQUENCE public.course_lists_id_seq;
DROP TABLE public.course_lists;
DROP SEQUENCE public.api_keys_id_seq;
DROP TABLE public.api_keys;
DROP SEQUENCE public.adults_id_seq;
DROP TABLE public.adults;
DROP SEQUENCE public.admins_id_seq;
DROP TABLE public.admins;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: adults; Type: TABLE; Schema: public; Owner: -
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
    iden_number character varying
);


--
-- Name: adults_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE adults_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: adults_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE adults_id_seq OWNED BY adults.id;


--
-- Name: api_keys; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE api_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: api_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE api_keys_id_seq OWNED BY api_keys.id;


--
-- Name: course_lists; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: course_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE course_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE course_lists_id_seq OWNED BY course_lists.id;


--
-- Name: course_rooms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE course_rooms (
    id integer NOT NULL,
    course_list_id integer,
    room_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: course_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE course_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE course_rooms_id_seq OWNED BY course_rooms.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE courses (
    id integer NOT NULL,
    year character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE courses_id_seq OWNED BY courses.id;


--
-- Name: father_lists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE father_lists (
    id integer NOT NULL,
    adult_id integer,
    student_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: father_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE father_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: father_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE father_lists_id_seq OWNED BY father_lists.id;


--
-- Name: guardians; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE guardians (
    id integer NOT NULL,
    adult_id integer,
    student_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: guardians_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE guardians_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guardians_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE guardians_id_seq OWNED BY guardians.id;


--
-- Name: mother_lists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mother_lists (
    id integer NOT NULL,
    adult_id integer,
    student_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: mother_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mother_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mother_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mother_lists_id_seq OWNED BY mother_lists.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rooms_id_seq OWNED BY rooms.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: student_course_lists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE student_course_lists (
    id integer NOT NULL,
    student_id integer,
    course_list_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: student_course_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE student_course_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: student_course_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE student_course_lists_id_seq OWNED BY student_course_lists.id;


--
-- Name: student_rooms; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: student_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE student_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: student_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE student_rooms_id_seq OWNED BY student_rooms.id;


--
-- Name: student_subjects; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: student_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE student_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: student_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE student_subjects_id_seq OWNED BY student_subjects.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: -
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
    password_digest character varying
);


--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE students_id_seq OWNED BY students.id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subjects_id_seq OWNED BY subjects.id;


--
-- Name: teacher_courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE teacher_courses (
    id integer NOT NULL,
    teacher_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    subject_id integer
);


--
-- Name: teacher_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE teacher_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teacher_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE teacher_courses_id_seq OWNED BY teacher_courses.id;


--
-- Name: teacher_rooms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE teacher_rooms (
    id integer NOT NULL,
    teacher_id integer,
    room_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status boolean
);


--
-- Name: teacher_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE teacher_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teacher_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE teacher_rooms_id_seq OWNED BY teacher_rooms.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: -
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
    prefix character varying
);


--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE teachers_id_seq OWNED BY teachers.id;


--
-- Name: year_rooms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE year_rooms (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: year_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE year_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: year_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE year_rooms_id_seq OWNED BY year_rooms.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY adults ALTER COLUMN id SET DEFAULT nextval('adults_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY api_keys ALTER COLUMN id SET DEFAULT nextval('api_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY course_lists ALTER COLUMN id SET DEFAULT nextval('course_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY course_rooms ALTER COLUMN id SET DEFAULT nextval('course_rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY courses ALTER COLUMN id SET DEFAULT nextval('courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY father_lists ALTER COLUMN id SET DEFAULT nextval('father_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardians ALTER COLUMN id SET DEFAULT nextval('guardians_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mother_lists ALTER COLUMN id SET DEFAULT nextval('mother_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rooms ALTER COLUMN id SET DEFAULT nextval('rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY student_course_lists ALTER COLUMN id SET DEFAULT nextval('student_course_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY student_rooms ALTER COLUMN id SET DEFAULT nextval('student_rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY student_subjects ALTER COLUMN id SET DEFAULT nextval('student_subjects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY students ALTER COLUMN id SET DEFAULT nextval('students_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subjects ALTER COLUMN id SET DEFAULT nextval('subjects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY teacher_courses ALTER COLUMN id SET DEFAULT nextval('teacher_courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY teacher_rooms ALTER COLUMN id SET DEFAULT nextval('teacher_rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY teachers ALTER COLUMN id SET DEFAULT nextval('teachers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY year_rooms ALTER COLUMN id SET DEFAULT nextval('year_rooms_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY admins (id, username, password_digest, first_name, last_name, department, created_at, updated_at) FROM stdin;
4	canet	$2a$10$pk4JyJ7tUsEQWZOuc0HwF.6coK6KWmdXDCpZKDDfIeHZH5ggRLnIC	\N	\N	\N	2016-08-17 11:32:46.617285	2016-08-17 11:32:46.617285
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('admins_id_seq', 4, true);


--
-- Data for Name: adults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY adults (id, first_name, last_name, address, call, zip_code, enthicity, district, parish, city, created_at, updated_at, prefix, nationality, iden_number) FROM stdin;
1	man	\N	\N	\N	\N	\N	\N	\N	\N	2016-08-31 09:01:25.960963	2016-08-31 09:01:25.960963	\N	\N	\N
3	kanoydfdf	huikin	\N	\N	\N	\N	\N	\N	\N	2016-09-03 08:44:19.537948	2016-09-03 08:44:19.537948	\N	\N	\N
2	tris	tanaaa	\N	\N	\N	\N	\N	\N	\N	2016-09-03 08:26:31.955496	2016-09-13 12:04:36.530391	Mr.	\N	\N
8	fsdfassdf	test	\N	\N	\N	\N	\N	\N	\N	2016-09-21 05:44:07.154261	2016-09-21 05:44:07.154261	nay	\N	\N
9	าสพำ	แฟหก	\N	\N	\N	\N	\N	\N	\N	2016-09-21 05:44:17.520238	2016-10-09 09:02:17.2051	นาย	\N	\N
10	นันทิพั	พลบดี	\N	\N	\N	\N	\N	\N	\N	2016-09-21 05:50:28.755483	2016-10-09 09:02:26.936715	นาย	\N	\N
7	สิริกุล	เกรกุล	\N	\N	\N	\N	\N	\N	\N	2016-09-21 05:41:59.422772	2016-10-09 09:02:33.951421	นาย	\N	\N
11	กรกต	ชัยสิง	\N	\N	\N	\N	\N	\N	\N	2017-01-16 12:24:40.158768	2017-01-16 12:24:40.158768	นาย	\N	\N
12	มรสุม	หัดเห	\N	\N	\N	\N	\N	\N	\N	2017-01-16 12:30:48.438413	2017-01-16 12:30:48.438413	นาย	\N	\N
13	สุเมธ	ศักดิ์สิทธ์	\N	\N	\N	\N	\N	\N	\N	2017-01-16 12:46:32.950839	2017-01-16 12:46:32.950839	นาย	\N	\N
14	สุเมธ	สรสัก	\N	\N	\N	\N	\N	\N	\N	2017-01-16 12:46:55.001424	2017-01-16 12:46:55.001424	นาย	\N	\N
15	สรสัก	เฮลั่น	\N	\N	\N	\N	\N	\N	\N	2017-01-16 12:49:04.393398	2017-01-16 12:49:04.393398	นาย	\N	\N
16	วิโยค	ภัย	\N	\N	\N	\N	\N	\N	\N	2017-01-16 13:22:45.647505	2017-01-16 13:22:45.647505	นาง	\N	\N
4	พิภัจน์12	เอกภพ1	\N	\N	\N	\N	\N	\N	\N	2016-09-20 11:17:44.010443	2017-02-05 11:12:46.336572	นาย	\N	\N
5	สะพาง12	หาลัย1	\N	\N	\N	\N	\N	\N	\N	2016-09-20 11:28:51.750124	2017-02-05 11:52:02.597073	นาง	\N	\N
6	หหห12	ฟฟฟ1	\N	\N	\N	\N	\N	\N	\N	2016-09-20 11:30:56.982845	2017-02-05 12:00:31.902246	นาย	\N	16345535
17	วิชาร	สังหะ	\N	\N	\N	\N	\N	\N	\N	2017-02-05 12:13:45.62561	2017-02-05 12:13:45.62561	นาย	\N	149492619
18	สำราญ	มากชัย	\N	\N	\N	\N	\N	\N	\N	2017-02-05 13:08:00.214211	2017-02-05 13:08:00.214211	นาย	\N	1236212
19	ศิระ	หักหน้า	\N	\N	\N	\N	\N	\N	\N	2017-02-05 13:12:36.709274	2017-02-05 13:12:36.709274	นาย	\N	3626226
20	วิสัย	หักกิจ	\N	\N	\N	\N	\N	\N	\N	2017-02-05 13:16:35.838029	2017-02-05 13:16:35.838029	นาง	\N	\N
21	วิสาร	หกิจ	\N	\N	\N	\N	\N	\N	\N	2017-02-05 13:19:24.869954	2017-02-05 13:19:24.869954	นาง	\N	\N
22	วิรุญ	จำบัง	\N	\N	\N	\N	\N	\N	\N	2017-02-05 13:25:26.455225	2017-02-05 13:25:26.455225	นาย	\N	62548
\.


--
-- Name: adults_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('adults_id_seq', 22, true);


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY api_keys (id, access_token, expires_at, student_id, active, created_at, updated_at, admin_id) FROM stdin;
\.


--
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('api_keys_id_seq', 579, true);


--
-- Data for Name: course_lists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY course_lists (id, course_id, created_at, updated_at, room_level, year_room_id, full_name) FROM stdin;
3	2	2016-11-06 08:11:55.662083	2016-11-06 08:11:55.662083	ป.1	\N	ชั้นมัธยมศึกษาปีที่1
4	2	2016-11-06 08:11:55.667508	2016-11-06 08:11:55.667508	ป.2	\N	ชั้นมัธยมศึกษาปีที่2
5	2	2016-11-06 08:11:55.671233	2016-11-06 08:11:55.671233	ป.3	\N	ชั้นมัธยมศึกษาปีที่3
6	2	2016-11-06 08:11:55.674928	2016-11-06 08:11:55.674928	ป.4	\N	ชั้นมัธยมศึกษาปีที่4
7	2	2016-11-06 08:11:55.678929	2016-11-06 08:11:55.678929	ป.5	\N	ชั้นมัธยมศึกษาปีที่5
8	2	2016-11-06 08:11:55.683226	2016-11-06 08:11:55.683226	ป.6	\N	ชั้นมัธยมศึกษาปีที่6
13	3	2016-11-06 09:49:03.277325	2016-11-06 09:49:03.277325	ป.1	\N	ชั้นมัธยมศึกษาปีที่1
14	3	2016-11-06 09:49:03.286907	2016-11-06 09:49:03.286907	ป.2	\N	ชั้นมัธยมศึกษาปีที่2
15	3	2016-11-06 09:49:03.290718	2016-11-06 09:49:03.290718	ป.3	\N	ชั้นมัธยมศึกษาปีที่3
16	3	2016-11-06 09:49:03.294042	2016-11-06 09:49:03.294042	ป.4	\N	ชั้นมัธยมศึกษาปีที่4
17	3	2016-11-06 09:49:03.297287	2016-11-06 09:49:03.297287	ป.5	\N	ชั้นมัธยมศึกษาปีที่5
18	3	2016-11-06 09:49:03.300578	2016-11-06 09:49:03.300578	ป.6	\N	ชั้นมัธยมศึกษาปีที่6
1	1	2016-09-25 03:09:54.145014	2016-11-06 10:11:26.516847	ป.1	2	ชั้นมัธยมศึกษาปีที่1
9	1	2016-11-06 08:18:40.395985	2016-11-06 10:11:26.528267	ป.2	\N	ชั้นมัธยมศึกษาปีที่2
10	1	2016-11-06 08:18:40.422399	2016-11-06 10:11:26.531085	ป.3	\N	ชั้นมัธยมศึกษาปีที่3
11	1	2016-11-06 08:18:40.435287	2016-11-06 10:11:26.534045	ป.4	\N	ชั้นมัธยมศึกษาปีที่4
12	1	2016-11-06 08:18:42.462012	2016-11-06 10:11:26.536679	ป.5	\N	ชั้นมัธยมศึกษาปีที่5
19	1	2016-11-06 10:13:04.866495	2016-11-06 10:13:04.866495	ป.6	\N	ชั้นมัธยมศึกษาปีที่6
20	4	2016-11-07 10:39:54.681487	2016-11-07 10:39:54.681487	ป.1	\N	ชั้นมัธยมศึกษาปีที่1
21	4	2016-11-07 10:39:54.685076	2016-11-07 10:39:54.685076	ป.2	\N	ชั้นมัธยมศึกษาปีที่2
22	4	2016-11-07 10:39:54.688472	2016-11-07 10:39:54.688472	ป.3	\N	ชั้นมัธยมศึกษาปีที่3
23	4	2016-11-07 10:39:54.69155	2016-11-07 10:39:54.69155	ป.4	\N	ชั้นมัธยมศึกษาปีที่4
24	4	2016-11-07 10:39:54.694553	2016-11-07 10:39:54.694553	ป.5	\N	ชั้นมัธยมศึกษาปีที่5
25	4	2016-11-07 10:39:54.697558	2016-11-07 10:39:54.697558	ป.6	\N	ชั้นมัธยมศึกษาปีที่6
26	5	2017-01-29 10:37:18.384875	2017-01-29 10:37:18.384875	ป.1	\N	ชั้นมัธยมศึกษาปีที่1
27	5	2017-01-29 10:37:18.401434	2017-01-29 10:37:18.401434	ป.2	\N	ชั้นมัธยมศึกษาปีที่2
28	5	2017-01-29 10:37:18.406057	2017-01-29 10:37:18.406057	ป.3	\N	ชั้นมัธยมศึกษาปีที่3
29	5	2017-01-29 10:37:18.409401	2017-01-29 10:37:18.409401	ป.4	\N	ชั้นมัธยมศึกษาปีที่4
30	5	2017-01-29 10:37:18.412701	2017-01-29 10:37:18.412701	ป.5	\N	ชั้นมัธยมศึกษาปีที่5
31	5	2017-01-29 10:37:18.416043	2017-01-29 10:37:18.416043	ป.6	\N	ชั้นมัธยมศึกษาปีที่6
\.


--
-- Name: course_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('course_lists_id_seq', 31, true);


--
-- Data for Name: course_rooms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY course_rooms (id, course_list_id, room_id, created_at, updated_at) FROM stdin;
1	1	1	2016-10-29 01:53:44.518322	2016-10-29 01:53:44.518322
5	1	14	2016-11-07 10:22:31.945641	2016-11-07 10:22:31.945641
7	28	16	2017-01-29 10:50:30.352733	2017-01-29 10:50:30.352733
\.


--
-- Name: course_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('course_rooms_id_seq', 7, true);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY courses (id, year, created_at, updated_at) FROM stdin;
1	2559	2016-09-25 02:38:42.891423	2016-10-28 11:07:15.487837
2	2538	2016-11-06 08:11:55.640577	2016-11-06 08:11:55.640577
3	2539	2016-11-06 09:49:03.259146	2016-11-06 09:49:03.259146
4	2537	2016-11-07 10:39:54.677625	2016-11-07 10:39:54.677625
5	2558	2017-01-29 10:37:18.370963	2017-01-29 10:37:18.370963
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('courses_id_seq', 5, true);


--
-- Data for Name: father_lists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY father_lists (id, adult_id, student_id, created_at, updated_at) FROM stdin;
6	2	596	2016-09-03 08:50:04.218725	2016-09-03 08:50:04.218725
7	4	601	2016-09-20 11:17:49.548281	2016-09-20 11:17:49.548281
8	9	179	2016-09-21 05:44:18.462711	2016-09-21 05:44:18.462711
9	12	180	2017-01-16 12:30:48.607609	2017-01-16 12:30:48.607609
10	15	181	2017-01-16 12:49:04.534808	2017-01-16 12:49:04.534808
11	19	595	2017-02-05 13:12:36.815179	2017-02-05 13:12:36.815179
\.


--
-- Name: father_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('father_lists_id_seq', 11, true);


--
-- Data for Name: guardians; Type: TABLE DATA; Schema: public; Owner: -
--

COPY guardians (id, adult_id, student_id, created_at, updated_at) FROM stdin;
1	3	596	2016-09-03 09:00:37.73612	2016-09-03 09:00:37.73612
2	6	601	2016-09-20 11:30:57.2962	2016-09-20 11:30:57.2962
3	7	179	2016-09-21 05:41:59.627639	2016-09-21 05:41:59.627639
4	22	595	2017-02-05 13:25:26.577765	2017-02-05 13:25:26.577765
\.


--
-- Name: guardians_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('guardians_id_seq', 4, true);


--
-- Data for Name: mother_lists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mother_lists (id, adult_id, student_id, created_at, updated_at) FROM stdin;
1	3	596	2016-09-03 08:44:29.717906	2016-09-03 08:44:29.717906
2	5	601	2016-09-20 11:28:51.889721	2016-09-20 11:28:51.889721
3	10	179	2016-09-21 05:50:29.032837	2016-09-21 05:50:29.032837
4	16	180	2017-01-16 13:22:45.778369	2017-01-16 13:22:45.778369
5	21	595	2017-02-05 13:19:25.004786	2017-02-05 13:19:25.004786
\.


--
-- Name: mother_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('mother_lists_id_seq', 5, true);


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rooms (id, name, level, year, created_at, updated_at, status, year_room_id, priority) FROM stdin;
104	พุทธรักษา	ป.1	2560	2017-02-06 06:16:02.713081	2017-02-06 06:16:02.713081	\N	16	1
105	ลีลาวดี	ป.1	2560	2017-02-06 06:16:02.725048	2017-02-06 06:16:02.725048	\N	16	2
106	กระเช้าสีดา	ป.2	2560	2017-02-06 06:16:02.736386	2017-02-06 06:16:02.736386	\N	16	3
107	จ่ามงกุฎ	ป.2	2560	2017-02-06 06:16:02.740664	2017-02-06 06:16:02.740664	\N	16	4
108	เพชรดี	ป.3	2560	2017-02-06 06:16:02.750528	2017-02-06 06:16:02.750528	\N	16	5
16	เพชรดี	ป.3	2558	2017-01-28 07:27:07.869171	2017-01-28 07:27:07.869171	\N	4	\N
1	พุทธรักษา	ป.1	2559	2016-07-17 08:03:38.265315	2017-01-31 05:32:45.638984	\N	2	1
109	มณีงาม	ป.3	2560	2017-02-06 06:16:02.754317	2017-02-06 06:16:02.754317	\N	16	6
3	กระเช้าสีดา	ป.2	2559	2016-07-17 08:04:19.125074	2017-01-31 05:33:55.933778	\N	2	3
4	จ่ามงกุฎ	ป.2	2559	2016-07-17 08:04:42.000118	2017-01-31 05:34:05.973964	\N	2	4
5	เพชรดี	ป.3	2559	2016-07-17 08:05:57.187638	2017-01-31 05:34:40.489345	\N	2	5
6	มณีงาม	ป.3	2559	2016-07-17 08:06:05.971159	2017-01-31 05:34:50.485869	\N	2	6
8	ร่มไทร	ป.4	2559	2016-07-17 08:07:19.624159	2017-01-31 05:35:34.013018	\N	2	7
7	ใบโพธิ์	ป.4	2559	2016-07-17 08:07:03.931434	2017-01-31 05:35:42.193021	\N	2	8
110	ร่มไทร	ป.4	2560	2017-02-06 06:16:02.757765	2017-02-06 06:16:02.757765	\N	16	7
111	ใบโพธิ์	ป.4	2560	2017-02-06 06:16:02.761222	2017-02-06 06:16:02.761222	\N	16	8
11	แสงตะวัน	ป.6	2559	2016-07-17 08:09:00.756834	2017-01-31 05:36:52.857006	\N	2	11
112	มหานที	ป.5	2560	2017-02-06 06:16:02.769342	2017-02-06 06:16:02.769342	\N	16	9
12	จันทร์กระจ่าง	ป.6	2559	2016-07-17 08:09:17.683285	2017-01-31 05:37:00.800918	\N	2	12
9	ปถวีธร	ป.5	2559	2016-07-17 08:08:20.270838	2017-01-31 05:39:29.364648	\N	2	10
10	มหานที	ป.5	2559	2016-07-17 08:08:42.763187	2017-01-31 05:39:43.66053		2	9
113	ปถวีธร	ป.5	2560	2017-02-06 06:16:02.774091	2017-02-06 06:16:02.774091	\N	16	10
114	แสงตะวัน	ป.6	2560	2017-02-06 06:16:02.816741	2017-02-06 06:16:02.816741	\N	16	11
115	จันทร์กระจ่าง	ป.6	2560	2017-02-06 06:16:02.854577	2017-02-06 06:16:02.854577	\N	16	12
14	ลีลาวดี	ป.1	2559	2016-11-06 12:07:15.839858	2017-02-05 11:41:07.515311	\N	2	2
\.


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('rooms_id_seq', 115, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
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
\.


--
-- Data for Name: student_course_lists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY student_course_lists (id, student_id, course_list_id, created_at, updated_at) FROM stdin;
1	181	1	2016-09-26 14:37:55.160853	2016-09-26 14:37:55.160853
2	183	1	2016-09-26 14:37:55.19233	2016-09-26 14:37:55.19233
3	184	1	2016-09-26 14:37:55.196812	2016-09-26 14:37:55.196812
4	186	1	2016-09-26 14:37:55.201262	2016-09-26 14:37:55.201262
5	188	1	2016-09-26 14:37:55.207021	2016-09-26 14:37:55.207021
6	189	1	2016-09-26 14:37:55.211804	2016-09-26 14:37:55.211804
7	191	1	2016-09-26 14:37:55.216198	2016-09-26 14:37:55.216198
8	192	1	2016-09-26 14:37:55.220398	2016-09-26 14:37:55.220398
9	194	1	2016-09-26 14:37:55.225922	2016-09-26 14:37:55.225922
10	195	1	2016-09-26 14:37:55.234025	2016-09-26 14:37:55.234025
11	197	1	2016-09-26 14:37:55.241123	2016-09-26 14:37:55.241123
12	199	1	2016-09-26 14:37:55.245498	2016-09-26 14:37:55.245498
13	200	1	2016-09-26 14:37:55.249816	2016-09-26 14:37:55.249816
14	202	1	2016-09-26 14:37:55.258233	2016-09-26 14:37:55.258233
15	204	1	2016-09-26 14:37:55.262556	2016-09-26 14:37:55.262556
16	205	1	2016-09-26 14:37:55.266917	2016-09-26 14:37:55.266917
17	207	1	2016-09-26 14:37:55.272501	2016-09-26 14:37:55.272501
18	209	1	2016-09-26 14:37:55.284065	2016-09-26 14:37:55.284065
19	210	1	2016-09-26 14:37:55.289908	2016-09-26 14:37:55.289908
20	212	1	2016-09-26 14:37:55.294408	2016-09-26 14:37:55.294408
21	595	1	2016-09-26 14:37:55.298834	2016-09-26 14:37:55.298834
22	179	1	2016-09-26 14:37:55.30339	2016-09-26 14:37:55.30339
23	596	1	2016-09-26 14:37:55.310541	2016-09-26 14:37:55.310541
24	601	1	2016-09-26 14:37:55.314665	2016-09-26 14:37:55.314665
25	180	1	2016-09-26 14:37:55.318831	2016-09-26 14:37:55.318831
26	182	1	2016-09-26 14:37:55.323552	2016-09-26 14:37:55.323552
27	185	1	2016-09-26 14:37:55.327974	2016-09-26 14:37:55.327974
28	187	1	2016-09-26 14:37:55.333011	2016-09-26 14:37:55.333011
29	190	1	2016-09-26 14:37:55.338856	2016-09-26 14:37:55.338856
30	193	1	2016-09-26 14:37:55.344682	2016-09-26 14:37:55.344682
31	196	1	2016-09-26 14:37:55.349041	2016-09-26 14:37:55.349041
32	198	1	2016-09-26 14:37:55.355679	2016-09-26 14:37:55.355679
33	201	1	2016-09-26 14:37:55.361611	2016-09-26 14:37:55.361611
34	203	1	2016-09-26 14:37:55.366075	2016-09-26 14:37:55.366075
35	206	1	2016-09-26 14:37:55.371512	2016-09-26 14:37:55.371512
36	208	1	2016-09-26 14:37:55.376351	2016-09-26 14:37:55.376351
37	211	1	2016-09-26 14:37:55.386907	2016-09-26 14:37:55.386907
\.


--
-- Name: student_course_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('student_course_lists_id_seq', 37, true);


--
-- Data for Name: student_rooms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY student_rooms (id, student_id, room_id, created_at, updated_at, cr, cp, ca, gp, gpa, level, status, student_status, code_number) FROM stdin;
72	182	1	2016-07-20 13:48:41.860754	2017-02-05 11:20:21.863529	\N	\N	\N	\N	\N	ป.1	f	t	259004
70	180	1	2016-07-20 13:48:41.838838	2017-02-05 11:20:21.539906	\N	\N	\N	\N	\N	ป.1	f	t	259002
75	185	1	2016-07-20 13:48:41.892316	2017-02-05 11:20:21.9362	\N	\N	\N	\N	\N	ป.1	f	t	259007
76	186	1	2016-07-20 13:48:41.901569	2017-02-05 11:20:20.79549	\N	\N	\N	\N	\N	ป.1	f	t	259008
77	187	1	2016-07-20 13:48:41.913276	2017-02-05 11:20:22.009711	\N	\N	\N	\N	\N	ป.1	f	t	259009
78	188	1	2016-07-20 13:48:41.923371	2017-02-05 11:20:20.804677	\N	\N	\N	\N	\N	ป.1	f	t	259069
83	193	1	2016-07-20 13:48:41.973598	2017-02-05 11:20:22.128656	\N	\N	\N	\N	\N	ป.1	f	t	259014
79	189	1	2016-07-20 13:48:41.931126	2017-02-05 11:20:20.871003	\N	\N	\N	\N	\N	ป.1	f	t	259010
81	191	1	2016-07-20 13:48:41.954689	2017-02-05 11:20:20.885604	\N	\N	\N	\N	\N	ป.1	f	t	259012
82	192	1	2016-07-20 13:48:41.965217	2017-02-05 11:20:20.893466	\N	\N	\N	\N	\N	ป.1	f	t	259013
84	194	1	2016-07-20 13:48:41.986507	2017-02-05 11:20:20.901398	\N	\N	\N	\N	\N	ป.1	f	t	259015
86	196	1	2016-07-20 13:48:42.004474	2017-02-05 11:20:22.1985	\N	\N	\N	\N	\N	ป.1	f	t	259017
85	195	1	2016-07-20 13:48:41.994239	2017-02-05 11:20:20.910823	\N	\N	\N	\N	\N	ป.1	f	t	259016
89	199	1	2016-07-20 13:48:42.042504	2017-02-05 11:20:21.038809	\N	\N	\N	\N	\N	ป.1	f	t	259020
88	198	1	2016-07-20 13:48:42.03615	2017-02-05 11:20:22.267367	\N	\N	\N	\N	\N	ป.1	f	t	259019
91	201	1	2016-07-20 13:48:42.055982	2017-02-05 11:20:22.341835	\N	\N	\N	\N	\N	ป.1	f	t	259022
90	200	1	2016-07-20 13:48:42.048945	2017-02-05 11:20:21.052936	\N	\N	\N	\N	\N	ป.1	f	t	259021
92	202	1	2016-07-20 13:48:42.064647	2017-02-05 11:20:21.061138	\N	\N	\N	\N	\N	ป.1	f	t	259023
93	203	1	2016-07-20 13:48:42.075468	2017-02-05 11:20:22.39451	\N	\N	\N	\N	\N	ป.1	f	t	259024
95	205	1	2016-07-20 13:48:42.099543	2017-02-05 11:20:21.133656	\N	\N	\N	\N	\N	ป.1	f	t	259070
96	206	1	2016-07-20 13:48:42.10607	2017-02-05 11:20:22.466598	\N	\N	\N	\N	\N	ป.1	f	t	259026
97	207	1	2016-07-20 13:48:42.112383	2017-02-05 11:20:21.201761	\N	\N	\N	\N	\N	ป.1	f	t	259027
98	208	1	2016-07-20 13:48:42.119153	2017-02-05 11:20:22.483361	\N	\N	\N	\N	\N	ป.1	f	t	259029
99	209	1	2016-07-20 13:48:42.130658	2017-02-05 11:20:21.268405	\N	\N	\N	\N	\N	ป.1	f	t	259030
139	249	3	2016-07-20 14:20:51.899537	2017-02-05 11:32:16.162882	\N	\N	\N	\N	\N	ป.2	f	t	258002
100	210	1	2016-07-20 13:48:42.138329	2017-02-05 11:20:21.328174	\N	\N	\N	\N	\N	ป.1	f	t	259031
102	212	1	2016-07-20 13:48:42.15368	2017-02-05 11:20:21.396087	\N	\N	\N	\N	\N	ป.1	f	t	259033
71	181	1	2016-07-20 13:48:41.852742	2017-02-05 11:20:21.475743	\N	\N	\N	\N	\N	ป.1	f	t	259003
141	251	3	2016-07-20 14:20:51.909889	2017-02-05 11:32:17.043223	\N	\N	\N	\N	\N	ป.2	f	t	258004
140	250	3	2016-07-20 14:20:51.904472	2017-02-05 11:32:16.193896	\N	\N	\N	\N	\N	ป.2	f	t	258003
142	252	3	2016-07-20 14:20:51.920145	2017-02-05 11:32:16.218862	\N	\N	\N	\N	\N	ป.2	f	t	258005
144	254	3	2016-07-20 14:20:51.932113	2017-02-05 11:32:17.103681	\N	\N	\N	\N	\N	ป.2	f	t	258007
145	255	3	2016-07-20 14:20:51.937195	2017-02-05 11:32:16.35809	\N	\N	\N	\N	\N	ป.2	f	t	258008
146	256	3	2016-07-20 14:20:51.942739	2017-02-05 11:32:17.174619	\N	\N	\N	\N	\N	ป.2	f	t	258009
147	257	3	2016-07-20 14:20:51.948318	2017-02-05 11:32:16.433186	\N	\N	\N	\N	\N	ป.2	f	t	258011
149	259	3	2016-07-20 14:20:51.959262	2017-02-05 11:32:17.252985	\N	\N	\N	\N	\N	ป.2	f	t	258013
148	258	3	2016-07-20 14:20:51.953484	2017-02-05 11:32:16.511142	\N	\N	\N	\N	\N	ป.2	f	t	258012
151	261	3	2016-07-20 14:20:51.988163	2017-02-05 11:32:16.536054	\N	\N	\N	\N	\N	ป.2	f	t	258014
152	262	3	2016-07-20 14:20:51.993559	2017-02-05 11:32:17.321297	\N	\N	\N	\N	\N	ป.2	f	t	258015
153	263	3	2016-07-20 14:20:51.999627	2017-02-05 11:32:16.544807	\N	\N	\N	\N	\N	ป.2	f	t	258016
154	264	3	2016-07-20 14:20:52.004622	2017-02-05 11:32:17.380612	\N	\N	\N	\N	\N	ป.2	f	t	258017
155	265	3	2016-07-20 14:20:52.009558	2017-02-05 11:32:16.618728	\N	\N	\N	\N	\N	ป.2	f	t	258018
159	269	3	2016-07-20 14:20:52.030586	2017-02-05 11:32:17.528249	\N	\N	\N	\N	\N	ป.2	f	t	258023
156	266	3	2016-07-20 14:20:52.015023	2017-02-05 11:32:16.644575	\N	\N	\N	\N	\N	ป.2	f	t	258019
158	268	3	2016-07-20 14:20:52.025365	2017-02-05 11:32:16.654756	\N	\N	\N	\N	\N	ป.2	f	t	258022
160	270	3	2016-07-20 14:20:52.03833	2017-02-05 11:32:16.710869	\N	\N	\N	\N	\N	ป.2	f	t	258024
162	272	3	2016-07-20 14:20:52.050517	2017-02-05 11:32:17.599064	\N	\N	\N	\N	\N	ป.2	f	t	258026
161	271	3	2016-07-20 14:20:52.044345	2017-02-05 11:32:16.726093	\N	\N	\N	\N	\N	ป.2	f	t	258025
163	273	3	2016-07-20 14:20:52.056971	2017-02-05 11:32:16.734592	\N	\N	\N	\N	\N	ป.2	f	t	258027
167	277	3	2016-07-20 14:20:52.08218	2017-02-05 11:32:17.732595	\N	\N	\N	\N	\N	ป.2	f	t	258030
165	275	3	2016-07-20 14:20:52.069506	2017-02-05 11:32:16.742406	\N	\N	\N	\N	\N	ป.2	f	t	258071
166	276	3	2016-07-20 14:20:52.075886	2017-02-05 11:32:16.80452	\N	\N	\N	\N	\N	ป.2	f	t	258029
168	278	3	2016-07-20 14:20:52.088392	2017-02-05 11:32:16.818184	\N	\N	\N	\N	\N	ป.2	f	t	258068
170	280	3	2016-07-20 14:20:52.10074	2017-02-05 11:32:17.809366	\N	\N	\N	\N	\N	ป.2	f	t	258032
169	279	3	2016-07-20 14:20:52.09456	2017-02-05 11:32:16.82657	\N	\N	\N	\N	\N	ป.2	f	t	258031
173	283	3	2016-07-20 14:20:52.121297	2017-02-05 11:32:16.897993	\N	\N	\N	\N	\N	ป.2	f	t	258082
172	282	3	2016-07-20 14:20:52.112988	2017-02-05 11:32:17.878987	\N	\N	\N	\N	\N	ป.2	f	t	258081
175	285	4	2016-07-20 14:21:06.802371	2017-02-05 11:32:17.942146	\N	\N	\N	\N	\N	ป.2	f	t	258036
138	248	3	2016-07-20 14:20:51.886642	2017-02-05 11:32:16.975257	\N	\N	\N	\N	\N	ป.2	f	t	258001
196	306	4	2016-07-20 14:21:06.994759	2017-02-05 11:32:18.503474	\N	\N	\N	\N	\N	ป.2	f	t	258056
177	287	4	2016-07-20 14:21:06.822445	2017-02-05 11:32:18.01311	\N	\N	\N	\N	\N	ป.2	f	t	258038
181	291	4	2016-07-20 14:21:06.864657	2017-02-05 11:32:19.228109	\N	\N	\N	\N	\N	ป.2	f	t	258042
179	289	4	2016-07-20 14:21:06.848669	2017-02-05 11:32:18.087968	\N	\N	\N	\N	\N	ป.2	f	t	258040
180	290	4	2016-07-20 14:21:06.858181	2017-02-05 11:32:18.161283	\N	\N	\N	\N	\N	ป.2	f	t	258041
182	292	4	2016-07-20 14:21:06.871009	2017-02-05 11:32:18.235108	\N	\N	\N	\N	\N	ป.2	f	t	258043
183	293	4	2016-07-20 14:21:06.877947	2017-02-05 11:32:19.237165	\N	\N	\N	\N	\N	ป.2	f	t	258044
184	294	4	2016-07-20 14:21:06.888449	2017-02-05 11:32:18.310265	\N	\N	\N	\N	\N	ป.2	f	t	258045
186	296	4	2016-07-20 14:21:06.906901	2017-02-05 11:32:19.245475	\N	\N	\N	\N	\N	ป.2	f	t	258047
187	297	4	2016-07-20 14:21:06.918367	2017-02-05 11:32:18.336238	\N	\N	\N	\N	\N	ป.2	f	t	258075
189	299	4	2016-07-20 14:21:06.932251	2017-02-05 11:32:19.306533	\N	\N	\N	\N	\N	ป.2	f	t	258050
188	298	4	2016-07-20 14:21:06.925696	2017-02-05 11:32:18.344541	\N	\N	\N	\N	\N	ป.2	f	t	258049
190	300	4	2016-07-20 14:21:06.939327	2017-02-05 11:32:18.406644	\N	\N	\N	\N	\N	ป.2	f	t	258072
191	301	4	2016-07-20 14:21:06.950609	2017-02-05 11:32:19.373839	\N	\N	\N	\N	\N	ป.2	f	t	258052
193	303	4	2016-07-20 14:21:06.970247	2017-02-05 11:32:18.431003	\N	\N	\N	\N	\N	ป.2	f	t	258069
194	304	4	2016-07-20 14:21:06.976333	2017-02-05 11:32:19.452637	\N	\N	\N	\N	\N	ป.2	f	t	258054
174	284	4	2016-07-20 14:21:06.787566	2017-02-05 11:32:18.439499	\N	\N	\N	\N	\N	ป.2	f	t	258035
195	305	4	2016-07-20 14:21:06.988307	2017-02-05 11:32:19.520115	\N	\N	\N	\N	\N	ป.2	f	t	258055
198	308	4	2016-07-20 14:21:07.009681	2017-02-05 11:32:19.593546	\N	\N	\N	\N	\N	ป.2	f	t	258058
197	307	4	2016-07-20 14:21:07.002053	2017-02-05 11:32:18.57289	\N	\N	\N	\N	\N	ป.2	f	t	258057
204	314	4	2016-07-20 14:21:07.07553	2017-02-05 11:32:18.791738	\N	\N	\N	\N	\N	ป.2	f	t	258062
201	311	4	2016-07-20 14:21:07.045976	2017-02-05 11:32:19.657833	\N	\N	\N	\N	\N	ป.2	f	t	258060
202	312	4	2016-07-20 14:21:07.05384	2017-02-05 11:32:19.683927	\N	\N	\N	\N	\N	ป.2	f	t	258061
206	316	4	2016-07-20 14:21:07.097082	2017-02-05 11:32:19.71801	\N	\N	\N	\N	\N	ป.2	f	t	258065
205	315	4	2016-07-20 14:21:07.089915	2017-02-05 11:32:18.860227	\N	\N	\N	\N	\N	ป.2	f	t	258063
207	317	4	2016-07-20 14:21:07.120706	2017-02-05 11:32:18.926502	\N	\N	\N	\N	\N	ป.2	f	t	258066
213	323	5	2016-07-20 14:21:14.293158	2017-02-05 11:32:19.76985	\N	\N	\N	\N	\N	ป.3	f	t	257004
210	320	4	2016-07-20 14:21:07.141718	2017-02-05 11:32:19.070143	\N	\N	\N	\N	\N	ป.2	f	t	258083
176	286	4	2016-07-20 14:21:06.814334	2017-02-05 11:32:19.139943	\N	\N	\N	\N	\N	ป.2	f	t	258037
214	324	5	2016-07-20 14:21:14.302871	2017-02-05 11:32:20.045451	\N	\N	\N	\N	\N	ป.3	f	t	257005
211	321	5	2016-07-20 14:21:14.275227	2017-02-05 11:32:20.028135	\N	\N	\N	\N	\N	ป.3	f	t	257001
74	184	1	2016-07-20 13:48:41.883077	2017-02-05 11:20:20.77315	\N	\N	\N	\N	\N	ป.1	f	t	259006
314	424	8	2016-07-20 14:21:42.805614	2017-02-05 11:41:42.860003	\N	\N	\N	\N	\N	ป.4	f	t	256071
315	425	8	2016-07-20 14:21:42.811698	2017-02-05 11:41:42.868285	\N	\N	\N	\N	\N	ป.4	f	t	256005
317	427	8	2016-07-20 14:21:42.834189	2017-02-05 11:41:42.885697	\N	\N	\N	\N	\N	ป.4	f	t	256039
313	423	8	2016-07-20 14:21:42.799522	2017-02-05 11:41:42.907451	\N	\N	\N	\N	\N	ป.4	f	t	256001
321	431	8	2016-07-20 14:21:42.874412	2017-02-05 11:41:42.9161	\N	\N	\N	\N	\N	ป.4	f	t	256045
322	432	8	2016-07-20 14:21:42.881449	2017-02-05 11:41:42.942315	\N	\N	\N	\N	\N	ป.4	f	t	256013
326	436	8	2016-07-20 14:21:42.932283	2017-02-05 11:41:42.97928	\N	\N	\N	\N	\N	ป.4	f	t	256015
329	439	8	2016-07-20 14:21:42.957682	2017-02-05 11:41:43.013506	\N	\N	\N	\N	\N	ป.4	f	t	256018
333	443	8	2016-07-20 14:21:43.008153	2017-02-05 11:41:43.038508	\N	\N	\N	\N	\N	ป.4	f	t	256057
336	446	8	2016-07-20 14:21:43.043624	2017-02-05 11:41:43.047311	\N	\N	\N	\N	\N	ป.4	f	t	256028
338	448	8	2016-07-20 14:21:43.061524	2017-02-05 11:41:43.066005	\N	\N	\N	\N	\N	ป.4	f	t	256065
340	450	8	2016-07-20 14:21:43.077395	2017-02-05 11:41:43.081478	\N	\N	\N	\N	\N	ป.4	f	t	256066
343	453	8	2016-07-20 14:21:43.104252	2017-02-05 11:41:43.114279	\N	\N	\N	\N	\N	ป.4	f	t	256070
344	454	8	2016-07-20 14:21:43.111263	2017-02-05 11:41:43.12308	\N	\N	\N	\N	\N	ป.4	f	t	259077
319	429	8	2016-07-20 14:21:42.852468	2017-02-05 11:41:43.148536	\N	\N	\N	\N	\N	ป.4	f	t	256008
323	433	8	2016-07-20 14:21:42.888467	2017-02-05 11:41:43.172377	\N	\N	\N	\N	\N	ป.4	f	t	256046
218	328	5	2016-07-20 14:21:14.329644	2017-02-05 11:32:19.804853	\N	\N	\N	\N	\N	ป.3	f	t	257009
220	330	5	2016-07-20 14:21:14.346004	2017-02-05 11:32:19.81915	\N	\N	\N	\N	\N	ป.3	f	t	257011
225	335	5	2016-07-20 14:21:14.399057	2017-02-05 11:32:19.851415	\N	\N	\N	\N	\N	ป.3	f	t	257017
224	334	5	2016-07-20 14:21:14.392569	2017-02-05 11:32:20.120151	\N	\N	\N	\N	\N	ป.3	f	t	257016
229	339	5	2016-07-20 14:21:14.425676	2017-02-05 11:32:20.144655	\N	\N	\N	\N	\N	ป.3	f	t	257021
226	336	5	2016-07-20 14:21:14.406177	2017-02-05 11:32:19.872183	\N	\N	\N	\N	\N	ป.3	f	t	257018
228	338	5	2016-07-20 14:21:14.420841	2017-02-05 11:32:19.88501	\N	\N	\N	\N	\N	ป.3	f	t	257020
233	343	5	2016-07-20 14:21:14.455836	2017-02-05 11:32:19.921545	\N	\N	\N	\N	\N	ป.3	f	t	257025
232	342	5	2016-07-20 14:21:14.447321	2017-02-05 11:32:20.160414	\N	\N	\N	\N	\N	ป.3	f	t	257024
235	345	5	2016-07-20 14:21:14.468592	2017-02-05 11:32:20.177505	\N	\N	\N	\N	\N	ป.3	f	t	257027
236	346	5	2016-07-20 14:21:14.477939	2017-02-05 11:32:19.950896	\N	\N	\N	\N	\N	ป.3	f	t	257028
243	353	5	2016-07-20 14:21:14.541883	2017-02-05 11:32:20.234525	\N	\N	\N	\N	\N	ป.3	f	t	257068
237	347	5	2016-07-20 14:21:14.493545	2017-02-05 11:32:19.960037	\N	\N	\N	\N	\N	ป.3	f	t	257029
239	349	5	2016-07-20 14:21:14.504442	2017-02-05 11:32:19.977181	\N	\N	\N	\N	\N	ป.3	f	t	257031
241	351	5	2016-07-20 14:21:14.519378	2017-02-05 11:32:19.99428	\N	\N	\N	\N	\N	ป.3	f	t	257033
244	354	5	2016-07-20 14:21:14.547234	2017-02-05 11:32:20.019576	\N	\N	\N	\N	\N	ป.3	f	t	258085
245	355	5	2016-07-20 14:21:14.559443	2017-02-05 11:32:20.250291	\N	\N	\N	\N	\N	ป.3	f	t	259076
222	332	5	2016-07-20 14:21:14.366135	2017-02-05 11:32:20.102883	\N	\N	\N	\N	\N	ป.3	f	t	257013
247	357	6	2016-07-20 14:21:21.522911	2017-02-05 11:32:20.272524	\N	\N	\N	\N	\N	ป.3	f	t	257036
248	358	6	2016-07-20 14:21:21.529215	2017-02-05 11:32:20.280625	\N	\N	\N	\N	\N	ป.3	f	t	257037
251	361	6	2016-07-20 14:21:21.567569	2017-02-05 11:32:20.319004	\N	\N	\N	\N	\N	ป.3	f	t	257041
255	365	6	2016-07-20 14:21:21.599306	2017-02-05 11:32:20.341861	\N	\N	\N	\N	\N	ป.3	f	t	257045
254	364	6	2016-07-20 14:21:21.59235	2017-02-05 11:32:20.60824	\N	\N	\N	\N	\N	ป.3	f	t	257044
256	366	6	2016-07-20 14:21:21.608285	2017-02-05 11:32:20.624818	\N	\N	\N	\N	\N	ป.3	f	t	257046
260	370	6	2016-07-20 14:21:21.644566	2017-02-05 11:32:20.396648	\N	\N	\N	\N	\N	ป.3	f	t	257050
258	368	6	2016-07-20 14:21:21.622439	2017-02-05 11:32:20.637551	\N	\N	\N	\N	\N	ป.3	f	t	257048
264	374	6	2016-07-20 14:21:21.673233	2017-02-05 11:32:20.688714	\N	\N	\N	\N	\N	ป.3	f	t	257054
262	372	6	2016-07-20 14:21:21.657838	2017-02-05 11:32:20.413957	\N	\N	\N	\N	\N	ป.3	f	t	257052
263	373	6	2016-07-20 14:21:21.664543	2017-02-05 11:32:20.432083	\N	\N	\N	\N	\N	ป.3	f	t	257053
270	380	6	2016-07-20 14:21:21.744754	2017-02-05 11:32:20.48626	\N	\N	\N	\N	\N	ป.3	f	t	257060
266	376	6	2016-07-20 14:21:21.69952	2017-02-05 11:32:20.706042	\N	\N	\N	\N	\N	ป.3	f	t	257056
267	377	6	2016-07-20 14:21:21.713938	2017-02-05 11:32:20.713413	\N	\N	\N	\N	\N	ป.3	f	t	257057
271	381	6	2016-07-20 14:21:21.760515	2017-02-05 11:32:20.746441	\N	\N	\N	\N	\N	ป.3	f	t	257062
273	383	6	2016-07-20 14:21:21.776527	2017-02-05 11:32:20.511481	\N	\N	\N	\N	\N	ป.3	f	t	257065
274	384	6	2016-07-20 14:21:21.782938	2017-02-05 11:32:20.764048	\N	\N	\N	\N	\N	ป.3	f	t	257066
275	385	6	2016-07-20 14:21:21.794723	2017-02-05 11:32:20.527022	\N	\N	\N	\N	\N	ป.3	f	t	257067
277	387	6	2016-07-20 14:21:21.810131	2017-02-05 11:32:20.773642	\N	\N	\N	\N	\N	ป.3	f	t	257070
279	389	6	2016-07-20 14:21:21.827459	2017-02-05 11:32:20.562531	\N	\N	\N	\N	\N	ป.3	f	t	259074
351	461	9	2016-07-20 14:21:57.635619	2017-02-05 11:32:21.43542	\N	\N	\N	\N	\N	ป.5	f	t	255046
252	362	6	2016-07-20 14:21:21.579674	2017-02-05 11:32:20.597405	\N	\N	\N	\N	\N	ป.3	f	t	257042
284	394	7	2016-07-20 14:21:30.94782	2017-02-05 11:41:43.329699	\N	\N	\N	\N	\N	ป.4	f	t	256038
287	397	7	2016-07-20 14:21:30.977428	2017-02-05 11:41:43.361019	\N	\N	\N	\N	\N	ป.4	f	t	256042
288	398	7	2016-07-20 14:21:30.989776	2017-02-05 11:41:43.630604	\N	\N	\N	\N	\N	ป.4	f	t	256009
291	401	7	2016-07-20 14:21:31.031661	2017-02-05 11:41:43.392631	\N	\N	\N	\N	\N	ป.4	f	t	256012
292	402	7	2016-07-20 14:21:31.038323	2017-02-05 11:41:43.653921	\N	\N	\N	\N	\N	ป.4	f	t	256048
294	404	7	2016-07-20 14:21:31.069184	2017-02-05 11:41:43.425985	\N	\N	\N	\N	\N	ป.4	f	t	256017
295	405	7	2016-07-20 14:21:31.079532	2017-02-05 11:41:43.668322	\N	\N	\N	\N	\N	ป.4	f	t	256019
296	406	7	2016-07-20 14:21:31.09346	2017-02-05 11:41:43.442243	\N	\N	\N	\N	\N	ป.4	f	t	256055
298	408	7	2016-07-20 14:21:31.105645	2017-02-05 11:41:43.681964	\N	\N	\N	\N	\N	ป.4	f	t	256022
302	412	7	2016-07-20 14:21:31.140642	2017-02-05 11:41:43.494214	\N	\N	\N	\N	\N	ป.4	f	t	256084
300	410	7	2016-07-20 14:21:31.124577	2017-02-05 11:41:43.690655	\N	\N	\N	\N	\N	ป.4	f	t	256058
303	413	7	2016-07-20 14:21:31.146979	2017-02-05 11:41:43.700504	\N	\N	\N	\N	\N	ป.4	f	t	256061
304	414	7	2016-07-20 14:21:31.156029	2017-02-05 11:41:43.502174	\N	\N	\N	\N	\N	ป.4	f	t	256026
307	417	7	2016-07-20 14:21:31.180558	2017-02-05 11:41:43.730899	\N	\N	\N	\N	\N	ป.4	f	t	256031
306	416	7	2016-07-20 14:21:31.174452	2017-02-05 11:41:43.52557	\N	\N	\N	\N	\N	ป.4	f	t	256062
311	421	7	2016-07-20 14:21:31.210433	2017-02-05 11:41:43.566741	\N	\N	\N	\N	\N	ป.4	f	t	256035
310	420	7	2016-07-20 14:21:31.202578	2017-02-05 11:41:43.738428	\N	\N	\N	\N	\N	ป.4	f	t	256032
285	395	7	2016-07-20 14:21:30.956278	2017-02-05 11:41:43.613747	\N	\N	\N	\N	\N	ป.4	f	t	256006
325	435	8	2016-07-20 14:21:42.911902	2017-02-05 11:41:43.180791	\N	\N	\N	\N	\N	ป.4	f	t	256049
330	440	8	2016-07-20 14:21:42.96552	2017-02-05 11:41:43.219639	\N	\N	\N	\N	\N	ป.4	f	t	256054
332	442	8	2016-07-20 14:21:42.994054	2017-02-05 11:41:43.227938	\N	\N	\N	\N	\N	ป.4	f	t	256056
334	444	8	2016-07-20 14:21:43.016915	2017-02-05 11:41:43.237985	\N	\N	\N	\N	\N	ป.4	f	t	256023
283	393	7	2016-07-20 14:21:30.937006	2017-02-05 11:41:43.320794	\N	\N	\N	\N	\N	ป.4	f	t	256004
347	457	9	2016-07-20 14:21:57.599186	2017-02-05 11:32:21.747207	\N	\N	\N	\N	\N	ป.5	f	t	255005
349	459	9	2016-07-20 14:21:57.613594	2017-02-05 11:32:21.763707	\N	\N	\N	\N	\N	ป.5	f	t	255007
352	462	9	2016-07-20 14:21:57.651437	2017-02-05 11:32:21.781803	\N	\N	\N	\N	\N	ป.5	f	t	255048
354	464	9	2016-07-20 14:21:57.668234	2017-02-05 11:32:21.461401	\N	\N	\N	\N	\N	ป.5	f	t	255050
355	465	9	2016-07-20 14:21:57.678017	2017-02-05 11:32:21.807102	\N	\N	\N	\N	\N	ป.5	f	t	255070
356	466	9	2016-07-20 14:21:57.684405	2017-02-05 11:32:21.47974	\N	\N	\N	\N	\N	ป.5	f	t	255052
360	470	9	2016-07-20 14:21:57.716124	2017-02-05 11:32:21.825662	\N	\N	\N	\N	\N	ป.5	f	t	255054
359	469	9	2016-07-20 14:21:57.709109	2017-02-05 11:32:21.517734	\N	\N	\N	\N	\N	ป.5	f	t	255017
362	472	9	2016-07-20 14:21:57.732951	2017-02-05 11:32:21.54332	\N	\N	\N	\N	\N	ป.5	f	t	255019
363	473	9	2016-07-20 14:21:57.744306	2017-02-05 11:32:21.834219	\N	\N	\N	\N	\N	ป.5	f	t	255020
345	455	9	2016-07-20 14:21:57.58642	2017-02-05 11:32:21.729896	\N	\N	\N	\N	\N	ป.5	f	t	255002
217	327	5	2016-07-20 14:21:14.323163	2017-02-05 11:32:19.795188	\N	\N	\N	\N	\N	ป.3	f	t	257008
286	396	7	2016-07-20 14:21:30.964222	2017-02-05 11:41:43.345155	\N	\N	\N	\N	\N	ป.4	f	t	256041
290	400	7	2016-07-20 14:21:31.015219	2017-02-05 11:41:43.645732	\N	\N	\N	\N	\N	ป.4	f	t	256011
367	477	9	2016-07-20 14:21:57.77628	2017-02-05 11:32:21.594573	\N	\N	\N	\N	\N	ป.5	f	t	255023
371	481	9	2016-07-20 14:21:57.812851	2017-02-05 11:32:21.633479	\N	\N	\N	\N	\N	ป.5	f	t	255031
373	483	9	2016-07-20 14:21:57.831182	2017-02-05 11:32:21.894668	\N	\N	\N	\N	\N	ป.5	f	t	255067
374	484	9	2016-07-20 14:21:57.837594	2017-02-05 11:32:21.672597	\N	\N	\N	\N	\N	ป.5	f	t	255068
375	485	9	2016-07-20 14:21:57.844984	2017-02-05 11:32:21.911238	\N	\N	\N	\N	\N	ป.5	f	t	255034
377	487	9	2016-07-20 14:21:57.861941	2017-02-05 11:32:21.697291	\N	\N	\N	\N	\N	ป.5	f	t	255035
378	488	9	2016-07-20 14:21:57.881551	2017-02-05 11:32:21.926165	\N	\N	\N	\N	\N	ป.5	f	t	258078
368	478	9	2016-07-20 14:21:57.790323	2017-02-05 11:32:21.868947	\N	\N	\N	\N	\N	ป.5	f	t	255061
419	529	11	2016-07-20 14:22:19.176503	2017-02-05 11:32:21.955669	\N	\N	\N	\N	\N	ป.6	f	t	254036
386	496	10	2016-07-20 14:22:08.05147	2017-02-05 11:32:20.862102	\N	\N	\N	\N	\N	ป.5	f	t	255040
383	493	10	2016-07-20 14:22:08.031049	2017-02-05 11:32:20.826204	\N	\N	\N	\N	\N	ป.5	f	t	255004
381	491	10	2016-07-20 14:22:08.012681	2017-02-05 11:32:20.84567	\N	\N	\N	\N	\N	ป.5	f	t	255001
390	500	10	2016-07-20 14:22:08.085206	2017-02-05 11:32:21.181694	\N	\N	\N	\N	\N	ป.5	f	t	255006
387	497	10	2016-07-20 14:22:08.062055	2017-02-05 11:32:20.871254	\N	\N	\N	\N	\N	ป.5	f	t	255041
393	503	10	2016-07-20 14:22:08.106631	2017-02-05 11:32:20.913339	\N	\N	\N	\N	\N	ป.5	f	t	255012
392	502	10	2016-07-20 14:22:08.099847	2017-02-05 11:32:21.197125	\N	\N	\N	\N	\N	ป.5	f	t	255010
397	507	10	2016-07-20 14:22:08.143608	2017-02-05 11:32:21.227787	\N	\N	\N	\N	\N	ป.5	f	t	255053
394	504	10	2016-07-20 14:22:08.118348	2017-02-05 11:32:20.922008	\N	\N	\N	\N	\N	ป.5	f	t	255049
396	506	10	2016-07-20 14:22:08.137647	2017-02-05 11:32:20.929753	\N	\N	\N	\N	\N	ป.5	f	t	255013
401	511	10	2016-07-20 14:22:08.171934	2017-02-05 11:32:20.982488	\N	\N	\N	\N	\N	ป.5	f	t	255057
400	510	10	2016-07-20 14:22:08.164741	2017-02-05 11:32:21.244138	\N	\N	\N	\N	\N	ป.5	f	t	255072
402	512	10	2016-07-20 14:22:08.179694	2017-02-05 11:32:21.26087	\N	\N	\N	\N	\N	ป.5	f	t	255055
404	514	10	2016-07-20 14:22:08.20141	2017-02-05 11:32:21.001822	\N	\N	\N	\N	\N	ป.5	f	t	255058
406	516	10	2016-07-20 14:22:08.21316	2017-02-05 11:32:21.297749	\N	\N	\N	\N	\N	ป.5	f	t	255024
405	515	10	2016-07-20 14:22:08.20751	2017-02-05 11:32:21.020796	\N	\N	\N	\N	\N	ป.5	f	t	255022
412	522	10	2016-07-20 14:22:08.256533	2017-02-05 11:32:21.076689	\N	\N	\N	\N	\N	ป.5	f	t	255065
409	519	10	2016-07-20 14:22:08.234631	2017-02-05 11:32:21.316513	\N	\N	\N	\N	\N	ป.5	f	t	255026
411	521	10	2016-07-20 14:22:08.250618	2017-02-05 11:32:21.335602	\N	\N	\N	\N	\N	ป.5	f	t	255027
366	476	9	2016-07-20 14:21:57.769787	2017-02-05 11:32:21.576386	\N	\N	\N	\N	\N	ป.5	f	t	255060
413	523	10	2016-07-20 14:22:08.26838	2017-02-05 11:32:21.086051	\N	\N	\N	\N	\N	ป.5	f	t	255066
415	525	10	2016-07-20 14:22:08.279899	2017-02-05 11:32:21.095232	\N	\N	\N	\N	\N	ป.5	f	t	255033
416	526	10	2016-07-20 14:22:08.286588	2017-02-05 11:32:21.110595	\N	\N	\N	\N	\N	ป.5	f	t	258087
385	495	10	2016-07-20 14:22:08.045728	2017-02-05 11:32:21.143467	\N	\N	\N	\N	\N	ป.5	f	t	255039
421	531	11	2016-07-20 14:22:19.189027	2017-02-05 11:32:21.974381	\N	\N	\N	\N	\N	ป.6	f	t	254072
423	533	11	2016-07-20 14:22:19.203876	2017-02-05 11:32:22.28097	\N	\N	\N	\N	\N	ป.6	f	t	256092
424	534	11	2016-07-20 14:22:19.215636	2017-02-05 11:32:22.013076	\N	\N	\N	\N	\N	ป.6	f	t	254070
425	535	11	2016-07-20 14:22:19.227078	2017-02-05 11:32:22.296644	\N	\N	\N	\N	\N	ป.6	f	t	254043
432	542	11	2016-07-20 14:22:19.309851	2017-02-05 11:32:22.074724	\N	\N	\N	\N	\N	ป.6	f	t	254071
428	538	11	2016-07-20 14:22:19.263534	2017-02-05 11:32:22.306974	\N	\N	\N	\N	\N	ป.6	f	t	254049
430	540	11	2016-07-20 14:22:19.288077	2017-02-05 11:32:22.315695	\N	\N	\N	\N	\N	ป.6	f	t	254053
434	544	11	2016-07-20 14:22:19.327909	2017-02-05 11:32:22.331296	\N	\N	\N	\N	\N	ป.6	f	t	254022
449	559	11	2016-07-20 14:22:19.44712	2017-02-05 11:32:22.246228	\N	\N	\N	\N	\N	ป.6	f	t	258091
435	545	11	2016-07-20 14:22:19.334179	2017-02-05 11:32:22.107257	\N	\N	\N	\N	\N	ป.6	f	t	254023
439	549	11	2016-07-20 14:22:19.36314	2017-02-05 11:32:22.358538	\N	\N	\N	\N	\N	ป.6	f	t	254028
438	548	11	2016-07-20 14:22:19.356045	2017-02-05 11:32:22.14284	\N	\N	\N	\N	\N	ป.6	f	t	254027
440	550	11	2016-07-20 14:22:19.374915	2017-02-05 11:32:22.158672	\N	\N	\N	\N	\N	ป.6	f	t	254029
442	552	11	2016-07-20 14:22:19.393015	2017-02-05 11:32:22.368334	\N	\N	\N	\N	\N	ป.6	f	t	254064
443	553	11	2016-07-20 14:22:19.399285	2017-02-05 11:32:22.177995	\N	\N	\N	\N	\N	ป.6	f	t	254030
444	554	11	2016-07-20 14:22:19.405767	2017-02-05 11:32:22.392662	\N	\N	\N	\N	\N	ป.6	f	t	256088
431	541	11	2016-07-20 14:22:19.298278	2017-02-05 11:32:22.229771	\N	\N	\N	\N	\N	ป.6	f	t	254017
447	557	11	2016-07-20 14:22:19.428625	2017-02-05 11:32:22.406164	\N	\N	\N	\N	\N	ป.6	f	t	257076
451	561	12	2016-07-20 14:25:13.663481	2017-02-05 11:32:22.442053	\N	\N	\N	\N	\N	ป.6	f	t	254005
420	530	11	2016-07-20 14:22:19.182808	2017-02-05 11:32:22.263514	\N	\N	\N	\N	\N	ป.6	f	t	254037
454	564	12	2016-07-20 14:25:13.680342	2017-02-05 11:32:22.862514	\N	\N	\N	\N	\N	ป.6	f	t	254008
453	563	12	2016-07-20 14:25:13.674102	2017-02-05 11:32:22.460932	\N	\N	\N	\N	\N	ป.6	f	t	254040
458	568	12	2016-07-20 14:25:13.713264	2017-02-05 11:32:22.496185	\N	\N	\N	\N	\N	ป.6	f	t	254047
457	567	12	2016-07-20 14:25:13.703403	2017-02-05 11:32:22.881998	\N	\N	\N	\N	\N	ป.6	f	t	254011
462	572	12	2016-07-20 14:25:13.737971	2017-02-05 11:32:22.915619	\N	\N	\N	\N	\N	ป.6	f	t	254015
459	569	12	2016-07-20 14:25:13.721094	2017-02-05 11:32:22.512218	\N	\N	\N	\N	\N	ป.6	f	t	254012
461	571	12	2016-07-20 14:25:13.733	2017-02-05 11:32:22.528249	\N	\N	\N	\N	\N	ป.6	f	t	254050
463	573	12	2016-07-20 14:25:13.7431	2017-02-05 11:32:22.537519	\N	\N	\N	\N	\N	ป.6	f	t	254054
466	576	12	2016-07-20 14:25:13.758771	2017-02-05 11:32:22.575656	\N	\N	\N	\N	\N	ป.6	f	t	254073
468	578	12	2016-07-20 14:25:13.76851	2017-02-05 11:32:22.585576	\N	\N	\N	\N	\N	ป.6	f	t	256075
469	579	12	2016-07-20 14:25:13.773766	2017-02-05 11:32:22.593711	\N	\N	\N	\N	\N	ป.6	f	t	254058
470	580	12	2016-07-20 14:25:13.778395	2017-02-05 11:32:22.612422	\N	\N	\N	\N	\N	ป.6	f	t	254025
472	582	12	2016-07-20 14:25:13.788311	2017-02-05 11:32:22.655106	\N	\N	\N	\N	\N	ป.6	f	t	254062
473	583	12	2016-07-20 14:25:13.793583	2017-02-05 11:32:22.670444	\N	\N	\N	\N	\N	ป.6	f	t	254063
476	586	12	2016-07-20 14:25:13.808927	2017-02-05 11:32:22.714044	\N	\N	\N	\N	\N	ป.6	f	t	254068
450	560	12	2016-07-20 14:25:13.656675	2017-02-05 11:32:22.834449	\N	\N	\N	\N	\N	ป.6	f	t	254001
203	313	4	2016-07-20 14:21:07.066005	2017-02-05 11:32:19.692398	\N	\N	\N	\N	\N	ป.2	f	t	258073
208	318	4	2016-07-20 14:21:07.127514	2017-02-05 11:32:19.72654	\N	\N	\N	\N	\N	ป.2	f	t	258067
212	322	5	2016-07-20 14:21:14.281619	2017-02-05 11:32:19.757372	\N	\N	\N	\N	\N	ป.3	f	t	257002
215	325	5	2016-07-20 14:21:14.309965	2017-02-05 11:32:19.778403	\N	\N	\N	\N	\N	ป.3	f	t	257006
223	333	5	2016-07-20 14:21:14.379577	2017-02-05 11:32:19.842316	\N	\N	\N	\N	\N	ป.3	f	t	257015
231	341	5	2016-07-20 14:21:14.44171	2017-02-05 11:32:19.901932	\N	\N	\N	\N	\N	ป.3	f	t	257023
238	348	5	2016-07-20 14:21:14.499204	2017-02-05 11:32:20.195758	\N	\N	\N	\N	\N	ป.3	f	t	257030
234	344	5	2016-07-20 14:21:14.462523	2017-02-05 11:32:19.934072	\N	\N	\N	\N	\N	ป.3	f	t	257026
242	352	5	2016-07-20 14:21:14.532638	2017-02-05 11:32:20.010391	\N	\N	\N	\N	\N	ป.3	f	t	257034
250	360	6	2016-07-20 14:21:21.556709	2017-02-05 11:32:20.308217	\N	\N	\N	\N	\N	ป.3	f	t	257039
227	337	5	2016-07-20 14:21:14.415508	2017-02-05 11:32:20.128055	\N	\N	\N	\N	\N	ป.3	f	t	257019
253	363	6	2016-07-20 14:21:21.585973	2017-02-05 11:32:20.333744	\N	\N	\N	\N	\N	ป.3	f	t	257043
257	367	6	2016-07-20 14:21:21.615714	2017-02-05 11:32:20.376618	\N	\N	\N	\N	\N	ป.3	f	t	257047
265	375	6	2016-07-20 14:21:21.686414	2017-02-05 11:32:20.455065	\N	\N	\N	\N	\N	ป.3	f	t	257055
269	379	6	2016-07-20 14:21:21.731689	2017-02-05 11:32:20.729412	\N	\N	\N	\N	\N	ป.3	f	t	257059
276	386	6	2016-07-20 14:21:21.801276	2017-02-05 11:32:20.543891	\N	\N	\N	\N	\N	ป.3	f	t	257069
280	390	6	2016-07-20 14:21:21.840182	2017-02-05 11:32:20.793102	\N	\N	\N	\N	\N	ป.3	f	t	259075
261	371	6	2016-07-20 14:21:21.650973	2017-02-05 11:32:20.652808	\N	\N	\N	\N	\N	ป.3	f	t	257051
382	492	10	2016-07-20 14:22:08.018753	2017-02-05 11:32:20.814636	\N	\N	\N	\N	\N	ป.5	f	t	255037
199	309	4	2016-07-20 14:21:07.018421	2017-02-05 11:32:18.643885	\N	\N	\N	\N	\N	ป.2	f	t	258059
69	179	1	2016-07-20 13:48:41.823254	2017-02-06 05:40:35.451084	\N	9	9	34.5	3.83333333333333348	ป.1	f	t	259001
492	215	14	2016-11-06 12:40:21.555847	2017-02-05 11:41:40.564477	\N	\N	\N	\N	\N	ป.1	f	t	259036
494	217	14	2016-11-06 12:40:21.564588	2017-02-05 11:41:40.573166	\N	\N	\N	\N	\N	ป.1	f	t	259068
496	219	14	2016-11-06 12:40:21.575001	2017-02-05 11:41:40.580433	\N	\N	\N	\N	\N	ป.1	f	t	259039
497	220	14	2016-11-06 12:40:21.578759	2017-02-05 11:41:40.644292	\N	\N	\N	\N	\N	ป.1	f	t	259040
501	224	14	2016-11-06 12:40:21.596944	2017-02-05 11:41:40.777815	\N	\N	\N	\N	\N	ป.1	f	t	259045
503	226	14	2016-11-06 12:40:21.604534	2017-02-05 11:41:40.792075	\N	\N	\N	\N	\N	ป.1	f	t	259047
505	228	14	2016-11-06 12:40:21.623198	2017-02-05 11:41:40.800222	\N	\N	\N	\N	\N	ป.1	f	t	259049
506	229	14	2016-11-06 12:40:21.627738	2017-02-05 11:41:40.809717	\N	\N	\N	\N	\N	ป.1	f	t	259050
508	231	14	2016-11-06 12:40:21.642284	2017-02-05 11:41:40.868859	\N	\N	\N	\N	\N	ป.1	f	t	259071
510	233	14	2016-11-06 12:40:21.659536	2017-02-05 11:41:40.936311	\N	\N	\N	\N	\N	ป.1	f	t	259054
511	234	14	2016-11-06 12:40:21.663538	2017-02-05 11:41:41.007224	\N	\N	\N	\N	\N	ป.1	f	t	259055
513	236	14	2016-11-06 12:40:21.681767	2017-02-05 11:41:41.069758	\N	\N	\N	\N	\N	ป.1	f	t	259057
516	239	14	2016-11-06 12:40:21.700953	2017-02-05 11:41:41.214112	\N	\N	\N	\N	\N	ป.1	f	t	259060
518	241	14	2016-11-06 12:40:21.720826	2017-02-05 11:41:41.282426	\N	\N	\N	\N	\N	ป.1	f	t	259062
531	606	16	2017-01-28 07:30:32.695731	2017-01-30 13:09:26.720827	\N	18	18	70.5	3.91666666666666652	ป.3	f	t	\N
309	419	7	2016-07-20 14:21:31.19524	2017-02-05 11:41:43.552839	\N	\N	\N	\N	\N	ป.4	f	t	256085
312	422	7	2016-07-20 14:21:31.220168	2017-02-05 11:41:43.745738	\N	\N	\N	\N	\N	ป.4	f	t	259078
528	604	7	2017-01-28 07:18:37.549019	2017-02-05 11:41:43.582088	\N	\N	\N	\N	\N	ป.4	f	t	256036
1230	606	8	2017-02-06 06:13:46.145505	2017-02-06 06:16:07.021135	\N	\N	\N	\N	\N	ป.4	f	t	\N
320	430	8	2016-07-20 14:21:42.862083	2017-02-05 11:41:43.16343	\N	\N	\N	\N	\N	ป.4	f	t	256010
335	445	8	2016-07-20 14:21:43.029888	2017-02-05 11:41:43.25757	\N	\N	\N	\N	\N	ป.4	f	t	256060
331	441	8	2016-07-20 14:21:42.982821	2017-02-05 11:41:43.029936	\N	\N	\N	\N	\N	ป.4	f	t	256021
341	451	8	2016-07-20 14:21:43.08927	2017-02-05 11:41:43.098506	\N	\N	\N	\N	\N	ป.4	f	t	256068
339	449	8	2016-07-20 14:21:43.070741	2017-02-05 11:41:43.287343	\N	\N	\N	\N	\N	ป.4	f	t	256030
342	452	8	2016-07-20 14:21:43.096209	2017-02-05 11:41:43.299887	\N	\N	\N	\N	\N	ป.4	f	t	256069
316	426	8	2016-07-20 14:21:42.823758	2017-02-05 11:41:43.131675	\N	\N	\N	\N	\N	ป.4	f	t	256037
301	411	7	2016-07-20 14:21:31.132167	2017-02-05 11:41:43.486239	\N	\N	\N	\N	\N	ป.4	f	t	256024
353	463	9	2016-07-20 14:21:57.661665	2017-02-05 11:32:21.444126	\N	\N	\N	\N	\N	ป.5	f	t	256083
357	467	9	2016-07-20 14:21:57.696159	2017-02-05 11:32:21.500658	\N	\N	\N	\N	\N	ป.5	f	t	257073
361	471	9	2016-07-20 14:21:57.726298	2017-02-05 11:32:21.535263	\N	\N	\N	\N	\N	ป.5	f	t	255018
369	479	9	2016-07-20 14:21:57.796501	2017-02-05 11:32:21.613213	\N	\N	\N	\N	\N	ป.5	f	t	255063
380	490	9	2016-07-20 14:21:57.900592	2017-02-05 11:32:21.942844	\N	\N	\N	\N	\N	ป.5	f	t	258090
376	486	9	2016-07-20 14:21:57.855233	2017-02-05 11:32:21.68926	\N	\N	\N	\N	\N	ป.5	f	t	255069
365	475	9	2016-07-20 14:21:57.763307	2017-02-05 11:32:21.859081	\N	\N	\N	\N	\N	ป.5	f	t	255059
422	532	11	2016-07-20 14:22:19.195072	2017-02-05 11:32:21.987864	\N	\N	\N	\N	\N	ป.6	f	t	254078
388	498	10	2016-07-20 14:22:08.068056	2017-02-05 11:32:21.159857	\N	\N	\N	\N	\N	ป.5	f	t	255042
395	505	10	2016-07-20 14:22:08.127071	2017-02-05 11:32:21.219584	\N	\N	\N	\N	\N	ป.5	f	t	256072
407	517	10	2016-07-20 14:22:08.219079	2017-02-05 11:32:21.028638	\N	\N	\N	\N	\N	ป.5	f	t	255025
403	513	10	2016-07-20 14:22:08.189908	2017-02-05 11:32:21.278113	\N	\N	\N	\N	\N	ป.5	f	t	255021
350	460	9	2016-07-20 14:21:57.620573	2017-02-05 11:32:21.426456	\N	\N	\N	\N	\N	ป.5	f	t	255009
478	588	12	2016-07-20 14:25:13.820927	2017-02-05 11:32:22.75289	\N	\N	\N	\N	\N	ป.6	f	t	254034
479	589	12	2016-07-20 14:25:13.826369	2017-02-05 11:32:22.77514	\N	\N	\N	\N	\N	ป.6	f	t	254069
480	590	12	2016-07-20 14:25:13.831305	2017-02-05 11:32:22.788558	\N	\N	\N	\N	\N	ป.6	f	t	257071
481	591	12	2016-07-20 14:25:13.836136	2017-02-05 11:32:22.808662	\N	\N	\N	\N	\N	ป.6	f	t	257074
452	562	12	2016-07-20 14:25:13.669057	2017-02-05 11:32:22.854648	\N	\N	\N	\N	\N	ป.6	f	t	254038
485	596	1	2016-08-16 15:29:17.981562	2017-02-05 11:20:21.8062	\N	\N	\N	\N	\N	ป.1	f	t	32423
80	190	1	2016-07-20 13:48:41.942216	2017-02-05 11:20:22.068009	\N	\N	\N	\N	\N	ป.1	f	t	259011
1457	515	114	2017-02-06 06:16:07.676429	2017-02-06 06:16:07.676429	\N	\N	\N	\N	\N	ป.6	t	t	255022
520	243	14	2016-11-06 12:40:21.735965	2017-02-05 11:41:41.370333	\N	\N	\N	\N	\N	ป.1	f	t	259064
495	218	14	2016-11-06 12:40:21.569335	2017-02-05 11:41:41.475823	\N	\N	\N	\N	\N	ป.1	f	t	259038
519	242	14	2016-11-06 12:40:21.72753	2017-02-05 11:41:41.350324	\N	\N	\N	\N	\N	ป.1	f	t	259063
490	213	14	2016-11-06 12:40:21.536276	2017-02-05 11:41:41.358372	\N	\N	\N	\N	\N	ป.1	f	t	259034
499	222	14	2016-11-06 12:40:21.589287	2017-02-05 11:41:41.483687	\N	\N	\N	\N	\N	ป.1	f	t	259043
523	246	14	2016-11-06 12:40:21.747981	2017-02-05 11:41:41.445576	\N	\N	\N	\N	\N	ป.1	f	t	259072
491	214	14	2016-11-06 12:40:21.5519	2017-02-05 11:41:41.460268	\N	\N	\N	\N	\N	ป.1	f	t	259035
522	245	14	2016-11-06 12:40:21.744038	2017-02-05 11:41:41.902284	\N	\N	\N	\N	\N	ป.1	f	t	259066
502	225	14	2016-11-06 12:40:21.600681	2017-02-05 11:41:41.541273	\N	\N	\N	\N	\N	ป.1	f	t	259046
504	227	14	2016-11-06 12:40:21.613924	2017-02-05 11:41:41.551539	\N	\N	\N	\N	\N	ป.1	f	t	259048
509	232	14	2016-11-06 12:40:21.653997	2017-02-05 11:41:41.57152	\N	\N	\N	\N	\N	ป.1	f	t	259052
512	235	14	2016-11-06 12:40:21.675153	2017-02-05 11:41:41.637023	\N	\N	\N	\N	\N	ป.1	f	t	259056
515	238	14	2016-11-06 12:40:21.689244	2017-02-05 11:41:41.706367	\N	\N	\N	\N	\N	ป.1	f	t	259059
517	240	14	2016-11-06 12:40:21.707358	2017-02-05 11:41:41.771658	\N	\N	\N	\N	\N	ป.1	f	t	259061
498	221	14	2016-11-06 12:40:21.585528	2017-02-05 11:41:41.835365	\N	\N	\N	\N	\N	ป.1	f	t	259042
524	247	14	2016-11-06 12:40:21.751766	2017-02-05 11:41:41.909812	\N	\N	\N	\N	\N	ป.1	f	t	259073
328	438	8	2016-07-20 14:21:42.949503	2017-02-05 11:41:42.996343	\N	\N	\N	\N	\N	ป.4	f	t	256053
547	606	7	2017-01-30 13:22:58.966397	2017-02-05 11:41:43.597206	\N	\N	\N	\N	\N	ป.4	f	t	\N
549	605	7	2017-01-31 04:38:17.243432	2017-02-05 11:41:43.605484	\N	\N	\N	\N	\N	ป.4	f	t	\N
305	415	7	2016-07-20 14:21:31.168437	2017-02-05 11:41:43.716291	\N	\N	\N	\N	\N	ป.4	f	t	256027
143	253	3	2016-07-20 14:20:51.926602	2017-02-05 11:32:16.292905	\N	\N	\N	\N	\N	ป.2	f	t	258006
410	520	10	2016-07-20 14:22:08.241252	2017-02-05 11:32:21.060052	\N	\N	\N	\N	\N	ป.5	f	t	255064
384	494	10	2016-07-20 14:22:08.038466	2017-02-05 11:32:21.127027	\N	\N	\N	\N	\N	ป.5	f	t	255038
456	566	12	2016-07-20 14:25:13.695463	2017-02-05 11:32:22.488318	\N	\N	\N	\N	\N	ป.6	f	t	254009
426	536	11	2016-07-20 14:22:19.244645	2017-02-05 11:32:22.030973	\N	\N	\N	\N	\N	ป.6	f	t	254045
429	539	11	2016-07-20 14:22:19.27627	2017-02-05 11:32:22.065502	\N	\N	\N	\N	\N	ป.6	f	t	254051
433	543	11	2016-07-20 14:22:19.321063	2017-02-05 11:32:22.083674	\N	\N	\N	\N	\N	ป.6	f	t	254020
437	547	11	2016-07-20 14:22:19.348933	2017-02-05 11:32:22.126269	\N	\N	\N	\N	\N	ป.6	f	t	254026
445	555	11	2016-07-20 14:22:19.41285	2017-02-05 11:32:22.195485	\N	\N	\N	\N	\N	ป.6	f	t	254032
448	558	11	2016-07-20 14:22:19.440903	2017-02-05 11:32:22.221779	\N	\N	\N	\N	\N	ป.6	f	t	258079
418	528	11	2016-07-20 14:22:19.164381	2017-02-05 11:32:22.423621	\N	\N	\N	\N	\N	ป.6	f	t	254004
460	570	12	2016-07-20 14:25:13.727807	2017-02-05 11:32:22.899318	\N	\N	\N	\N	\N	ป.6	f	t	254013
464	574	12	2016-07-20 14:25:13.748162	2017-02-05 11:32:22.545551	\N	\N	\N	\N	\N	ป.6	f	t	256076
471	581	12	2016-07-20 14:25:13.783267	2017-02-05 11:32:22.629	\N	\N	\N	\N	\N	ป.6	f	t	254018
475	585	12	2016-07-20 14:25:13.80402	2017-02-05 11:32:22.696824	\N	\N	\N	\N	\N	ป.6	f	t	254067
477	587	12	2016-07-20 14:25:13.815087	2017-02-05 11:32:22.736811	\N	\N	\N	\N	\N	ป.6	f	t	256074
73	183	1	2016-07-20 13:48:41.873113	2017-02-05 11:18:47.381004	\N	\N	\N	\N	\N	ป.1	f	t	259005
87	197	1	2016-07-20 13:48:42.02417	2017-02-05 11:20:20.981962	\N	\N	\N	\N	\N	ป.1	f	t	259018
94	204	1	2016-07-20 13:48:42.087596	2017-02-05 11:20:21.069894	\N	\N	\N	\N	\N	ป.1	f	t	259025
484	595	1	2016-08-16 15:22:19.807673	2017-02-05 11:20:21.74157	\N	\N	\N	\N	\N	ป.1	f	t	32412
101	211	1	2016-07-20 13:48:42.14722	2017-02-05 11:20:22.495002	\N	\N	\N	\N	\N	ป.1	f	t	259032
542	608	1	2017-01-28 11:07:04.139398	2017-02-05 11:20:22.508729	\N	\N	\N	\N	\N	ป.1	f	t	12345
391	501	10	2016-07-20 14:22:08.091422	2017-02-05 11:32:20.896359	\N	\N	\N	\N	\N	ป.5	f	t	255045
1252	601	106	2017-02-06 06:16:03.616902	2017-02-06 06:16:03.616902	\N	\N	\N	\N	\N	ป.2	t	t	1234
1253	179	106	2017-02-06 06:16:03.627837	2017-02-06 06:16:03.627837	\N	\N	\N	\N	\N	ป.2	t	t	259001
1254	595	106	2017-02-06 06:16:03.634466	2017-02-06 06:16:03.634466	\N	\N	\N	\N	\N	ป.2	t	t	32412
1255	596	106	2017-02-06 06:16:03.690075	2017-02-06 06:16:03.690075	\N	\N	\N	\N	\N	ป.2	t	t	32423
1256	182	106	2017-02-06 06:16:03.753892	2017-02-06 06:16:03.753892	\N	\N	\N	\N	\N	ป.2	t	t	259004
1257	185	106	2017-02-06 06:16:03.819977	2017-02-06 06:16:03.819977	\N	\N	\N	\N	\N	ป.2	t	t	259007
488	601	1	2016-09-04 10:14:52.124508	2017-02-06 06:07:42.620963	\N	9	9	34.5	3.83333333333333348	ป.1	f	t	1234
1231	183	106	2017-02-06 06:16:03.023263	2017-02-06 06:16:03.023263	\N	\N	\N	\N	\N	ป.2	t	t	259005
1232	184	106	2017-02-06 06:16:03.044495	2017-02-06 06:16:03.044495	\N	\N	\N	\N	\N	ป.2	t	t	259006
1233	186	106	2017-02-06 06:16:03.059865	2017-02-06 06:16:03.059865	\N	\N	\N	\N	\N	ป.2	t	t	259008
1234	188	106	2017-02-06 06:16:03.12764	2017-02-06 06:16:03.12764	\N	\N	\N	\N	\N	ป.2	t	t	259069
1235	189	106	2017-02-06 06:16:03.141195	2017-02-06 06:16:03.141195	\N	\N	\N	\N	\N	ป.2	t	t	259010
1236	191	106	2017-02-06 06:16:03.148665	2017-02-06 06:16:03.148665	\N	\N	\N	\N	\N	ป.2	t	t	259012
1237	192	106	2017-02-06 06:16:03.155519	2017-02-06 06:16:03.155519	\N	\N	\N	\N	\N	ป.2	t	t	259013
1238	194	106	2017-02-06 06:16:03.162544	2017-02-06 06:16:03.162544	\N	\N	\N	\N	\N	ป.2	t	t	259015
1239	195	106	2017-02-06 06:16:03.214688	2017-02-06 06:16:03.214688	\N	\N	\N	\N	\N	ป.2	t	t	259016
1240	197	106	2017-02-06 06:16:03.22142	2017-02-06 06:16:03.22142	\N	\N	\N	\N	\N	ป.2	t	t	259018
1241	199	106	2017-02-06 06:16:03.275747	2017-02-06 06:16:03.275747	\N	\N	\N	\N	\N	ป.2	t	t	259020
1242	200	106	2017-02-06 06:16:03.337813	2017-02-06 06:16:03.337813	\N	\N	\N	\N	\N	ป.2	t	t	259021
1243	202	106	2017-02-06 06:16:03.403028	2017-02-06 06:16:03.403028	\N	\N	\N	\N	\N	ป.2	t	t	259023
1244	204	106	2017-02-06 06:16:03.410149	2017-02-06 06:16:03.410149	\N	\N	\N	\N	\N	ป.2	t	t	259025
1245	205	106	2017-02-06 06:16:03.423944	2017-02-06 06:16:03.423944	\N	\N	\N	\N	\N	ป.2	t	t	259070
1246	207	106	2017-02-06 06:16:03.430884	2017-02-06 06:16:03.430884	\N	\N	\N	\N	\N	ป.2	t	t	259027
1247	209	106	2017-02-06 06:16:03.438371	2017-02-06 06:16:03.438371	\N	\N	\N	\N	\N	ป.2	t	t	259030
1248	210	106	2017-02-06 06:16:03.489857	2017-02-06 06:16:03.489857	\N	\N	\N	\N	\N	ป.2	t	t	259031
1249	212	106	2017-02-06 06:16:03.555394	2017-02-06 06:16:03.555394	\N	\N	\N	\N	\N	ป.2	t	t	259033
1250	181	106	2017-02-06 06:16:03.600947	2017-02-06 06:16:03.600947	\N	\N	\N	\N	\N	ป.2	t	t	259003
1251	180	106	2017-02-06 06:16:03.607588	2017-02-06 06:16:03.607588	\N	\N	\N	\N	\N	ป.2	t	t	259002
1258	187	106	2017-02-06 06:16:03.880065	2017-02-06 06:16:03.880065	\N	\N	\N	\N	\N	ป.2	t	t	259009
1259	190	106	2017-02-06 06:16:03.939884	2017-02-06 06:16:03.939884	\N	\N	\N	\N	\N	ป.2	t	t	259011
1260	193	106	2017-02-06 06:16:03.999298	2017-02-06 06:16:03.999298	\N	\N	\N	\N	\N	ป.2	t	t	259014
1261	196	106	2017-02-06 06:16:04.073247	2017-02-06 06:16:04.073247	\N	\N	\N	\N	\N	ป.2	t	t	259017
1262	198	106	2017-02-06 06:16:04.127337	2017-02-06 06:16:04.127337	\N	\N	\N	\N	\N	ป.2	t	t	259019
1263	201	106	2017-02-06 06:16:04.147601	2017-02-06 06:16:04.147601	\N	\N	\N	\N	\N	ป.2	t	t	259022
1264	203	106	2017-02-06 06:16:04.208911	2017-02-06 06:16:04.208911	\N	\N	\N	\N	\N	ป.2	t	t	259024
1265	206	106	2017-02-06 06:16:04.258349	2017-02-06 06:16:04.258349	\N	\N	\N	\N	\N	ป.2	t	t	259026
150	260	3	2016-07-20 14:20:51.971381	2017-02-05 11:32:16.527361	\N	\N	\N	\N	\N	ป.2	f	t	258074
171	281	3	2016-07-20 14:20:52.106638	2017-02-05 11:32:16.835066	\N	\N	\N	\N	\N	ป.2	f	t	258034
157	267	3	2016-07-20 14:20:52.020298	2017-02-05 11:32:17.454413	\N	\N	\N	\N	\N	ป.2	f	t	258021
164	274	3	2016-07-20 14:20:52.063225	2017-02-05 11:32:17.659779	\N	\N	\N	\N	\N	ป.2	f	t	258028
500	223	14	2016-11-06 12:40:21.593122	2017-02-05 11:41:40.70739	\N	\N	\N	\N	\N	ป.1	f	t	259044
514	237	14	2016-11-06 12:40:21.685496	2017-02-05 11:41:41.144933	\N	\N	\N	\N	\N	ป.1	f	t	259067
521	244	14	2016-11-06 12:40:21.74018	2017-02-05 11:41:41.381496	\N	\N	\N	\N	\N	ป.1	f	t	259065
493	216	14	2016-11-06 12:40:21.559827	2017-02-05 11:41:41.467981	\N	\N	\N	\N	\N	ป.1	f	t	259037
192	302	4	2016-07-20 14:21:06.96382	2017-02-05 11:32:18.414591	\N	\N	\N	\N	\N	ป.2	f	t	258053
200	310	4	2016-07-20 14:21:07.035678	2017-02-05 11:32:18.711833	\N	\N	\N	\N	\N	ป.2	f	t	258070
209	319	4	2016-07-20 14:21:07.134889	2017-02-05 11:32:18.992043	\N	\N	\N	\N	\N	ป.2	f	t	258084
178	288	4	2016-07-20 14:21:06.836415	2017-02-05 11:32:19.211389	\N	\N	\N	\N	\N	ป.2	f	t	258039
221	331	5	2016-07-20 14:21:14.357689	2017-02-05 11:32:19.826811	\N	\N	\N	\N	\N	ป.3	f	t	257012
230	340	5	2016-07-20 14:21:14.430387	2017-02-05 11:32:19.893004	\N	\N	\N	\N	\N	ป.3	f	t	257022
216	326	5	2016-07-20 14:21:14.316664	2017-02-05 11:32:20.0624	\N	\N	\N	\N	\N	ป.3	f	t	257007
219	329	5	2016-07-20 14:21:14.338276	2017-02-05 11:32:20.082858	\N	\N	\N	\N	\N	ป.3	f	t	257010
240	350	5	2016-07-20 14:21:14.510202	2017-02-05 11:32:20.215789	\N	\N	\N	\N	\N	ป.3	f	t	257032
246	356	6	2016-07-20 14:21:21.516382	2017-02-05 11:32:20.359851	\N	\N	\N	\N	\N	ป.3	f	t	257035
259	369	6	2016-07-20 14:21:21.63208	2017-02-05 11:32:20.388385	\N	\N	\N	\N	\N	ป.3	f	t	257049
268	378	6	2016-07-20 14:21:21.721677	2017-02-05 11:32:20.468431	\N	\N	\N	\N	\N	ป.3	f	t	257058
272	382	6	2016-07-20 14:21:21.767346	2017-02-05 11:32:20.494402	\N	\N	\N	\N	\N	ป.3	f	t	257064
278	388	6	2016-07-20 14:21:21.819899	2017-02-05 11:32:20.553519	\N	\N	\N	\N	\N	ป.3	f	t	257072
249	359	6	2016-07-20 14:21:21.539049	2017-02-05 11:32:20.579494	\N	\N	\N	\N	\N	ป.3	f	t	257038
389	499	10	2016-07-20 14:22:08.073907	2017-02-05 11:32:20.878958	\N	\N	\N	\N	\N	ป.5	f	t	255043
398	508	10	2016-07-20 14:22:08.149602	2017-02-05 11:32:20.946115	\N	\N	\N	\N	\N	ป.5	f	t	255073
399	509	10	2016-07-20 14:22:08.155956	2017-02-05 11:32:20.962805	\N	\N	\N	\N	\N	ป.5	f	t	256073
408	518	10	2016-07-20 14:22:08.226949	2017-02-05 11:32:21.044908	\N	\N	\N	\N	\N	ป.5	f	t	256059
417	527	10	2016-07-20 14:22:08.296905	2017-02-05 11:32:21.369765	\N	\N	\N	\N	\N	ป.5	f	t	259079
346	456	9	2016-07-20 14:21:57.593055	2017-02-05 11:32:21.381721	\N	\N	\N	\N	\N	ป.5	f	t	255003
348	458	9	2016-07-20 14:21:57.605374	2017-02-05 11:32:21.409001	\N	\N	\N	\N	\N	ป.5	f	t	255044
364	474	9	2016-07-20 14:21:57.75062	2017-02-05 11:32:21.560519	\N	\N	\N	\N	\N	ป.5	f	t	255071
372	482	9	2016-07-20 14:21:57.818991	2017-02-05 11:32:21.661095	\N	\N	\N	\N	\N	ป.5	f	t	255032
379	489	9	2016-07-20 14:21:57.893828	2017-02-05 11:32:21.713667	\N	\N	\N	\N	\N	ป.5	f	t	258086
358	468	9	2016-07-20 14:21:57.702701	2017-02-05 11:32:21.817457	\N	\N	\N	\N	\N	ป.5	f	t	255016
370	480	9	2016-07-20 14:21:57.806781	2017-02-05 11:32:21.886915	\N	\N	\N	\N	\N	ป.5	f	t	255030
427	537	11	2016-07-20 14:22:19.252123	2017-02-05 11:32:22.049538	\N	\N	\N	\N	\N	ป.6	f	t	254046
441	551	11	2016-07-20 14:22:19.381958	2017-02-05 11:32:22.169884	\N	\N	\N	\N	\N	ป.6	f	t	256087
446	556	11	2016-07-20 14:22:19.421573	2017-02-05 11:32:22.212086	\N	\N	\N	\N	\N	ป.6	f	t	257075
436	546	11	2016-07-20 14:22:19.340531	2017-02-05 11:32:22.349219	\N	\N	\N	\N	\N	ป.6	f	t	254059
455	565	12	2016-07-20 14:25:13.686467	2017-02-05 11:32:22.478429	\N	\N	\N	\N	\N	ป.6	f	t	254042
474	584	12	2016-07-20 14:25:13.798814	2017-02-05 11:32:22.68854	\N	\N	\N	\N	\N	ป.6	f	t	254065
482	592	12	2016-07-20 14:25:13.841692	2017-02-05 11:32:22.825413	\N	\N	\N	\N	\N	ป.6	f	t	258088
465	575	12	2016-07-20 14:25:13.753079	2017-02-05 11:32:22.931925	\N	\N	\N	\N	\N	ป.6	f	t	254019
467	577	12	2016-07-20 14:25:13.763547	2017-02-05 11:32:22.946791	\N	\N	\N	\N	\N	ป.6	f	t	255077
507	230	14	2016-11-06 12:40:21.632616	2017-02-05 11:41:41.5635	\N	\N	\N	\N	\N	ป.1	f	t	259051
318	428	8	2016-07-20 14:21:42.84248	2017-02-05 11:41:42.893487	\N	\N	\N	\N	\N	ป.4	f	t	256040
324	434	8	2016-07-20 14:21:42.896428	2017-02-05 11:41:42.962123	\N	\N	\N	\N	\N	ป.4	f	t	256047
327	437	8	2016-07-20 14:21:42.942658	2017-02-05 11:41:43.19948	\N	\N	\N	\N	\N	ป.4	f	t	256052
337	447	8	2016-07-20 14:21:43.0526	2017-02-05 11:41:43.267987	\N	\N	\N	\N	\N	ป.4	f	t	256029
289	399	7	2016-07-20 14:21:31.002774	2017-02-05 11:41:43.376335	\N	\N	\N	\N	\N	ป.4	f	t	256086
293	403	7	2016-07-20 14:21:31.050545	2017-02-05 11:41:43.40784	\N	\N	\N	\N	\N	ป.4	f	t	256014
297	407	7	2016-07-20 14:21:31.099693	2017-02-05 11:41:43.463706	\N	\N	\N	\N	\N	ป.4	f	t	256034
299	409	7	2016-07-20 14:21:31.11759	2017-02-05 11:41:43.478526	\N	\N	\N	\N	\N	ป.4	f	t	258089
308	418	7	2016-07-20 14:21:31.186914	2017-02-05 11:41:43.534483	\N	\N	\N	\N	\N	ป.4	f	t	258076
1266	208	106	2017-02-06 06:16:04.32544	2017-02-06 06:16:04.32544	\N	\N	\N	\N	\N	ป.2	t	t	259029
1267	211	106	2017-02-06 06:16:04.338984	2017-02-06 06:16:04.338984	\N	\N	\N	\N	\N	ป.2	t	t	259032
1268	608	106	2017-02-06 06:16:04.345429	2017-02-06 06:16:04.345429	\N	\N	\N	\N	\N	ป.2	t	t	12345
1269	215	107	2017-02-06 06:16:04.355389	2017-02-06 06:16:04.355389	\N	\N	\N	\N	\N	ป.2	t	t	259036
1270	217	107	2017-02-06 06:16:04.36222	2017-02-06 06:16:04.36222	\N	\N	\N	\N	\N	ป.2	t	t	259068
185	295	4	2016-07-20 14:21:06.898151	2017-02-05 11:32:18.32498	\N	\N	\N	\N	\N	ป.2	f	t	258046
1271	219	107	2017-02-06 06:16:04.423668	2017-02-06 06:16:04.423668	\N	\N	\N	\N	\N	ป.2	t	t	259039
1272	220	107	2017-02-06 06:16:04.475213	2017-02-06 06:16:04.475213	\N	\N	\N	\N	\N	ป.2	t	t	259040
1273	223	107	2017-02-06 06:16:04.526957	2017-02-06 06:16:04.526957	\N	\N	\N	\N	\N	ป.2	t	t	259044
1274	224	107	2017-02-06 06:16:04.591662	2017-02-06 06:16:04.591662	\N	\N	\N	\N	\N	ป.2	t	t	259045
1275	226	107	2017-02-06 06:16:04.659344	2017-02-06 06:16:04.659344	\N	\N	\N	\N	\N	ป.2	t	t	259047
1276	228	107	2017-02-06 06:16:04.672713	2017-02-06 06:16:04.672713	\N	\N	\N	\N	\N	ป.2	t	t	259049
1277	229	107	2017-02-06 06:16:04.679964	2017-02-06 06:16:04.679964	\N	\N	\N	\N	\N	ป.2	t	t	259050
1278	231	107	2017-02-06 06:16:04.686807	2017-02-06 06:16:04.686807	\N	\N	\N	\N	\N	ป.2	t	t	259071
1279	233	107	2017-02-06 06:16:04.693896	2017-02-06 06:16:04.693896	\N	\N	\N	\N	\N	ป.2	t	t	259054
1280	234	107	2017-02-06 06:16:04.744366	2017-02-06 06:16:04.744366	\N	\N	\N	\N	\N	ป.2	t	t	259055
1281	236	107	2017-02-06 06:16:04.805555	2017-02-06 06:16:04.805555	\N	\N	\N	\N	\N	ป.2	t	t	259057
1282	237	107	2017-02-06 06:16:04.871487	2017-02-06 06:16:04.871487	\N	\N	\N	\N	\N	ป.2	t	t	259067
1283	239	107	2017-02-06 06:16:04.925226	2017-02-06 06:16:04.925226	\N	\N	\N	\N	\N	ป.2	t	t	259060
1284	241	107	2017-02-06 06:16:04.993418	2017-02-06 06:16:04.993418	\N	\N	\N	\N	\N	ป.2	t	t	259062
1285	242	107	2017-02-06 06:16:05.051847	2017-02-06 06:16:05.051847	\N	\N	\N	\N	\N	ป.2	t	t	259063
1286	213	107	2017-02-06 06:16:05.110543	2017-02-06 06:16:05.110543	\N	\N	\N	\N	\N	ป.2	t	t	259034
1287	243	107	2017-02-06 06:16:05.17065	2017-02-06 06:16:05.17065	\N	\N	\N	\N	\N	ป.2	t	t	259064
1288	244	107	2017-02-06 06:16:05.177219	2017-02-06 06:16:05.177219	\N	\N	\N	\N	\N	ป.2	t	t	259065
1289	246	107	2017-02-06 06:16:05.191024	2017-02-06 06:16:05.191024	\N	\N	\N	\N	\N	ป.2	t	t	259072
1290	214	107	2017-02-06 06:16:05.197624	2017-02-06 06:16:05.197624	\N	\N	\N	\N	\N	ป.2	t	t	259035
1291	216	107	2017-02-06 06:16:05.204792	2017-02-06 06:16:05.204792	\N	\N	\N	\N	\N	ป.2	t	t	259037
1292	218	107	2017-02-06 06:16:05.254547	2017-02-06 06:16:05.254547	\N	\N	\N	\N	\N	ป.2	t	t	259038
1293	222	107	2017-02-06 06:16:05.318707	2017-02-06 06:16:05.318707	\N	\N	\N	\N	\N	ป.2	t	t	259043
1294	225	107	2017-02-06 06:16:05.3781	2017-02-06 06:16:05.3781	\N	\N	\N	\N	\N	ป.2	t	t	259046
1295	227	107	2017-02-06 06:16:05.439313	2017-02-06 06:16:05.439313	\N	\N	\N	\N	\N	ป.2	t	t	259048
1296	230	107	2017-02-06 06:16:05.489923	2017-02-06 06:16:05.489923	\N	\N	\N	\N	\N	ป.2	t	t	259051
1297	232	107	2017-02-06 06:16:05.552837	2017-02-06 06:16:05.552837	\N	\N	\N	\N	\N	ป.2	t	t	259052
1298	235	107	2017-02-06 06:16:05.619231	2017-02-06 06:16:05.619231	\N	\N	\N	\N	\N	ป.2	t	t	259056
1299	238	107	2017-02-06 06:16:05.685574	2017-02-06 06:16:05.685574	\N	\N	\N	\N	\N	ป.2	t	t	259059
1300	240	107	2017-02-06 06:16:05.739137	2017-02-06 06:16:05.739137	\N	\N	\N	\N	\N	ป.2	t	t	259061
1301	221	107	2017-02-06 06:16:05.80236	2017-02-06 06:16:05.80236	\N	\N	\N	\N	\N	ป.2	t	t	259042
1302	245	107	2017-02-06 06:16:05.860322	2017-02-06 06:16:05.860322	\N	\N	\N	\N	\N	ป.2	t	t	259066
1303	247	107	2017-02-06 06:16:05.930698	2017-02-06 06:16:05.930698	\N	\N	\N	\N	\N	ป.2	t	t	259073
1304	249	108	2017-02-06 06:16:06.00705	2017-02-06 06:16:06.00705	\N	\N	\N	\N	\N	ป.3	t	t	258002
1305	250	108	2017-02-06 06:16:06.050409	2017-02-06 06:16:06.050409	\N	\N	\N	\N	\N	ป.3	t	t	258003
1306	252	108	2017-02-06 06:16:06.05658	2017-02-06 06:16:06.05658	\N	\N	\N	\N	\N	ป.3	t	t	258005
1307	253	108	2017-02-06 06:16:06.064459	2017-02-06 06:16:06.064459	\N	\N	\N	\N	\N	ป.3	t	t	258006
1308	255	108	2017-02-06 06:16:06.075709	2017-02-06 06:16:06.075709	\N	\N	\N	\N	\N	ป.3	t	t	258008
1309	257	108	2017-02-06 06:16:06.08258	2017-02-06 06:16:06.08258	\N	\N	\N	\N	\N	ป.3	t	t	258011
1310	258	108	2017-02-06 06:16:06.140731	2017-02-06 06:16:06.140731	\N	\N	\N	\N	\N	ป.3	t	t	258012
1311	260	108	2017-02-06 06:16:06.165611	2017-02-06 06:16:06.165611	\N	\N	\N	\N	\N	ป.3	t	t	258074
1312	261	108	2017-02-06 06:16:06.171658	2017-02-06 06:16:06.171658	\N	\N	\N	\N	\N	ป.3	t	t	258014
1313	263	108	2017-02-06 06:16:06.178133	2017-02-06 06:16:06.178133	\N	\N	\N	\N	\N	ป.3	t	t	258016
1314	265	108	2017-02-06 06:16:06.199333	2017-02-06 06:16:06.199333	\N	\N	\N	\N	\N	ป.3	t	t	258018
1315	266	108	2017-02-06 06:16:06.205237	2017-02-06 06:16:06.205237	\N	\N	\N	\N	\N	ป.3	t	t	258019
1316	268	108	2017-02-06 06:16:06.211385	2017-02-06 06:16:06.211385	\N	\N	\N	\N	\N	ป.3	t	t	258022
1317	270	108	2017-02-06 06:16:06.224819	2017-02-06 06:16:06.224819	\N	\N	\N	\N	\N	ป.3	t	t	258024
1318	271	108	2017-02-06 06:16:06.231231	2017-02-06 06:16:06.231231	\N	\N	\N	\N	\N	ป.3	t	t	258025
1319	273	108	2017-02-06 06:16:06.244672	2017-02-06 06:16:06.244672	\N	\N	\N	\N	\N	ป.3	t	t	258027
1320	275	108	2017-02-06 06:16:06.257841	2017-02-06 06:16:06.257841	\N	\N	\N	\N	\N	ป.3	t	t	258071
1321	276	108	2017-02-06 06:16:06.266092	2017-02-06 06:16:06.266092	\N	\N	\N	\N	\N	ป.3	t	t	258029
1322	278	108	2017-02-06 06:16:06.272302	2017-02-06 06:16:06.272302	\N	\N	\N	\N	\N	ป.3	t	t	258068
1323	279	108	2017-02-06 06:16:06.278851	2017-02-06 06:16:06.278851	\N	\N	\N	\N	\N	ป.3	t	t	258031
1324	281	108	2017-02-06 06:16:06.292071	2017-02-06 06:16:06.292071	\N	\N	\N	\N	\N	ป.3	t	t	258034
1325	283	108	2017-02-06 06:16:06.303449	2017-02-06 06:16:06.303449	\N	\N	\N	\N	\N	ป.3	t	t	258082
1326	248	108	2017-02-06 06:16:06.310925	2017-02-06 06:16:06.310925	\N	\N	\N	\N	\N	ป.3	t	t	258001
1327	251	108	2017-02-06 06:16:06.317283	2017-02-06 06:16:06.317283	\N	\N	\N	\N	\N	ป.3	t	t	258004
1328	254	108	2017-02-06 06:16:06.323637	2017-02-06 06:16:06.323637	\N	\N	\N	\N	\N	ป.3	t	t	258007
1329	256	108	2017-02-06 06:16:06.330515	2017-02-06 06:16:06.330515	\N	\N	\N	\N	\N	ป.3	t	t	258009
1330	259	108	2017-02-06 06:16:06.344262	2017-02-06 06:16:06.344262	\N	\N	\N	\N	\N	ป.3	t	t	258013
1331	262	108	2017-02-06 06:16:06.357393	2017-02-06 06:16:06.357393	\N	\N	\N	\N	\N	ป.3	t	t	258015
1332	264	108	2017-02-06 06:16:06.36434	2017-02-06 06:16:06.36434	\N	\N	\N	\N	\N	ป.3	t	t	258017
1333	267	108	2017-02-06 06:16:06.370327	2017-02-06 06:16:06.370327	\N	\N	\N	\N	\N	ป.3	t	t	258021
1334	269	108	2017-02-06 06:16:06.377397	2017-02-06 06:16:06.377397	\N	\N	\N	\N	\N	ป.3	t	t	258023
1335	272	108	2017-02-06 06:16:06.391257	2017-02-06 06:16:06.391257	\N	\N	\N	\N	\N	ป.3	t	t	258026
1336	274	108	2017-02-06 06:16:06.406453	2017-02-06 06:16:06.406453	\N	\N	\N	\N	\N	ป.3	t	t	258028
1337	277	108	2017-02-06 06:16:06.413458	2017-02-06 06:16:06.413458	\N	\N	\N	\N	\N	ป.3	t	t	258030
1338	280	108	2017-02-06 06:16:06.427354	2017-02-06 06:16:06.427354	\N	\N	\N	\N	\N	ป.3	t	t	258032
1339	282	108	2017-02-06 06:16:06.440004	2017-02-06 06:16:06.440004	\N	\N	\N	\N	\N	ป.3	t	t	258081
1340	285	109	2017-02-06 06:16:06.450305	2017-02-06 06:16:06.450305	\N	\N	\N	\N	\N	ป.3	t	t	258036
1341	287	109	2017-02-06 06:16:06.461766	2017-02-06 06:16:06.461766	\N	\N	\N	\N	\N	ป.3	t	t	258038
1342	289	109	2017-02-06 06:16:06.475818	2017-02-06 06:16:06.475818	\N	\N	\N	\N	\N	ป.3	t	t	258040
1343	290	109	2017-02-06 06:16:06.482079	2017-02-06 06:16:06.482079	\N	\N	\N	\N	\N	ป.3	t	t	258041
1344	292	109	2017-02-06 06:16:06.488305	2017-02-06 06:16:06.488305	\N	\N	\N	\N	\N	ป.3	t	t	258043
1345	294	109	2017-02-06 06:16:06.495282	2017-02-06 06:16:06.495282	\N	\N	\N	\N	\N	ป.3	t	t	258045
1346	295	109	2017-02-06 06:16:06.508524	2017-02-06 06:16:06.508524	\N	\N	\N	\N	\N	ป.3	t	t	258046
1347	297	109	2017-02-06 06:16:06.52002	2017-02-06 06:16:06.52002	\N	\N	\N	\N	\N	ป.3	t	t	258075
1348	298	109	2017-02-06 06:16:06.529017	2017-02-06 06:16:06.529017	\N	\N	\N	\N	\N	ป.3	t	t	258049
1349	300	109	2017-02-06 06:16:06.543254	2017-02-06 06:16:06.543254	\N	\N	\N	\N	\N	ป.3	t	t	258072
1350	302	109	2017-02-06 06:16:06.556055	2017-02-06 06:16:06.556055	\N	\N	\N	\N	\N	ป.3	t	t	258053
1351	303	109	2017-02-06 06:16:06.562071	2017-02-06 06:16:06.562071	\N	\N	\N	\N	\N	ป.3	t	t	258069
1352	284	109	2017-02-06 06:16:06.568008	2017-02-06 06:16:06.568008	\N	\N	\N	\N	\N	ป.3	t	t	258035
1353	306	109	2017-02-06 06:16:06.57465	2017-02-06 06:16:06.57465	\N	\N	\N	\N	\N	ป.3	t	t	258056
1354	307	109	2017-02-06 06:16:06.588528	2017-02-06 06:16:06.588528	\N	\N	\N	\N	\N	ป.3	t	t	258057
1355	309	109	2017-02-06 06:16:06.594418	2017-02-06 06:16:06.594418	\N	\N	\N	\N	\N	ป.3	t	t	258059
1356	310	109	2017-02-06 06:16:06.607304	2017-02-06 06:16:06.607304	\N	\N	\N	\N	\N	ป.3	t	t	258070
1357	314	109	2017-02-06 06:16:06.615422	2017-02-06 06:16:06.615422	\N	\N	\N	\N	\N	ป.3	t	t	258062
1358	315	109	2017-02-06 06:16:06.622059	2017-02-06 06:16:06.622059	\N	\N	\N	\N	\N	ป.3	t	t	258063
1359	317	109	2017-02-06 06:16:06.636754	2017-02-06 06:16:06.636754	\N	\N	\N	\N	\N	ป.3	t	t	258066
1360	319	109	2017-02-06 06:16:06.660542	2017-02-06 06:16:06.660542	\N	\N	\N	\N	\N	ป.3	t	t	258084
1361	320	109	2017-02-06 06:16:06.667358	2017-02-06 06:16:06.667358	\N	\N	\N	\N	\N	ป.3	t	t	258083
1362	286	109	2017-02-06 06:16:06.683748	2017-02-06 06:16:06.683748	\N	\N	\N	\N	\N	ป.3	t	t	258037
1363	288	109	2017-02-06 06:16:06.693609	2017-02-06 06:16:06.693609	\N	\N	\N	\N	\N	ป.3	t	t	258039
1364	291	109	2017-02-06 06:16:06.700312	2017-02-06 06:16:06.700312	\N	\N	\N	\N	\N	ป.3	t	t	258042
1365	293	109	2017-02-06 06:16:06.717653	2017-02-06 06:16:06.717653	\N	\N	\N	\N	\N	ป.3	t	t	258044
1366	296	109	2017-02-06 06:16:06.726897	2017-02-06 06:16:06.726897	\N	\N	\N	\N	\N	ป.3	t	t	258047
1367	299	109	2017-02-06 06:16:06.732906	2017-02-06 06:16:06.732906	\N	\N	\N	\N	\N	ป.3	t	t	258050
1368	301	109	2017-02-06 06:16:06.739027	2017-02-06 06:16:06.739027	\N	\N	\N	\N	\N	ป.3	t	t	258052
1369	304	109	2017-02-06 06:16:06.745392	2017-02-06 06:16:06.745392	\N	\N	\N	\N	\N	ป.3	t	t	258054
1370	305	109	2017-02-06 06:16:06.75873	2017-02-06 06:16:06.75873	\N	\N	\N	\N	\N	ป.3	t	t	258055
1371	308	109	2017-02-06 06:16:06.77025	2017-02-06 06:16:06.77025	\N	\N	\N	\N	\N	ป.3	t	t	258058
1372	311	109	2017-02-06 06:16:06.778394	2017-02-06 06:16:06.778394	\N	\N	\N	\N	\N	ป.3	t	t	258060
1373	312	109	2017-02-06 06:16:06.785115	2017-02-06 06:16:06.785115	\N	\N	\N	\N	\N	ป.3	t	t	258061
1374	313	109	2017-02-06 06:16:06.802692	2017-02-06 06:16:06.802692	\N	\N	\N	\N	\N	ป.3	t	t	258073
1375	316	109	2017-02-06 06:16:06.810319	2017-02-06 06:16:06.810319	\N	\N	\N	\N	\N	ป.3	t	t	258065
1376	318	109	2017-02-06 06:16:06.816814	2017-02-06 06:16:06.816814	\N	\N	\N	\N	\N	ป.3	t	t	258067
1377	424	112	2017-02-06 06:16:06.840369	2017-02-06 06:16:06.840369	\N	\N	\N	\N	\N	ป.5	t	t	256071
1378	425	112	2017-02-06 06:16:06.84679	2017-02-06 06:16:06.84679	\N	\N	\N	\N	\N	ป.5	t	t	256005
1379	427	112	2017-02-06 06:16:06.853659	2017-02-06 06:16:06.853659	\N	\N	\N	\N	\N	ป.5	t	t	256039
1380	428	112	2017-02-06 06:16:06.873014	2017-02-06 06:16:06.873014	\N	\N	\N	\N	\N	ป.5	t	t	256040
1381	423	112	2017-02-06 06:16:06.87993	2017-02-06 06:16:06.87993	\N	\N	\N	\N	\N	ป.5	t	t	256001
1382	431	112	2017-02-06 06:16:06.885994	2017-02-06 06:16:06.885994	\N	\N	\N	\N	\N	ป.5	t	t	256045
1383	432	112	2017-02-06 06:16:06.894141	2017-02-06 06:16:06.894141	\N	\N	\N	\N	\N	ป.5	t	t	256013
1384	434	112	2017-02-06 06:16:06.905209	2017-02-06 06:16:06.905209	\N	\N	\N	\N	\N	ป.5	t	t	256047
1385	436	112	2017-02-06 06:16:06.923221	2017-02-06 06:16:06.923221	\N	\N	\N	\N	\N	ป.5	t	t	256015
1386	438	112	2017-02-06 06:16:06.92961	2017-02-06 06:16:06.92961	\N	\N	\N	\N	\N	ป.5	t	t	256053
1387	439	112	2017-02-06 06:16:06.935814	2017-02-06 06:16:06.935814	\N	\N	\N	\N	\N	ป.5	t	t	256018
1388	441	112	2017-02-06 06:16:06.942181	2017-02-06 06:16:06.942181	\N	\N	\N	\N	\N	ป.5	t	t	256021
1389	443	112	2017-02-06 06:16:06.949019	2017-02-06 06:16:06.949019	\N	\N	\N	\N	\N	ป.5	t	t	256057
1390	446	112	2017-02-06 06:16:06.965746	2017-02-06 06:16:06.965746	\N	\N	\N	\N	\N	ป.5	t	t	256028
1391	448	112	2017-02-06 06:16:06.976991	2017-02-06 06:16:06.976991	\N	\N	\N	\N	\N	ป.5	t	t	256065
1392	450	112	2017-02-06 06:16:06.983953	2017-02-06 06:16:06.983953	\N	\N	\N	\N	\N	ป.5	t	t	256066
1393	451	112	2017-02-06 06:16:07.003013	2017-02-06 06:16:07.003013	\N	\N	\N	\N	\N	ป.5	t	t	256068
1394	453	112	2017-02-06 06:16:07.01136	2017-02-06 06:16:07.01136	\N	\N	\N	\N	\N	ป.5	t	t	256070
1395	454	112	2017-02-06 06:16:07.017352	2017-02-06 06:16:07.017352	\N	\N	\N	\N	\N	ป.5	t	t	259077
1397	426	112	2017-02-06 06:16:07.036783	2017-02-06 06:16:07.036783	\N	\N	\N	\N	\N	ป.5	t	t	256037
1398	429	112	2017-02-06 06:16:07.049202	2017-02-06 06:16:07.049202	\N	\N	\N	\N	\N	ป.5	t	t	256008
1399	430	112	2017-02-06 06:16:07.060237	2017-02-06 06:16:07.060237	\N	\N	\N	\N	\N	ป.5	t	t	256010
1400	433	112	2017-02-06 06:16:07.067059	2017-02-06 06:16:07.067059	\N	\N	\N	\N	\N	ป.5	t	t	256046
1401	435	112	2017-02-06 06:16:07.073418	2017-02-06 06:16:07.073418	\N	\N	\N	\N	\N	ป.5	t	t	256049
1402	437	112	2017-02-06 06:16:07.080012	2017-02-06 06:16:07.080012	\N	\N	\N	\N	\N	ป.5	t	t	256052
1403	440	112	2017-02-06 06:16:07.096431	2017-02-06 06:16:07.096431	\N	\N	\N	\N	\N	ป.5	t	t	256054
1404	442	112	2017-02-06 06:16:07.108817	2017-02-06 06:16:07.108817	\N	\N	\N	\N	\N	ป.5	t	t	256056
1405	444	112	2017-02-06 06:16:07.115237	2017-02-06 06:16:07.115237	\N	\N	\N	\N	\N	ป.5	t	t	256023
1406	445	112	2017-02-06 06:16:07.12152	2017-02-06 06:16:07.12152	\N	\N	\N	\N	\N	ป.5	t	t	256060
414	524	10	2016-07-20 14:22:08.273949	2017-02-05 11:32:21.351849	\N	\N	\N	\N	\N	ป.5	f	t	255029
1407	447	112	2017-02-06 06:16:07.128166	2017-02-06 06:16:07.128166	\N	\N	\N	\N	\N	ป.5	t	t	256029
1408	449	112	2017-02-06 06:16:07.14221	2017-02-06 06:16:07.14221	\N	\N	\N	\N	\N	ป.5	t	t	256030
1409	452	112	2017-02-06 06:16:07.157921	2017-02-06 06:16:07.157921	\N	\N	\N	\N	\N	ป.5	t	t	256069
1410	393	113	2017-02-06 06:16:07.16784	2017-02-06 06:16:07.16784	\N	\N	\N	\N	\N	ป.5	t	t	256004
1411	394	113	2017-02-06 06:16:07.174151	2017-02-06 06:16:07.174151	\N	\N	\N	\N	\N	ป.5	t	t	256038
1412	396	113	2017-02-06 06:16:07.183504	2017-02-06 06:16:07.183504	\N	\N	\N	\N	\N	ป.5	t	t	256041
1413	397	113	2017-02-06 06:16:07.203044	2017-02-06 06:16:07.203044	\N	\N	\N	\N	\N	ป.5	t	t	256042
1414	399	113	2017-02-06 06:16:07.209173	2017-02-06 06:16:07.209173	\N	\N	\N	\N	\N	ป.5	t	t	256086
1415	401	113	2017-02-06 06:16:07.222153	2017-02-06 06:16:07.222153	\N	\N	\N	\N	\N	ป.5	t	t	256012
1416	403	113	2017-02-06 06:16:07.237772	2017-02-06 06:16:07.237772	\N	\N	\N	\N	\N	ป.5	t	t	256014
1417	404	113	2017-02-06 06:16:07.243789	2017-02-06 06:16:07.243789	\N	\N	\N	\N	\N	ป.5	t	t	256017
1418	406	113	2017-02-06 06:16:07.257692	2017-02-06 06:16:07.257692	\N	\N	\N	\N	\N	ป.5	t	t	256055
1419	407	113	2017-02-06 06:16:07.272743	2017-02-06 06:16:07.272743	\N	\N	\N	\N	\N	ป.5	t	t	256034
1420	409	113	2017-02-06 06:16:07.279112	2017-02-06 06:16:07.279112	\N	\N	\N	\N	\N	ป.5	t	t	258089
1421	411	113	2017-02-06 06:16:07.292866	2017-02-06 06:16:07.292866	\N	\N	\N	\N	\N	ป.5	t	t	256024
1422	412	113	2017-02-06 06:16:07.306705	2017-02-06 06:16:07.306705	\N	\N	\N	\N	\N	ป.5	t	t	256084
1423	414	113	2017-02-06 06:16:07.313073	2017-02-06 06:16:07.313073	\N	\N	\N	\N	\N	ป.5	t	t	256026
1424	416	113	2017-02-06 06:16:07.325755	2017-02-06 06:16:07.325755	\N	\N	\N	\N	\N	ป.5	t	t	256062
1425	418	113	2017-02-06 06:16:07.340511	2017-02-06 06:16:07.340511	\N	\N	\N	\N	\N	ป.5	t	t	258076
1426	419	113	2017-02-06 06:16:07.347157	2017-02-06 06:16:07.347157	\N	\N	\N	\N	\N	ป.5	t	t	256085
1427	421	113	2017-02-06 06:16:07.359943	2017-02-06 06:16:07.359943	\N	\N	\N	\N	\N	ป.5	t	t	256035
1428	604	113	2017-02-06 06:16:07.374616	2017-02-06 06:16:07.374616	\N	\N	\N	\N	\N	ป.5	t	t	256036
1396	606	112	2017-02-06 06:16:07.02531	2017-02-06 06:16:07.378376	\N	\N	\N	\N	\N	ป.5	f	t	\N
1429	606	113	2017-02-06 06:16:07.388724	2017-02-06 06:16:07.388724	\N	\N	\N	\N	\N	ป.5	t	t	\N
1430	605	113	2017-02-06 06:16:07.396543	2017-02-06 06:16:07.396543	\N	\N	\N	\N	\N	ป.5	t	t	\N
1431	395	113	2017-02-06 06:16:07.407027	2017-02-06 06:16:07.407027	\N	\N	\N	\N	\N	ป.5	t	t	256006
1432	398	113	2017-02-06 06:16:07.421879	2017-02-06 06:16:07.421879	\N	\N	\N	\N	\N	ป.5	t	t	256009
1433	400	113	2017-02-06 06:16:07.42799	2017-02-06 06:16:07.42799	\N	\N	\N	\N	\N	ป.5	t	t	256011
1434	402	113	2017-02-06 06:16:07.434306	2017-02-06 06:16:07.434306	\N	\N	\N	\N	\N	ป.5	t	t	256048
1435	405	113	2017-02-06 06:16:07.440035	2017-02-06 06:16:07.440035	\N	\N	\N	\N	\N	ป.5	t	t	256019
1436	408	113	2017-02-06 06:16:07.44573	2017-02-06 06:16:07.44573	\N	\N	\N	\N	\N	ป.5	t	t	256022
1437	410	113	2017-02-06 06:16:07.458845	2017-02-06 06:16:07.458845	\N	\N	\N	\N	\N	ป.5	t	t	256058
1438	413	113	2017-02-06 06:16:07.472825	2017-02-06 06:16:07.472825	\N	\N	\N	\N	\N	ป.5	t	t	256061
1439	415	113	2017-02-06 06:16:07.479158	2017-02-06 06:16:07.479158	\N	\N	\N	\N	\N	ป.5	t	t	256027
1440	417	113	2017-02-06 06:16:07.492905	2017-02-06 06:16:07.492905	\N	\N	\N	\N	\N	ป.5	t	t	256031
1441	420	113	2017-02-06 06:16:07.507857	2017-02-06 06:16:07.507857	\N	\N	\N	\N	\N	ป.5	t	t	256032
1442	422	113	2017-02-06 06:16:07.516745	2017-02-06 06:16:07.516745	\N	\N	\N	\N	\N	ป.5	t	t	259078
1443	492	114	2017-02-06 06:16:07.530375	2017-02-06 06:16:07.530375	\N	\N	\N	\N	\N	ป.6	t	t	255037
1444	493	114	2017-02-06 06:16:07.54321	2017-02-06 06:16:07.54321	\N	\N	\N	\N	\N	ป.6	t	t	255004
1445	491	114	2017-02-06 06:16:07.555428	2017-02-06 06:16:07.555428	\N	\N	\N	\N	\N	ป.6	t	t	255001
1446	496	114	2017-02-06 06:16:07.562551	2017-02-06 06:16:07.562551	\N	\N	\N	\N	\N	ป.6	t	t	255040
1447	497	114	2017-02-06 06:16:07.577037	2017-02-06 06:16:07.577037	\N	\N	\N	\N	\N	ป.6	t	t	255041
1448	499	114	2017-02-06 06:16:07.588914	2017-02-06 06:16:07.588914	\N	\N	\N	\N	\N	ป.6	t	t	255043
1449	501	114	2017-02-06 06:16:07.595142	2017-02-06 06:16:07.595142	\N	\N	\N	\N	\N	ป.6	t	t	255045
1450	503	114	2017-02-06 06:16:07.601366	2017-02-06 06:16:07.601366	\N	\N	\N	\N	\N	ป.6	t	t	255012
1451	504	114	2017-02-06 06:16:07.607714	2017-02-06 06:16:07.607714	\N	\N	\N	\N	\N	ป.6	t	t	255049
1452	506	114	2017-02-06 06:16:07.622746	2017-02-06 06:16:07.622746	\N	\N	\N	\N	\N	ป.6	t	t	255013
1453	508	114	2017-02-06 06:16:07.628563	2017-02-06 06:16:07.628563	\N	\N	\N	\N	\N	ป.6	t	t	255073
1454	509	114	2017-02-06 06:16:07.640283	2017-02-06 06:16:07.640283	\N	\N	\N	\N	\N	ป.6	t	t	256073
1455	511	114	2017-02-06 06:16:07.648601	2017-02-06 06:16:07.648601	\N	\N	\N	\N	\N	ป.6	t	t	255057
1456	514	114	2017-02-06 06:16:07.66416	2017-02-06 06:16:07.66416	\N	\N	\N	\N	\N	ป.6	t	t	255058
1458	517	114	2017-02-06 06:16:07.682917	2017-02-06 06:16:07.682917	\N	\N	\N	\N	\N	ป.6	t	t	255025
1459	518	114	2017-02-06 06:16:07.689243	2017-02-06 06:16:07.689243	\N	\N	\N	\N	\N	ป.6	t	t	256059
1460	520	114	2017-02-06 06:16:07.69568	2017-02-06 06:16:07.69568	\N	\N	\N	\N	\N	ป.6	t	t	255064
1461	522	114	2017-02-06 06:16:07.708958	2017-02-06 06:16:07.708958	\N	\N	\N	\N	\N	ป.6	t	t	255065
1462	523	114	2017-02-06 06:16:07.719609	2017-02-06 06:16:07.719609	\N	\N	\N	\N	\N	ป.6	t	t	255066
1463	525	114	2017-02-06 06:16:07.727842	2017-02-06 06:16:07.727842	\N	\N	\N	\N	\N	ป.6	t	t	255033
1464	526	114	2017-02-06 06:16:07.73404	2017-02-06 06:16:07.73404	\N	\N	\N	\N	\N	ป.6	t	t	258087
1465	494	114	2017-02-06 06:16:07.740375	2017-02-06 06:16:07.740375	\N	\N	\N	\N	\N	ป.6	t	t	255038
1466	495	114	2017-02-06 06:16:07.753376	2017-02-06 06:16:07.753376	\N	\N	\N	\N	\N	ป.6	t	t	255039
1467	498	114	2017-02-06 06:16:07.75942	2017-02-06 06:16:07.75942	\N	\N	\N	\N	\N	ป.6	t	t	255042
1468	500	114	2017-02-06 06:16:07.771281	2017-02-06 06:16:07.771281	\N	\N	\N	\N	\N	ป.6	t	t	255006
1469	502	114	2017-02-06 06:16:07.778864	2017-02-06 06:16:07.778864	\N	\N	\N	\N	\N	ป.6	t	t	255010
1470	505	114	2017-02-06 06:16:07.785227	2017-02-06 06:16:07.785227	\N	\N	\N	\N	\N	ป.6	t	t	256072
1471	507	114	2017-02-06 06:16:07.792484	2017-02-06 06:16:07.792484	\N	\N	\N	\N	\N	ป.6	t	t	255053
1472	510	114	2017-02-06 06:16:07.806477	2017-02-06 06:16:07.806477	\N	\N	\N	\N	\N	ป.6	t	t	255072
1473	512	114	2017-02-06 06:16:07.812346	2017-02-06 06:16:07.812346	\N	\N	\N	\N	\N	ป.6	t	t	255055
1474	513	114	2017-02-06 06:16:07.818	2017-02-06 06:16:07.818	\N	\N	\N	\N	\N	ป.6	t	t	255021
1475	516	114	2017-02-06 06:16:07.824004	2017-02-06 06:16:07.824004	\N	\N	\N	\N	\N	ป.6	t	t	255024
1476	519	114	2017-02-06 06:16:07.849092	2017-02-06 06:16:07.849092	\N	\N	\N	\N	\N	ป.6	t	t	255026
1477	521	114	2017-02-06 06:16:07.859384	2017-02-06 06:16:07.859384	\N	\N	\N	\N	\N	ป.6	t	t	255027
1478	524	114	2017-02-06 06:16:07.86594	2017-02-06 06:16:07.86594	\N	\N	\N	\N	\N	ป.6	t	t	255029
1479	527	114	2017-02-06 06:16:07.872149	2017-02-06 06:16:07.872149	\N	\N	\N	\N	\N	ป.6	t	t	259079
1480	456	115	2017-02-06 06:16:07.882126	2017-02-06 06:16:07.882126	\N	\N	\N	\N	\N	ป.6	t	t	255003
1481	458	115	2017-02-06 06:16:07.899884	2017-02-06 06:16:07.899884	\N	\N	\N	\N	\N	ป.6	t	t	255044
1482	460	115	2017-02-06 06:16:07.912583	2017-02-06 06:16:07.912583	\N	\N	\N	\N	\N	ป.6	t	t	255009
1483	461	115	2017-02-06 06:16:07.920401	2017-02-06 06:16:07.920401	\N	\N	\N	\N	\N	ป.6	t	t	255046
1484	463	115	2017-02-06 06:16:07.940812	2017-02-06 06:16:07.940812	\N	\N	\N	\N	\N	ป.6	t	t	256083
1485	464	115	2017-02-06 06:16:07.947137	2017-02-06 06:16:07.947137	\N	\N	\N	\N	\N	ป.6	t	t	255050
1486	466	115	2017-02-06 06:16:07.953436	2017-02-06 06:16:07.953436	\N	\N	\N	\N	\N	ป.6	t	t	255052
1487	467	115	2017-02-06 06:16:07.959785	2017-02-06 06:16:07.959785	\N	\N	\N	\N	\N	ป.6	t	t	257073
1488	469	115	2017-02-06 06:16:07.966679	2017-02-06 06:16:07.966679	\N	\N	\N	\N	\N	ป.6	t	t	255017
1489	471	115	2017-02-06 06:16:07.985513	2017-02-06 06:16:07.985513	\N	\N	\N	\N	\N	ป.6	t	t	255018
1490	472	115	2017-02-06 06:16:07.996427	2017-02-06 06:16:07.996427	\N	\N	\N	\N	\N	ป.6	t	t	255019
1491	474	115	2017-02-06 06:16:08.002232	2017-02-06 06:16:08.002232	\N	\N	\N	\N	\N	ป.6	t	t	255071
1492	476	115	2017-02-06 06:16:08.008045	2017-02-06 06:16:08.008045	\N	\N	\N	\N	\N	ป.6	t	t	255060
1493	477	115	2017-02-06 06:16:08.01541	2017-02-06 06:16:08.01541	\N	\N	\N	\N	\N	ป.6	t	t	255023
1494	479	115	2017-02-06 06:16:08.027807	2017-02-06 06:16:08.027807	\N	\N	\N	\N	\N	ป.6	t	t	255063
1495	481	115	2017-02-06 06:16:08.040445	2017-02-06 06:16:08.040445	\N	\N	\N	\N	\N	ป.6	t	t	255031
1496	482	115	2017-02-06 06:16:08.047005	2017-02-06 06:16:08.047005	\N	\N	\N	\N	\N	ป.6	t	t	255032
1497	484	115	2017-02-06 06:16:08.059954	2017-02-06 06:16:08.059954	\N	\N	\N	\N	\N	ป.6	t	t	255068
1498	486	115	2017-02-06 06:16:08.066329	2017-02-06 06:16:08.066329	\N	\N	\N	\N	\N	ป.6	t	t	255069
1499	487	115	2017-02-06 06:16:08.073065	2017-02-06 06:16:08.073065	\N	\N	\N	\N	\N	ป.6	t	t	255035
1500	489	115	2017-02-06 06:16:08.086398	2017-02-06 06:16:08.086398	\N	\N	\N	\N	\N	ป.6	t	t	258086
1501	455	115	2017-02-06 06:16:08.092623	2017-02-06 06:16:08.092623	\N	\N	\N	\N	\N	ป.6	t	t	255002
1502	457	115	2017-02-06 06:16:08.10412	2017-02-06 06:16:08.10412	\N	\N	\N	\N	\N	ป.6	t	t	255005
1503	459	115	2017-02-06 06:16:08.112641	2017-02-06 06:16:08.112641	\N	\N	\N	\N	\N	ป.6	t	t	255007
1504	462	115	2017-02-06 06:16:08.119259	2017-02-06 06:16:08.119259	\N	\N	\N	\N	\N	ป.6	t	t	255048
1505	465	115	2017-02-06 06:16:08.135249	2017-02-06 06:16:08.135249	\N	\N	\N	\N	\N	ป.6	t	t	255070
1506	468	115	2017-02-06 06:16:08.141254	2017-02-06 06:16:08.141254	\N	\N	\N	\N	\N	ป.6	t	t	255016
1507	470	115	2017-02-06 06:16:08.151741	2017-02-06 06:16:08.151741	\N	\N	\N	\N	\N	ป.6	t	t	255054
1508	473	115	2017-02-06 06:16:08.163271	2017-02-06 06:16:08.163271	\N	\N	\N	\N	\N	ป.6	t	t	255020
1509	475	115	2017-02-06 06:16:08.169517	2017-02-06 06:16:08.169517	\N	\N	\N	\N	\N	ป.6	t	t	255059
1510	478	115	2017-02-06 06:16:08.184172	2017-02-06 06:16:08.184172	\N	\N	\N	\N	\N	ป.6	t	t	255061
1511	480	115	2017-02-06 06:16:08.190587	2017-02-06 06:16:08.190587	\N	\N	\N	\N	\N	ป.6	t	t	255030
1512	483	115	2017-02-06 06:16:08.196947	2017-02-06 06:16:08.196947	\N	\N	\N	\N	\N	ป.6	t	t	255067
1513	485	115	2017-02-06 06:16:08.202592	2017-02-06 06:16:08.202592	\N	\N	\N	\N	\N	ป.6	t	t	255034
1514	488	115	2017-02-06 06:16:08.208228	2017-02-06 06:16:08.208228	\N	\N	\N	\N	\N	ป.6	t	t	258078
1515	490	115	2017-02-06 06:16:08.215603	2017-02-06 06:16:08.215603	\N	\N	\N	\N	\N	ป.6	t	t	258090
\.


--
-- Name: student_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('student_rooms_id_seq', 1515, true);


--
-- Data for Name: student_subjects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY student_subjects (id, subject_id, score1, score2, grade, created_at, updated_at, student_room_id, score_result, status, status_grade) FROM stdin;
120	2	0	0		2016-10-29 02:24:22.809655	2016-11-06 10:32:09.768524	485	\N	t	f
121	1	0	0		2016-10-29 02:24:22.812055	2016-11-06 10:32:09.771001	485	\N	t	f
122	3	0	0		2016-10-29 02:24:22.814457	2016-11-06 10:32:09.77387	485	\N	t	f
124	1	0	0		2016-10-29 02:24:22.822996	2016-11-06 10:32:09.784865	484	\N	t	f
125	3	0	0		2016-10-29 02:24:22.825434	2016-11-06 10:32:09.787082	484	\N	t	f
126	2	0	0		2016-10-29 02:24:22.829676	2016-11-06 10:32:09.789262	102	\N	t	f
127	1	0	0		2016-10-29 02:24:22.831875	2016-11-06 10:32:09.791587	102	\N	t	f
128	3	0	0		2016-10-29 02:24:22.834251	2016-11-06 10:32:09.793941	102	\N	t	f
129	2	0	0		2016-10-29 02:24:22.839684	2016-11-06 10:32:09.796366	101	\N	t	f
130	1	0	0		2016-10-29 02:24:22.850801	2016-11-06 10:32:09.801809	101	\N	t	f
131	3	0	0		2016-10-29 02:24:22.853009	2016-11-06 10:32:09.80419	101	\N	t	f
132	2	0	0		2016-10-29 02:24:22.857462	2016-11-06 10:32:09.806609	100	\N	t	f
133	1	0	0		2016-10-29 02:24:22.8598	2016-11-06 10:32:09.808989	100	\N	t	f
134	3	0	0		2016-10-29 02:24:22.8621	2016-11-06 10:32:09.811316	100	\N	t	f
135	2	0	0		2016-10-29 02:24:22.866643	2016-11-06 10:32:09.813716	99	\N	t	f
136	1	0	0		2016-10-29 02:24:22.87069	2016-11-06 10:32:09.816179	99	\N	t	f
137	3	0	0		2016-10-29 02:24:22.873561	2016-11-06 10:32:09.820353	99	\N	t	f
138	2	0	0		2016-10-29 02:24:22.877989	2016-11-06 10:32:09.823508	98	\N	t	f
139	1	0	0		2016-10-29 02:24:22.880316	2016-11-06 10:32:09.82912	98	\N	t	f
140	3	0	0		2016-10-29 02:24:22.882543	2016-11-06 10:32:09.83664	98	\N	t	f
141	2	0	0		2016-10-29 02:24:22.888356	2016-11-06 10:32:09.841319	97	\N	t	f
142	1	0	0		2016-10-29 02:24:22.899009	2016-11-06 10:32:09.84368	97	\N	t	f
143	3	0	0		2016-10-29 02:24:22.902166	2016-11-06 10:32:09.845967	97	\N	t	f
145	1	0	0		2016-10-29 02:24:22.910733	2016-11-06 10:32:09.856097	96	\N	t	f
146	3	0	0		2016-10-29 02:24:22.91303	2016-11-06 10:32:09.858454	96	\N	t	f
147	2	0	0		2016-10-29 02:24:22.917709	2016-11-06 10:32:09.860732	95	\N	t	f
148	1	0	0		2016-10-29 02:24:22.920101	2016-11-06 10:32:09.863064	95	\N	t	f
149	3	0	0		2016-10-29 02:24:22.922249	2016-11-06 10:32:09.865403	95	\N	t	f
150	2	0	0		2016-10-29 02:24:22.926811	2016-11-06 10:32:09.867765	94	\N	t	f
151	1	0	0		2016-10-29 02:24:22.929121	2016-11-06 10:32:09.870132	94	\N	t	f
152	3	0	0		2016-10-29 02:24:22.931484	2016-11-06 10:32:09.87262	94	\N	t	f
153	2	0	0		2016-10-29 02:24:22.937287	2016-11-06 10:32:09.875819	93	\N	t	f
154	1	0	0		2016-10-29 02:24:22.947737	2016-11-06 10:32:09.886033	93	\N	t	f
155	3	0	0		2016-10-29 02:24:22.949944	2016-11-06 10:32:09.890487	93	\N	t	f
156	2	0	0		2016-10-29 02:24:22.957041	2016-11-06 10:32:09.893014	92	\N	t	f
157	1	0	0		2016-10-29 02:24:22.959554	2016-11-06 10:32:09.898062	92	\N	t	f
158	3	0	0		2016-10-29 02:24:22.96185	2016-11-06 10:32:09.900365	92	\N	t	f
159	2	0	0		2016-10-29 02:24:22.966271	2016-11-06 10:32:09.902793	91	\N	t	f
160	1	0	0		2016-10-29 02:24:22.969009	2016-11-06 10:32:09.905179	91	\N	t	f
161	3	0	0		2016-10-29 02:24:22.971427	2016-11-06 10:32:09.909808	91	\N	t	f
162	2	0	0		2016-10-29 02:24:22.975789	2016-11-06 10:32:09.914133	90	\N	t	f
163	1	0	0		2016-10-29 02:24:22.978179	2016-11-06 10:32:09.921556	90	\N	t	f
164	3	0	0		2016-10-29 02:24:22.980703	2016-11-06 10:32:09.924126	90	\N	t	f
166	1	0	0		2016-10-29 02:24:22.988345	2016-11-06 10:32:09.930517	89	\N	t	f
167	3	0	0		2016-10-29 02:24:22.991138	2016-11-06 10:32:09.937613	89	\N	t	f
168	2	0	0		2016-10-29 02:24:23.00016	2016-11-06 10:32:09.940819	88	\N	t	f
169	1	0	0		2016-10-29 02:24:23.005134	2016-11-06 10:32:09.946241	88	\N	t	f
170	3	0	0		2016-10-29 02:24:23.007453	2016-11-06 10:32:09.954015	88	\N	t	f
171	2	0	0		2016-10-29 02:24:23.012047	2016-11-06 10:32:09.956558	87	\N	t	f
172	1	0	0		2016-10-29 02:24:23.014333	2016-11-06 10:32:09.958956	87	\N	t	f
173	3	0	0		2016-10-29 02:24:23.016682	2016-11-06 10:32:09.961259	87	\N	t	f
174	2	0	0		2016-10-29 02:24:23.021021	2016-11-06 10:32:09.963562	86	\N	t	f
175	1	0	0		2016-10-29 02:24:23.023497	2016-11-06 10:32:09.965991	86	\N	t	f
176	3	0	0		2016-10-29 02:24:23.025652	2016-11-06 10:32:09.968533	86	\N	t	f
177	2	0	0		2016-10-29 02:24:23.029886	2016-11-06 10:32:09.970976	85	\N	t	f
178	1	0	0		2016-10-29 02:24:23.032782	2016-11-06 10:32:09.973644	85	\N	t	f
179	3	0	0		2016-10-29 02:24:23.039155	2016-11-06 10:32:09.976175	85	\N	t	f
180	2	0	0		2016-10-29 02:24:23.044566	2016-11-06 10:32:09.979584	84	\N	t	f
181	1	0	0		2016-10-29 02:24:23.049154	2016-11-06 10:32:09.982786	84	\N	t	f
182	3	0	0		2016-10-29 02:24:23.05212	2016-11-06 10:32:09.98539	84	\N	t	f
183	2	0	0		2016-10-29 02:24:23.058308	2016-11-06 10:32:09.988113	83	\N	t	f
184	1	0	0		2016-10-29 02:24:23.060742	2016-11-06 10:32:09.991353	83	\N	t	f
185	3	0	0		2016-10-29 02:24:23.063045	2016-11-06 10:32:10.002233	83	\N	t	f
187	1	0	0		2016-10-29 02:24:23.070084	2016-11-06 10:32:10.00715	82	\N	t	f
188	3	0	0		2016-10-29 02:24:23.072488	2016-11-06 10:32:10.009468	82	\N	t	f
189	2	0	0		2016-10-29 02:24:23.077162	2016-11-06 10:32:10.011823	81	\N	t	f
190	1	0	0		2016-10-29 02:24:23.079586	2016-11-06 10:32:10.015581	81	\N	t	f
191	3	0	0		2016-10-29 02:24:23.081834	2016-11-06 10:32:10.021693	81	\N	t	f
192	2	0	0		2016-10-29 02:24:23.087167	2016-11-06 10:32:10.023947	80	\N	t	f
193	1	0	0		2016-10-29 02:24:23.098	2016-11-06 10:32:10.026198	80	\N	t	f
194	3	0	0		2016-10-29 02:24:23.100248	2016-11-06 10:32:10.028385	80	\N	t	f
195	2	0	0		2016-10-29 02:24:23.106716	2016-11-06 10:32:10.030755	79	\N	t	f
196	1	0	0		2016-10-29 02:24:23.109204	2016-11-06 10:32:10.033199	79	\N	t	f
197	3	0	0		2016-10-29 02:24:23.111646	2016-11-06 10:32:10.035436	79	\N	t	f
198	2	0	0		2016-10-29 02:24:23.115836	2016-11-06 10:32:10.038575	78	\N	t	f
199	1	0	0		2016-10-29 02:24:23.118157	2016-11-06 10:32:10.046151	78	\N	t	f
200	3	0	0		2016-10-29 02:24:23.120489	2016-11-06 10:32:10.054704	78	\N	t	f
201	2	0	0		2016-10-29 02:24:23.124893	2016-11-06 10:32:10.05927	77	\N	t	f
202	1	0	0		2016-10-29 02:24:23.127314	2016-11-06 10:32:10.061588	77	\N	t	f
203	3	0	0		2016-10-29 02:24:23.129521	2016-11-06 10:32:10.06744	77	\N	t	f
204	2	0	0		2016-10-29 02:24:23.134945	2016-11-06 10:32:10.075794	76	\N	t	f
205	1	0	0		2016-10-29 02:24:23.137926	2016-11-06 10:32:10.079102	76	\N	t	f
206	3	0	0		2016-10-29 02:24:23.14062	2016-11-06 10:32:10.082451	76	\N	t	f
208	1	0	0		2016-10-29 02:24:23.151304	2016-11-06 10:32:10.098433	75	\N	t	f
209	3	0	0		2016-10-29 02:24:23.153594	2016-11-06 10:32:10.103704	75	\N	t	f
210	2	0	0		2016-10-29 02:24:23.15796	2016-11-06 10:32:10.105947	74	\N	t	f
211	1	0	0		2016-10-29 02:24:23.160346	2016-11-06 10:32:10.108323	74	\N	t	f
212	3	0	0		2016-10-29 02:24:23.162733	2016-11-06 10:32:10.110788	74	\N	t	f
213	2	0	0		2016-10-29 02:24:23.167064	2016-11-06 10:32:10.120729	73	\N	t	f
215	3	0	0		2016-10-29 02:24:23.174158	2016-11-06 10:32:10.128023	73	\N	t	f
216	2	0	0		2016-10-29 02:24:23.178496	2016-11-06 10:32:10.131253	72	\N	t	f
217	1	0	0		2016-10-29 02:24:23.180831	2016-11-06 10:32:10.134402	72	\N	t	f
218	3	0	0		2016-10-29 02:24:23.183132	2016-11-06 10:32:10.13737	72	\N	t	f
219	2	0	0		2016-10-29 02:24:23.188174	2016-11-06 10:32:10.141184	71	\N	t	f
119	3	80	90	4	2016-10-29 02:24:22.805017	2017-01-29 10:23:41.56392	488	85	t	t
221	3	0	0		2016-10-29 02:24:23.201172	2016-11-06 10:32:10.147446	71	\N	t	f
222	2	0	0		2016-10-29 02:24:23.20548	2016-11-06 10:32:10.152705	70	\N	t	f
223	1	0	0		2016-10-29 02:24:23.207833	2016-11-06 10:32:10.155031	70	\N	t	f
224	3	0	0		2016-10-29 02:24:23.210037	2016-11-06 10:32:10.157394	70	\N	t	f
229	5	0	0		2016-10-29 15:26:07.088725	2016-11-06 10:32:10.174347	485	\N	t	f
230	5	0	0		2016-10-29 15:26:07.093284	2016-11-06 10:32:10.176749	484	\N	t	f
231	5	0	0		2016-10-29 15:26:07.097542	2016-11-06 10:32:10.178899	102	\N	t	f
232	5	0	0		2016-10-29 15:26:07.101271	2016-11-06 10:32:10.181335	101	\N	t	f
233	5	0	0		2016-10-29 15:26:07.105049	2016-11-06 10:32:10.183711	100	\N	t	f
234	5	0	0		2016-10-29 15:26:07.110792	2016-11-06 10:32:10.186832	99	\N	t	f
235	5	0	0		2016-10-29 15:26:07.114991	2016-11-06 10:32:10.201691	98	\N	t	f
236	5	0	0		2016-10-29 15:26:07.119197	2016-11-06 10:32:10.20634	97	\N	t	f
237	5	0	0		2016-10-29 15:26:07.123498	2016-11-06 10:32:10.208878	96	\N	t	f
238	5	0	0		2016-10-29 15:26:07.129011	2016-11-06 10:32:10.211303	95	\N	t	f
239	5	0	0		2016-10-29 15:26:07.132078	2016-11-06 10:32:10.216607	94	\N	t	f
240	5	0	0		2016-10-29 15:26:07.135068	2016-11-06 10:32:10.221726	93	\N	t	f
242	5	0	0		2016-10-29 15:26:07.145783	2016-11-06 10:32:10.226261	91	\N	t	f
243	5	0	0		2016-10-29 15:26:07.14998	2016-11-06 10:32:10.228579	90	\N	t	f
244	5	0	0		2016-10-29 15:26:07.152897	2016-11-06 10:32:10.230861	89	\N	t	f
245	5	0	0		2016-10-29 15:26:07.156291	2016-11-06 10:32:10.233344	88	\N	t	f
246	5	0	0		2016-10-29 15:26:07.159445	2016-11-06 10:32:10.235721	87	\N	t	f
247	5	0	0		2016-10-29 15:26:07.164115	2016-11-06 10:32:10.238026	86	\N	t	f
248	5	0	0		2016-10-29 15:26:07.168255	2016-11-06 10:32:10.240929	85	\N	t	f
249	5	0	0		2016-10-29 15:26:07.171494	2016-11-06 10:32:10.244124	84	\N	t	f
250	5	0	0		2016-10-29 15:26:07.174793	2016-11-06 10:32:10.247292	83	\N	t	f
251	5	0	0		2016-10-29 15:26:07.179515	2016-11-06 10:32:10.253162	82	\N	t	f
252	5	0	0		2016-10-29 15:26:07.184078	2016-11-06 10:32:10.262395	81	\N	t	f
253	5	0	0		2016-10-29 15:26:07.187252	2016-11-06 10:32:10.269437	80	\N	t	f
254	5	0	0		2016-10-29 15:26:07.190599	2016-11-06 10:32:10.274141	79	\N	t	f
255	5	0	0		2016-10-29 15:26:07.195402	2016-11-06 10:32:10.276508	78	\N	t	f
256	5	0	0		2016-10-29 15:26:07.200542	2016-11-06 10:32:10.279239	77	\N	t	f
257	5	0	0		2016-10-29 15:26:07.204426	2016-11-06 10:32:10.283948	76	\N	t	f
258	5	0	0		2016-10-29 15:26:07.208351	2016-11-06 10:32:10.286501	75	\N	t	f
259	5	0	0		2016-10-29 15:26:07.211652	2016-11-06 10:32:10.289183	74	\N	t	f
260	5	0	0		2016-10-29 15:26:07.214605	2016-11-06 10:32:10.291712	73	\N	t	f
261	5	0	0		2016-10-29 15:26:07.218535	2016-11-06 10:32:10.293924	72	\N	t	f
263	5	0	0		2016-10-29 15:26:07.2262	2016-11-06 10:32:10.304302	70	\N	t	f
264	5	0	0		2016-10-29 15:26:07.230838	2016-11-06 10:32:10.307377	69	\N	t	f
302	2	0	0		2016-10-30 17:30:46.033725	2016-11-06 11:57:56.637302	137	\N	f	f
303	2	0	0		2016-10-30 17:30:46.037996	2016-11-06 11:57:56.649595	136	\N	f	f
305	2	0	0		2016-10-30 17:30:46.045484	2016-11-06 11:57:56.686665	134	\N	f	f
306	2	0	0		2016-10-30 17:30:46.049177	2016-11-06 11:57:56.702485	133	\N	f	f
307	2	0	0		2016-10-30 17:30:46.05282	2016-11-06 11:57:56.715395	132	\N	f	f
308	2	0	0		2016-10-30 17:30:46.056473	2016-11-06 11:57:56.730657	131	\N	f	f
309	2	0	0		2016-10-30 17:30:46.060204	2016-11-06 11:57:56.741799	130	\N	f	f
310	2	0	0		2016-10-30 17:30:46.063878	2016-11-06 11:57:56.768578	129	\N	f	f
348	1	0	0		2016-10-30 17:30:46.240264	2016-11-06 11:57:56.800464	126	\N	f	f
349	1	0	0		2016-10-30 17:30:46.243718	2016-11-06 11:57:56.811042	125	\N	f	f
350	1	0	0		2016-10-30 17:30:46.247151	2016-11-06 11:57:56.821616	124	\N	f	f
351	1	0	0		2016-10-30 17:30:46.250501	2016-11-06 11:57:56.837651	123	\N	f	f
352	1	0	0		2016-10-30 17:30:46.253808	2016-11-06 11:57:56.856416	122	\N	f	f
354	1	0	0		2016-10-30 17:30:46.260222	2016-11-06 11:57:56.877123	120	\N	f	f
355	1	0	0		2016-10-30 17:30:46.26368	2016-11-06 11:57:56.88928	119	\N	f	f
356	1	0	0		2016-10-30 17:30:46.266908	2016-11-06 11:57:56.903187	118	\N	f	f
357	1	0	0		2016-10-30 17:30:46.270411	2016-11-06 11:57:56.919409	117	\N	f	f
358	1	0	0		2016-10-30 17:30:46.273677	2016-11-06 11:57:56.930494	116	\N	f	f
394	3	0	0		2016-10-30 17:30:46.443745	2016-11-06 11:57:56.944073	115	\N	f	f
225	2	80	87	4	2016-10-29 02:24:23.214311	2017-02-06 05:40:35.251744	69	83.5	t	t
226	1	75	76	3.5	2016-10-29 02:24:23.216654	2017-02-06 05:40:35.335362	69	75.5	t	t
227	3	80	80	4	2016-10-29 02:24:23.221307	2017-02-06 05:40:35.389669	69	80	t	t
228	5	80	75	3.5	2016-10-29 15:26:07.075325	2017-02-06 05:44:43.348035	488	77.5	t	t
360	1	0	0		2016-10-30 17:30:46.280711	2016-11-06 11:57:56.959047	114	\N	f	f
361	1	0	0		2016-10-30 17:30:46.284225	2016-11-06 11:57:56.979308	113	\N	f	f
362	1	0	0		2016-10-30 17:30:46.287392	2016-11-06 11:57:56.990418	112	\N	f	f
363	1	0	0		2016-10-30 17:30:46.290555	2016-11-06 11:57:57.003915	111	\N	f	f
364	1	0	0		2016-10-30 17:30:46.29381	2016-11-06 11:57:57.023185	110	\N	f	f
365	1	0	0		2016-10-30 17:30:46.297425	2016-11-06 11:57:57.039555	109	\N	f	f
366	1	0	0		2016-10-30 17:30:46.301049	2016-11-06 11:57:57.050989	108	\N	f	f
367	1	0	0		2016-10-30 17:30:46.304411	2016-11-06 11:57:57.061663	107	\N	f	f
368	1	0	0		2016-10-30 17:30:46.307694	2016-11-06 11:57:57.075432	106	\N	f	f
369	1	0	0		2016-10-30 17:30:46.311454	2016-11-06 11:57:57.098732	105	\N	f	f
370	1	0	0		2016-10-30 17:30:46.314892	2016-11-06 11:57:57.11257	104	\N	f	f
371	1	0	0		2016-10-30 17:30:46.318497	2016-11-06 11:57:57.126634	103	\N	f	f
372	3	0	0		2016-10-30 17:30:46.371776	2016-11-06 11:57:56.623048	137	\N	f	f
374	3	0	0		2016-10-30 17:30:46.378788	2016-11-06 11:57:56.664291	135	\N	f	f
375	3	0	0		2016-10-30 17:30:46.382029	2016-11-06 11:57:56.681234	134	\N	f	f
376	3	0	0		2016-10-30 17:30:46.385231	2016-11-06 11:57:56.696173	133	\N	f	f
377	3	0	0		2016-10-30 17:30:46.38872	2016-11-06 11:57:56.709777	132	\N	f	f
378	3	0	0		2016-10-30 17:30:46.391942	2016-11-06 11:57:56.723531	131	\N	f	f
379	3	0	0		2016-10-30 17:30:46.395309	2016-11-06 11:57:56.737276	130	\N	f	f
346	1	0	0		2016-10-30 17:30:46.233529	2016-11-06 11:57:56.775434	128	\N	f	f
381	3	0	0		2016-10-30 17:30:46.402047	2016-11-06 11:57:56.778396	128	\N	f	f
382	3	0	0		2016-10-30 17:30:46.405586	2016-11-06 11:57:56.792752	127	\N	f	f
383	3	0	0		2016-10-30 17:30:46.408862	2016-11-06 11:57:56.8026	126	\N	f	f
384	3	0	0		2016-10-30 17:30:46.412048	2016-11-06 11:57:56.8132	125	\N	f	f
385	3	0	0		2016-10-30 17:30:46.415157	2016-11-06 11:57:56.824856	124	\N	f	f
386	3	0	0		2016-10-30 17:30:46.418335	2016-11-06 11:57:56.840535	123	\N	f	f
387	3	0	0		2016-10-30 17:30:46.421485	2016-11-06 11:57:56.858802	122	\N	f	f
388	3	0	0		2016-10-30 17:30:46.424665	2016-11-06 11:57:56.869128	121	\N	f	f
389	3	0	0		2016-10-30 17:30:46.428211	2016-11-06 11:57:56.879824	120	\N	f	f
390	3	0	0		2016-10-30 17:30:46.431365	2016-11-06 11:57:56.891922	119	\N	f	f
391	3	0	0		2016-10-30 17:30:46.434519	2016-11-06 11:57:56.906476	118	\N	f	f
392	3	0	0		2016-10-30 17:30:46.437573	2016-11-06 11:57:56.921712	117	\N	f	f
393	3	0	0		2016-10-30 17:30:46.440677	2016-11-06 11:57:56.933089	116	\N	f	f
395	3	0	0		2016-10-30 17:30:46.44693	2016-11-06 11:57:56.967171	114	\N	f	f
396	3	0	0		2016-10-30 17:30:46.450232	2016-11-06 11:57:56.981662	113	\N	f	f
397	3	0	0		2016-10-30 17:30:46.453758	2016-11-06 11:57:56.992998	112	\N	f	f
398	3	0	0		2016-10-30 17:30:46.45699	2016-11-06 11:57:57.00815	111	\N	f	f
399	3	0	0		2016-10-30 17:30:46.460421	2016-11-06 11:57:57.026561	110	\N	f	f
400	3	0	0		2016-10-30 17:30:46.463699	2016-11-06 11:57:57.042148	109	\N	f	f
331	2	0	0		2016-10-30 17:30:46.140906	2016-11-06 11:57:57.057948	108	\N	f	f
402	3	0	0		2016-10-30 17:30:46.469996	2016-11-06 11:57:57.064345	107	\N	f	f
403	3	0	0		2016-10-30 17:30:46.473151	2016-11-06 11:57:57.081213	106	\N	f	f
404	3	0	0		2016-10-30 17:30:46.476469	2016-11-06 11:57:57.101582	105	\N	f	f
405	3	0	0		2016-10-30 17:30:46.479836	2016-11-06 11:57:57.115529	104	\N	f	f
406	3	0	0		2016-10-30 17:30:46.48299	2016-11-06 11:57:57.129654	103	\N	f	f
407	5	0	0		2016-10-30 17:30:46.526856	2016-11-06 11:57:56.634512	137	\N	f	f
339	1	0	0		2016-10-30 17:30:46.210366	2016-11-06 11:57:56.65449	135	\N	f	f
340	1	0	0		2016-10-30 17:30:46.213702	2016-11-06 11:57:56.67841	134	\N	f	f
341	1	0	0		2016-10-30 17:30:46.217023	2016-11-06 11:57:56.693903	133	\N	f	f
342	1	0	0		2016-10-30 17:30:46.220354	2016-11-06 11:57:56.706896	132	\N	f	f
343	1	0	0		2016-10-30 17:30:46.22349	2016-11-06 11:57:56.720304	131	\N	f	f
344	1	0	0		2016-10-30 17:30:46.226636	2016-11-06 11:57:56.734876	130	\N	f	f
345	1	0	0		2016-10-30 17:30:46.22986	2016-11-06 11:57:56.745059	129	\N	f	f
347	1	0	0		2016-10-30 17:30:46.237149	2016-11-06 11:57:56.790275	127	\N	f	f
312	2	0	0		2016-10-30 17:30:46.071464	2016-11-06 11:57:56.797083	127	\N	f	f
313	2	0	0		2016-10-30 17:30:46.075598	2016-11-06 11:57:56.807411	126	\N	f	f
314	2	0	0		2016-10-30 17:30:46.079365	2016-11-06 11:57:56.817651	125	\N	f	f
315	2	0	0		2016-10-30 17:30:46.083565	2016-11-06 11:57:56.831476	124	\N	f	f
316	2	0	0		2016-10-30 17:30:46.088828	2016-11-06 11:57:56.852553	123	\N	f	f
353	1	0	0		2016-10-30 17:30:46.257015	2016-11-06 11:57:56.866916	121	\N	f	f
318	2	0	0		2016-10-30 17:30:46.095644	2016-11-06 11:57:56.873556	121	\N	f	f
319	2	0	0		2016-10-30 17:30:46.098912	2016-11-06 11:57:56.884568	120	\N	f	f
320	2	0	0		2016-10-30 17:30:46.102416	2016-11-06 11:57:56.898312	119	\N	f	f
321	2	0	0		2016-10-30 17:30:46.105806	2016-11-06 11:57:56.915614	118	\N	f	f
322	2	0	0		2016-10-30 17:30:46.109208	2016-11-06 11:57:56.926881	117	\N	f	f
323	2	0	0		2016-10-30 17:30:46.112955	2016-11-06 11:57:56.938109	116	\N	f	f
324	2	0	0		2016-10-30 17:30:46.116304	2016-11-06 11:57:56.950691	115	\N	f	f
325	2	0	0		2016-10-30 17:30:46.119812	2016-11-06 11:57:56.975275	114	\N	f	f
326	2	0	0		2016-10-30 17:30:46.123444	2016-11-06 11:57:56.986504	113	\N	f	f
327	2	0	0		2016-10-30 17:30:46.126831	2016-11-06 11:57:56.998176	112	\N	f	f
328	2	0	0		2016-10-30 17:30:46.130281	2016-11-06 11:57:57.018158	111	\N	f	f
329	2	0	0		2016-10-30 17:30:46.133925	2016-11-06 11:57:57.035371	110	\N	f	f
330	2	0	0		2016-10-30 17:30:46.137352	2016-11-06 11:57:57.047208	109	\N	f	f
332	2	0	0		2016-10-30 17:30:46.144802	2016-11-06 11:57:57.069187	107	\N	f	f
333	2	0	0		2016-10-30 17:30:46.148249	2016-11-06 11:57:57.092114	106	\N	f	f
334	2	0	0		2016-10-30 17:30:46.151579	2016-11-06 11:57:57.107764	105	\N	f	f
335	2	0	0		2016-10-30 17:30:46.155268	2016-11-06 11:57:57.121907	104	\N	f	f
336	2	0	0		2016-10-30 17:30:46.158733	2016-11-06 11:57:57.137997	103	\N	f	f
373	3	0	0		2016-10-30 17:30:46.375453	2016-11-06 11:57:56.644295	136	\N	f	f
337	1	0	0		2016-10-30 17:30:46.203349	2016-11-06 11:57:56.614087	137	\N	f	f
117	2	0	0		2016-10-29 02:24:22.783318	2016-11-06 10:32:09.758828	488	\N	t	f
123	2	0	0		2016-10-29 02:24:22.820257	2016-11-06 10:32:09.782529	484	\N	t	f
144	2	0	0		2016-10-29 02:24:22.908337	2016-11-06 10:32:09.852049	96	\N	t	f
165	2	0	0		2016-10-29 02:24:22.985866	2016-11-06 10:32:09.927336	89	\N	t	f
186	2	0	0		2016-10-29 02:24:23.067729	2016-11-06 10:32:10.004733	82	\N	t	f
207	2	0	0		2016-10-29 02:24:23.14591	2016-11-06 10:32:10.085621	75	\N	t	f
214	1	0	0		2016-10-29 02:24:23.171658	2016-11-06 10:32:10.12485	73	\N	t	f
220	1	0	0		2016-10-29 02:24:23.190566	2016-11-06 10:32:10.144392	71	\N	t	f
241	5	0	0		2016-10-29 15:26:07.139185	2016-11-06 10:32:10.224015	92	\N	t	f
262	5	0	0		2016-10-29 15:26:07.222173	2016-11-06 10:32:10.296212	71	\N	t	f
409	5	0	0		2016-10-30 17:30:46.533578	2016-11-06 11:57:56.670386	135	\N	f	f
304	2	0	0		2016-10-30 17:30:46.04177	2016-11-06 11:57:56.673689	135	\N	f	f
411	5	0	0		2016-10-30 17:30:46.540177	2016-11-06 11:57:56.699398	133	\N	f	f
412	5	0	0		2016-10-30 17:30:46.543471	2016-11-06 11:57:56.71265	132	\N	f	f
413	5	0	0		2016-10-30 17:30:46.546689	2016-11-06 11:57:56.728243	131	\N	f	f
414	5	0	0		2016-10-30 17:30:46.550012	2016-11-06 11:57:56.739683	130	\N	f	f
380	3	0	0		2016-10-30 17:30:46.398576	2016-11-06 11:57:56.747304	129	\N	f	f
416	5	0	0		2016-10-30 17:30:46.556229	2016-11-06 11:57:56.780805	128	\N	f	f
311	2	0	0		2016-10-30 17:30:46.067566	2016-11-06 11:57:56.783651	128	\N	f	f
418	5	0	0		2016-10-30 17:30:46.562738	2016-11-06 11:57:56.805001	126	\N	f	f
419	5	0	0		2016-10-30 17:30:46.565907	2016-11-06 11:57:56.81549	125	\N	f	f
420	5	0	0		2016-10-30 17:30:46.569141	2016-11-06 11:57:56.828029	124	\N	f	f
421	5	0	0		2016-10-30 17:30:46.572395	2016-11-06 11:57:56.845507	123	\N	f	f
422	5	0	0		2016-10-30 17:30:46.575735	2016-11-06 11:57:56.860953	122	\N	f	f
317	2	0	0		2016-10-30 17:30:46.092364	2016-11-06 11:57:56.863266	122	\N	f	f
424	5	0	0		2016-10-30 17:30:46.582084	2016-11-06 11:57:56.882017	120	\N	f	f
425	5	0	0		2016-10-30 17:30:46.585187	2016-11-06 11:57:56.895047	119	\N	f	f
426	5	0	0		2016-10-30 17:30:46.58884	2016-11-06 11:57:56.909927	118	\N	f	f
427	5	0	0		2016-10-30 17:30:46.592038	2016-11-06 11:57:56.924626	117	\N	f	f
428	5	0	0		2016-10-30 17:30:46.595344	2016-11-06 11:57:56.935743	116	\N	f	f
359	1	0	0		2016-10-30 17:30:46.277355	2016-11-06 11:57:56.941778	115	\N	f	f
430	5	0	0		2016-10-30 17:30:46.602041	2016-11-06 11:57:56.970465	114	\N	f	f
431	5	0	0		2016-10-30 17:30:46.605693	2016-11-06 11:57:56.984033	113	\N	f	f
432	5	0	0		2016-10-30 17:30:46.60915	2016-11-06 11:57:56.995755	112	\N	f	f
433	5	0	0		2016-10-30 17:30:46.612341	2016-11-06 11:57:57.011798	111	\N	f	f
434	5	0	0		2016-10-30 17:30:46.615536	2016-11-06 11:57:57.029604	110	\N	f	f
435	5	0	0		2016-10-30 17:30:46.619144	2016-11-06 11:57:57.044581	109	\N	f	f
401	3	0	0		2016-10-30 17:30:46.466827	2016-11-06 11:57:57.053401	108	\N	f	f
437	5	0	0		2016-10-30 17:30:46.625433	2016-11-06 11:57:57.066724	107	\N	f	f
438	5	0	0		2016-10-30 17:30:46.628915	2016-11-06 11:57:57.084782	106	\N	f	f
439	5	0	0		2016-10-30 17:30:46.632201	2016-11-06 11:57:57.104603	105	\N	f	f
440	5	0	0		2016-10-30 17:30:46.635267	2016-11-06 11:57:57.118897	104	\N	f	f
441	5	0	0		2016-10-30 17:30:46.639363	2016-11-06 11:57:57.134245	103	\N	f	f
338	1	0	0		2016-10-30 17:30:46.206906	2016-11-06 11:57:56.641509	136	\N	f	f
408	5	0	0		2016-10-30 17:30:46.530225	2016-11-06 11:57:56.647206	136	\N	f	f
410	5	0	0		2016-10-30 17:30:46.536849	2016-11-06 11:57:56.684082	134	\N	f	f
415	5	0	0		2016-10-30 17:30:46.553124	2016-11-06 11:57:56.749998	129	\N	f	f
417	5	0	0		2016-10-30 17:30:46.559493	2016-11-06 11:57:56.795033	127	\N	f	f
423	5	0	0		2016-10-30 17:30:46.579043	2016-11-06 11:57:56.871428	121	\N	f	f
429	5	0	0		2016-10-30 17:30:46.598634	2016-11-06 11:57:56.946806	115	\N	f	f
436	5	0	0		2016-10-30 17:30:46.622354	2016-11-06 11:57:57.055584	108	\N	f	f
478	1	0	0		2016-11-06 12:57:15.271982	2016-11-06 13:14:29.650261	523	\N	f	f
479	1	0	0		2016-11-06 12:57:15.274551	2016-11-06 13:14:29.661993	522	\N	f	f
480	1	0	0		2016-11-06 12:57:15.276862	2016-11-06 13:14:29.673792	521	\N	f	f
481	1	0	0		2016-11-06 12:57:15.279347	2016-11-06 13:14:29.686238	520	\N	f	f
482	1	0	0		2016-11-06 12:57:15.281785	2016-11-06 13:14:29.698531	519	\N	f	f
547	5	0	0		2016-11-06 12:57:15.50417	2016-11-06 13:14:29.642528	524	\N	f	f
513	3	0	0		2016-11-06 12:57:15.388145	2016-11-06 13:14:29.653061	523	\N	f	f
548	5	0	0		2016-11-06 12:57:15.50665	2016-11-06 13:14:29.6556	523	\N	f	f
514	3	0	0		2016-11-06 12:57:15.390797	2016-11-06 13:14:29.664486	522	\N	f	f
549	5	0	0		2016-11-06 12:57:15.509073	2016-11-06 13:14:29.667244	522	\N	f	f
550	5	0	0		2016-11-06 12:57:15.511498	2016-11-06 13:14:29.679279	521	\N	f	f
516	3	0	0		2016-11-06 12:57:15.396321	2016-11-06 13:14:29.688822	520	\N	f	f
551	5	0	0		2016-11-06 12:57:15.514018	2016-11-06 13:14:29.691607	520	\N	f	f
517	3	0	0		2016-11-06 12:57:15.399008	2016-11-06 13:14:29.701047	519	\N	f	f
552	5	0	0		2016-11-06 12:57:15.516461	2016-11-06 13:14:29.703713	519	\N	f	f
483	1	0	0		2016-11-06 12:57:15.284113	2016-11-06 13:14:29.710583	518	\N	f	f
518	3	0	0		2016-11-06 12:57:15.401703	2016-11-06 13:14:29.71381	518	\N	f	f
553	5	0	0		2016-11-06 12:57:15.518813	2016-11-06 13:14:29.716534	518	\N	f	f
484	1	0	0		2016-11-06 12:57:15.286766	2016-11-06 13:14:29.722732	517	\N	f	f
519	3	0	0		2016-11-06 12:57:15.404304	2016-11-06 13:14:29.725294	517	\N	f	f
554	5	0	0		2016-11-06 12:57:15.521212	2016-11-06 13:14:29.727975	517	\N	f	f
485	1	0	0		2016-11-06 12:57:15.289318	2016-11-06 13:14:29.735869	516	\N	f	f
520	3	0	0		2016-11-06 12:57:15.40746	2016-11-06 13:14:29.738333	516	\N	f	f
555	5	0	0		2016-11-06 12:57:15.523689	2016-11-06 13:14:29.74074	516	\N	f	f
486	1	0	0		2016-11-06 12:57:15.291565	2016-11-06 13:14:29.748172	515	\N	f	f
521	3	0	0		2016-11-06 12:57:15.411017	2016-11-06 13:14:29.750729	515	\N	f	f
556	5	0	0		2016-11-06 12:57:15.526338	2016-11-06 13:14:29.753133	515	\N	f	f
487	1	0	0		2016-11-06 12:57:15.294	2016-11-06 13:14:29.759438	514	\N	f	f
522	3	0	0		2016-11-06 12:57:15.413522	2016-11-06 13:14:29.762426	514	\N	f	f
557	5	0	0		2016-11-06 12:57:15.529142	2016-11-06 13:14:29.765916	514	\N	f	f
523	3	0	0		2016-11-06 12:57:15.415983	2016-11-06 13:14:29.77524	513	\N	f	f
558	5	0	0		2016-11-06 12:57:15.531632	2016-11-06 13:14:29.777877	513	\N	f	f
489	1	0	0		2016-11-06 12:57:15.298881	2016-11-06 13:14:29.785907	512	\N	f	f
524	3	0	0		2016-11-06 12:57:15.418411	2016-11-06 13:14:29.788649	512	\N	f	f
559	5	0	0		2016-11-06 12:57:15.53403	2016-11-06 13:14:29.791096	512	\N	f	f
490	1	0	0		2016-11-06 12:57:15.302308	2016-11-06 13:14:29.799246	511	\N	f	f
525	3	0	0		2016-11-06 12:57:15.420904	2016-11-06 13:14:29.801964	511	\N	f	f
560	5	0	0		2016-11-06 12:57:15.536479	2016-11-06 13:14:29.804527	511	\N	f	f
491	1	0	0		2016-11-06 12:57:15.30546	2016-11-06 13:14:29.811383	510	\N	f	f
526	3	0	0		2016-11-06 12:57:15.42331	2016-11-06 13:14:29.814679	510	\N	f	f
561	5	0	0		2016-11-06 12:57:15.538971	2016-11-06 13:14:29.817709	510	\N	f	f
492	1	0	0		2016-11-06 12:57:15.307847	2016-11-06 13:14:29.824478	509	\N	f	f
527	3	0	0		2016-11-06 12:57:15.425707	2016-11-06 13:14:29.827274	509	\N	f	f
562	5	0	0		2016-11-06 12:57:15.541462	2016-11-06 13:14:29.831054	509	\N	f	f
493	1	0	0		2016-11-06 12:57:15.310417	2016-11-06 13:14:29.837745	508	\N	f	f
528	3	0	0		2016-11-06 12:57:15.428189	2016-11-06 13:14:29.84044	508	\N	f	f
563	5	0	0		2016-11-06 12:57:15.543732	2016-11-06 13:14:29.843255	508	\N	f	f
494	1	0	0		2016-11-06 12:57:15.312688	2016-11-06 13:14:29.851152	507	\N	f	f
529	3	0	0		2016-11-06 12:57:15.430719	2016-11-06 13:14:29.853582	507	\N	f	f
564	5	0	0		2016-11-06 12:57:15.5462	2016-11-06 13:14:29.856073	507	\N	f	f
530	3	0	0		2016-11-06 12:57:15.433181	2016-11-06 13:14:29.866349	506	\N	f	f
565	5	0	0		2016-11-06 12:57:15.548705	2016-11-06 13:14:29.86913	506	\N	f	f
496	1	0	0		2016-11-06 12:57:15.317712	2016-11-06 13:14:29.87566	505	\N	f	f
531	3	0	0		2016-11-06 12:57:15.435562	2016-11-06 13:14:29.878469	505	\N	f	f
566	5	0	0		2016-11-06 12:57:15.551179	2016-11-06 13:14:29.882149	505	\N	f	f
497	1	0	0		2016-11-06 12:57:15.319963	2016-11-06 13:14:29.88899	504	\N	f	f
532	3	0	0		2016-11-06 12:57:15.438439	2016-11-06 13:14:29.891579	504	\N	f	f
567	5	0	0		2016-11-06 12:57:15.553437	2016-11-06 13:14:29.894319	504	\N	f	f
498	1	0	0		2016-11-06 12:57:15.322278	2016-11-06 13:14:29.901884	503	\N	f	f
533	3	0	0		2016-11-06 12:57:15.441774	2016-11-06 13:14:29.904613	503	\N	f	f
568	5	0	0		2016-11-06 12:57:15.555757	2016-11-06 13:14:29.907127	503	\N	f	f
499	1	0	0		2016-11-06 12:57:15.325027	2016-11-06 13:14:29.914941	502	\N	f	f
534	3	0	0		2016-11-06 12:57:15.444278	2016-11-06 13:14:29.917731	502	\N	f	f
569	5	0	0		2016-11-06 12:57:15.55813	2016-11-06 13:14:29.920136	502	\N	f	f
500	1	0	0		2016-11-06 12:57:15.327271	2016-11-06 13:14:29.927051	501	\N	f	f
535	3	0	0		2016-11-06 12:57:15.446641	2016-11-06 13:14:29.930642	501	\N	f	f
570	5	0	0		2016-11-06 12:57:15.560376	2016-11-06 13:14:29.933539	501	\N	f	f
501	1	0	0		2016-11-06 12:57:15.329479	2016-11-06 13:14:29.940068	500	\N	f	f
536	3	0	0		2016-11-06 12:57:15.449112	2016-11-06 13:14:29.942655	500	\N	f	f
571	5	0	0		2016-11-06 12:57:15.562647	2016-11-06 13:14:29.945261	500	\N	f	f
537	3	0	0		2016-11-06 12:57:15.451732	2016-11-06 13:14:29.955813	499	\N	f	f
572	5	0	0		2016-11-06 12:57:15.565125	2016-11-06 13:14:29.958385	499	\N	f	f
503	1	0	0		2016-11-06 12:57:15.334402	2016-11-06 13:14:29.965814	498	\N	f	f
538	3	0	0		2016-11-06 12:57:15.454161	2016-11-06 13:14:29.968559	498	\N	f	f
573	5	0	0		2016-11-06 12:57:15.56748	2016-11-06 13:14:29.971106	498	\N	f	f
504	1	0	0		2016-11-06 12:57:15.336744	2016-11-06 13:14:29.97779	497	\N	f	f
539	3	0	0		2016-11-06 12:57:15.456514	2016-11-06 13:14:29.980826	497	\N	f	f
574	5	0	0		2016-11-06 12:57:15.569916	2016-11-06 13:14:29.983674	497	\N	f	f
505	1	0	0		2016-11-06 12:57:15.339285	2016-11-06 13:14:29.990499	496	\N	f	f
540	3	0	0		2016-11-06 12:57:15.458842	2016-11-06 13:14:29.993229	496	\N	f	f
575	5	0	0		2016-11-06 12:57:15.572309	2016-11-06 13:14:29.99597	496	\N	f	f
506	1	0	0		2016-11-06 12:57:15.341578	2016-11-06 13:14:30.002189	495	\N	f	f
541	3	0	0		2016-11-06 12:57:15.461338	2016-11-06 13:14:30.004789	495	\N	f	f
576	5	0	0		2016-11-06 12:57:15.574907	2016-11-06 13:14:30.007461	495	\N	f	f
507	1	0	0		2016-11-06 12:57:15.343941	2016-11-06 13:14:30.01443	494	\N	f	f
542	3	0	0		2016-11-06 12:57:15.463624	2016-11-06 13:14:30.017175	494	\N	f	f
577	5	0	0		2016-11-06 12:57:15.577359	2016-11-06 13:14:30.020012	494	\N	f	f
508	1	0	0		2016-11-06 12:57:15.346407	2016-11-06 13:14:30.039587	493	\N	f	f
543	3	0	0		2016-11-06 12:57:15.465972	2016-11-06 13:14:30.042405	493	\N	f	f
578	5	0	0		2016-11-06 12:57:15.579709	2016-11-06 13:14:30.045078	493	\N	f	f
544	3	0	0		2016-11-06 12:57:15.468328	2016-11-06 13:14:30.054345	492	\N	f	f
579	5	0	0		2016-11-06 12:57:15.582572	2016-11-06 13:14:30.057061	492	\N	f	f
510	1	0	0		2016-11-06 12:57:15.351131	2016-11-06 13:14:30.063825	491	\N	f	f
545	3	0	0		2016-11-06 12:57:15.470837	2016-11-06 13:14:30.066413	491	\N	f	f
511	1	0	0		2016-11-06 12:57:15.353716	2016-11-06 13:14:30.076248	490	\N	f	f
546	3	0	0		2016-11-06 12:57:15.473232	2016-11-06 13:14:30.078893	490	\N	f	f
477	1	0	0		2016-11-06 12:57:15.268203	2016-11-06 13:14:29.620919	524	\N	f	f
512	3	0	0		2016-11-06 12:57:15.385501	2016-11-06 13:14:29.630477	524	\N	f	f
582	2	0	0		2016-11-06 12:57:15.621465	2016-11-06 13:14:29.645998	524	\N	f	f
583	2	0	0		2016-11-06 12:57:15.623931	2016-11-06 13:14:29.658101	523	\N	f	f
584	2	0	0		2016-11-06 12:57:15.62631	2016-11-06 13:14:29.669848	522	\N	f	f
515	3	0	0		2016-11-06 12:57:15.393506	2016-11-06 13:14:29.676543	521	\N	f	f
585	2	0	0		2016-11-06 12:57:15.628721	2016-11-06 13:14:29.681931	521	\N	f	f
586	2	0	0		2016-11-06 12:57:15.631284	2016-11-06 13:14:29.694204	520	\N	f	f
587	2	0	0		2016-11-06 12:57:15.6336	2016-11-06 13:14:29.706323	519	\N	f	f
588	2	0	0		2016-11-06 12:57:15.636002	2016-11-06 13:14:29.718972	518	\N	f	f
589	2	0	0		2016-11-06 12:57:15.63856	2016-11-06 13:14:29.731815	517	\N	f	f
590	2	0	0		2016-11-06 12:57:15.641366	2016-11-06 13:14:29.743093	516	\N	f	f
591	2	0	0		2016-11-06 12:57:15.643985	2016-11-06 13:14:29.755472	515	\N	f	f
592	2	0	0		2016-11-06 12:57:15.646371	2016-11-06 13:14:29.7684	514	\N	f	f
488	1	0	0		2016-11-06 12:57:15.296509	2016-11-06 13:14:29.772556	513	\N	f	f
593	2	0	0		2016-11-06 12:57:15.648845	2016-11-06 13:14:29.781247	513	\N	f	f
594	2	0	0		2016-11-06 12:57:15.651175	2016-11-06 13:14:29.793634	512	\N	f	f
595	2	0	0		2016-11-06 12:57:15.653496	2016-11-06 13:14:29.806952	511	\N	f	f
596	2	0	0		2016-11-06 12:57:15.655906	2016-11-06 13:14:29.820394	510	\N	f	f
597	2	0	0		2016-11-06 12:57:15.658525	2016-11-06 13:14:29.833881	509	\N	f	f
598	2	0	0		2016-11-06 12:57:15.660997	2016-11-06 13:14:29.846294	508	\N	f	f
599	2	0	0		2016-11-06 12:57:15.663512	2016-11-06 13:14:29.85851	507	\N	f	f
495	1	0	0		2016-11-06 12:57:15.315067	2016-11-06 13:14:29.863208	506	\N	f	f
600	2	0	0		2016-11-06 12:57:15.665942	2016-11-06 13:14:29.87169	506	\N	f	f
601	2	0	0		2016-11-06 12:57:15.668281	2016-11-06 13:14:29.88505	505	\N	f	f
602	2	0	0		2016-11-06 12:57:15.671003	2016-11-06 13:14:29.897553	504	\N	f	f
603	2	0	0		2016-11-06 12:57:15.673958	2016-11-06 13:14:29.9097	503	\N	f	f
604	2	0	0		2016-11-06 12:57:15.676442	2016-11-06 13:14:29.922703	502	\N	f	f
605	2	0	0		2016-11-06 12:57:15.678861	2016-11-06 13:14:29.936097	501	\N	f	f
606	2	0	0		2016-11-06 12:57:15.681413	2016-11-06 13:14:29.948871	500	\N	f	f
502	1	0	0		2016-11-06 12:57:15.332095	2016-11-06 13:14:29.95318	499	\N	f	f
607	2	0	0		2016-11-06 12:57:15.684172	2016-11-06 13:14:29.961115	499	\N	f	f
608	2	0	0		2016-11-06 12:57:15.686597	2016-11-06 13:14:29.973685	498	\N	f	f
609	2	0	0		2016-11-06 12:57:15.68902	2016-11-06 13:14:29.986167	497	\N	f	f
610	2	0	0		2016-11-06 12:57:15.691519	2016-11-06 13:14:29.998424	496	\N	f	f
611	2	0	0		2016-11-06 12:57:15.693931	2016-11-06 13:14:30.010157	495	\N	f	f
612	2	0	0		2016-11-06 12:57:15.696512	2016-11-06 13:14:30.035209	494	\N	f	f
613	2	0	0		2016-11-06 12:57:15.699312	2016-11-06 13:14:30.047706	493	\N	f	f
509	1	0	0		2016-11-06 12:57:15.348683	2016-11-06 13:14:30.051654	492	\N	f	f
614	2	0	0		2016-11-06 12:57:15.70174	2016-11-06 13:14:30.059588	492	\N	f	f
580	5	0	0		2016-11-06 12:57:15.585011	2016-11-06 13:14:30.069296	491	\N	f	f
615	2	0	0		2016-11-06 12:57:15.704131	2016-11-06 13:14:30.071789	491	\N	f	f
581	5	0	0		2016-11-06 12:57:15.587563	2016-11-06 13:14:30.081634	490	\N	f	f
616	2	0	0		2016-11-06 12:57:15.717093	2016-11-06 13:14:30.084194	490	\N	f	f
654	3	0	0		2016-11-07 10:24:25.967426	2016-12-13 07:31:59.602206	210	\N	f	f
618	1	0	0		2016-11-07 10:24:25.81662	2016-12-13 07:31:59.617544	209	\N	f	f
655	3	0	0		2016-11-07 10:24:25.970603	2016-12-13 07:31:59.621438	209	\N	f	f
619	1	0	0		2016-11-07 10:24:25.819303	2016-12-13 07:31:59.635192	208	\N	f	f
656	3	0	0		2016-11-07 10:24:25.973885	2016-12-13 07:31:59.638635	208	\N	f	f
620	1	0	0		2016-11-07 10:24:25.821625	2016-12-13 07:31:59.651485	207	\N	f	f
657	3	0	0		2016-11-07 10:24:25.976738	2016-12-13 07:31:59.654567	207	\N	f	f
621	1	0	0		2016-11-07 10:24:25.823965	2016-12-13 07:31:59.691321	206	\N	f	f
658	3	0	0		2016-11-07 10:24:25.979528	2016-12-13 07:31:59.693995	206	\N	f	f
622	1	0	0		2016-11-07 10:24:25.826336	2016-12-13 07:31:59.704558	205	\N	f	f
623	1	0	0		2016-11-07 10:24:25.829215	2016-12-13 07:31:59.718248	204	\N	f	f
660	3	0	0		2016-11-07 10:24:25.984773	2016-12-13 07:31:59.721215	204	\N	f	f
624	1	0	0		2016-11-07 10:24:25.831887	2016-12-13 07:31:59.732613	203	\N	f	f
661	3	0	0		2016-11-07 10:24:25.98719	2016-12-13 07:31:59.735591	203	\N	f	f
625	1	0	0		2016-11-07 10:24:25.834381	2016-12-13 07:31:59.744722	202	\N	f	f
662	3	0	0		2016-11-07 10:24:25.9897	2016-12-13 07:31:59.748152	202	\N	f	f
626	1	0	0		2016-11-07 10:24:25.836646	2016-12-13 07:31:59.758411	201	\N	f	f
663	3	0	0		2016-11-07 10:24:25.992188	2016-12-13 07:31:59.761037	201	\N	f	f
627	1	0	0		2016-11-07 10:24:25.839138	2016-12-13 07:31:59.771484	200	\N	f	f
664	3	0	0		2016-11-07 10:24:25.994556	2016-12-13 07:31:59.774172	200	\N	f	f
628	1	0	0		2016-11-07 10:24:25.841421	2016-12-13 07:31:59.784584	199	\N	f	f
665	3	0	0		2016-11-07 10:24:25.9969	2016-12-13 07:31:59.787186	199	\N	f	f
629	1	0	0		2016-11-07 10:24:25.843727	2016-12-13 07:31:59.796954	198	\N	f	f
666	3	0	0		2016-11-07 10:24:25.999308	2016-12-13 07:31:59.8002	198	\N	f	f
630	1	0	0		2016-11-07 10:24:25.851736	2016-12-13 07:31:59.809535	197	\N	f	f
667	3	0	0		2016-11-07 10:24:26.001722	2016-12-13 07:31:59.812038	197	\N	f	f
631	1	0	0		2016-11-07 10:24:25.854256	2016-12-13 07:31:59.823293	196	\N	f	f
632	1	0	0		2016-11-07 10:24:25.856874	2016-12-13 07:31:59.836774	195	\N	f	f
633	1	0	0		2016-11-07 10:24:25.859472	2016-12-13 07:31:59.849884	194	\N	f	f
634	1	0	0		2016-11-07 10:24:25.862054	2016-12-13 07:31:59.862003	193	\N	f	f
636	1	0	0		2016-11-07 10:24:25.86755	2016-12-13 07:31:59.888916	191	\N	f	f
637	1	0	0		2016-11-07 10:24:25.870053	2016-12-13 07:31:59.902983	190	\N	f	f
638	1	0	0		2016-11-07 10:24:25.872519	2016-12-13 07:31:59.917017	189	\N	f	f
639	1	0	0		2016-11-07 10:24:25.874937	2016-12-13 07:31:59.931358	188	\N	f	f
640	1	0	0		2016-11-07 10:24:25.87734	2016-12-13 07:31:59.945474	187	\N	f	f
641	1	0	0		2016-11-07 10:24:25.879819	2016-12-13 07:31:59.961315	186	\N	f	f
642	1	0	0		2016-11-07 10:24:25.882276	2016-12-13 07:31:59.977572	185	\N	f	f
643	1	0	0		2016-11-07 10:24:25.884731	2016-12-13 07:31:59.992583	184	\N	f	f
644	1	0	0		2016-11-07 10:24:25.887234	2016-12-13 07:32:00.008463	183	\N	f	f
645	1	0	0		2016-11-07 10:24:25.889668	2016-12-13 07:32:00.023132	182	\N	f	f
646	1	0	0		2016-11-07 10:24:25.892381	2016-12-13 07:32:00.036231	181	\N	f	f
647	1	0	0		2016-11-07 10:24:25.895051	2016-12-13 07:32:00.049227	180	\N	f	f
648	1	0	0		2016-11-07 10:24:25.897506	2016-12-13 07:32:00.062012	179	\N	f	f
649	1	0	0		2016-11-07 10:24:25.8999	2016-12-13 07:32:00.074292	178	\N	f	f
650	1	0	0		2016-11-07 10:24:25.903246	2016-12-13 07:32:00.087114	177	\N	f	f
651	1	0	0		2016-11-07 10:24:25.906548	2016-12-13 07:32:00.100161	176	\N	f	f
652	1	0	0		2016-11-07 10:24:25.909077	2016-12-13 07:32:00.113015	175	\N	f	f
653	1	0	0		2016-11-07 10:24:25.911484	2016-12-13 07:32:00.126592	174	\N	f	f
728	2	0	0		2016-11-07 10:24:26.297419	2016-12-13 07:31:59.611215	210	\N	f	f
692	5	0	0		2016-11-07 10:24:26.140837	2016-12-13 07:31:59.625074	209	\N	f	f
729	2	0	0		2016-11-07 10:24:26.300311	2016-12-13 07:31:59.628313	209	\N	f	f
693	5	0	0		2016-11-07 10:24:26.144107	2016-12-13 07:31:59.642273	208	\N	f	f
730	2	0	0		2016-11-07 10:24:26.303238	2016-12-13 07:31:59.645381	208	\N	f	f
731	2	0	0		2016-11-07 10:24:26.306132	2016-12-13 07:31:59.660856	207	\N	f	f
695	5	0	0		2016-11-07 10:24:26.149815	2016-12-13 07:31:59.69674	206	\N	f	f
732	2	0	0		2016-11-07 10:24:26.309001	2016-12-13 07:31:59.700026	206	\N	f	f
696	5	0	0		2016-11-07 10:24:26.152534	2016-12-13 07:31:59.709827	205	\N	f	f
733	2	0	0		2016-11-07 10:24:26.31154	2016-12-13 07:31:59.712384	205	\N	f	f
697	5	0	0		2016-11-07 10:24:26.15502	2016-12-13 07:31:59.723831	204	\N	f	f
734	2	0	0		2016-11-07 10:24:26.314086	2016-12-13 07:31:59.726632	204	\N	f	f
698	5	0	0		2016-11-07 10:24:26.157425	2016-12-13 07:31:59.738348	203	\N	f	f
735	2	0	0		2016-11-07 10:24:26.316523	2016-12-13 07:31:59.740753	203	\N	f	f
699	5	0	0		2016-11-07 10:24:26.159822	2016-12-13 07:31:59.751409	202	\N	f	f
736	2	0	0		2016-11-07 10:24:26.319304	2016-12-13 07:31:59.754378	202	\N	f	f
700	5	0	0		2016-11-07 10:24:26.162388	2016-12-13 07:31:59.764279	201	\N	f	f
737	2	0	0		2016-11-07 10:24:26.321853	2016-12-13 07:31:59.767415	201	\N	f	f
701	5	0	0		2016-11-07 10:24:26.164721	2016-12-13 07:31:59.77684	200	\N	f	f
738	2	0	0		2016-11-07 10:24:26.324307	2016-12-13 07:31:59.779378	200	\N	f	f
702	5	0	0		2016-11-07 10:24:26.167027	2016-12-13 07:31:59.789817	199	\N	f	f
739	2	0	0		2016-11-07 10:24:26.32674	2016-12-13 07:31:59.792314	199	\N	f	f
703	5	0	0		2016-11-07 10:24:26.16943	2016-12-13 07:31:59.803015	198	\N	f	f
740	2	0	0		2016-11-07 10:24:26.329157	2016-12-13 07:31:59.805584	198	\N	f	f
704	5	0	0		2016-11-07 10:24:26.171847	2016-12-13 07:31:59.816044	197	\N	f	f
668	3	0	0		2016-11-07 10:24:26.004166	2016-12-13 07:31:59.825934	196	\N	f	f
705	5	0	0		2016-11-07 10:24:26.174314	2016-12-13 07:31:59.828967	196	\N	f	f
742	2	0	0		2016-11-07 10:24:26.334	2016-12-13 07:31:59.832431	196	\N	f	f
669	3	0	0		2016-11-07 10:24:26.006675	2016-12-13 07:31:59.839398	195	\N	f	f
706	5	0	0		2016-11-07 10:24:26.176758	2016-12-13 07:31:59.841887	195	\N	f	f
743	2	0	0		2016-11-07 10:24:26.336416	2016-12-13 07:31:59.84459	195	\N	f	f
670	3	0	0		2016-11-07 10:24:26.009001	2016-12-13 07:31:59.85272	194	\N	f	f
707	5	0	0		2016-11-07 10:24:26.179196	2016-12-13 07:31:59.855407	194	\N	f	f
744	2	0	0		2016-11-07 10:24:26.338922	2016-12-13 07:31:59.858031	194	\N	f	f
671	3	0	0		2016-11-07 10:24:26.011399	2016-12-13 07:31:59.865678	193	\N	f	f
708	5	0	0		2016-11-07 10:24:26.181585	2016-12-13 07:31:59.868508	193	\N	f	f
745	2	0	0		2016-11-07 10:24:26.341425	2016-12-13 07:31:59.871053	193	\N	f	f
672	3	0	0		2016-11-07 10:24:26.013788	2016-12-13 07:31:59.877866	192	\N	f	f
709	5	0	0		2016-11-07 10:24:26.184032	2016-12-13 07:31:59.881222	192	\N	f	f
746	2	0	0		2016-11-07 10:24:26.343993	2016-12-13 07:31:59.884577	192	\N	f	f
673	3	0	0		2016-11-07 10:24:26.018642	2016-12-13 07:31:59.89163	191	\N	f	f
710	5	0	0		2016-11-07 10:24:26.186362	2016-12-13 07:31:59.894652	191	\N	f	f
747	2	0	0		2016-11-07 10:24:26.346626	2016-12-13 07:31:59.898078	191	\N	f	f
674	3	0	0		2016-11-07 10:24:26.021649	2016-12-13 07:31:59.905834	190	\N	f	f
711	5	0	0		2016-11-07 10:24:26.188747	2016-12-13 07:31:59.908489	190	\N	f	f
675	3	0	0		2016-11-07 10:24:26.024183	2016-12-13 07:31:59.919914	189	\N	f	f
712	5	0	0		2016-11-07 10:24:26.191134	2016-12-13 07:31:59.92235	189	\N	f	f
749	2	0	0		2016-11-07 10:24:26.354469	2016-12-13 07:31:59.92594	189	\N	f	f
676	3	0	0		2016-11-07 10:24:26.028227	2016-12-13 07:31:59.934876	188	\N	f	f
713	5	0	0		2016-11-07 10:24:26.193721	2016-12-13 07:31:59.937589	188	\N	f	f
750	2	0	0		2016-11-07 10:24:26.357323	2016-12-13 07:31:59.940098	188	\N	f	f
677	3	0	0		2016-11-07 10:24:26.031306	2016-12-13 07:31:59.951428	187	\N	f	f
714	5	0	0		2016-11-07 10:24:26.196455	2016-12-13 07:31:59.954122	187	\N	f	f
751	2	0	0		2016-11-07 10:24:26.361453	2016-12-13 07:31:59.956956	187	\N	f	f
678	3	0	0		2016-11-07 10:24:26.033929	2016-12-13 07:31:59.966479	186	\N	f	f
715	5	0	0		2016-11-07 10:24:26.199	2016-12-13 07:31:59.970007	186	\N	f	f
752	2	0	0		2016-11-07 10:24:26.364156	2016-12-13 07:31:59.97298	186	\N	f	f
679	3	0	0		2016-11-07 10:24:26.036441	2016-12-13 07:31:59.982356	185	\N	f	f
716	5	0	0		2016-11-07 10:24:26.201411	2016-12-13 07:31:59.985357	185	\N	f	f
753	2	0	0		2016-11-07 10:24:26.367332	2016-12-13 07:31:59.988112	185	\N	f	f
680	3	0	0		2016-11-07 10:24:26.03884	2016-12-13 07:31:59.995836	184	\N	f	f
717	5	0	0		2016-11-07 10:24:26.203787	2016-12-13 07:31:59.999956	184	\N	f	f
754	2	0	0		2016-11-07 10:24:26.370691	2016-12-13 07:32:00.002752	184	\N	f	f
681	3	0	0		2016-11-07 10:24:26.041291	2016-12-13 07:32:00.011857	183	\N	f	f
718	5	0	0		2016-11-07 10:24:26.206303	2016-12-13 07:32:00.015979	183	\N	f	f
682	3	0	0		2016-11-07 10:24:26.043735	2016-12-13 07:32:00.025688	182	\N	f	f
719	5	0	0		2016-11-07 10:24:26.20894	2016-12-13 07:32:00.029014	182	\N	f	f
756	2	0	0		2016-11-07 10:24:26.376246	2016-12-13 07:32:00.03216	182	\N	f	f
683	3	0	0		2016-11-07 10:24:26.046413	2016-12-13 07:32:00.039201	181	\N	f	f
720	5	0	0		2016-11-07 10:24:26.211476	2016-12-13 07:32:00.041712	181	\N	f	f
757	2	0	0		2016-11-07 10:24:26.378826	2016-12-13 07:32:00.044374	181	\N	f	f
684	3	0	0		2016-11-07 10:24:26.051794	2016-12-13 07:32:00.051839	180	\N	f	f
721	5	0	0		2016-11-07 10:24:26.213938	2016-12-13 07:32:00.05486	180	\N	f	f
758	2	0	0		2016-11-07 10:24:26.381389	2016-12-13 07:32:00.057623	180	\N	f	f
685	3	0	0		2016-11-07 10:24:26.054799	2016-12-13 07:32:00.064986	179	\N	f	f
722	5	0	0		2016-11-07 10:24:26.216907	2016-12-13 07:32:00.067379	179	\N	f	f
759	2	0	0		2016-11-07 10:24:26.383991	2016-12-13 07:32:00.070191	179	\N	f	f
686	3	0	0		2016-11-07 10:24:26.057477	2016-12-13 07:32:00.07729	178	\N	f	f
723	5	0	0		2016-11-07 10:24:26.221718	2016-12-13 07:32:00.080256	178	\N	f	f
760	2	0	0		2016-11-07 10:24:26.38663	2016-12-13 07:32:00.082781	178	\N	f	f
687	3	0	0		2016-11-07 10:24:26.061479	2016-12-13 07:32:00.089761	177	\N	f	f
724	5	0	0		2016-11-07 10:24:26.225211	2016-12-13 07:32:00.092826	177	\N	f	f
761	2	0	0		2016-11-07 10:24:26.38915	2016-12-13 07:32:00.095732	177	\N	f	f
688	3	0	0		2016-11-07 10:24:26.064572	2016-12-13 07:32:00.103236	176	\N	f	f
725	5	0	0		2016-11-07 10:24:26.228453	2016-12-13 07:32:00.105782	176	\N	f	f
689	3	0	0		2016-11-07 10:24:26.067083	2016-12-13 07:32:00.115752	175	\N	f	f
726	5	0	0		2016-11-07 10:24:26.231224	2016-12-13 07:32:00.118475	175	\N	f	f
763	2	0	0		2016-11-07 10:24:26.394299	2016-12-13 07:32:00.121437	175	\N	f	f
690	3	0	0		2016-11-07 10:24:26.069572	2016-12-13 07:32:00.129619	174	\N	f	f
727	5	0	0		2016-11-07 10:24:26.233791	2016-12-13 07:32:00.132622	174	\N	f	f
764	2	0	0		2016-11-07 10:24:26.396889	2016-12-13 07:32:00.135724	174	\N	f	f
617	1	0	0		2016-11-07 10:24:25.813633	2016-12-13 07:31:59.582751	210	\N	f	f
691	5	0	0		2016-11-07 10:24:26.137513	2016-12-13 07:31:59.607255	210	\N	f	f
694	5	0	0		2016-11-07 10:24:26.146939	2016-12-13 07:31:59.657959	207	\N	f	f
659	3	0	0		2016-11-07 10:24:25.982188	2016-12-13 07:31:59.70719	205	\N	f	f
741	2	0	0		2016-11-07 10:24:26.33165	2016-12-13 07:31:59.818637	197	\N	f	f
635	1	0	0		2016-11-07 10:24:25.864933	2016-12-13 07:31:59.875189	192	\N	f	f
748	2	0	0		2016-11-07 10:24:26.349277	2016-12-13 07:31:59.911987	190	\N	f	f
755	2	0	0		2016-11-07 10:24:26.37333	2016-12-13 07:32:00.018527	183	\N	f	f
762	2	0	0		2016-11-07 10:24:26.391573	2016-12-13 07:32:00.108251	176	\N	f	f
769	1	0	0		2017-01-28 11:07:04.238706	2017-01-28 11:07:04.238706	542	\N	t	f
770	3	0	0		2017-01-28 11:07:04.248237	2017-01-28 11:07:04.248237	542	\N	t	f
771	5	0	0		2017-01-28 11:07:04.276904	2017-01-28 11:07:04.276904	542	\N	t	f
772	2	0	0		2017-01-28 11:07:04.28039	2017-01-28 11:07:04.28039	542	\N	t	f
766	3	75	79	3.5	2017-01-28 10:27:43.138622	2017-01-29 10:35:51.285536	541	77	t	t
768	2	85	75	4	2017-01-28 10:27:43.144355	2017-01-29 10:18:50.563249	541	80	t	t
118	1	80	85	4	2016-10-29 02:24:22.795304	2017-01-29 10:23:41.530567	488	82.5	t	t
767	5	89	82	4	2017-01-28 10:27:43.14148	2017-01-29 10:29:48.674319	541	85.5	t	t
776	8	90	70	4	2017-01-29 10:50:30.37246	2017-01-29 10:51:20.829376	531	80	t	t
765	1	80	80	4	2017-01-28 10:27:43.132557	2017-01-29 11:54:30.12221	541	80	t	t
774	7	85	92	4	2017-01-29 10:50:30.364798	2017-01-29 10:51:20.885645	531	88.5	t	t
\.


--
-- Name: student_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('student_subjects_id_seq', 776, true);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

COPY students (id, first_name, last_name, gpa, created_at, updated_at, iden_number, code_number, room_state, blood, birthdate, address, call, zip_code, ability, nationality, ethnicity, district, parish, city, prefix, delete_status, username, password_digest) FROM stdin;
215	ฉัตรอนันท์  	ใจทัน	\N	2016-07-20 14:20:11.620062	2016-09-04 10:50:53.946916	\N	259036	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259036	$2a$10$AEHWygzIzVoThRqy2GZZXewH9vpU.aicAgYIn4CNZjhRdTu.ZunC.
217	ชยภัค	นิลจันทร์	\N	2016-07-20 14:20:11.625491	2016-09-04 10:50:54.100462	\N	259068	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259068	$2a$10$WeW0XLtK.YJIkQipgoD6ueA20xo2rmqiHYGgtqrQNsn.MjmOwqz6e
219	เดเมียน	เอสทิมา	\N	2016-07-20 14:20:11.631247	2016-09-04 10:50:54.248963	\N	259039	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259039	$2a$10$/3xyBd3U.xITf2sOlODpA.zsexRQmbocZk.YZxaZQL6OZkN/AV1Ha
220	ธนดล  	ก้องภักดีสุข	\N	2016-07-20 14:20:11.633677	2016-09-04 10:50:54.323562	\N	259040	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259040	$2a$10$a60nXD4IonUfmyD7rFc2fuenTkvMCgEmJ5mnDNuL0I6zBYhrMIDHe
223	ปพน	ศักดิ์อิสระพงศ์	\N	2016-07-20 14:20:11.64082	2016-09-04 10:50:54.479474	\N	259044	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259044	$2a$10$5y07Ab3tlc9VabmviJn3j.CpKtWmHSkXzgvucGSsWRR2zUwcLpV2y
224	พระพาย  	เจริญฉาย	\N	2016-07-20 14:20:11.643889	2016-09-04 10:50:54.565721	\N	259045	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259045	$2a$10$jF7MqoGVizv.xVT6VHKAc.32M3pW3drqfQnN2djDXhPOG9RrH5jAG
226	รัชชต	จินดาสอน	\N	2016-07-20 14:20:11.648807	2016-09-04 10:50:54.719745	\N	259047	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259047	$2a$10$KydHomiyTkrp.peTMzgAZ.AFicqCwAu7Z4/.Xpyf21OVqGLmSiaxu
228	วราภัทร	รอบคอบ	\N	2016-07-20 14:20:11.653395	2016-09-04 10:50:54.876978	\N	259049	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259049	$2a$10$fZ50YHz.JWU6jxksbY3itOf9k1tAShtiKfnBDhDItBCNlSGmY8ql.
229	ศุภณัฐ	ปั้นสุวรรณ	\N	2016-07-20 14:20:11.655658	2016-09-04 10:50:54.966372	\N	259050	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259050	$2a$10$ci4DktMw35PRf1c5tVgVgufprUxIN1ZcEvFfI.nWNFSRDPOuNrHhi
231	อภิชยา	ดอกกลอย	\N	2016-07-20 14:20:11.661014	2016-09-04 10:50:55.136014	\N	259071	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259071	$2a$10$hg9pA6fvpVYhpyX3eXwjFOw0ThVCN3kxonhcuza4hAnAOIdJmReuG
233	ขวัญนภัช  	ธนรักษ์	\N	2016-07-20 14:20:11.666608	2016-09-04 10:50:55.303992	\N	259054	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259054	$2a$10$OGcNzQnfUY82CodxsXEHu.99aH/bmCM2kF0gNFK0h2T65yzt.kZje
234	จิภูสินี  	ภูมี	\N	2016-07-20 14:20:11.669125	2016-09-04 10:50:55.388534	\N	259055	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259055	$2a$10$wR4zQr.pO694PT0raHx2d.xzRsZ3nmC/gaCt.GnnWHVXvU.nHN9Kq
236	ฐิติมา  	สุพรส	\N	2016-07-20 14:20:11.673765	2016-09-04 10:50:55.563958	\N	259057	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259057	$2a$10$Gjm1SOgyKIXvO8dB5HWQ/u9F4VbU5KYJ91ILVwtatsr9EbK5d1Lry
237	ณัฏฐณิชา	ยู่กี่	\N	2016-07-20 14:20:11.676666	2016-09-04 10:50:55.649992	\N	259067	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259067	$2a$10$UUrIbaMEi3t1zkEqvJagpu98tqmltFrkeC9bIbLk7hmXXXn2d.xlW
239	นนลณี  	ดอนสุวรรณ	\N	2016-07-20 14:20:11.682462	2016-09-04 10:50:55.818718	\N	259060	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259060	$2a$10$N3IMbcX.a5Adw5l0n0aEK.45FccljoGmvObGqxGlRV2/7W9T/TFNa
241	ปัญยพัชร์  	ศรมยุรา	\N	2016-07-20 14:20:11.687238	2016-09-04 10:50:55.985887	\N	259062	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259062	$2a$10$cAsiuMcZC.55Jf/WuyGa8.TlLNwK7tKgCDwJxUnlqZuUuLFZMetg2
242	พิชญ์สินี  	ซุน	\N	2016-07-20 14:20:11.68966	2016-09-04 10:50:56.075122	\N	259063	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259063	$2a$10$zZP.UoQTV344ue/mAyv3Iet0WJwO/oxF7DjieyEeDfOssBPiPyXdW
183	จิณณะ  	อังสุวรรณ	\N	2016-07-20 13:48:41.614226	2016-09-04 10:50:56.416905	\N	259005	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259005	$2a$10$UaHpcQuFJbSxeyoqDvXAMuYKiPFCbwWm21MfG2oue5ZIKqWOL0N26
184	จิรโรจน์	ธนโชติชัยวัฒน์	\N	2016-07-20 13:48:41.617457	2016-09-04 10:50:56.500269	\N	259006	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259006	$2a$10$dLDN5UiIiP3L7ppcOnxA8eL25h0pJ2FFdCSMi/Ae.cJsQmshPGxNi
186	เต็มถ์ธรรม  	สถิตย์	\N	2016-07-20 13:48:41.63053	2016-09-04 10:50:56.667698	\N	259008	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259008	$2a$10$5f5ZJG7l0qs34iCGfajzjuKjZl9EX.ylhmt.0LJQ/QpNE/FzLIvpG
188	นันทวัฒน์	ปฐมชัยอัมพร	\N	2016-07-20 13:48:41.637989	2016-09-04 10:50:56.838821	\N	259069	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259069	$2a$10$st2dm2b2CvyIfAypmhNVJeVZ7Ql9N3AIrtXZzOOmCIVNsdTWzIecu
189	พงศ์พล   	ตั้งปริมณฑล	\N	2016-07-20 13:48:41.641486	2016-09-04 10:50:56.924143	\N	259010	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259010	$2a$10$r/BUOtOLfkH3fePnUm/PwumN/PT.3qbr0YmlpdofqmwMhiaI5/4W6
191	ภานพ	เทียมเมธา	\N	2016-07-20 13:48:41.648064	2016-09-04 10:50:57.09925	\N	259012	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259012	$2a$10$NLPisRaMAY1MT.wdq0mP3ek1gyfpsbc9/pKD7aJ9oA2fmiqmZ/E/u
192	ภูดิศ	ไกรฤกษ์	\N	2016-07-20 13:48:41.654779	2016-09-04 10:50:57.185378	\N	259013	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259013	$2a$10$7b.vlBB6BuvmO.4WBTt2b.EYIg02sNpaCgdD7X3YInCZXjMYfk21e
194	วชิรวิทย์  	สมถวิล	\N	2016-07-20 13:48:41.665188	2016-09-04 10:50:57.354811	\N	259015	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259015	$2a$10$kJAHDI9qbI.vkoEm5MFwSui.Makv86UpHrGsZipXLBLySQSmWHBCK
195	วุฒิภัทร  	ฉายศรีศิริ	\N	2016-07-20 13:48:41.675175	2016-09-04 10:50:57.439227	\N	259016	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259016	$2a$10$1BhGXkyXorN.2s7jJxa0huGwbbiA7.sYeG.84B5pzst4e1UR0ruWK
197	อาชวิน	เทพไชย	\N	2016-07-20 13:48:41.691022	2016-09-04 10:50:57.611178	\N	259018	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259018	$2a$10$1dllk1VfYXjrtQ6KqwiuoeGEYnqppI0u.6CgYixOaI43fLLw5/fla
199	กวินตรา	สุขภูศรี	\N	2016-07-20 13:48:41.700866	2016-09-04 10:50:57.786408	\N	259020	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259020	$2a$10$BeTEig.do1NBZ3Oy1CWLFe5QTkkViUl15ZKBajmb43dP0QA6EzBVi
200	กัญจน์นิกข์	เพ็ชรละออ	\N	2016-07-20 13:48:41.704045	2016-09-04 10:50:57.871246	\N	259021	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259021	$2a$10$XNQG4off2Hb6eVpRsm.74uNmFHMBIOxZG0WeW1lI1QEtQQTHyHzbu
202	ชญากานต์	ชำนาญกิจ	\N	2016-07-20 13:48:41.716297	2016-09-04 10:50:58.041784	\N	259023	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259023	$2a$10$rgtllzsLNlCPapKi5r.5d.g27vwiy4W6x1Zku3f7sOsxCxETDIAc2
204	ณัฐวีร์  	เจียรสมจิตร	\N	2016-07-20 13:48:41.722719	2016-09-04 10:50:58.218388	\N	259025	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259025	$2a$10$3va3dYkupPEZ4mK0vUdSfOjJMgHwsGq2FkDeOWXaOoT3k2quF.53K
205	นรกมล	ชาวเฉียง	\N	2016-07-20 13:48:41.725909	2016-09-04 10:50:58.301293	\N	259070	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259070	$2a$10$US7GOxpcNln.nt2fo4p.jugZ75tlPD.8FJQBPzJGl8Ieu.4T29tiK
207	นิติภา  	วัยนิพิฐพงษ์	\N	2016-07-20 13:48:41.732524	2016-09-04 10:50:58.477448	\N	259027	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259027	$2a$10$2JtfRV3KMeZgdnzS5GoxXe166Dk0z2M71U2M0jMRe5F3R/4koLE1q
209	พริมตา  	ตั้งไพบูลย์	\N	2016-07-20 13:48:41.740376	2016-09-04 10:50:58.664772	\N	259030	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259030	$2a$10$sD81vTA6S9D.YCidH7lajuWnv0JljGVgu4.EZwYEE14xBJg1OSQia
210	ภคมน  	สหฤทานันท์	\N	2016-07-20 13:48:41.745455	2016-09-04 10:50:58.757719	\N	259031	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259031	$2a$10$ULowW3pgI1c58cG3ouEH1unnihvLNcDNR76bwm1ZgQUNLJPZqFhW.
212	สุทัตตา	ปฐมพีรกุล	\N	2016-07-20 13:48:41.753398	2016-09-04 10:50:58.927808	\N	259033	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259033	$2a$10$7n6IHWhPDtxtJdKV/bW3ZehwzvZV2ZWGSr7F5etIgYYfa1GvWnwYa
213	กรวิชญ์  	บุญรอด	\N	2016-07-20 14:20:11.599471	2016-09-04 10:50:59.01856	\N	259034	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259034	$2a$10$h8j8t3W5DpsHkzwPqnIe.u7pFF9vmUrhfXm.w7y3ZNLK3cpcgChOK
243	เพียรนารา	ปลาตะเพียนทอง	\N	2016-07-20 14:20:11.69229	2016-09-04 10:50:59.187124	\N	259064	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259064	$2a$10$Lo5yH6aYVgIiH71bzu.L2uk9tR1TWKFukedohEXTAeq8CtV6OtjSu
244	ภคพร	ศรีอ่อนรอด	\N	2016-07-20 14:20:11.695557	2016-09-04 10:50:59.27408	\N	259065	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259065	$2a$10$nGawaqlHaiYpwKWfp01Fv.MXYEbNvL/6jDyi6F2LZU7XRvFpqI9k2
246	ลภัสรดา	ท่าทราย	\N	2016-07-20 14:20:11.700484	2016-09-04 10:50:59.439985	\N	259072	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259072	$2a$10$mrZZeqvk6Uc/88buUXui5erLQQtX2LBz8i8uwOyNC8.CU7efstfLq
609	นันทิพัฒน์ๆ	พลบดี	\N	2017-02-06 06:12:33.2299	2017-02-06 06:12:33.2299	1717171717171	224	\N		\N										เด็กชาย	\N	224	$2a$10$GNe9h0F.521YWaiwwO3mau.fN/JrJpF0Ak.zR4Ysh4bBY17OI1z9e
249	วรภพ       	ศรีกิจวรการ	\N	2016-07-20 14:20:51.626877	2016-09-04 10:50:59.697689	\N	258002	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258002	$2a$10$QlqnOdWF.0CFWru3HE9oiegfZuUiSvVAZ1IKttdinfNibpg1YxH2.
250	คุณัชญ์	แสงนนท์	\N	2016-07-20 14:20:51.630084	2016-09-04 10:50:59.785254	\N	258003	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258003	$2a$10$dGSL4Y80zVjCUFOPG8jAj.w5jiKgwQDNRYI5nR4cFVeMQMrkNANI.
252	ณัฏฐพัชร์	เกียรติกสิกร	\N	2016-07-20 14:20:51.63581	2016-09-04 10:50:59.953248	\N	258005	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258005	$2a$10$n9QSfbDjn37XWmoRmms0TOgigCPCQu4ejMrfvf7AhVu6iSdKMh7z2
253	ธนภัทร     	ถิ่นประชา	\N	2016-07-20 14:20:51.638881	2016-09-04 10:51:00.035124	\N	258006	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258006	$2a$10$amGXVoWO9orpZ.eSBWVuyekdyVigmW5SKASr7zuJaL1zfFZxqYgN6
255	นพัศ	อลงกรณ์รัศมี	\N	2016-07-20 14:20:51.64476	2016-09-04 10:51:00.203884	\N	258008	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258008	$2a$10$9GZYHKQQkyD44O8xCZi8h.RjrRJa8ApgTEi9.mfn/IQhmNIqcjtOy
257	ภาม                	อุมาลี	\N	2016-07-20 14:20:51.650516	2016-09-04 10:51:00.374167	\N	258011	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258011	$2a$10$jlBenOsXJdb/g68A.W9plOktCcFSQK7C/jkUWX.NC/PBx3nyowFMy
258	ภาสวิชญ์	ฐิติถาวรวงศ์	\N	2016-07-20 14:20:51.653207	2016-09-04 10:51:00.459341	\N	258012	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258012	$2a$10$8NY21MXc3ykMQ5GlsVNmB.3rZScWMO2ZKUSh4UUfFv18tGVH8dJ6i
260	วชรภูมิ	ธรณิศร	\N	2016-07-20 14:20:51.658618	2016-09-04 10:51:00.623005	\N	258074	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258074	$2a$10$htCi5P4QhJ9ZNZl8cC5vE.jZogq/f7w9/eDX3VQRlDQEaFeYVhCau
261	อชิระ	ก้อนคำใหญ่	\N	2016-07-20 14:20:51.661506	2016-09-04 10:51:00.706252	\N	258014	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258014	$2a$10$6Y1Z3.7Pa128h/i1MG3epeien5bRKF3wUNXbsK6/ab192QjMICqFa
263	อินทัช	อินเทพ	\N	2016-07-20 14:20:51.667133	2016-09-04 10:51:00.872493	\N	258016	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258016	$2a$10$WB9CuHaFeEqYO8LNhbB4ROw2wnruK2f5kAu1xDazK6iSMlCPpBnVa
265	กัญญาภัค      	อาจณรงค์ฤทธิ์	\N	2016-07-20 14:20:51.672585	2016-09-04 10:51:01.038349	\N	258018	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258018	$2a$10$zoRzH/gYlrgpswWS7b67Au7Fq8he.DrCywqhxyk0/ohGeGUvGsr2G
266	กันต์ณัฐฐา	ตั้งปริมณฑล	\N	2016-07-20 14:20:51.675401	2016-09-04 10:51:01.120635	\N	258019	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258019	$2a$10$KW7SClkcBK7dW6IUIuDQ5ee7ex8u7LgfcbBJCBmQHGMP2qxvBP4Oa
268	ณัฐจรี              	ถิรพร	\N	2016-07-20 14:20:51.681122	2016-09-04 10:51:01.283389	\N	258022	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258022	$2a$10$QWJK0CobLCSH1CYfv4k5ouTnyfmvvxwbH1RzAXGhAklm181A/XRtO
270	นันทวดี	ตั้งธนาธรทิพย์	\N	2016-07-20 14:20:51.68659	2016-09-04 10:51:01.454692	\N	258024	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258024	$2a$10$QxjvX3gsW8u6Bd6FuLMqV.6Vys47q63GTf5Pf.NjGiMaVLK9h7.bm
271	บัวชมพู	เกิดสำอางค์	\N	2016-07-20 14:20:51.690422	2016-09-04 10:51:01.538776	\N	258025	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258025	$2a$10$uSGhq/ZCBIqVMqkrjn0BRO/M0.yakbu7gelyM3Xzr5XjRMGfDE04q
273	พัสตราภรณ์	แพรอัตถ์	\N	2016-07-20 14:20:51.696129	2016-09-04 10:51:01.711213	\N	258027	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258027	$2a$10$IFX1DC58cTTRhFYl5Qt3juU6M11OFh7ssln69DkiHsBJ.B2FbYksO
275	พีระณัฏฐ์	ทรัพย์เย็น	\N	2016-07-20 14:20:51.701938	2016-09-04 10:51:01.886005	\N	258071	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258071	$2a$10$unyzv/pfXtHDWnK.f7/5guG4FystscvhbOqKuOwsXOspb.oUSU0DC
276	ภัทรมน	อรุณศิริวัฒน์	\N	2016-07-20 14:20:51.704819	2016-09-04 10:51:01.970628	\N	258029	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258029	$2a$10$Un3Pu0FYlqHaSV4A0gVDUO9oNXgasrFYl3G57nCHs2pF7BFCMshtq
278	ลลินทร์	อมรรัตนไพจิตร	\N	2016-07-20 14:20:51.710449	2016-09-04 10:51:02.137395	\N	258068	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258068	$2a$10$beh/0a4ufGL0pekI85z04O934SEeTw03qlm4UXqK3RIIH4/1sKSt2
279	ศิตางค์	โอภาสปกรณ์กิจ	\N	2016-07-20 14:20:51.713225	2016-09-04 10:51:02.216642	\N	258031	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258031	$2a$10$atd3zKVQg6sws8xgr2acFO1WPa5.CF5KNumZBizfh1aDvtmkQcTGS
281	สิรินดา            	หิรัญญสุทธิ์	\N	2016-07-20 14:20:51.71893	2016-09-04 10:51:02.384363	\N	258034	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258034	$2a$10$Uc8yClO7FSUgBCvjYccgCeRKnlKRfvjRoys/1jlbIue9n9N/maXEO
283	อิสระ	ช่างเสนาะ	\N	2016-07-20 14:20:51.724972	2016-09-04 10:51:02.55528	\N	258082	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258082	$2a$10$l0PllwApi2NIhdxmM/F8JePkNtwpY1UcAHA03L7FS8T1GhNT.PwuC
285	กรวิชญ์	นันทานิช	\N	2016-07-20 14:21:06.498099	2016-09-04 10:51:02.67224	\N	258036	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258036	$2a$10$lhESbi8rYlFDjLOUoJQNUehf1srhaQii.ka6VV515wS9raQpcGRUC
287	กฤษธเนศ         	ศิลปงาม	\N	2016-07-20 14:21:06.504695	2016-09-04 10:51:02.841647	\N	258038	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258038	$2a$10$yg3sK0jypPeIv6KAsavE1OpjE6MHCpCA.f54Q0bUdt/HlYrf3Vjwe
289	ชยพล  	เส็งสาย	\N	2016-07-20 14:21:06.516081	2016-09-04 10:51:03.012837	\N	258040	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258040	$2a$10$s5MjG1QUc0jHfWVONvj2FeglKpz8mKZ7aS1q3W1/WfgGyWQENKmsW
290	ณกฤศ	ดำรงกิจถาวร	\N	2016-07-20 14:21:06.520454	2016-09-04 10:51:03.096378	\N	258041	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258041	$2a$10$wYtD0lC00dmr8L0NErl.Wu6C/biCoFZob9zIlZC8vd9gsvIK1DZPu
292	ศิรวัฒน์	ธนะกิจรุ่งเรือง	\N	2016-07-20 14:21:06.528627	2016-09-04 10:51:03.271766	\N	258043	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258043	$2a$10$tdMGwbh0DQFqQrImAvEbfum6hxISyKnrnGM/Vc6dZffN282h4jE42
294	นิพิฐพนธ์	ก้องภักดีสุข	\N	2016-07-20 14:21:06.536265	2016-09-04 10:51:03.442616	\N	258045	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258045	$2a$10$f1qtQqf8/.rBV90De0YG7OspO8Rn0AFgXJbvu120w3HY5kXwM3KmO
295	ปรัตถกร	มณีประเสริฐ	\N	2016-07-20 14:21:06.546728	2016-09-04 10:51:03.525113	\N	258046	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258046	$2a$10$ldBpGRc6vEz/8kZ3lO0Jwu4Rvl2A0jhxt9NqzqCa0JyMkP7ewvboa
297	พัฒนพงศ	ศักดิ์ศรีสกุล	\N	2016-07-20 14:21:06.552406	2016-09-04 10:51:03.692426	\N	258075	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258075	$2a$10$2x/t0EsdTlqdnwy.3YOgX.xjc243EpGFFmyhgxSlZiZBo5ngyeocS
298	สัณฑราช	สุทธิวงษ์	\N	2016-07-20 14:21:06.561482	2016-09-04 10:51:03.796047	\N	258049	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258049	$2a$10$StZV3xegL0V2c2UwwWVvo.RdckIQUs869SN2JKdS3qvUGzEW8I.ZK
300	อติวัตติ์	กริตตานุกูล	\N	2016-07-20 14:21:06.576169	2016-09-04 10:51:04.084027	\N	258072	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258072	$2a$10$rqZ14DUtJ9OCcbhBvm2F1eF60uK8xmhy6spoLDk8FvCWBbGJSRgNG
302	ชนิชา 	งามเกียรติขจร	\N	2016-07-20 14:21:06.587979	2016-09-04 10:51:04.382453	\N	258053	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258053	$2a$10$W7TXz4nqQPH2hZ/aBIxL1OlSg4mnvBGj/pAdK00oEM0tOxQlM2LaC
303	ชนิตว์นันท์	ขุมทรัพย์	\N	2016-07-20 14:21:06.591096	2016-09-04 10:51:04.506647	\N	258069	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258069	$2a$10$V15WYopDnFmQe39be1cjQOSNNbDcv3NcJ41CL.8Xp7Jf5ykyU1GaC
284	กตัญญู              	พรเจริญกิจกุล	\N	2016-07-20 14:21:06.486312	2016-09-04 10:51:04.735642	\N	258035	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258035	$2a$10$x8LASn9DyKGYdO7CZEE3R.bjckgO5D1MwhufftdmAp6iaec3Qam96
306	ดวงภรณ์	มงคลสุรวาณิชย์	\N	2016-07-20 14:21:06.606698	2016-09-04 10:51:04.934935	\N	258056	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258056	$2a$10$go9ybv3G63FuuFXTkpI54OKUXDX7nk8jBGKq1FRM5dFHhdz1h9x86
307	ธนัชชา	ฐานวัฒน์	\N	2016-07-20 14:21:06.609782	2016-09-04 10:51:05.028685	\N	258057	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258057	$2a$10$K9BzMqaGHVLbSkdn1T.95.DnSCnuN8CTzEnOvNfLNKNxcxHKwSW5m
309	ปารัช             	ภัทรไชยอนันท์	\N	2016-07-20 14:21:06.616663	2016-09-04 10:51:05.226269	\N	258059	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258059	$2a$10$3PMyo4ibn65oWkJpO4f3Jedz8R0DObYeW6BitQgrsD2G3c268QFEa
310	นภัสศรันยา	เฮงเส็ง	\N	2016-07-20 14:21:06.61969	2016-09-04 10:51:05.314065	\N	258070	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258070	$2a$10$9/.r2G9Fd5Pa5HE.BoYNqOJlkHAEk7hYScjwPqmf9a8wB31t3xEaK
181	คีรีภาร์กร  	ทองนพรัตน์	\N	2016-07-20 13:48:41.606793	2016-10-08 17:28:59.370593	31232131231	259003	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259003	$2a$10$iM11E70gJkS0658eRVffVOpiI.10zL.Rluhj7CF6Ctf8vWgBLbxh.
314	แพรววนิต	เลิศโอภาส	\N	2016-07-20 14:21:06.640541	2016-09-04 10:51:05.671346	\N	258062	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258062	$2a$10$VEBXcLo4bR5GqHjWzUGoGOCFBZXvfICVjmbAIrK4FROrK6Z0we5gm
315	ภัททากร	อรุณศิริวัฒน์	\N	2016-07-20 14:21:06.644244	2016-09-04 10:51:05.759958	\N	258063	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258063	$2a$10$IP.53GnCgxWYwAQfa6GpH.QaeA378JiL6By7iwbwmrcBEnhPyQ6We
317	สุประวีณ์	ตั้งนิธินันท์	\N	2016-07-20 14:21:06.653973	2016-09-04 10:51:05.935024	\N	258066	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258066	$2a$10$b9b43tZz9BxJl6/rbbq0h.6AzQZrS2siO5hl3n1kAMomoMrlIaoGa
319	โสภิดา	สุพานิช	\N	2016-07-20 14:21:06.659954	2016-09-04 10:51:06.106451	\N	258084	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258084	$2a$10$uo77jUul8A4L8E40JQ94nuCb/pS5CwX5utrxypTOiVwqmh3aku166
320	ปองคุณ	อดุลยธรรม	\N	2016-07-20 14:21:06.667081	2016-09-04 10:51:06.194237	\N	258083	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258083	$2a$10$JlE5Q8cetO74FzIyA7Ol1OgXRHDThYp01VFy5eG14BhriBmbTTXp6
322	ชยพล        	ชื่นชม	\N	2016-07-20 14:21:14.061512	2016-09-04 10:51:06.366745	\N	257002	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257002	$2a$10$34z0YYh/HdY6DQ.zjDJKtucGq2Xvqz.mGSIZaztFMQhtpa6f6LT5a
323	ณฏฐวรรษ   	 เจียรสมจิตร	\N	2016-07-20 14:21:14.064887	2016-09-04 10:51:06.454397	\N	257004	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257004	$2a$10$kEBx0hCHQmADf7g8.tm6uuLLapXOw26PVKABjbpYbkGHgk/1TULuu
325	พีรเดช       	สุทธหลวง	\N	2016-07-20 14:21:14.070579	2016-09-04 10:51:06.622776	\N	257006	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257006	$2a$10$Y5UjiF3XvRjgMTZo1jnfEuXOWEO3amaSjv1EDEOYt8KqMzW7HNSdK
327	พุฒิพงศ์    	 เจนโกศล	\N	2016-07-20 14:21:14.083812	2016-09-04 10:51:06.785884	\N	257008	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257008	$2a$10$EadaK99kI5evu/gXxFENT.V1PH4uoViGroxsGyxX8Z4RklKwFz86y
328	ภูมิพัฒน์      	เกียรติกสิกร	\N	2016-07-20 14:21:14.087168	2016-09-04 10:51:06.870528	\N	257009	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257009	$2a$10$Wi1mKX2KQC9PJ6DEPkI6.O3QoGT21Kv0I8s9iksy7zYEmoKFEVMBq
330	ยิ่งพันธ์      	ปัญญานนทวงศ์	\N	2016-07-20 14:21:14.103708	2016-09-04 10:51:07.054578	\N	257011	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257011	$2a$10$3m7d94X2I2DQclzw5sBLS.u2UzLqaCEh7kwjmwokIq5Y3g/b9ks9G
331	ศุกล          	อนุศาสนี	\N	2016-07-20 14:21:14.112032	2016-09-04 10:51:07.14344	\N	257012	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257012	$2a$10$piV1N5SBXaVnvwHBihtOJesGrjMm2nLYV3Bblq.j4CWeTg7qxDUbW
333	อรรถพล     	ตั้งธนาธรทิพย์	\N	2016-07-20 14:21:14.124451	2016-09-04 10:51:07.318613	\N	257015	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257015	$2a$10$ikRrcizNC8MU9szE8aziTuuuxV.tBTMivYAcwaSvStLmfSaJiEmqq
335	จิรัชญา        	ไหลธนานนท์	\N	2016-07-20 14:21:14.131245	2016-09-04 10:51:07.486714	\N	257017	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257017	$2a$10$GLzWmD4Mb/HaCnzOdwR3HOfRSp2CEZiwWM/UUcCZcghIMhGeMf6QW
336	ชญาภา       	 นาคสิเนหผล	\N	2016-07-20 14:21:14.133766	2016-09-04 10:51:07.572215	\N	257018	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257018	$2a$10$9q/Os2CGR/GDtgSpaa/cTeDb/7.85ndWzxPPHzkkP48t408GElyKy
338	ฐิติรัตน์         	 ศิลาคำ	\N	2016-07-20 14:21:14.140298	2016-09-04 10:51:07.741261	\N	257020	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257020	$2a$10$J3khcjKaq5oGrnTvkpWq6.gM2Aehr.61de2UCvJAxyab8tFEL87a6
340	ณัฐธยาน์          	 แจ้งจิตร	\N	2016-07-20 14:21:14.146814	2016-09-04 10:51:07.92338	\N	257022	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257022	$2a$10$bCegrRUzY/tpOxQviruv6eVXl3Oun3KKECck3EYf/ssoOs45ffRxa
341	นันท์ชญาน์    	ยิ้มสีใส	\N	2016-07-20 14:21:14.151612	2016-09-04 10:51:08.014875	\N	257023	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257023	$2a$10$X4BPDbGThhOcQCgpsa4Tlu0OcEtIyArE9w./BUrSO7inB4.rBs0.i
343	บุญฐิตา       	บูรณะอำมาตย์	\N	2016-07-20 14:21:14.161019	2016-09-04 10:51:08.200358	\N	257025	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257025	$2a$10$6VowExodiVgg9ZQMIVuR4.4JnePKf2tNXhwbeMXjlGVE9kwWyWRYu
344	ปริญญากร   	สุขจินดา	\N	2016-07-20 14:21:14.163804	2016-09-04 10:51:08.29228	\N	257026	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257026	$2a$10$Pr7YIl5.D2QHh7cxIkT33u0K9m4zcccpVT.ER2g97egF137GFIaja
346	พิชชาภา       	ตรองพาณิชย์	\N	2016-07-20 14:21:14.174988	2016-09-04 10:51:08.476739	\N	257028	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257028	$2a$10$EdEwS.ckwMAutBSldsngeOB8RR0vVcA63iab9mlcfX.F.V.RJeFze
347	รรรรรา        	 เจริญผล	\N	2016-07-20 14:21:14.177894	2016-09-04 10:51:08.568452	\N	257029	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257029	$2a$10$2LmLClAYFwnV2UBDi8FeTOtLm3lQdGI.RscYIF1tOI/yJegSd9bBq
349	วีรินท์          	 ศรีแดง	\N	2016-07-20 14:21:14.18358	2016-09-04 10:51:08.737086	\N	257031	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257031	$2a$10$I9ILQ6Ic76kxdgOiQ9SPdebajo.piojMZDd.8yCKnnTuDm.mWkGKu
351	อัฐภิญญา      	เลิศพิมลพันธ์	\N	2016-07-20 14:21:14.189471	2016-09-04 10:51:08.905257	\N	257033	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257033	$2a$10$VJSmPmlWlZYRF0cr33zuZus6YyfrRoRnACmzAs07dWR31OBXRS5Qy
352	อัปสรวาด       	วสันตกรณ์	\N	2016-07-20 14:21:14.192584	2016-09-04 10:51:08.989853	\N	257034	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257034	$2a$10$0U8x90gsTVB9BuZM2aR0Nejp17YywURQm0g/VAle/XYdjTbp1wPiS
354	เจษฎา	สุพานิช	\N	2016-07-20 14:21:14.201008	2016-09-04 10:51:09.160347	\N	258085	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258085	$2a$10$etfZu8XfquBz.o42eylmtOeEI0j8R08KwJneXzqmYog98m0XzHPR.
357	กันย์         	 เจนลาภวัฒนกุล	\N	2016-07-20 14:21:21.292978	2016-09-04 10:51:09.324323	\N	257036	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257036	$2a$10$ZM3j3HhsWv9j8hVwEiq0H.4AuEC32lUCdT7.8ZwEkQYYRFs7WTpFi
358	ธนภัทร       	จันทร์เกษม	\N	2016-07-20 14:21:21.296634	2016-09-04 10:51:09.413166	\N	257037	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257037	$2a$10$zGaGNG0WZruN6J4GokP7Ge10LVKjIKCSsazKoXu0ivzeq8AvQMS9O
360	ธนวินท์       	เที่ยวมาพบสุข	\N	2016-07-20 14:21:21.303997	2016-09-04 10:51:09.618893	\N	257039	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257039	$2a$10$swKd3Xx9n5t/0VnQgwhuluWsBGS393l/TUURRnZ/3HWbMH4PZCzhm
361	ปกรณ์        	ปุญญวานิช	\N	2016-07-20 14:21:21.309182	2016-09-04 10:51:09.711705	\N	257041	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257041	$2a$10$StO0CJkrbc0/2e.8pQx3n.B6rkh0Qe1ds5MUWarFZNCpSj7rzVLty
363	พิรัฐกรณ์     	คูณทอง	\N	2016-07-20 14:21:21.315908	2016-09-04 10:51:09.878554	\N	257043	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257043	$2a$10$aNnyoDEYP/ft2H.eOn88ye9dwrVYVBi4UzGKUmS2BVoMBaEXmaILy
365	วรันณ์ธร     	 ธิบดี	\N	2016-07-20 14:21:21.325424	2016-09-04 10:51:10.047554	\N	257045	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257045	$2a$10$.X8CPzYfEMWZf426YkJj3eeb542irdq7.mVmG.TL.DsKw/QFwA9x6
356	กฤษภาส     	ภัททิยกุล	\N	2016-07-20 14:21:21.281051	2016-09-04 10:51:10.132714	\N	257035	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257035	$2a$10$RsNA9SYpnE2JEtLQL1/AYO.WLloTD3DrTQs.Y7Uljan96cIo4Qz22
367	สหรัถ        	 ศิริธรรมขันติ	\N	2016-07-20 14:21:21.331955	2016-09-04 10:51:10.298907	\N	257047	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257047	$2a$10$zG3TQqRY1ESE0FRbhdZ6XOX45cLlBtB6AHE58VHQKsjOIeOBRKBCa
369	กมลชนก    	สืบสายเพ็ชร	\N	2016-07-20 14:21:21.338372	2016-09-04 10:51:10.455716	\N	257049	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257049	$2a$10$BOfrD2BaySKYOhuYvAE3i.aiAkp2ORhIU2kYpBC2jP/.URXcfIMrO
370	กรรณิกาณ์   	ปานรักษา	\N	2016-07-20 14:21:21.342135	2016-09-04 10:51:10.538803	\N	257050	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257050	$2a$10$MpBjoaEvLmbRiP9sYCbc/e25UpA6SidrUdgBQPJMcH1gyGXCxsk1q
372	ชาลิสา        	ลินกิตติ์	\N	2016-07-20 14:21:21.353695	2016-09-04 10:51:10.698198	\N	257052	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257052	$2a$10$gtPYCb6NyPBRpHXzdzj04OHS6.1..bDshhpdv6lU6ktYQpW6Yu9tW
373	ญาณินี       	 วรวงศ์	\N	2016-07-20 14:21:21.359236	2016-09-04 10:51:10.776775	\N	257053	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257053	$2a$10$UJtprffce4kbEOejJMHqduLw0sgaDEwzmxidxgK.lP.Txhbnb.ybq
375	ประภาพร     	จันทน์วิมล	\N	2016-07-20 14:21:21.365599	2016-09-04 10:51:10.933754	\N	257055	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257055	$2a$10$OjOH9xwZfS/s8bRKwxR0Ve89jokRyWlPHbO/N5AYV33.1qzDArn/W
378	พรนัชชา     	ตันธุวปฐม	\N	2016-07-20 14:21:21.377383	2016-09-04 10:51:11.201558	\N	257058	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257058	$2a$10$UUyZCFg2itQir2TyFO6X2ernnumlfhxLLlRUl.c5fonAiuNrXAHim
380	แพรวา       	 ปัญญาเลิศ	\N	2016-07-20 14:21:21.383143	2016-09-04 10:51:11.356625	\N	257060	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257060	$2a$10$rDn/A1s5/lWmvYSpwnEz4Os8Br6yOrlcBxujadcV8zzAmTGFYYfg2
382	ศิรภัสสร     	 เส็งเจริญ	\N	2016-07-20 14:21:21.394737	2016-09-04 10:51:11.50892	\N	257064	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257064	$2a$10$gEFj3AUW/BCJCyZypdJr3uzpZoDoB6/1fASNu0TxkFuc/1pKxT9GK
383	สิณิภา       	 บัวแสงจันทร์	\N	2016-07-20 14:21:21.397744	2016-09-04 10:51:11.596911	\N	257065	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257065	$2a$10$rnrqieYEouL99Dz2WdR9BeyxUEboIyywa6ldjzAV6tq2ZqCBVvE0m
385	อักษรวรรณ   	วสันตกรณ์	\N	2016-07-20 14:21:21.40584	2016-09-04 10:51:11.753516	\N	257067	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257067	$2a$10$qiuqTIptFUyxoVsvFWqIquhvtYERPMWu0OgmIRmNfkraqrd2OTjha
386	จินต์ศุจี	นาคซื่อตรง	\N	2016-07-20 14:21:21.416365	2016-09-04 10:51:11.826626	\N	257069	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257069	$2a$10$YLX3SzGi6OYLwzQ1fYbE1O2u0AGsPJYsC3t6E7DdHKjGhGCSrhape
388	สุพิชชา	ศรีเกษ	\N	2016-07-20 14:21:21.422078	2016-09-04 10:51:12.028243	\N	257072	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257072	$2a$10$frLKUIQ0kA8eyvRZ6l.yyuYmm6vidmTHQyCfTwdBoHeDZvWgbMKPe
389	เบญญาดา	วณิชนันทธาดา	\N	2016-07-20 14:21:21.425028	2016-09-04 10:51:12.143843	\N	259074	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259074	$2a$10$essRl5nqQfIsaxDwX7boyOIcVjCSKh1G/1qD6jbWFeuWEMIRLMnyi
393	จิรภัทร	ปลั่งพงษ์พันธ์	\N	2016-07-20 14:21:30.737074	2016-09-04 10:51:12.599006	\N	256004	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256004	$2a$10$PtemyCYXN6UGJvTaxnMQO.sMdA0i45iGxM7ymeuWyNahX9Ywh63eu
394	ณัฐภณ	วะน้ำค้าง	\N	2016-07-20 14:21:30.740265	2016-09-04 10:51:12.698894	\N	256038	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256038	$2a$10$fpxM8Bujzuc8lwUTCIyY4.O2IF2Sk84Wq.Cqdp05Ox0K9eK2tGJ6e
396	ธนากฤต	โชคบุญญาวาส	\N	2016-07-20 14:21:30.746818	2016-09-04 10:51:12.913837	\N	256041	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256041	$2a$10$1FrZv3plgig2x/1RuURcJOaTFnAtdkbTDH/3RwAzNCybytksNP4Lq
397	ธนาดล	สมบัติบุญมา	\N	2016-07-20 14:21:30.756947	2016-09-04 10:51:13.015766	\N	256042	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256042	$2a$10$hZNBeLwkB0GchE/WGoSAtueEp8K02l5iRYHDVxQSEMy6alPaCeU1e
399	นิมมาน	ตั้งสิทธิ์เสรีวงศ์	\N	2016-07-20 14:21:30.763682	2016-09-04 10:51:13.214692	\N	256086	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256086	$2a$10$QkBKE2cn8WWFzlWp1tGof.acPsWK4t8yf0VkFuS3NDVbfe/8kJcC2
401	ยศวีร์	วรภาสไพบูลย์	\N	2016-07-20 14:21:30.772	2016-09-04 10:51:13.436971	\N	256012	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256012	$2a$10$3WdwOJ1Wd4HD.71zyoTRKOSWAZiz6e4okvEHVQaD41dCYC8Y.B3rG
403	สรวิชญ์	สงวนพันธุ์	\N	2016-07-20 14:21:30.782776	2016-09-04 10:51:13.653964	\N	256014	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256014	$2a$10$qMZFpOkdG0Bc43MOLvJwdeeZgpP/rc8HzlczAVe5Fm/EiwnxMhMVe
404	กันตา	อนุจร	\N	2016-07-20 14:21:30.785834	2016-09-04 10:51:13.769568	\N	256017	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256017	$2a$10$nMzsuHj782wOQLUIFhvajemjibZ5FHRa57Jc1BgHO0eDt3zNPzhkW
406	ชนิกานต์	เนตรถนอมศักดิ์	\N	2016-07-20 14:21:30.791878	2016-09-04 10:51:13.984133	\N	256055	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256055	$2a$10$QuNlTAjcdENgWStku9NFtOLsVhLZPGeGOFEqmrh1WaCyD60QyotdK
407	ธนัชชา	ปฐมเนติกุล	\N	2016-07-20 14:21:30.794906	2016-09-04 10:51:14.086316	\N	256034	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256034	$2a$10$7jzERLfTwSVIsu15YJe9..SaL6QMc6TCXOCBd6IUqHRbTX.a4Od7S
409	นันท์หทัย	ผุยรอด	\N	2016-07-20 14:21:30.801054	2016-09-04 10:51:14.25481	\N	258089	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258089	$2a$10$.9BshV/0EKzuhSX.H9mOHuvrz/5wjYxD/ySCQBan.CMP2JxSIEwGS
411	ปวริศา	วัฒนะชัย	\N	2016-07-20 14:21:30.810131	2016-09-04 10:51:14.415608	\N	256024	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256024	$2a$10$WjdFK2IyIHaHD9/JFTqH6.MYDVSEuSkEBF1dCXkvHMR55ljgD8csG
412	ปาณิสรา	ธรณิศร	\N	2016-07-20 14:21:30.813929	2016-09-04 10:51:14.494664	\N	256084	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256084	$2a$10$vy6oOFsC.XNLleCgz6n3F.PyQNZtsnVuP8T9VWRoqgMCqIhcI/r.O
414	พิชญธิดา	อังศุภากร	\N	2016-07-20 14:21:30.82125	2016-09-04 10:51:14.681747	\N	256026	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256026	$2a$10$a1Vb.DviIklRB2StTAoWneV8HpytzX18dcrzb6yk2WmUCHGwqGh/S
416	พุทธิมา	เณรบำรุง	\N	2016-07-20 14:21:30.829636	2016-09-04 10:51:14.838623	\N	256062	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256062	$2a$10$C0uEAUKOpoAkOsxzJ8QNPevFhOq4SHLEq3XJHIcxFxktRf.Q/Do6K
418	ศิรินทิพย์	ปึ้งสุนทร	\N	2016-07-20 14:21:30.838713	2016-09-04 10:51:15.012517	\N	258076	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258076	$2a$10$H6Eoe1sEYZz9wbFw7OgCde3gAfMK13h9MEGBjlO0qRF/hP7QpKoZy
419	ศุภากร	ผาสุวรรณ	\N	2016-07-20 14:21:30.845465	2016-09-04 10:51:15.088487	\N	256085	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256085	$2a$10$uDcBFv6vXlX3EwE30ZilZurjEoPUH/80oECu.vbpdrCR1cH0GCT5e
421	อิสรกร	ดิษฐ์แสดง	\N	2016-07-20 14:21:30.853478	2016-09-04 10:51:15.244139	\N	256035	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256035	$2a$10$bJ1xoIib.s6W4h5GwQ8XLOqcTbti/Ext9rU6O9wCLTSg2nySTjxM.
424	กิตติพงศ์	ดีมากมี	\N	2016-07-20 14:21:42.615296	2016-09-04 10:51:15.399838	\N	256071	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256071	$2a$10$fAOP9gBny4YZ3LbyWhqTKOLCNXh3eOYTbmc0z1VmNQu2Uggjed94S
425	ณัฎฐ์ชานนท์	รัตนนารีกุล	\N	2016-07-20 14:21:42.6187	2016-09-04 10:51:15.47691	\N	256005	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256005	$2a$10$y7p6lrtDQyM4YSy.3hGGBOTyB/DskjuYpB9vdozpz.WKiYcbF856a
427	เตชัส	งามเกียรติขจร	\N	2016-07-20 14:21:42.624496	2016-09-04 10:51:15.633121	\N	256039	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256039	$2a$10$j3X9xYgy2T/ZkIttrK2LiO651VB6QHL72jdRm.FtqRSAsXfqdOoii
428	ธนกร	อัครคหสิน	\N	2016-07-20 14:21:42.627434	2016-09-04 10:51:15.708724	\N	256040	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256040	$2a$10$YqWMIF185ffTlxu62U75cuuBA9CA7e6TR4/pex7cQJdkPJodKoOdO
423	กรณัฐ	ปมิตต์ธศิล	\N	2016-07-20 14:21:42.605622	2016-09-04 10:51:15.859397	\N	256001	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256001	$2a$10$0DFrw3v1qom5N4VfvPtfcOJVCWX4pqFAk5y6fi/abIBg9Hd00vu7C
431	พีรภาส	ขจรศักดิ์ชัย	\N	2016-07-20 14:21:42.644222	2016-09-04 10:51:16.010418	\N	256045	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256045	$2a$10$wYnqszZTJDQ.2i4919d4UOrmT5jkfDwt0tQvcL8UvEkoUUWZaDDW2
432	รวิช	คูวิจิตรจารุ	\N	2016-07-20 14:21:42.649889	2016-09-04 10:51:16.08721	\N	256013	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256013	$2a$10$a5CxC20JoeuWvAa0Oov5s.9gZOf1ZctpQDWAvVlMBjRgJkLspCEqG
434	ศักย์วริษฐ์	สราญวงศ์	\N	2016-07-20 14:21:42.663212	2016-09-04 10:51:16.23705	\N	256047	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256047	$2a$10$8TwF/Ui5j2tijK87zjn2PuNeJqgvYwsfxOI5AbbvY3cl09JyyzxQy
436	สุกฤษ	สำเภาเงิน	\N	2016-07-20 14:21:42.672133	2016-09-04 10:51:16.392466	\N	256015	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256015	$2a$10$2ZEv3btIWefuwGJWjdTJM.RbyDHRpwN1qwrsJQijDFPLpOwoWCZOy
438	กาลตรงกัน	ประดิษฐบุญ	\N	2016-07-20 14:21:42.677948	2016-09-04 10:51:16.543351	\N	256053	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256053	$2a$10$pa5GYsuPVMgZ4Yaknsh5ouzU8DlwvIMphq3bRkqyGWzNkHiCwv.cO
439	ครองขวัญ	นาคทอง	\N	2016-07-20 14:21:42.682628	2016-09-04 10:51:16.624651	\N	256018	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256018	$2a$10$Gb1AUeDi3eHLVsPub/SNq.E1.t75u.RC3msfzhoeZ2h4KK7kaD0Xq
441	ณัฏฐณิชา	เกียรติบุญญาฤทธิ์	\N	2016-07-20 14:21:42.691916	2016-09-04 10:51:16.780462	\N	256021	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256021	$2a$10$kvptbbOLlEkPXm23IdycOOGfV.UMLugpMbNOvbR1thO7KbIbOPVdy
443	ธนัฏฐ์อร	สวัสดิกิจ	\N	2016-07-20 14:21:42.697683	2016-09-04 10:51:16.930754	\N	256057	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256057	$2a$10$kGUJkfKB/U/aFRcflVyWQ.TETJa3ya.fXWhhYeWn2vHOtK.Ti1Ymy
446	พุทธิมา	สุขสมวงศ์	\N	2016-07-20 14:21:42.710367	2016-09-04 10:51:17.153093	\N	256028	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256028	$2a$10$9J4SF25KfYbY2zYBna70vuGoM1m/.W900xVbnDLBq9sFpdi.TC3a2
448	มุกตาภา	พัสดร	\N	2016-07-20 14:21:42.718933	2016-09-04 10:51:17.308794	\N	256065	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256065	$2a$10$0gV8UdT/mqZtKZmwBtoHlurDGLeolM4JEL/jndWQsk3DgDy7klEpm
450	รมิดา	บุญญะหงษ์	\N	2016-07-20 14:21:42.726633	2016-09-04 10:51:17.458205	\N	256066	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256066	$2a$10$CsUReGlVmt5Z6RGUjhJ/j.hZNbQlNW4/zkHFTo0cQJY0KM7lZjcKa
451	รักตกันท์	มูลทรงเกียรติ์	\N	2016-07-20 14:21:42.730689	2016-09-04 10:51:17.536562	\N	256068	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256068	$2a$10$NFZPj9TzJp5EgSm01F69UOwfsmKJ1Z29A/DHZUBiHWTtOV5eUcfJ.
453	ริตา	คุ้นเคยค้า	\N	2016-07-20 14:21:42.739484	2016-09-04 10:51:17.689609	\N	256070	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256070	$2a$10$Q6/3UyCFeZAKvsc2bnd/eOH58yhGic2sfLk3uHF8/VUKdMtAPa55G
454	กวินลดา	ท่าทราย	\N	2016-07-20 14:21:42.742391	2016-09-04 10:51:17.768205	\N	259077	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259077	$2a$10$oeEiwUnG58wiYCSW2wM2FuDrjI7lKz8qZqKWFeDYja7yrc2hdI/1m
456	ชวินธร          	ธนรักษ์	\N	2016-07-20 14:21:57.37787	2016-09-04 10:51:17.918885	\N	255003	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255003	$2a$10$dqGcNhrm8Nm3IRYZOt.xw.toF1pJGQOYevrBzXmXJVj.f0PCHSsPu
458	ธวรรธน์	คุ้มแผน	\N	2016-07-20 14:21:57.384324	2016-09-04 10:51:18.069798	\N	255044	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255044	$2a$10$JNo2BXHzEYIs0Dj/NuNtwOSPZsf/WJr.coAsH.3RebhU3dBvGElty
460	เธียรพรหม    	เนตรสขาวัฒน์	\N	2016-07-20 14:21:57.392212	2016-09-04 10:51:18.227962	\N	255009	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255009	$2a$10$Ah9FD0zOHliUp0P0voTIKu5agkrv0BkTktUx/NL8EmPxVhTqFGulS
461	ปภังกร	ตันติอำนวย	\N	2016-07-20 14:21:57.396006	2016-09-04 10:51:18.306427	\N	255046	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255046	$2a$10$PJAidAUhbHsgYt9Wpy8KFeOEIiso6ITvjkBk8KlTsg8/9.Ye5x0Rm
463	พัทธพล	แสงสำลี	\N	2016-07-20 14:21:57.410221	2016-09-04 10:51:18.457817	\N	256083	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256083	$2a$10$Zu28PTMScVwseMIF4YFDcuAcl7FZIaIaxbwjAmqgmjXA2ZlIv4qMe
464	พีรฬ์ดนย์       	วิชพันธุ์	\N	2016-07-20 14:21:57.415103	2016-09-04 10:51:18.537473	\N	255050	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255050	$2a$10$p7sHVjNetMCi1AqFjvsbju1ADI/azLf5v9NDhVT6JU/MCKZhioJfK
466	รัฐพรรดิ	ศรีพยงค์	\N	2016-07-20 14:21:57.424725	2016-09-04 10:51:18.688888	\N	255052	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255052	$2a$10$t/gFERxrnu6DdRA3q3GA4eT6SO4Q.MGhWgaZOskcHJtdfNRnS5bl2
467	ศุภณัฐ	ศรีเกษ	\N	2016-07-20 14:21:57.427639	2016-09-04 10:51:18.7673	\N	257073	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257073	$2a$10$n51DOO8AUSB.NQXjriLNceLeygZnLdn1HQxnYd/oZHlg./dBpT.SS
469	สุรฐะวิชญ์     	จุลวนิชรัตนา	\N	2016-07-20 14:21:57.433577	2016-09-04 10:51:18.925516	\N	255017	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255017	$2a$10$UobBarftc4bqzJuiy2DBoeqMhpiA70PcpR4bgyxO6HDPMhpusI67W
471	อัศวิน  	ด้วงแป้น	\N	2016-07-20 14:21:57.445266	2016-09-04 10:51:19.079083	\N	255018	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255018	$2a$10$LLR82oiqpEp/q31zdggw7Of3Emh9u.cgNb344xzsei.ZlHUcWz/zS
472	เกตน์นิภา       	บุญเกิด	\N	2016-07-20 14:21:57.448507	2016-09-04 10:51:19.158448	\N	255019	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255019	$2a$10$SfJo29YESIGdyPENyP.vfuBcA5VN1HETDDI5djxvvHB8ZltfT4TFS
474	ญาณิศา	สิงห์เมือง	\N	2016-07-20 14:21:57.455867	2016-09-04 10:51:19.311701	\N	255071	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255071	$2a$10$QKwA3CvXDGY5b1.ucpyEoOGYWgxIZklJM84aEzFqKmaubSVZoAx7.
476	นภัสสร             	วงษ์มั่น	\N	2016-07-20 14:21:57.46621	2016-09-04 10:51:19.472097	\N	255060	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255060	$2a$10$KeCwJnCgfiOuGmqsejOmGO7jQWbK5RIL6P3PH2A7bgt0Znj8v9FfO
477	นมนต์	บุญรอด	\N	2016-07-20 14:21:57.469745	2016-09-04 10:51:19.552854	\N	255023	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255023	$2a$10$0iinWMMXaJ9f7BbXtupQ1eo4Z/hoAAjUQnkJgamb9K37xgmLi3pcK
479	ปุณณภา       	คงเกรียงไกร	\N	2016-07-20 14:21:57.476732	2016-09-04 10:51:19.715394	\N	255063	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255063	$2a$10$it8lSdA66ca2yOWwDd2fZ.D7JDCV.uus1WHdHcB.CRlJM8rLfZAaW
481	ภคมน	ภาณุศานต์	\N	2016-07-20 14:21:57.484001	2016-09-04 10:51:19.868727	\N	255031	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255031	$2a$10$QznR.GnED1/dB3ZSXEmife7igWu0efwa3sc7ayWIqfeIlyExwhVtS
482	มทินา          	ชื่นประไพ	\N	2016-07-20 14:21:57.487045	2016-09-04 10:51:19.944139	\N	255032	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255032	$2a$10$TyBAhEoQCddPhXt0H4mngOEj9mYqA38eUMPb1ejF41dXyR5Y2uY0m
484	สัพพร          	นิลพันธุ์	\N	2016-07-20 14:21:57.495892	2016-09-04 10:51:20.092901	\N	255068	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255068	$2a$10$tq9tOMm45VZJ1ZblyoWpb.0KtfPwVdpctWdEQpzqm5U2Weoe0.rwK
486	อัญอานันท์       	อังคสยาวัฒน์	\N	2016-07-20 14:21:57.5019	2016-09-04 10:51:20.241038	\N	255069	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255069	$2a$10$0WV0YcWbhvW0Wic3Jc8.refKXlMvs0cmachc2VFD9f4XtsIoxLiKu
487	อิสรีย์	วิโรจน์กิจเจริญ	\N	2016-07-20 14:21:57.509074	2016-09-04 10:51:20.316619	\N	255035	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255035	$2a$10$e8RNSecKv8RV7P7Bz25ANut1FEO5zF0f6V2/8H8goCRsvVfLlSWze
489	วารีวา	วทัญญูไพศาล	\N	2016-07-20 14:21:57.516949	2016-09-04 10:51:20.46785	\N	258086	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258086	$2a$10$Dh3crwvtZoN.6wfvIy/H4eABWuJ8CrwbENGEvmzr0LWHrr4U2UfZe
492	ชยพล	อังสุวรรณ	\N	2016-07-20 14:22:07.808087	2016-09-04 10:51:20.619042	\N	255037	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255037	$2a$10$bALV3qbAa0celoOKNguaAekDYSR5h7dt2JyD0paujj4ahpYcClhvK
493	ฌาน	จุฬามรกต	\N	2016-07-20 14:22:07.81167	2016-09-04 10:51:20.698937	\N	255004	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255004	$2a$10$WUzgeY8wTejl4aZSVXwbJe7m.M4x8gX60TptLWYZ2yg5FxUfQcKqS
491	ชนดล            	หวังเศรษฐกุล	\N	2016-07-20 14:22:07.798719	2016-09-04 10:51:20.852504	\N	255001	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255001	$2a$10$mytmYSA0IghmFeAey6oLJe9wAVA0iCOeSuAz1/g1IpjIr1DWqz7pC
496	เดชาธร          	อมตทวีวัฒน์	\N	2016-07-20 14:22:07.820784	2016-09-04 10:51:21.000172	\N	255040	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255040	$2a$10$aIUy644hFaR9ZeaVE0hSGOXbJB22ircdfOtfKQ/qq99dh2KJGqoAW
497	ตรัยธรรม      	สถิตย์	\N	2016-07-20 14:22:07.829143	2016-09-04 10:51:21.07366	\N	255041	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255041	$2a$10$ePsPyBhC2O2cHpTkeir0DOLwwiifkBwalbdYS0PsWwW/8AJdTdnNa
499	ธนดล            	ธีรภาพสกุลวงศ์	\N	2016-07-20 14:22:07.838841	2016-09-04 10:51:21.227818	\N	255043	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255043	$2a$10$lETePChVVdMSzTvWUPVxGugYrfY8ohz9qisEPW0B1Al63O6ZzPMi2
501	นนทภัทร       	รวยอริยทรัพย์	\N	2016-07-20 14:22:07.860038	2016-09-04 10:51:21.37791	\N	255045	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255045	$2a$10$hnN0.woydNXYYSrmPxVhkeNJ.UIw64JJ9WJ7n9LNv8A1j4AuFJJW6
503	ปุณณัตถ์	สงษ์ทอง	\N	2016-07-20 14:22:07.865651	2016-09-04 10:51:21.527438	\N	255012	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255012	$2a$10$jVQaIEj.p8U5pgknfYvzRujlWQSwMVFPa.c4zVAHoFd3QrkMarutG
504	ปุนยวีร์           	ชีวะถาวร	\N	2016-07-20 14:22:07.868444	2016-09-04 10:51:21.607486	\N	255049	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255049	$2a$10$iqdKzSrhqvNOuj6YfNtxeOYOzvBJZUmn4jVOLeYV/BWFYKC0HdZBe
506	มนัส	สถิรรัตน์	\N	2016-07-20 14:22:07.87413	2016-09-04 10:51:21.761149	\N	255013	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255013	$2a$10$xQs.at4NbAuU.My1973Ws.v8bbg/gPVgrmIhnfzJ19fZOAnpHzFeK
508	สุรพัฒน์	ถิ่นประชา	\N	2016-07-20 14:22:07.885336	2016-09-04 10:51:21.915933	\N	255073	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255073	$2a$10$XvFd3GQVnPJaN/y5MsKKm.s98kYIZ6vxSd4lWEB8QeBX0T0wwxYLW
509	เขมจิรา	ไกรฤกษ์	\N	2016-07-20 14:22:07.887996	2016-09-04 10:51:21.993539	\N	256073	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256073	$2a$10$QMDSu1XwvzBckaNA7Yf0TOj9DHKx9gvPEAv4QKlU9fSebyQXrRD.2
511	ณิชา	ศรีบัณฑิต	\N	2016-07-20 14:22:07.895462	2016-09-04 10:51:22.150728	\N	255057	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255057	$2a$10$sBLx5Dr59E8WRRPqMK9ElOT00X2Y8Ta5752wB9V0cvDtEa.RQHGOG
180	กานต์นิธิ  	ศักดิ์ศรียุทธนา	\N	2016-07-20 13:48:41.596753	2016-12-13 03:22:54.02372	\N	259002	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	เด็กหญิง	\N	259002	$2a$10$Zi6YHUEHc.IrisR3OUNrqODrkMNCQ/vbVONkY4LBb6Y0DRgwNLbdu
514	ธนพร    	ธรรมศิริพงษ์	\N	2016-07-20 14:22:07.913698	2016-09-04 10:51:22.38137	\N	255058	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255058	$2a$10$bVzoc48AEFB4CY3dw.9W..9NreyeQedExVfVJS05UhF3ppC0NIyf2
515	ธฤตวัน        	โสภณานุกุล	\N	2016-07-20 14:22:07.91669	2016-09-04 10:51:22.454291	\N	255022	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255022	$2a$10$vcW5Bv.jmNlz9gXBwgLJ1uxyPS/QViErF.G0TVzxS.gscKDU/2IDC
517	ปริยาภัทร    	พรสมบูรณ์ศิริ	\N	2016-07-20 14:22:07.926639	2016-09-04 10:51:22.608664	\N	255025	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255025	$2a$10$J308DVlHeEssiZBHkRFIb.TlEij8kwZyDgeUrLb9v39BACDjQ8ap.
518	ปาณิสรา	วานิชาชีวะ	\N	2016-07-20 14:22:07.934249	2016-09-04 10:51:22.686382	\N	256059	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256059	$2a$10$z67VK4Bi0FXVjXL9a1c6uOP74C39Y5R5rHyRdTf3TXhjbuGjys1Cm
520	พรนภัส       	แพรอัตถ์	\N	2016-07-20 14:22:07.939955	2016-09-04 10:51:22.839533	\N	255064	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255064	$2a$10$toIbfX/DCLQqMuGxNuadvOnzZNHdU/EACRRQd0k.VCXU9cCJqtZC6
522	พรรษริล           	จารุพุทธิศิริพจน์	\N	2016-07-20 14:22:07.945553	2016-09-04 10:51:22.987025	\N	255065	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255065	$2a$10$rtd15Koaqd3Ry0.z5CWbEuawpJrQ7.flXVVy/F2241HiA/jBAHubO
523	พีรญา	อินทรรักษา	\N	2016-07-20 14:22:07.948389	2016-09-04 10:51:23.061404	\N	255066	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255066	$2a$10$MMNqCYLnE1WSCt/GZ83cV.DVTPLJPsTzQNtdxUp8i4yUCFCZPT92i
525	อรทัย 	แตระกุล	\N	2016-07-20 14:22:07.954314	2016-09-04 10:51:23.216066	\N	255033	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255033	$2a$10$xtqJ1Wu/7FbYXY7A3GLMY.FCKKBpObBUHuZVJab5dTSu0Uq0htUKa
526	รักตาภา	บุญคุ้ม	\N	2016-07-20 14:22:07.957086	2016-09-04 10:51:23.292054	\N	258087	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258087	$2a$10$bvqXXzsybfpBzR7T2qq5a.qvAuhoLeE903hXaM0BMEZthI0vrqgLO
529	คณิศร	เจริญฐิติรัตน์	\N	2016-07-20 14:22:18.969638	2016-09-04 10:51:23.442765	\N	254036	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254036	$2a$10$P10wxfgLOMP7aLJyyI54COdqxiQBlqshR3oelcahjhVcM8fBM1ITi
531	ฐิรวิชญ์	สะสมทรัพย์	\N	2016-07-20 14:22:18.976516	2016-09-04 10:51:23.599192	\N	254072	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254072	$2a$10$oFfkZY7uYmrtPVi7EEelcO/7Ys7yysg2SXLsxP5mRfgl.eXNCpqZ.
532	ณัฐนันท์	อ่อนแช่ม	\N	2016-07-20 14:22:18.979686	2016-09-04 10:51:23.676286	\N	254078	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254078	$2a$10$gmqnp3lHKXLjJQZGInM6Pu6UfmHWG2S.w.gdPuEQ.TFBA.b4MHzf6
534	ธีรภัทร	แฝงเพ็ชร	\N	2016-07-20 14:22:18.988942	2016-09-04 10:51:23.832251	\N	254070	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254070	$2a$10$RbfjaUIK.YG9VkWT51wVE.8qwxGMYy44zrdR5Tr2f.X4KnZ9WbEVS
536	ปวรวิช	กุฎีศรี	\N	2016-07-20 14:22:18.995859	2016-09-04 10:51:23.98207	\N	254045	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254045	$2a$10$LDHkDBsGXfkzOjBpS2uF9OWc17Z2Q4ROQrCLH5g4O1h7wEO69z9ci
537	พัชรันทร์	พูลเทพ	\N	2016-07-20 14:22:18.99977	2016-09-04 10:51:24.060398	\N	254046	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254046	$2a$10$ZDylPEHVyhkrlndL9IJ6XOLf7uM2AW0JoSnGJI7QHxJ4tj6rrZlTa
539	ศุภณัฐ	ศรันย์พานิช  	\N	2016-07-20 14:22:19.015353	2016-09-04 10:51:24.212387	\N	254051	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254051	$2a$10$AbyJv2ZfBYqwibtgvgRqEuEDDqqw35DVyKk1JLtmznK7267x3J576
542	อสมา	เสื้อเมือง	\N	2016-07-20 14:22:19.02511	2016-09-04 10:51:24.362046	\N	254071	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254071	$2a$10$Op4hpWxas6AYu4RYW.r8ZuNhw92o1AH/nj9sOFKC7ClKMlVthHXfK
543	กัลยกร	ลิ้มศิริวัฒน์	\N	2016-07-20 14:22:19.028301	2016-09-04 10:51:24.436309	\N	254020	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254020	$2a$10$QLx3qT8PTqbGxt7U0zO.hev8Njv3yMGl4QZMovJu0vxMu/VFSrXZu
545	ณัฐชยา 	มงคลสุรวาณิชย์	\N	2016-07-20 14:22:19.040332	2016-09-04 10:51:24.589307	\N	254023	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254023	$2a$10$Ow64DbukDvWrKQFW12M.heU3T0Ov5TCJ6RsF8qCf3ieEVCofp7HCG
547	ธวัลรัตน์	ริมดุสิต	\N	2016-07-20 14:22:19.046928	2016-09-04 10:51:24.74125	\N	254026	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254026	$2a$10$krJyKIv4J51OvJB6n4JR..sRPOcWu6DparrrTgdZK/fnPhy5tlGh6
548	ธันยมัย	บุญปราบ	\N	2016-07-20 14:22:19.05064	2016-09-04 10:51:24.818859	\N	254027	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254027	$2a$10$mffwRFHaJ8pzmIZ58lERG.2PSqGOIou4NymPgz7NhI.ITmxJVKFtW
550	นิชาภา	ตั้งนิธินันท์	\N	2016-07-20 14:22:19.058802	2016-09-04 10:51:24.974862	\N	254029	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254029	$2a$10$nu3hdW/J1.LRGeNVGosJ8udP8y3zCKyq6fUUPrVkvBuD9XFcl6cNe
551	ปริชญา	สุริยะยรรยง	\N	2016-07-20 14:22:19.062982	2016-09-04 10:51:25.052405	\N	256087	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256087	$2a$10$OzbDGHkP.gdzC18K/BROwunjV5qqQd3vDFzxSeHGuENwtBueW8gHC
553	พิชชานันท์	ปฐมชัยอัมพร	\N	2016-07-20 14:22:19.07098	2016-09-04 10:51:25.203075	\N	254030	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254030	$2a$10$nY2Ri5j3o5ebbLw2yhcDEO10jWIyOpIM81fUMKnpja3.r.I5.QEzG
555	สิริยาพร	ปิยะกุลวรวัฒน์	\N	2016-07-20 14:22:19.078473	2016-09-04 10:51:25.3538	\N	254032	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254032	$2a$10$tD98rILrwFGWHzyf3iJdouK.aHy5lxGSHOItq0az/J8rtfZz6Q4Yu
556	สุพัดชา	สวัสดิ์ชัย	\N	2016-07-20 14:22:19.084876	2016-09-04 10:51:25.42979	\N	257075	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257075	$2a$10$C1SYeUrKtRO6eI/vwtmPm.EXHCMHSrz7Ky6o3ibgQSSiAMdxdwpbi
558	ณัฐณิชา	สมพรสุขสวัสดิ์	\N	2016-07-20 14:22:19.09229	2016-09-04 10:51:25.586579	\N	258079	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258079	$2a$10$q6Duzt6kO/3SnxxhnwhqB.4kZMqypZITEw1JrsbIq2Qd87xj/L2cK
541	อภิสิทธิ์	ฐากุลวีรนันท์	\N	2016-07-20 14:22:19.021707	2016-09-04 10:51:25.748966	\N	254017	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254017	$2a$10$UzLe88KL6c6mjrM1kPFXr.jilCtEJxkhAJ4v2zSsOqLX16QDxF/Q2
559	โชค	จงจิตดังจง	\N	2016-07-20 14:22:19.096401	2016-09-04 10:51:25.831141	\N	258091	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258091	$2a$10$IZnNN4ujwkRRvCyTMDcQXumJp074k6nSdAuyMID7ilIDVaY4Wj6uq
561	โชติวิทย์	มหันต์ชาครพงศ์	\N	2016-07-20 14:25:13.485394	2016-09-04 10:51:25.983094	\N	254005	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254005	$2a$10$M1UpKkI3kQyE4YwIbKD11.xxZUiERajVS9tUFWFcb72USulUjpcTS
563	ณัฐปคัลภ์	สอนดี	\N	2016-07-20 14:25:13.492438	2016-09-04 10:51:26.134863	\N	254040	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254040	$2a$10$2QNysiUKoy9/Bm6z6SIA0eSUhuK5Z/Dfu3z9SZfBJR2clVw0oCcrW
565	ธีธัช	พรหมเอียด	\N	2016-07-20 14:25:13.497732	2016-09-04 10:51:26.286996	\N	254042	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254042	$2a$10$.UZq1Ovjkdar.wZmVqNuKuxHtbuJzTUHpM6lh6laqMXNMYl8hRhAa
566	นิธิภัทร์	ปิยะวงศ์วัฒนา	\N	2016-07-20 14:25:13.500479	2016-09-04 10:51:26.36573	\N	254009	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254009	$2a$10$2ez7Ik0A4ef7rwdtL8rKU.O9f.GeqtDRuctgdMrYcS3nUx0V/4X5m
568	ภวัต	ณัฐพูลวัฒน์   	\N	2016-07-20 14:25:13.508443	2016-09-04 10:51:26.520868	\N	254047	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254047	$2a$10$Uf3NEh09FYrw1QNLQY0GG.Cr0bfAq8D1ChT8G/HrF8rJJeF5Lg9w2
569	ภิเษก	ไชยแจ่มจันทร์	\N	2016-07-20 14:25:13.511774	2016-09-04 10:51:26.596765	\N	254012	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254012	$2a$10$L6YrWG6jbcdGL8MCwe3Uye1j753/fPxWn6Y883DPSgmH8FeOhy7yi
571	ศิรวัฒน์	มกรกิจวิบูลย์	\N	2016-07-20 14:25:13.517444	2016-09-04 10:51:26.751264	\N	254050	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254050	$2a$10$.9an8Pf4klJ30q6A5hFI8.7oKdXWa1HLNFaxiSLzSFI70MyU1ZJ5a
573	อดิศา	ศรีปฐมสวัสดิ์	\N	2016-07-20 14:25:13.523333	2016-09-04 10:51:26.908531	\N	254054	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254054	$2a$10$heV/9kHmP5bLZ82ufIx/UuLxRd7VilJowLylptC5wHmlBGC4CVZ/G
574	อิทธิกร	สุพรส	\N	2016-07-20 14:25:13.526361	2016-09-04 10:51:26.986539	\N	256076	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256076	$2a$10$WRLvPnf6rRRYU21c5X3qDuZshnSdGrOKzLzY.NHsSLZ/x.1jeqx.u
576	กชพร	กิ่มเปี่ยม	\N	2016-07-20 14:25:13.533524	2016-09-04 10:51:27.141312	\N	254073	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254073	$2a$10$VlGWb7oKo9Ymm233hO8fwe3WH/XhM3BWnM5WVjge4DVCdPLW1KwpO
578	เขมณัฎฐ์	เหมือนชู	\N	2016-07-20 14:25:13.540308	2016-09-04 10:51:27.298785	\N	256075	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256075	$2a$10$nw5zKGpRnNmf4.akoS5IaOa3SgB0YH5da3zI7m3yU1bcQEW8SopKG
579	ญาธิป	อินณวงศ์	\N	2016-07-20 14:25:13.54312	2016-09-04 10:51:27.376396	\N	254058	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254058	$2a$10$jqIJVgHxjgVIjhS3YuoFdO6BINwNznGstQr1ES/iDcPROOVSGoJiO
580	ณิชารีย์	ฐากุลวีรนันท์	\N	2016-07-20 14:25:13.545693	2016-09-04 10:51:27.452094	\N	254025	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254025	$2a$10$LMt9MYXY551mM1VyHhO8BO8ncaastcqAnUYoTfnf3X4mU0SrTX0pG
581	เบญญาภา	มหาสังข์	\N	2016-07-20 14:25:13.548339	2016-09-04 10:51:27.531103	\N	254018	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254018	$2a$10$AEAuHW00LZkBZ2T80NFYO.2lKVksXbcsRpMp8mV8bElzt2gLBObCa
582	ปลายฟ้า	ศิริตรัย	\N	2016-07-20 14:25:13.550896	2016-09-04 10:51:27.609908	\N	254062	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254062	$2a$10$oZlzlVIbTJw5IlGqMsVDjOHjGBTJLCMY8O/g5pDng3JU9MiubaSim
601	เฮ123	ฮา12	\N	2016-09-04 10:14:51.959303	2017-02-05 10:09:33.744304	42143242805-	1234	\N	O	\N										เด็กหญิง	\N	1234	$2a$10$xiS9BbJAtI.XN9huhjkZTOk3LO5GHThB60fMuM76wxNyGZsQK3ypG
583	ปวีราภร	ศรีพรมมา	\N	2016-07-20 14:25:13.553591	2016-09-04 10:51:27.683288	\N	254063	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254063	$2a$10$3QQgbXPwkjG0QouiSe/STOjwBOeZ/cWcKKM.cxyY75rCcCov.lNyi
584	พรนภา	ธัมม์บันดาลสุข	\N	2016-07-20 14:25:13.556252	2016-09-04 10:51:27.754942	\N	254065	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254065	$2a$10$zdWlg4LXGo/EsAVXdhOr9Oh5HXnlqR0EbLLW761YxnXUUhOon.1Z2
585	ระวีนันท์	ญาติมาก	\N	2016-07-20 14:25:13.558774	2016-09-04 10:51:27.829547	\N	254067	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254067	$2a$10$sCtBGhCWqk7R4cxeFwLPxe7KQlMm4ZE/kJu3f3h0GI2B5J9VkBnJy
586	วรินทร์ภร   	ชาวนาฟาง	\N	2016-07-20 14:25:13.561378	2016-09-04 10:51:27.903438	\N	254068	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254068	$2a$10$BIvZNMsBAf.hmoWNH7YGO.mauF1sfyqmjdwowGO8btJftHo3tI6Tu
587	ศศิมา	เทียนดอนไพร	\N	2016-07-20 14:25:13.564458	2016-09-04 10:51:27.977232	\N	256074	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256074	$2a$10$XwDBk/MjL3PSeOE7vpJIr.iG00P2BEXgIeD6MKQX9ezUu/ajt9aOO
588	สิริวริณ	เหลืองปฐมชัย	\N	2016-07-20 14:25:13.566978	2016-09-04 10:51:28.052411	\N	254034	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254034	$2a$10$RDAEQGBJbEMGFJT2qk9POum67MzUp8K2wzLTBbPtGh/THNjiDMLti
604	กฤษฏิ์ศรัณย์	สราญวงศ์	\N	2017-01-28 07:18:37.54493	2017-01-28 07:18:37.54493	\N	256036	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256036	$2a$10$jhppRcsj399aD19lFY/Z9eyQzubxMpRF0/bJ9k1k7qR82/2gt1cIq
179	กฤชรัช	โชติพัฒนถาวร	\N	2016-07-20 13:48:41.587563	2016-12-13 03:24:32.72593	1719900359838	259001	t	O	2000-03-02 17:00:00	1/2 หมู่1	0857041333	71000	นอน	ไทย	ไทย	ปากแพรก	เมือง	กาญจนบุรี	เด็กหญิง	\N	259001	$2a$10$gWsEPBENDQEpmSNozGTVAuIudPSGq1ex6N/iguhdBduvqJtqwETwm
589	อรพรรณ	ธรสินธุ์	\N	2016-07-20 14:25:13.569466	2016-09-04 10:51:28.129337	\N	254069	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254069	$2a$10$QzM1071YLgSaZnulS0MkaOk6Uv26E96fIW4DbAN8f5ZY/5A4A3UjK
214	กฤชภัทร  	โชติพัฒนถาวร	\N	2016-07-20 14:20:11.609818	2016-09-04 10:50:53.850567	\N	259035	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259035	$2a$10$6ZdAx2YZx3AnV/FEH/MUNeH/J4Wuf6tWbS3b61CxjKQ7ATtOJtoGm
216	ชนันธร  	มณฑลชัย	\N	2016-07-20 14:20:11.622815	2016-09-04 10:50:54.02456	\N	259037	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259037	$2a$10$FoaY2RhLhykbBkOK6rMsGubUgz5hwhb6nmu6XgcrBOvTHJNN53pu.
218	ณรงค์กมล  	ห่านศรีวิจิตร	\N	2016-07-20 14:20:11.62861	2016-09-04 10:50:54.172299	\N	259038	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259038	$2a$10$0F1X/0/1jYM3eOXWcjYsneCDkJ.LFVyNBLfqmBj6tvuuDmWdbIggm
222	ธีรภัทร์  	ไทยวัฒนานนท์	\N	2016-07-20 14:20:11.638448	2016-09-04 10:50:54.398407	\N	259043	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259043	$2a$10$hOVSxM48lRM6g/l5atZ/1.hhPQxnTvRlrde5zXQ2s.5Zcsv1K8x.q
225	พิชญุตม์	รุ่งทวีชัย	\N	2016-07-20 14:20:11.646493	2016-09-04 10:50:54.642293	\N	259046	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259046	$2a$10$nYX2Lb1bGld3Li6Z/VBVK.zNNRmEG7v0CUMgushPZoRIp98b2a46K
227	รัชพล  	กล่อมจิตร	\N	2016-07-20 14:20:11.651095	2016-09-04 10:50:54.795624	\N	259048	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259048	$2a$10$PEHqL3G3fpDOIFerGKsOHuuP1pN9exyVZfMfS7nTIluoPCWTVBEg.
590	ปาลิดา	ศรีสำราญ	\N	2016-07-20 14:25:13.572344	2016-09-04 10:51:28.210168	\N	257071	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257071	$2a$10$DbLKkGcdbphN4JH1ThuRX.p846r0QSYYTm1pstCb1M/KkO..GLEgS
591	ลักษิกา	สุภชัยพานิชพงศ์	\N	2016-07-20 14:25:13.575314	2016-09-04 10:51:28.287333	\N	257074	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257074	$2a$10$xjPJO6Sh7JAEi2z9IxJbJ.RDXuA3tC64OgaGCUvVBpDtqacyZK0SO
592	ศิศิรา	เจียมทับทักษิณ	\N	2016-07-20 14:25:13.577696	2016-09-04 10:51:28.364474	\N	258088	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258088	$2a$10$5CPUZNIh3gRrz.zjbBA1HuMm2KhuBT6gqrGpb0nhgXWifonKSk5w.
595	aaa	bbb	\N	2016-08-16 15:22:19.724475	2016-09-04 10:51:28.443433		32412	\N		\N										\N	\N	32412	$2a$10$OV66cVmafQ1WGfEwM8MC0OENIlNnN5jbOsulI/fMzRiQr9Bj7ijCG
596	ccc	ddd	\N	2016-08-16 15:29:17.905696	2016-09-04 10:51:28.597682		32423	\N		\N										\N	1	32423	$2a$10$P6V9AT6smXkNdbwEEd8nNO/nG4l9dKZAzIRCCzxn2NFxpIkynTky6
606	แมน	ma	\N	2017-01-28 07:30:32.693381	2017-01-30 13:27:59.190506	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	$2a$10$bNX8QygFmHd14MCPvxcR7OgfQV/5vJdjC0wNYDKBUDBPrTqSax8.G
605	มิค	ma	\N	2017-01-28 07:30:24.076104	2017-01-30 13:28:06.335884	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	$2a$10$SXqUxA3lL8RP1CxXSdg6YuOh8XhzLTgC6HPJdkNdlns.TvmmB65VG
230	หฤษฎ  	พรรณพัฒน์	\N	2016-07-20 14:20:11.658021	2016-09-04 10:50:55.049627	\N	259051	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259051	$2a$10$kINbr5Oi/GcdmUVpBOgRDOcjiAMNg4qZDRoAXyzKdluZl3oqpg.5m
232	กานต์รวี  	ศักดิ์ศรียุทธนา	\N	2016-07-20 14:20:11.663732	2016-09-04 10:50:55.220208	\N	259052	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259052	$2a$10$K29WGvJkZb.vJsbn84jqnuiS7xCdsag5C5FhtsgDKS0dDJqaPJBwy
235	ชนิดาภา  	ปิ่นทองดี	\N	2016-07-20 14:20:11.671487	2016-09-04 10:50:55.475241	\N	259056	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259056	$2a$10$Yv9hxFrHGBRQFT7nyYSYCe4S2cR1DmF9GhjjN8WaoMOOJNWHSHbFO
238	ธัญวลัย	สิงห์เมือง	\N	2016-07-20 14:20:11.68	2016-09-04 10:50:55.733921	\N	259059	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259059	$2a$10$aDNE7xFldAjnO3n/BipACevaywFTzVxlLkufaIC5sGTaATa4i6o5i
240	บัวบูชา  	ลีฬหรัตนรักษ์	\N	2016-07-20 14:20:11.684884	2016-09-04 10:50:55.904282	\N	259061	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259061	$2a$10$YWpWMlFFNo0siFvx0RCF/eE68qPxMZ7wbGNHdL9QJvW.RYUCOXBRK
182	จิณณ์ณภัทร  	พรสมบูรณ์ศิริ	\N	2016-07-20 13:48:41.611119	2016-09-04 10:50:56.331901	\N	259004	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259004	$2a$10$tibT4yR3t/L6dl1P7zpzpewF2DRy2D1d.giKMBudZn9OOWBNwCsa6
185	ณัฏฐกร    	แต้มมาลา	\N	2016-07-20 13:48:41.620554	2016-09-04 10:50:56.582697	\N	259007	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259007	$2a$10$92Px0ZZtlsqfx/k73Lr0I.AMD.Sq/VZoKapr5NAHN41YSV9dq59uy
187	ธีรัช  	วิจิตร์ปัญญารักษ์	\N	2016-07-20 13:48:41.63437	2016-09-04 10:50:56.753368	\N	259009	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259009	$2a$10$PH1ENxv03fGPqh83brIM6.cTtY2LyLEBzW5tUDUPDvyHbQLa7ZBNa
190	พัณณพงษ์	วงศ์วรปกรณ์	\N	2016-07-20 13:48:41.644533	2016-09-04 10:50:57.01598	\N	259011	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259011	$2a$10$VjKbsIBkFrU.fdkEGFkycuoVcKp70baOWx3XlNN0szsNLLhU.uqpS
193	เลนนอน  	จอห์นสัน	\N	2016-07-20 13:48:41.658961	2016-09-04 10:50:57.272498	\N	259014	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259014	$2a$10$kLQSM2FbElhu/vUUibgv1Or7J4MKdypaIaGwllUjJRvmwDFwOrBeG
196	เศรษฐณัฏฐ์  	อิ่มนุกูลกิจ	\N	2016-07-20 13:48:41.684081	2016-09-04 10:50:57.526029	\N	259017	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259017	$2a$10$Cu1Npd7DTxbdDTgm0ulalu4qYDkeiHi4Iic6fhZ1ZhuRDNR3F9KOi
198	กรจิรา  	นันทานิช	\N	2016-07-20 13:48:41.694688	2016-09-04 10:50:57.69648	\N	259019	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259019	$2a$10$SqRSWO96IClRLu/xyBZ.W.CB7nHqsYq/lWym0FSUk7zhTwkOIL4Sy
201	จันทิมา	เลี้ยงอยู่	\N	2016-07-20 13:48:41.707051	2016-09-04 10:50:57.953994	\N	259022	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259022	$2a$10$IxBG5kcjORo5wuyWzt0qj.K2ccOaUax7PMs1YECI/HLPFG/RvnIvy
203	ณภัทรสร  	ศิลปชัย	\N	2016-07-20 13:48:41.719566	2016-09-04 10:50:58.126011	\N	259024	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259024	$2a$10$w0u.YYD2uJSP4h4GO8c8fu2/iN9gugbFWHi2UCDFcAEU9Ls2ifQo.
206	นันนภัทร  	นิธิพงศ์ไพศาล	\N	2016-07-20 13:48:41.729218	2016-09-04 10:50:58.383202	\N	259026	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259026	$2a$10$Dq5gXxTHpVTaQdU/It5qXe7XOrpzNRqYPkOmh7co09dX88UR7d0z2
208	ปวีร์รักษ์	รุจิวัฒนานนท์	\N	2016-07-20 13:48:41.736523	2016-09-04 10:50:58.580775	\N	259029	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259029	$2a$10$qwzcJ0IYVFQh7uNPAuNDD.TNDMhEcUFWH0Hpw0Bcq5KmBEvoFnsA6
211	วริษฐา  	เต็งประยูรศรี	\N	2016-07-20 13:48:41.749339	2016-09-04 10:50:58.838448	\N	259032	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259032	$2a$10$v2ZFoaGvtbeucf4J6IVQyenAXCtmxB0nyV5.YDSMfH6MNFiK2fA2K
221	ธัญณัฏฐนันธ์	พิทักษ์เผ่า	\N	2016-07-20 14:20:11.636044	2016-09-04 10:50:59.098125	\N	259042	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259042	$2a$10$bCslCwvbbZUvzJXYoqvoUOHP4nL.muc8VjjTVRK2kN0odeDGgeqSa
245	ภาสพิชญ์  	อังคสยาวัฒน์	\N	2016-07-20 14:20:11.698118	2016-09-04 10:50:59.3553	\N	259066	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259066	$2a$10$X5EM2BwUX8O3GnqSTKRWhuSw2PiMPj.oFEUY8UeoXh72AMXsqWazK
247	ชัชพัธ	อัครพงศ์ไพศาล	\N	2016-07-20 14:20:11.702894	2016-09-04 10:50:59.523769	\N	259073	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259073	$2a$10$PvT3NPI7FCzoV4UA/wsk/e1Ry7It6Yx/h94XqM8yDmm/jbTPqWh6K
248	กิตติพัฒน์	สุสัณฐิตพงษ์	\N	2016-07-20 14:20:51.615074	2016-09-04 10:50:59.611459	\N	258001	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258001	$2a$10$wAAbzXIIS.D0OJYImT7WJ.Gmzcl/SOqpvb3v5pXWa27ZOLXeiLcPu
251	จิรชัจ	วัชรพงศ์เสถียร	\N	2016-07-20 14:20:51.63294	2016-09-04 10:50:59.869536	\N	258004	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258004	$2a$10$oZsw8Kl7XMSCUAcv0NKx8e8qe6yUOZyomKSICMzp/q8wllDEKGeT6
254	ธนา	สัจจะธนาพร	\N	2016-07-20 14:20:51.641901	2016-09-04 10:51:00.119972	\N	258007	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258007	$2a$10$xrrE62E0TF/gMWMBIiztGeQFO6vktHieZ9FoQMTnUPRINpWWeYAli
256	ปวิชญา	เกียรติบุญญาฤทธิ์	\N	2016-07-20 14:20:51.64762	2016-09-04 10:51:00.295505	\N	258009	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258009	$2a$10$TjysNGHzSsUU8D5vZEe/Me2L3rgxS.bsi/NdezvNf/Rz6uCWpgfka
259	มังกร	เจนลาภวัฒนกุล	\N	2016-07-20 14:20:51.655869	2016-09-04 10:51:00.535636	\N	258013	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258013	$2a$10$QflSeqowO0kvJFZYwP2WA.idvOweloFNqAy5Zd/i9sMYTkvo9f07u
262	อภิภู                  	ลาภสุทธิเกษม	\N	2016-07-20 14:20:51.664342	2016-09-04 10:51:00.79153	\N	258015	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258015	$2a$10$WAC8brLmwg4kCsPYWEXzvO.YEP20Pmu40OL3MXa2w09CpRMyKDp6m
264	อินภุชงค์   	ปูรณวัฒนกุล	\N	2016-07-20 14:20:51.669929	2016-09-04 10:51:00.959198	\N	258017	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258017	$2a$10$HHFxqUIpt2ZkZsE72xalMeulPQMBUVO7uYWLScIeZfHh2c581vQJO
267	ณฤชล	สูจิฆระ	\N	2016-07-20 14:20:51.678325	2016-09-04 10:51:01.197689	\N	258021	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258021	$2a$10$02QDNfe7yMwjhcFN77Pq2er9LthhbhmQqYPlBNdU8BKLGiKIjgn.m
269	ณิชาภา          	ถิรธนานนท์	\N	2016-07-20 14:20:51.683848	2016-09-04 10:51:01.372886	\N	258023	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258023	$2a$10$WR8TnZrV.x3fP9pf93J7Iu.7U238zH6YjrPlK9DozVOMh6DJCLS4G
272	พรรษชล	จันทร์สว่างกูล	\N	2016-07-20 14:20:51.693221	2016-09-04 10:51:01.625839	\N	258026	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258026	$2a$10$UWfgdofL2bmmaSHAMdNoye9UuXagHmt9P0nPCzYd8dvAAobft/1N6
274	พิชชาพร       	โกฏิมนัสวนิชย์	\N	2016-07-20 14:20:51.698976	2016-09-04 10:51:01.800238	\N	258028	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258028	$2a$10$Bcv0QBDiX8xyKOZpnLrw0uJyubIN7Nw2wSdeC631oY6tIHtc8VNKa
277	ภาสินี	กำเนิดแก้ว	\N	2016-07-20 14:20:51.70782	2016-09-04 10:51:02.054847	\N	258030	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258030	$2a$10$giufq71jCaM5zX9AytJ9vej2v6m.KRPyJxqjEK4hlYIjxvir99YE.
280	สราภาภัทร	ไตรวุฒิ	\N	2016-07-20 14:20:51.71605	2016-09-04 10:51:02.300199	\N	258032	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258032	$2a$10$4vUe9WQOevYWV9d0KFEPH.jFxaTC4Yo2Yo3Yr6wcCG3v0Qug7DIsm
282	จิรัชญา	วราสินธุ์	\N	2016-07-20 14:20:51.72207	2016-09-04 10:51:02.467678	\N	258081	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258081	$2a$10$H0azqIz2SmVR8.NLKPcNTe8Cluo.luuyQrZP25cmHgrD3bw/2CZbi
286	กฤษกร	กู้ทรัพย์	\N	2016-07-20 14:21:06.501651	2016-09-04 10:51:02.763225	\N	258037	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258037	$2a$10$1Cyspe47xu7z5zlMI.AVueNByz4Y38pb9IRtmQmc3fUnQpTi5rnbC
288	ชญาณัฐธนาพล  	ปภาตา	\N	2016-07-20 14:21:06.507659	2016-09-04 10:51:02.928016	\N	258039	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258039	$2a$10$OJeRCAinJAsByeTfk0ki5utQmf/vkoTbouBKcBblhB8GIH0A9a.gi
291	ณัฏฐพัฒน์	ศรีกล่ำพึ่ง	\N	2016-07-20 14:21:06.524307	2016-09-04 10:51:03.185016	\N	258042	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258042	$2a$10$C4jzUDiGNre.6UoLFqJIyezcnBsYDCJs5OecY.CMTbu4RTjZS6cmi
293	นันทิยะ             	ลักขณาภิชนชัช	\N	2016-07-20 14:21:06.531934	2016-09-04 10:51:03.355438	\N	258044	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258044	$2a$10$nznoIAWMHdIoNHVFjCGe6uSHUG.iuNwcvzpWIWrEajKviXUISYra.
296	ปัณณทัต	โฮมไชยะวงศ์	\N	2016-07-20 14:21:06.549579	2016-09-04 10:51:03.609093	\N	258047	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258047	$2a$10$qWyW.SHFYEJuWOSDmKePQOmiyMNtIrzk0JPeSePWzLCBpmRHEXhje
299	สิรภพ	สงวนพันธุ์	\N	2016-07-20 14:21:06.57014	2016-09-04 10:51:03.969929	\N	258050	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258050	$2a$10$ny.a62YybccrnXYOUx.d3.0gdzNL5hG/q71FrsFmYzK.fiD.5GT1i
301	แคทลียา 	สิรศักดิ์ชัยกุล	\N	2016-07-20 14:21:06.579749	2016-09-04 10:51:04.180266	\N	258052	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258052	$2a$10$x6iBHDCb7fAgPBZnP8xV9OyiEpSLGUfcvsMsj2V2TmcqUXdb5fd1K
304	ชัญญานุช      	ตรีราช	\N	2016-07-20 14:21:06.594095	2016-09-04 10:51:04.634819	\N	258054	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258054	$2a$10$.NvMeMB/ASciWzWSqVdsPOthCMoU.70SMdFtA7B56graeDtKN/GCe
305	ญาณาศา	พิพัฒน์สุวรรณ	\N	2016-07-20 14:21:06.60349	2016-09-04 10:51:04.835481	\N	258055	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258055	$2a$10$jFGHohP7hid1DGPv5rpZcuItwIa184kM7rmR3KLkNMlwSp2g2td.W
308	ปพิชญา	หวังเศรษฐกุล	\N	2016-07-20 14:21:06.613296	2016-09-04 10:51:05.138501	\N	258058	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258058	$2a$10$53I9QijN3/FlnUjfpn6sou0S53WjMjQWve68YDaM8fV1jb/b4wFyW
311	พวงชมพู        	ฉัตรอรุณศรีวรา	\N	2016-07-20 14:21:06.623272	2016-09-04 10:51:05.395106	\N	258060	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258060	$2a$10$PND7LKWs..p8acfcAlWXye1UG3x1VidaNyAt0psCdJmgs7/LwPe/q
312	พัณณิน	กิติคุณานนท์	\N	2016-07-20 14:21:06.631099	2016-09-04 10:51:05.492795	\N	258061	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258061	$2a$10$6sXGiuk1HJ/1rwcx69GmwOraswWTDmXFDZmSbV4GMr9K8sRv.BZ6q
313	พีระนันท์	ทรัพย์เย็น	\N	2016-07-20 14:21:06.636974	2016-09-04 10:51:05.587443	\N	258073	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258073	$2a$10$xDf8QTngqqfK/u.ewDpnOOX6YI.uQ8O4oD/4Pf/GjCcsGrkD3ht9u
316	สริญญา	ศิริรัตน์	\N	2016-07-20 14:21:06.647871	2016-09-04 10:51:05.850235	\N	258065	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258065	$2a$10$4Mf5TMz2838dgdZii9.kLeolbCcoXwxr7L2kSoRFWLQIaNidg7uPi
318	อิรวดี               	กุลวิจิตร	\N	2016-07-20 14:21:06.65704	2016-09-04 10:51:06.019829	\N	258067	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258067	$2a$10$y3JvGNM8VZbQvrKp1lGWNekIkBPCD.8noE/7M7B6GDTmwaGSbEEly
321	คุณกร        	จันทโรทัย	\N	2016-07-20 14:21:14.049736	2016-09-04 10:51:06.280864	\N	257001	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257001	$2a$10$FAXWgHUKhLHrtarFLmb6R.1JdZsE.P6N1uXuoH4JoCbM1tZtG6r/6
324	ธนโชติ      	 อิงพงษ์พันธ์	\N	2016-07-20 14:21:14.067732	2016-09-04 10:51:06.537543	\N	257005	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257005	$2a$10$.8bd0rLQ.P9jNNCs9hgn9O0AhMYj4JfOBaIIS0T1loPzbK2zFUq7e
326	พีระพัฒน์    	จำเนียรดำรงการ	\N	2016-07-20 14:21:14.073669	2016-09-04 10:51:06.703925	\N	257007	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257007	$2a$10$f01P5/tUh5qog6c9ugCIpOuNVDZ962/WwkNq2cWhvEW017uY84siq
329	ภูวดล        	 ชุนดี	\N	2016-07-20 14:21:14.097523	2016-09-04 10:51:06.961156	\N	257010	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257010	$2a$10$nKyxL56KQ//CMkw.4q/u9umj57.fB0/qX7x5tqrWns9TzwAu4gV7O
332	อนุสิษฐ์      	ศรีศักราภิคุปต์	\N	2016-07-20 14:21:14.11489	2016-09-04 10:51:07.231924	\N	257013	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257013	$2a$10$5A.ufk2SqsyrpxSVYvFzfeNpBJdVWvIcof2SNNUNmoEGr.4ipmBj2
334	กิรณา          	บุญเต็ม	\N	2016-07-20 14:21:14.128135	2016-09-04 10:51:07.405517	\N	257016	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257016	$2a$10$kfcqLvP/BoflFTi45LTnHu7zYHnn.tVXO7dFOFlGwR8M5JUqChZLa
337	ชนัญธิดา     	 สุคนธมณี	\N	2016-07-20 14:21:14.137005	2016-09-04 10:51:07.656622	\N	257019	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257019	$2a$10$cuJn5DTPwq//kOIH7UK55uBy5hqeq8F784jVEZpIOm8zlV6pyMzaG
339	ณัฏฐณิชา     	รุ่งเรือง	\N	2016-07-20 14:21:14.143549	2016-09-04 10:51:07.832433	\N	257021	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257021	$2a$10$h.59QP08rf3mxP32sf04dOIF0qC7ZxreSIpDiDREaYeCyrUqxerp.
342	นันทภัค       	ศรีกิจเกษมวัฒน์	\N	2016-07-20 14:21:14.158258	2016-09-04 10:51:08.107114	\N	257024	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257024	$2a$10$VisBYwjUWhSsGCnuzZpU7uzGh1mWSW8NtiIA6z/SSmjegMSf/2aii
345	พลอยวลีย์    	 จันทร์คล้าย	\N	2016-07-20 14:21:14.170307	2016-09-04 10:51:08.39016	\N	257027	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257027	$2a$10$3IRcvQzfOCYPgtun3HPTme0wCqiTbMRtcU4qEd/OF4CfFlTOG.laS
348	ลลิตวดี        	ห่านศรีจิตร	\N	2016-07-20 14:21:14.180751	2016-09-04 10:51:08.657046	\N	257030	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257030	$2a$10$0M1Fbq8I7LMzdBKjaOdtBuSOTXkiiq9c3p1P8htTamyzJ5D61a8fq
350	ศุภิสรา        	 เส็งเจริญ	\N	2016-07-20 14:21:14.186501	2016-09-04 10:51:08.821072	\N	257032	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257032	$2a$10$q41qi2NxcocIJVk8Qvzg.OhRtCcMVxvc/GvRNFE6UkfjJScUmz9J2
353	ธนารีย์	ก้วยไข่มุข	\N	2016-07-20 14:21:14.195954	2016-09-04 10:51:09.073938	\N	257068	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257068	$2a$10$Jq0DCdEGdSKEJJXph4MYD.J0t1AA9zd0zuIL.oWEBK/E9mChWYe.2
355	อุณห์	อุณหะจิรังรักษ์	\N	2016-07-20 14:21:14.20438	2016-09-04 10:51:09.24342	\N	259076	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259076	$2a$10$hcgxMhNpFAFpynpzPye4qeyq25GM0Oj3COmkl2z4JTvEMa2HLszAm
359	ธนพัชญ์     	 ไทรทอง	\N	2016-07-20 14:21:21.300717	2016-09-04 10:51:09.508087	\N	257038	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257038	$2a$10$IjgfXIp6AIalovMJSn31m.R7lgoXSxaxoJRq.VrLvJXr58GFmfuu.
362	ปราชญา     	วัฒนกุลเจริญ	\N	2016-07-20 14:21:21.312368	2016-09-04 10:51:09.794623	\N	257042	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257042	$2a$10$vDa6i6xbr0XVhxZa4AOijuxZobfyUEg7qCQi2l209N85yh2FutXs6
364	ภูริวัฒ         	ช้ามะเริง	\N	2016-07-20 14:21:21.320839	2016-09-04 10:51:09.969941	\N	257044	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257044	$2a$10$kw1dlYwLctdeDtfvHKwOe.LW0YMbqdyYW/sCfqqlTqQFalMs/eAxu
366	ศุภพัฒน์    	 อินทรบำรุง	\N	2016-07-20 14:21:21.328875	2016-09-04 10:51:10.216122	\N	257046	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257046	$2a$10$FZGVitVV6ZQUf57dRARVL.3aIboXLx/RG0ipbHsZhu1pdF2.T4Fee
368	สิริวงศ์         	แดงอ่อน	\N	2016-07-20 14:21:21.335491	2016-09-04 10:51:10.37932	\N	257048	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257048	$2a$10$bnpTuiYL9v1AKJFwiDQNkeormnQfS7mqCnt3invulsftSqEpqiJ9C
371	การิตา        	พรรณพัฒน์	\N	2016-07-20 14:21:21.34616	2016-09-04 10:51:10.618659	\N	257051	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257051	$2a$10$rW2qKXd87rGuCXgLzZ6aEOMWBo7uquz2E8JnjuTa8ET9S2R08E4MS
374	ณฤดี         	ธีระกุล	\N	2016-07-20 14:21:21.362181	2016-09-04 10:51:10.854401	\N	257054	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257054	$2a$10$DHqe0kO0wqZDRBDJsX4BfeS/cPsInSfpu6EV40LRVi7ohgXwO6cI.
376	ไปรยา        	รุ่งเรือง	\N	2016-07-20 14:21:21.371366	2016-09-04 10:51:11.010434	\N	257056	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257056	$2a$10$HQhhyFYyH7V0yDtrMyt06udjhiWckfbL4XF6HZRpYxfE5i/lSbR.O
377	พรนภัส      	หงส์จำรัสศิลป์	\N	2016-07-20 14:21:21.37444	2016-09-04 10:51:11.124805	\N	257057	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257057	$2a$10$aS940ChkDNpp4g6JFwrLgu0ksiiB4eP5rPxRyhY5tG/8nTbxLp2uq
379	พิมพ์วรา     	หงษ์วิทยากร	\N	2016-07-20 14:21:21.380265	2016-09-04 10:51:11.278425	\N	257059	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257059	$2a$10$aPZt9mgUwoBPdmsHx1CE1.tQid40C0JjZgLh7G./aJhSX76oqsfwe
381	รัฐวิรา         	รัชย์สิริโสภณ	\N	2016-07-20 14:21:21.389124	2016-09-04 10:51:11.430968	\N	257062	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257062	$2a$10$blWA8/uLqAd8QGoRLdgW3.dOd3hgn0WXZUSwSG3lKoIdMOdp7tF0G
384	สุภัครฐิพา    	อนันตวิรุฬห์	\N	2016-07-20 14:21:21.4008	2016-09-04 10:51:11.676057	\N	257066	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257066	$2a$10$W0MXYkhwJQfw2WN675BY.uDF9MjEvOnbvWPFeC.hV1SgAGMNBTEmO
387	สิรวิชญ์	ศุภมาสหิรัญ	\N	2016-07-20 14:21:21.419531	2016-09-04 10:51:11.90398	\N	257070	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257070	$2a$10$m2kP2yN16J20UoAucvzmQO.U2YpOi3axM8GYAdgnJM1OdjHwrirgW
390	ณัฐพล	ทองอ่อน	\N	2016-07-20 14:21:21.429133	2016-09-04 10:51:12.257687	\N	259075	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259075	$2a$10$NuEgRolwOfKPZmWmC5bjv.wBie3xi2e4X6wCaL6U5NEKTSiAAfXim
392	กฤษฏิ์ศรัณย์	สราญวงศ์	\N	2016-07-20 14:21:30.733205	2016-09-04 10:51:12.488962	\N	256036	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256036	$2a$10$xuuRUg7Umm.utltQbEaY7OK4I2QFruFYsdl/FkqOCqGAAl5.Tlhw.
395	เตชินท์	งามเกียรติขจร	\N	2016-07-20 14:21:30.743344	2016-09-04 10:51:12.803262	\N	256006	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256006	$2a$10$0HOHxk.XlzcX92i7ksRGieiI0tgt5pmP2Y8lBVYkLv5SKCqWaK29e
398	ธีร์กวิน	มะโนสอน	\N	2016-07-20 14:21:30.760042	2016-09-04 10:51:13.116997	\N	256009	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256009	$2a$10$Rb04O9A2.3ZJH93YsWbUMeKk3VqCwcUg/DV2X0iQkZrwzE1WW2LB6
400	พีรพัฒน์	เจษฎาปกรณ์	\N	2016-07-20 14:21:30.76906	2016-09-04 10:51:13.328449	\N	256011	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256011	$2a$10$Lj.1gLrDV4Y94X9qi9zBweFRDd5kNoi792lHCxdBBlQgWUVlH7FPm
402	ศุภกานต์	ศรันย์พานิช	\N	2016-07-20 14:21:30.778799	2016-09-04 10:51:13.542069	\N	256048	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256048	$2a$10$FAKC6JVgIy89j4sAbuc3veBWgfZaP50l85BAPv0hEBvhb5dvPJVzq
405	ชนมน	พรมสุวรรณ	\N	2016-07-20 14:21:30.789012	2016-09-04 10:51:13.871475	\N	256019	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256019	$2a$10$B0flp4XBHvhRgbidful4JOaeJIjATiYcy.rTUiXFG8QcbRKH874Fu
408	นันท์นภัส	สุริยะยรรยง	\N	2016-07-20 14:21:30.798096	2016-09-04 10:51:14.176706	\N	256022	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256022	$2a$10$9MLqIqQYlEaDQQDYNjHrLeTg6aTrddSsIlLp0dQpTSpBCD1TUOKcS
410	ปริยากร	สอาดชูชม	\N	2016-07-20 14:21:30.805064	2016-09-04 10:51:14.336565	\N	256058	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256058	$2a$10$r1LkAol5bVicO4gRR2dfd.tWdcgbVeNpxiU5QqELhgTeE8zxqPhlO
413	พชรมน	วงษ์ศรี	\N	2016-07-20 14:21:30.817556	2016-09-04 10:51:14.589293	\N	256061	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256061	$2a$10$.s1ymIeieE7vC7ep6C27QO82ZUUmMhu6N.FX6rQM13aw6p82KdETW
415	พิริยา	แสงศิลา	\N	2016-07-20 14:21:30.824829	2016-09-04 10:51:14.761831	\N	256027	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256027	$2a$10$IvYF9B4tZYZecjAqauyCbetyz4CSC/VYCJRGoFRSaz6XH2qMlCvES
417	วรวลัญช์	สงวนทรัพย์	\N	2016-07-20 14:21:30.835537	2016-09-04 10:51:14.935833	\N	256031	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256031	$2a$10$fUXKirBKhDjoR/tYX2fd8ucfdZcBobAc/DgrS/51MqeBj1zj6hoSW
420	สมิตานัน	สุขสมัย	\N	2016-07-20 14:21:30.850458	2016-09-04 10:51:15.16349	\N	256032	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256032	$2a$10$Ke/rvCME6f5KEWJz.WMhfOKoEWb/klbyeuCOXwbTGkdQnXSUiOHBy
422	ภาณุวิชญ์	ชุติเดโช	\N	2016-07-20 14:21:30.856549	2016-09-04 10:51:15.32085	\N	259078	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259078	$2a$10$4No8H8vDJ1uShDXwwBh/qOFdRuwh9hLnomLM09e.v4fIGKp6OrDPW
426	ณัฐดนย์	ดีวาจา	\N	2016-07-20 14:21:42.621588	2016-09-04 10:51:15.556126	\N	256037	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256037	$2a$10$GmKP0PFfM48mvrcz8OOEkewGSFm0Lg3htFrdWAT1N4DBtlL6LpmHq
429	ธนวัฒน์	ประเสริฐศักดิ์	\N	2016-07-20 14:21:42.636527	2016-09-04 10:51:15.787824	\N	256008	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256008	$2a$10$X.S5oqJzkEcy3rPoOveDpODIRsETmoDLc.S4EtKlP6RebU/Iw/7LG
430	ปาลิน	ตุงคเศรวงศ์	\N	2016-07-20 14:21:42.640696	2016-09-04 10:51:15.934223	\N	256010	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256010	$2a$10$0.kqVpGoHCaPPlHw3Z5SBe699c0GKlENV4kWcO57D.7t//zLs9rPG
433	ศตพล	ฉันไชย	\N	2016-07-20 14:21:42.658841	2016-09-04 10:51:16.160515	\N	256046	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256046	$2a$10$ryMJtj2y6WoJ2FHpTAysTuZV5j2HWhquLRmYhTl1eg.wet71wVZ8a
435	สกุล	จำเริญรวย	\N	2016-07-20 14:21:42.668971	2016-09-04 10:51:16.315716	\N	256049	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256049	$2a$10$OknDZjJFNSq6jkU0JEf09.9Pfhz56YrVhkW/.cu.mCd/6RvCNi7.2
437	กัลยวัญญ์	มกรกิจวิบูลย์	\N	2016-07-20 14:21:42.675089	2016-09-04 10:51:16.468633	\N	256052	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256052	$2a$10$oBFZ49lYhUgEJnRZ58Y6o.B3z2k/t2HCsNCF3AjbmAKSTbXgVsQF6
440	จิตราภา	ศรีสุวิภา	\N	2016-07-20 14:21:42.689092	2016-09-04 10:51:16.701783	\N	256054	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256054	$2a$10$cIZTiPDTOpNzVhguEj3O4OrY/W.moYUAEGFK4x1E3qL96Ph4k/ydy
442	ณิชาพร	อนันต์ศฤงฆาร	\N	2016-07-20 14:21:42.694824	2016-09-04 10:51:16.854477	\N	256056	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256056	$2a$10$E7NUfPmMeQOMGp6.iGj72u8r2lMssFt.IG2QtsggI9XuJTJhZmmQW
444	บุษกร	อัครคหสิน	\N	2016-07-20 14:21:42.700604	2016-09-04 10:51:17.001496	\N	256023	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256023	$2a$10$ExK71WS6N34GGgkWn/52b.Kewrm3MZ2XNKD5rAeWmO5cBESWOCm0i
445	เปมิศา	อินเทพ	\N	2016-07-20 14:21:42.703829	2016-09-04 10:51:17.077001	\N	256060	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256060	$2a$10$LT0FLWoNuDJQuQfaPqaaDORkJLgcTdo45bBFxWjJ1LY9UI8tGfd3G
447	มนณทิพย์	ดีเลิศ	\N	2016-07-20 14:21:42.71536	2016-09-04 10:51:17.229664	\N	256029	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256029	$2a$10$RlB.xNjMXK.13T8ELr6.feMBKFSBq8ExoYhP2MG9QF.aIiJH7rrWC
449	รติมา	อวิคุณประเสริฐ	\N	2016-07-20 14:21:42.722207	2016-09-04 10:51:17.382387	\N	256030	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256030	$2a$10$5PA/CftUuajUf4jZezIx.uiipbKpAp5VwGQqu9t5uWC7Rolu3shcK
452	ราชาวดี	รวยอริยทรัพย์	\N	2016-07-20 14:21:42.736619	2016-09-04 10:51:17.613187	\N	256069	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256069	$2a$10$0bTTv9RePDcOiRn0hkqB6elml7YUeOnVaLR1Imba2gqFxa9oB1VSe
455	ชวกร 	ลาวัณย์วิสุทธิ์	\N	2016-07-20 14:21:57.365953	2016-09-04 10:51:17.84346	\N	255002	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255002	$2a$10$673ncXSE6SUzenBusg856OsBbMEQbLUBiJ/1Biv9O5DgU6BKgzBzW
457	ณัฏฐ์  	ณ นคร	\N	2016-07-20 14:21:57.381378	2016-09-04 10:51:17.991219	\N	255005	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255005	$2a$10$BMCGtkRdz5LyNO9rwEhEMO8W3gmSEAqFK6rYdwhpDUQ1Pqecr97CS
459	ธัญพิสิษฐ์       	อมตทวีวัฒน์	\N	2016-07-20 14:21:57.387552	2016-09-04 10:51:18.149758	\N	255007	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255007	$2a$10$fpVgHWl8QMe0Ek7GC6wINu/OapR/00TF9dHj70X7yxRr1NoFnWGVi
462	ปุณณัตถ์ 	บุณยศรีสวัสดิ์	\N	2016-07-20 14:21:57.405188	2016-09-04 10:51:18.38145	\N	255048	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255048	$2a$10$AG8z9zRObYz0k/ufCVPQx.Sbnl55E3Svsb6CnClpcUiwZOOZu.l8a
465	ภูวเมศฐ์	กิตติธันยวัฒน์	\N	2016-07-20 14:21:57.421746	2016-09-04 10:51:18.612625	\N	255070	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255070	$2a$10$/RSsgpzPZVflmxg.N3bTye7z4FT0nX.ozDQLsatju.popcXg/wkdC
468	สิทธิผล	อินเทพ	\N	2016-07-20 14:21:57.430673	2016-09-04 10:51:18.847018	\N	255016	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255016	$2a$10$NMsqb.F4umK7OYCgeGTT0.rl7uMRnUhtSyZ05YZfh96FFcOLl7oju
470	เสฏฐวุฒิ        	เมืองพันธ์	\N	2016-07-20 14:21:57.436616	2016-09-04 10:51:19.003545	\N	255054	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255054	$2a$10$r5OmrOJPXthB0usHR2J.dOVn980Xtzmm65B74o22nN/2N2gRRAVke
473	ชนาภา	มณีวงศ์	\N	2016-07-20 14:21:57.451389	2016-09-04 10:51:19.230591	\N	255020	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255020	$2a$10$Fx1zAOvbyIZDuwGS9/27Me.5uXwsvGHL7to8Mf4DvxCB8Vd7nLA8G
475	ธิรดา    	ชาคริยานุโยค	\N	2016-07-20 14:21:57.459443	2016-09-04 10:51:19.393124	\N	255059	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255059	$2a$10$cfeBa761.wMpn4ip593tKevtffPTMosBxF.NC4n5fRDI0dBSvh0aW
478	นฤภร          	พนาสกุลการ	\N	2016-07-20 14:21:57.473201	2016-09-04 10:51:19.629907	\N	255061	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255061	$2a$10$MXccNwC3.mqx0Yr4HwZpsOPp2icnxLFPY6TkfuFphYXReA3LewbaO
480	พิทยาภรณ์	ภัทรพูนสิน	\N	2016-07-20 14:21:57.480179	2016-09-04 10:51:19.793084	\N	255030	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255030	$2a$10$xASSxp1CeIEFo8RTqpVV5.PC8LAp.OjdIDhmY0keif9hqeMdU7m6O
483	วรัฐธภรณ์    	คูณทอง	\N	2016-07-20 14:21:57.492792	2016-09-04 10:51:20.020273	\N	255067	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255067	$2a$10$fggQNUOFl78y5jsJtUcDb.GUbl0V3LwXxXq1RFhKmEr7W.qoAGTn.
485	อรนิภา         	อภิวัฒนานันท์	\N	2016-07-20 14:21:57.49883	2016-09-04 10:51:20.166695	\N	255034	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255034	$2a$10$bb1m74U1KnaTHrSFWFAGS.SYrIv9sBZZ1GoIl9QM1ITKP2YSheuPi
488	ฐาปนกร	นันทิสิงห์	\N	2016-07-20 14:21:57.513955	2016-09-04 10:51:20.391422	\N	258078	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258078	$2a$10$d8spHRB9sakHAy/kLFZhMehHgxrENkzsL2sKi3oA15fnCN73vX01K
490	ณภัทร	จงจิตดังจง	\N	2016-07-20 14:21:57.520042	2016-09-04 10:51:20.545289	\N	258090	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258090	$2a$10$ELAlpIZ2SZBP/B8EBli8i.xkoEgTST1bgfEoQulGseNcGvRLE5GQS
494	ญาณพัฒน์	พูลเทพ	\N	2016-07-20 14:22:07.814798	2016-09-04 10:51:20.775553	\N	255038	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255038	$2a$10$o4OgcDHzL9ZORtHfcE5/G.blK5/DcydKs1YlskUM2wsQgh.vle1zm
495	ณพวีร์	มีศรีสุข	\N	2016-07-20 14:22:07.817891	2016-09-04 10:51:20.928043	\N	255039	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255039	$2a$10$07nRBGDNAkaJtmRnGxRob.x7CMlmyUukwjgEP0wWNbtA4WtHlimbu
498	ทายาท	จำเริญรวย	\N	2016-07-20 14:22:07.835461	2016-09-04 10:51:21.149959	\N	255042	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255042	$2a$10$L2ZT3M/nnGkeaP27Hvt0S.ubwg2fRzEEOIwD055REXB5or06Ewyea
500	ธนทัต	ชินวัฒนโชติ	\N	2016-07-20 14:22:07.847992	2016-09-04 10:51:21.302371	\N	255006	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255006	$2a$10$YPmRmIX8UvrpvWH2jZrx..wAJp3x0xtJfpFbJURSZ/GKASyxhCEpW
502	นิพิฐพนธ์      	อมตทวีวัฒน์	\N	2016-07-20 14:22:07.862822	2016-09-04 10:51:21.450747	\N	255010	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255010	$2a$10$IKQz03/B04ICN/GuQkaqc.Q8ZAdVLywQ88YIogtmxoq5VZ3A5qd.O
505	พงศธร	เจนโกศล	\N	2016-07-20 14:22:07.871302	2016-09-04 10:51:21.686126	\N	256072	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256072	$2a$10$Fx8vk9gT47LpSdkvBfU9gezu8BokUtpLNhqsrIeYj9hAwjzvtJhBG
507	วราวุฒิ                  	มาเจริญ	\N	2016-07-20 14:22:07.879193	2016-09-04 10:51:21.837283	\N	255053	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255053	$2a$10$95oieuHqH0YSHG/.B8vFSO1nWpC8E4RO2Bbyk04wqG83M.nxPWKI6
510	ชิสากัญญ์	ตั้งปรีชาพาณิชย์	\N	2016-07-20 14:22:07.890702	2016-09-04 10:51:22.070216	\N	255072	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255072	$2a$10$MD33GE1l6RFajpSxgIyAb..0dArnRruY5t1h5ymntdcKTkCYtQNU2
512	ณิชารัศม์	ศักดิ์เกษมรัตน์	\N	2016-07-20 14:22:07.904129	2016-09-04 10:51:22.234651	\N	255055	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255055	$2a$10$qcj7eDAF.DKUwJ5HB1rpMOmwT6bufY58F/lDAiLBmvNIrByIJlYgu
513	ทัชชญา	ลาภสุทธิเกษม	\N	2016-07-20 14:22:07.90923	2016-09-04 10:51:22.307463	\N	255021	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255021	$2a$10$PHUIVu58QkH3ZcSoZU0Hju8fPxeejbAvK4FGhFd0A7xN5jPRffXxu
516	บุณยาพร      	เสริมบุญ	\N	2016-07-20 14:22:07.920035	2016-09-04 10:51:22.530703	\N	255024	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255024	$2a$10$lUAKoNl.ZT/myq.1hfcUqusENYSXHZmaJpK1ZpoRQkE8rI9Z3O2sC
519	ปิ่นมณี	คุณากรกุล	\N	2016-07-20 14:22:07.937129	2016-09-04 10:51:22.762606	\N	255026	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255026	$2a$10$EwzxHZetaS9ezqriYXqG7Oz4J42L7MdffbJKlWKSTZW9rU.og5z5y
521	พรนับพัน      	เกรียงวัฒนพงษ์	\N	2016-07-20 14:22:07.942699	2016-09-04 10:51:22.913418	\N	255027	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255027	$2a$10$OvrMvzLPVFsInAPRfFCxAe7AdNtXMcoQ.jiHrA6KP.XapKv6QUywC
524	มนัสนันท์	ศรีศักราภิคุปต์	\N	2016-07-20 14:22:07.951306	2016-09-04 10:51:23.137832	\N	255029	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255029	$2a$10$uoLjAz119zfjiC2Hcg8UEO6aTCYodxL5REbRYCj5p0bjgFptZuTe6
527	ณภัค	เกิดเจริญ	\N	2016-07-20 14:22:07.961847	2016-09-04 10:51:23.367476	\N	259079	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259079	$2a$10$EVcPpdd4a8tik5vZhJqjauZZ0chO1NAYoeQfkooF0vQC3PFfYto/.
530	ฐิตินันทร์	แซ่ลี้	\N	2016-07-20 14:22:18.972951	2016-09-04 10:51:23.519493	\N	254037	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254037	$2a$10$Q7V7UOCHQaxDSS0YKORNH..ldDtAHIDr4epHMf4s8xT./i0J5lKpK
533	แทนคุณ	วิเศษฤทธิ์	\N	2016-07-20 14:22:18.984354	2016-09-04 10:51:23.755687	\N	256092	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256092	$2a$10$W0rDENSl7sGaJ5QBJYz5sup5n38ElPQflMlejv6XXQ/X0N2Dul/H.
535	นนท์นรุตม์	สุขสงญาติ	\N	2016-07-20 14:22:18.992536	2016-09-04 10:51:23.906045	\N	254043	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254043	$2a$10$6gwEgA1/JsQs82hWq/XExO.VxSuFghA6VSvYGTMOE.2roMbk5mmj6
538	วิชญะ	ศักดิ์อิสระพงศ์	\N	2016-07-20 14:22:19.007441	2016-09-04 10:51:24.135365	\N	254049	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254049	$2a$10$ELTwl7PiAAcwwp1TvpQch.6xbDozIv8ZB3LTwqS9clmsBAGJn4sjm
540	โสภณวิชญ์	โธนบุตร	\N	2016-07-20 14:22:19.018593	2016-09-04 10:51:24.289196	\N	254053	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254053	$2a$10$PzMLrte1AxS7Ej4lMhRxwuQP56liWelfG4ZItXCKQADkbithmUtZu
544	ณภัทร	อุดมธรรมรักษ์	\N	2016-07-20 14:22:19.033837	2016-09-04 10:51:24.512047	\N	254022	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254022	$2a$10$w.9cCkESltwv7toeMpu83.x9Lwl7NBL9UvFOd8Hgvyu4nH1IkSERO
546	ณัฐนันท์	เรี่ยมประเสริฐ	\N	2016-07-20 14:22:19.04366	2016-09-04 10:51:24.668483	\N	254059	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254059	$2a$10$p5Eqhj/KiKPiPcylRqENR.S.yIpyxFZ3XZ6qIIXzE9mKXU0HyLKt.
549	ธัมมณัช	เลิศวิจิตรจรัส	\N	2016-07-20 14:22:19.054781	2016-09-04 10:51:24.895954	\N	254028	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254028	$2a$10$HC9s12gN0miFRuN5jptTKOuUp.UPWIMUOaRHM9QVLpbjKPi0GZkUi
552	ปาลิตา 	ศรีสวัสดิ์	\N	2016-07-20 14:22:19.066811	2016-09-04 10:51:25.126339	\N	254064	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254064	$2a$10$33tt0VqiA4ymBuPAfV3ale6498Kz.YcLG8f2SS2EVBfaBYHaksmOm
554	ศรีกร	อินต๊ะสาน	\N	2016-07-20 14:22:19.074362	2016-09-04 10:51:25.277533	\N	256088	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256088	$2a$10$b2/ko.CNbRqa9AE4k5C3luVWNSbHHkKRkkClSdFr7fUu9x9gaTYRO
557	ณัฐพัฒน์	บุญสม	\N	2016-07-20 14:22:19.088415	2016-09-04 10:51:25.508034	\N	257076	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257076	$2a$10$ejjgJ4.UrOepMMtH1.Zpne1hXjK2sMAII5ztjPkMSBEYxvsq6OHMS
528	ไกรพิชญ์	พรชลิตกิตติพร	\N	2016-07-20 14:22:18.959644	2016-09-04 10:51:25.667691	\N	254004	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254004	$2a$10$K7CF7baYPjlta7IJtgtgsO1bzyjRzs4c2f9OGCQhpMADu2jeIwWXO
560	กฤติณ	พัชนี	\N	2016-07-20 14:25:13.4764	2016-09-04 10:51:25.90659	\N	254001	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254001	$2a$10$O6V1DKA2t0gjow0J7K4CxOIOHWL.j6BCdQGbhXMcIm5wsZ7uu8Ohe
562	ณัฐกิตติ์	ฝางแก้ว	\N	2016-07-20 14:25:13.489338	2016-09-04 10:51:26.061686	\N	254038	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254038	$2a$10$WF/QIOAkHvUTSsuHCnT.rOkv1Tr5BB0K0UjUYxF1ebWvMbJ8Q3tPu
564	ธนบดี	อิทธิชัยวัฒนกุล	\N	2016-07-20 14:25:13.495186	2016-09-04 10:51:26.213957	\N	254008	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254008	$2a$10$nPLGRPy2u2XZkzG2/T4s6uwZdCRgHgddRiS/58MFDsVdlgCbr.Iau
567	ปวีร์	ลักขณาภิชนชัช	\N	2016-07-20 14:25:13.504082	2016-09-04 10:51:26.446047	\N	254011	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254011	$2a$10$sn7qEfkvjDaZcY/ROiXrSe0bdXmoew3XUuidepGLdbvO30FTms/Pe
570	วิชญพงศ์	ชั่งดวงจิตร์	\N	2016-07-20 14:25:13.514599	2016-09-04 10:51:26.677488	\N	254013	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254013	$2a$10$nv8kmbGPAg82CYtsvDWwL.VS2SqJy7OveqsudYOs5NYBOYAxlYlAO
572	สถิตคุณ  	ตระกูลชัยรัตน์	\N	2016-07-20 14:25:13.520515	2016-09-04 10:51:26.830265	\N	254015	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254015	$2a$10$lkiKoRWHNre9vZLQas.1WuXXYqpVPDDLBsjdkQfdmgz0ShErOSsE2
575	กัญญาณัฏฐ์	ศรีกล่ำพึ่ง	\N	2016-07-20 14:25:13.530308	2016-09-04 10:51:27.065708	\N	254019	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254019	$2a$10$kFsfOsBXu7x5LxwDeX09IedHrcEYRkmT0L9wIhARcpj0NGDryQsR6
577	เกตุจินดา	ศิริรัตนประเสริฐ	\N	2016-07-20 14:25:13.53644	2016-09-04 10:51:27.221037	\N	255077	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255077	$2a$10$VH86OhE2wgGMqlhOdHJrY.gAZZ5efPpMsGgkuWUJOJTwr6eR0t71K
607	man	naja	\N	2017-01-28 11:06:55.968219	2017-01-28 11:06:55.968219	\N	12345	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ddd	\N	12345	$2a$10$NgZHESvEs/H6Dr1FJgIRPuDTjsp3L51CP1fHeRfN3GY2IEiXf0Elu
608	มะโรง	มะเส็ง	\N	2017-01-28 11:07:03.984054	2017-01-28 11:07:03.984054		12345	\N		\N										เด็กชาย	\N	12345	$2a$10$EEElMAIGjCsADC8jIcSqNOqfnYGvMX5Oofh5Et48gDP3vMVQ/hKZ6
\.


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('students_id_seq', 609, true);


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY subjects (id, name, created_at, updated_at, code, hour_per_year, course_list_id, credit, status) FROM stdin;
1	ภาษาไทย 1	2016-09-25 03:17:31.467218	2016-10-28 14:53:03.886273	ท11101	200	1	3	วิชาหลัก
3	วิทยาศาสตร์ 1	2016-10-01 16:31:33.825206	2016-10-28 14:53:03.88984	ว11101	80	1	3	วิชาหลัก
5	สังคมศึกษา 1	2016-10-29 15:26:06.774481	2016-10-30 17:42:40.55882	ส11101	80	1	3	วิชาหลัก
2	คณิตศาสตร์ 1	2016-09-30 16:14:27.505148	2016-11-06 04:19:50.615878	ค11101	200	1	3	วิชาหลัก
7	ภาษาไทย	2017-01-29 10:44:52.712768	2017-01-29 10:44:52.712768	ท311101	200	28	3	วิชาหลัก
8	ภาษาอังกฤษ	2017-01-29 10:50:12.880062	2017-01-29 10:50:12.880062	อ311101	200	28	3	วิชาหลัก
\.


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('subjects_id_seq', 8, true);


--
-- Data for Name: teacher_courses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY teacher_courses (id, teacher_id, created_at, updated_at, subject_id) FROM stdin;
3	9	2016-10-29 10:19:08.273482	2016-10-29 10:19:08.273482	1
5	9	2016-10-29 12:27:39.081562	2016-10-29 12:27:39.081562	3
18	9	2016-10-30 04:42:52.407779	2016-10-30 04:42:52.407779	2
20	9	2016-10-30 04:50:21.225521	2016-10-30 04:50:21.225521	6
\.


--
-- Name: teacher_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('teacher_courses_id_seq', 20, true);


--
-- Data for Name: teacher_rooms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY teacher_rooms (id, teacher_id, room_id, created_at, updated_at, status) FROM stdin;
2	9	1	2016-12-10 09:47:38.074631	2016-12-11 06:11:51.015841	t
\.


--
-- Name: teacher_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('teacher_rooms_id_seq', 6, true);


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY teachers (id, first_name, last_name, created_at, updated_at, username, password_digest, status, resign, prefix) FROM stdin;
10	คณิน	มาโนช	2016-10-23 13:44:49.289328	2016-10-29 09:52:31.342018	kanin	$2a$10$7DxeliijFVmSJRl6XcW9tePI0zH1LAJGrG6scrx1jtp19lFPnUiuy	ceo	t	\N
12	นันทิพัฒน์	พลบดี	2016-10-24 05:34:30.152819	2016-10-29 10:03:53.171633	mannakub1	$2a$10$lVE86e4ZNWepnvWIYKAWfOmU5qnW8WzjbKqWuRGjrx9svuLaOBCmy	teacher	f	\N
13	สุจินันท์	แสนศิริมงคล	2016-11-07 10:06:33.883217	2016-11-07 10:10:00.448614	MiEZaa	$2a$10$f0wTXVuKMbIYi0wPvGnoAO.0.SN.8k71KPsEt2UTXQ04x1buf8TAa	super user	t	\N
9	นันทิพัฒน์	พลบดี	2016-10-20 13:56:33.403114	2016-12-11 09:33:58.992311	mannakub	$2a$10$EraqD7mT9w6X7iDLn/8njOJvWbX3z1BHlTCKwWuUyqqqSgcrbJaqW	teacher	t	\N
1	อภิเษก	หงษ์วิทยากร	2016-09-04 08:50:47.969239	2017-02-06 06:29:43.941822	canet	$2a$10$NEwdAXEkSFCFGT2DJV0PN.6a9sOrh6aUsYb9JVYObBY3L94Qu09bO	super user	t	อาจารย์
\.


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('teachers_id_seq', 13, true);


--
-- Data for Name: year_rooms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY year_rooms (id, name, created_at, updated_at) FROM stdin;
2	2559	2016-11-05 14:47:49.908471	2016-11-05 14:47:49.908471
3	2538	2016-12-10 07:11:50.764798	2016-12-10 07:11:50.764798
4	2558	2017-01-24 13:48:02.268781	2017-01-24 13:48:02.268781
16	2560	2017-02-06 06:16:02.644622	2017-02-06 06:16:02.644622
\.


--
-- Name: year_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('year_rooms_id_seq', 16, true);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: adults_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY adults
    ADD CONSTRAINT adults_pkey PRIMARY KEY (id);


--
-- Name: api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (id);


--
-- Name: course_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY course_lists
    ADD CONSTRAINT course_lists_pkey PRIMARY KEY (id);


--
-- Name: course_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY course_rooms
    ADD CONSTRAINT course_rooms_pkey PRIMARY KEY (id);


--
-- Name: courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: father_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY father_lists
    ADD CONSTRAINT father_lists_pkey PRIMARY KEY (id);


--
-- Name: guardians_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardians
    ADD CONSTRAINT guardians_pkey PRIMARY KEY (id);


--
-- Name: mother_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mother_lists
    ADD CONSTRAINT mother_lists_pkey PRIMARY KEY (id);


--
-- Name: rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: student_course_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY student_course_lists
    ADD CONSTRAINT student_course_lists_pkey PRIMARY KEY (id);


--
-- Name: student_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY student_rooms
    ADD CONSTRAINT student_rooms_pkey PRIMARY KEY (id);


--
-- Name: student_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY student_subjects
    ADD CONSTRAINT student_subjects_pkey PRIMARY KEY (id);


--
-- Name: students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: teacher_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY teacher_courses
    ADD CONSTRAINT teacher_courses_pkey PRIMARY KEY (id);


--
-- Name: teacher_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY teacher_rooms
    ADD CONSTRAINT teacher_rooms_pkey PRIMARY KEY (id);


--
-- Name: teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: year_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY year_rooms
    ADD CONSTRAINT year_rooms_pkey PRIMARY KEY (id);


--
-- Name: index_api_keys_on_access_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_api_keys_on_access_token ON api_keys USING btree (access_token);


--
-- Name: index_api_keys_on_student_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_api_keys_on_student_id ON api_keys USING btree (student_id);


--
-- Name: index_student_rooms_on_room_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_student_rooms_on_room_id ON student_rooms USING btree (room_id);


--
-- Name: index_student_rooms_on_student_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_student_rooms_on_student_id ON student_rooms USING btree (student_id);


--
-- Name: index_teacher_rooms_on_room_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_teacher_rooms_on_room_id ON teacher_rooms USING btree (room_id);


--
-- Name: index_teacher_rooms_on_teacher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_teacher_rooms_on_teacher_id ON teacher_rooms USING btree (teacher_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_0cbbeee5fd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY student_rooms
    ADD CONSTRAINT fk_rails_0cbbeee5fd FOREIGN KEY (student_id) REFERENCES students(id);


--
-- Name: fk_rails_5b59f33d87; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY student_rooms
    ADD CONSTRAINT fk_rails_5b59f33d87 FOREIGN KEY (room_id) REFERENCES rooms(id);


--
-- Name: fk_rails_f034c58d1b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY teacher_rooms
    ADD CONSTRAINT fk_rails_f034c58d1b FOREIGN KEY (room_id) REFERENCES rooms(id);


--
-- Name: fk_rails_fe6ab62ca8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY teacher_rooms
    ADD CONSTRAINT fk_rails_fe6ab62ca8 FOREIGN KEY (teacher_id) REFERENCES teachers(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM sunday;
GRANT ALL ON SCHEMA public TO sunday;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

