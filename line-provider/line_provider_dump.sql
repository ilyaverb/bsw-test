--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

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
-- Name: aerich; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aerich (
    id integer NOT NULL,
    version character varying(255) NOT NULL,
    app character varying(100) NOT NULL,
    content jsonb NOT NULL
);


ALTER TABLE public.aerich OWNER TO postgres;

--
-- Name: aerich_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aerich_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aerich_id_seq OWNER TO postgres;

--
-- Name: aerich_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aerich_id_seq OWNED BY public.aerich.id;


--
-- Name: eventmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eventmodel (
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    id uuid NOT NULL,
    coefficient numeric(4,2) DEFAULT 1 NOT NULL,
    deadline timestamp with time zone,
    state character varying(1) DEFAULT '1'::character varying NOT NULL
);


ALTER TABLE public.eventmodel OWNER TO postgres;

--
-- Name: COLUMN eventmodel.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.eventmodel.state IS 'NEW: 1\nFINISHED_WIN: 2\nFINISHED_LOSE: 3';


--
-- Name: aerich id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aerich ALTER COLUMN id SET DEFAULT nextval('public.aerich_id_seq'::regclass);


--
-- Data for Name: aerich; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aerich (id, version, app, content) FROM stdin;
1	0_20241024144512_init.py	models	{"models.Aerich": {"app": "models", "name": "models.Aerich", "table": "aerich", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": null, "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": true, "field_type": "IntField", "constraints": {"ge": -2147483648, "le": 2147483647}, "description": null, "python_type": "int", "db_field_types": {"": "INT"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "version", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "version", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 255}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(255)"}}, {"name": "app", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "app", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 100}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(100)"}}, {"name": "content", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "content", "docstring": null, "generated": false, "field_type": "JSONField", "constraints": {}, "description": null, "python_type": "Union[dict, list]", "db_field_types": {"": "JSON", "mssql": "NVARCHAR(MAX)", "oracle": "NCLOB", "postgres": "JSONB"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}, "models.EventModel": {"app": "models", "name": "models.EventModel", "table": "eventmodel", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": "<function uuid.uuid4>", "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "created_at", "unique": false, "default": null, "indexed": false, "auto_now": false, "nullable": true, "db_column": "created_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "updated_at", "unique": false, "default": null, "indexed": false, "auto_now": true, "nullable": true, "db_column": "updated_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "coefficient", "unique": false, "default": 1.0, "indexed": false, "nullable": false, "db_column": "coefficient", "docstring": null, "generated": false, "field_type": "DecimalField", "constraints": {}, "description": null, "python_type": "decimal.Decimal", "db_field_types": {"": "DECIMAL(4,2)", "sqlite": "VARCHAR(40)"}}, {"name": "deadline", "unique": false, "default": null, "indexed": false, "auto_now": false, "nullable": true, "db_column": "deadline", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {}, "description": null, "python_type": "datetime.datetime", "auto_now_add": false, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "state", "unique": false, "default": "EventState.NEW", "indexed": false, "nullable": false, "db_column": "state", "docstring": null, "generated": false, "field_type": "CharEnumFieldInstance", "constraints": {"max_length": 1}, "description": "NEW: 1\\nFINISHED_WIN: 2\\nFINISHED_LOSE: 3", "python_type": "str", "db_field_types": {"": "VARCHAR(1)"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}}
2	1_20241024151217_None.py	models	{"models.Aerich": {"app": "models", "name": "models.Aerich", "table": "aerich", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": null, "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": true, "field_type": "IntField", "constraints": {"ge": -2147483648, "le": 2147483647}, "description": null, "python_type": "int", "db_field_types": {"": "INT"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "version", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "version", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 255}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(255)"}}, {"name": "app", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "app", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 100}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(100)"}}, {"name": "content", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "content", "docstring": null, "generated": false, "field_type": "JSONField", "constraints": {}, "description": null, "python_type": "Union[dict, list]", "db_field_types": {"": "JSON", "mssql": "NVARCHAR(MAX)", "oracle": "NCLOB", "postgres": "JSONB"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}, "models.EventModel": {"app": "models", "name": "models.EventModel", "table": "eventmodel", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": "<function uuid.uuid4>", "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "created_at", "unique": false, "default": null, "indexed": false, "auto_now": false, "nullable": true, "db_column": "created_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "updated_at", "unique": false, "default": null, "indexed": false, "auto_now": true, "nullable": true, "db_column": "updated_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "coefficient", "unique": false, "default": 1.0, "indexed": false, "nullable": false, "db_column": "coefficient", "docstring": null, "generated": false, "field_type": "DecimalField", "constraints": {}, "description": null, "python_type": "decimal.Decimal", "db_field_types": {"": "DECIMAL(4,2)", "sqlite": "VARCHAR(40)"}}, {"name": "deadline", "unique": false, "default": null, "indexed": false, "auto_now": false, "nullable": true, "db_column": "deadline", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {}, "description": null, "python_type": "datetime.datetime", "auto_now_add": false, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "state", "unique": false, "default": "EventState.NEW", "indexed": false, "nullable": false, "db_column": "state", "docstring": null, "generated": false, "field_type": "CharEnumFieldInstance", "constraints": {"max_length": 1}, "description": "NEW: 1\\nFINISHED_WIN: 2\\nFINISHED_LOSE: 3", "python_type": "str", "db_field_types": {"": "VARCHAR(1)"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}}
3	2_20241024232442_None.py	models	{"models.Aerich": {"app": "models", "name": "models.Aerich", "table": "aerich", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": null, "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": true, "field_type": "IntField", "constraints": {"ge": -2147483648, "le": 2147483647}, "description": null, "python_type": "int", "db_field_types": {"": "INT"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "version", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "version", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 255}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(255)"}}, {"name": "app", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "app", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 100}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(100)"}}, {"name": "content", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "content", "docstring": null, "generated": false, "field_type": "JSONField", "constraints": {}, "description": null, "python_type": "Union[dict, list]", "db_field_types": {"": "JSON", "mssql": "NVARCHAR(MAX)", "oracle": "NCLOB", "postgres": "JSONB"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}, "models.EventModel": {"app": "models", "name": "models.EventModel", "table": "eventmodel", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": "<function uuid.uuid4>", "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "created_at", "unique": false, "default": null, "indexed": false, "auto_now": false, "nullable": true, "db_column": "created_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "updated_at", "unique": false, "default": null, "indexed": false, "auto_now": true, "nullable": true, "db_column": "updated_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "coefficient", "unique": false, "default": 1.0, "indexed": false, "nullable": false, "db_column": "coefficient", "docstring": null, "generated": false, "field_type": "DecimalField", "constraints": {}, "description": null, "python_type": "decimal.Decimal", "db_field_types": {"": "DECIMAL(4,2)", "sqlite": "VARCHAR(40)"}}, {"name": "deadline", "unique": false, "default": null, "indexed": false, "auto_now": false, "nullable": true, "db_column": "deadline", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {}, "description": null, "python_type": "datetime.datetime", "auto_now_add": false, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "state", "unique": false, "default": "EventState.NEW", "indexed": false, "nullable": false, "db_column": "state", "docstring": null, "generated": false, "field_type": "CharEnumFieldInstance", "constraints": {"max_length": 1}, "description": "NEW: 1\\nFINISHED_WIN: 2\\nFINISHED_LOSE: 3", "python_type": "str", "db_field_types": {"": "VARCHAR(1)"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}}
\.


--
-- Data for Name: eventmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eventmodel (created_at, updated_at, id, coefficient, deadline, state) FROM stdin;
2024-10-24 23:25:53.99+00	2024-10-24 23:26:25.888964+00	cf54d277-33bc-45a5-b622-c3f73aa296ab	0.00	2024-10-24 23:30:53.99+00	1
2024-10-24 15:02:26.177+00	2024-10-24 23:36:24.468673+00	408cad58-21b0-4aba-a624-a3223b591617	0.00	2024-10-25 15:02:26.177+00	3
2024-10-24 23:25:53.99+00	2024-10-24 23:40:49.45127+00	1ecac239-2050-43cc-bdfb-1bc2f34b122e	1.50	2024-10-24 23:55:53.99+00	2
2024-10-24 23:25:53.99+00	2024-10-25 00:36:36.123443+00	6aca84b7-19b8-4000-8dad-1bf5f4d1d3a7	1.50	2024-10-24 23:55:53.99+00	2
\.


--
-- Name: aerich_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aerich_id_seq', 3, true);


--
-- Name: aerich aerich_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aerich
    ADD CONSTRAINT aerich_pkey PRIMARY KEY (id);


--
-- Name: eventmodel eventmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventmodel
    ADD CONSTRAINT eventmodel_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

