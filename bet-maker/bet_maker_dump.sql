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
-- Name: betmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.betmodel (
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    id uuid NOT NULL,
    amount numeric(14,2) NOT NULL,
    event_id uuid NOT NULL,
    state character varying(12) DEFAULT 'not_finished'::character varying
);


ALTER TABLE public.betmodel OWNER TO postgres;

--
-- Name: COLUMN betmodel.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.betmodel.state IS 'NOT_FINISHED: not_finished\nWIN: win\nLOSE: lose';


--
-- Name: aerich id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aerich ALTER COLUMN id SET DEFAULT nextval('public.aerich_id_seq'::regclass);


--
-- Data for Name: aerich; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aerich (id, version, app, content) FROM stdin;
1	0_20241024144130_init.py	models	{"models.Aerich": {"app": "models", "name": "models.Aerich", "table": "aerich", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": null, "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": true, "field_type": "IntField", "constraints": {"ge": -2147483648, "le": 2147483647}, "description": null, "python_type": "int", "db_field_types": {"": "INT"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "version", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "version", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 255}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(255)"}}, {"name": "app", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "app", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 100}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(100)"}}, {"name": "content", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "content", "docstring": null, "generated": false, "field_type": "JSONField", "constraints": {}, "description": null, "python_type": "Union[dict, list]", "db_field_types": {"": "JSON", "mssql": "NVARCHAR(MAX)", "oracle": "NCLOB", "postgres": "JSONB"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}, "models.BetModel": {"app": "models", "name": "models.BetModel", "table": "betmodel", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": "<function uuid.uuid4>", "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "created_at", "unique": false, "default": null, "indexed": false, "auto_now": false, "nullable": true, "db_column": "created_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "updated_at", "unique": false, "default": null, "indexed": false, "auto_now": true, "nullable": true, "db_column": "updated_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "amount", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "amount", "docstring": null, "generated": false, "field_type": "DecimalField", "constraints": {}, "description": null, "python_type": "decimal.Decimal", "db_field_types": {"": "DECIMAL(14,2)", "sqlite": "VARCHAR(40)"}}, {"name": "event_id", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "event_id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, {"name": "state", "unique": false, "default": "BetState.NOT_FINISHED", "indexed": false, "nullable": true, "db_column": "state", "docstring": null, "generated": false, "field_type": "CharEnumFieldInstance", "constraints": {"max_length": 12}, "description": "NOT_FINISHED: not_finished\\nWIN: win\\nLOSE: lose", "python_type": "str", "db_field_types": {"": "VARCHAR(12)"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}}
2	1_20241024151737_None.py	models	{"models.Aerich": {"app": "models", "name": "models.Aerich", "table": "aerich", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": null, "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": true, "field_type": "IntField", "constraints": {"ge": -2147483648, "le": 2147483647}, "description": null, "python_type": "int", "db_field_types": {"": "INT"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "version", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "version", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 255}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(255)"}}, {"name": "app", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "app", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 100}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(100)"}}, {"name": "content", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "content", "docstring": null, "generated": false, "field_type": "JSONField", "constraints": {}, "description": null, "python_type": "Union[dict, list]", "db_field_types": {"": "JSON", "mssql": "NVARCHAR(MAX)", "oracle": "NCLOB", "postgres": "JSONB"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}, "models.BetModel": {"app": "models", "name": "models.BetModel", "table": "betmodel", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": "<function uuid.uuid4>", "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "created_at", "unique": false, "default": null, "indexed": false, "auto_now": false, "nullable": true, "db_column": "created_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "updated_at", "unique": false, "default": null, "indexed": false, "auto_now": true, "nullable": true, "db_column": "updated_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "amount", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "amount", "docstring": null, "generated": false, "field_type": "DecimalField", "constraints": {}, "description": null, "python_type": "decimal.Decimal", "db_field_types": {"": "DECIMAL(14,2)", "sqlite": "VARCHAR(40)"}}, {"name": "event_id", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "event_id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, {"name": "state", "unique": false, "default": "BetState.NOT_FINISHED", "indexed": false, "nullable": true, "db_column": "state", "docstring": null, "generated": false, "field_type": "CharEnumFieldInstance", "constraints": {"max_length": 12}, "description": "NOT_FINISHED: not_finished\\nWIN: win\\nLOSE: lose", "python_type": "str", "db_field_types": {"": "VARCHAR(12)"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}}
35	2_20241024152210_None.py	models	{"models.Aerich": {"app": "models", "name": "models.Aerich", "table": "aerich", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": null, "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": true, "field_type": "IntField", "constraints": {"ge": -2147483648, "le": 2147483647}, "description": null, "python_type": "int", "db_field_types": {"": "INT"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "version", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "version", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 255}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(255)"}}, {"name": "app", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "app", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 100}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(100)"}}, {"name": "content", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "content", "docstring": null, "generated": false, "field_type": "JSONField", "constraints": {}, "description": null, "python_type": "Union[dict, list]", "db_field_types": {"": "JSON", "mssql": "NVARCHAR(MAX)", "oracle": "NCLOB", "postgres": "JSONB"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}, "models.BetModel": {"app": "models", "name": "models.BetModel", "table": "betmodel", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": "<function uuid.uuid4>", "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "created_at", "unique": false, "default": null, "indexed": false, "auto_now": false, "nullable": true, "db_column": "created_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "updated_at", "unique": false, "default": null, "indexed": false, "auto_now": true, "nullable": true, "db_column": "updated_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "amount", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "amount", "docstring": null, "generated": false, "field_type": "DecimalField", "constraints": {}, "description": null, "python_type": "decimal.Decimal", "db_field_types": {"": "DECIMAL(14,2)", "sqlite": "VARCHAR(40)"}}, {"name": "event_id", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "event_id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, {"name": "state", "unique": false, "default": "BetState.NOT_FINISHED", "indexed": false, "nullable": true, "db_column": "state", "docstring": null, "generated": false, "field_type": "CharEnumFieldInstance", "constraints": {"max_length": 12}, "description": "NOT_FINISHED: not_finished\\nWIN: win\\nLOSE: lose", "python_type": "str", "db_field_types": {"": "VARCHAR(12)"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}}
68	3_20241024152424_None.py	models	{"models.Aerich": {"app": "models", "name": "models.Aerich", "table": "aerich", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": null, "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": true, "field_type": "IntField", "constraints": {"ge": -2147483648, "le": 2147483647}, "description": null, "python_type": "int", "db_field_types": {"": "INT"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "version", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "version", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 255}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(255)"}}, {"name": "app", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "app", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 100}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(100)"}}, {"name": "content", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "content", "docstring": null, "generated": false, "field_type": "JSONField", "constraints": {}, "description": null, "python_type": "Union[dict, list]", "db_field_types": {"": "JSON", "mssql": "NVARCHAR(MAX)", "oracle": "NCLOB", "postgres": "JSONB"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}, "models.BetModel": {"app": "models", "name": "models.BetModel", "table": "betmodel", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": "<function uuid.uuid4>", "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "created_at", "unique": false, "default": null, "indexed": false, "auto_now": false, "nullable": true, "db_column": "created_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "updated_at", "unique": false, "default": null, "indexed": false, "auto_now": true, "nullable": true, "db_column": "updated_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "amount", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "amount", "docstring": null, "generated": false, "field_type": "DecimalField", "constraints": {}, "description": null, "python_type": "decimal.Decimal", "db_field_types": {"": "DECIMAL(14,2)", "sqlite": "VARCHAR(40)"}}, {"name": "event_id", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "event_id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, {"name": "state", "unique": false, "default": "BetState.NOT_FINISHED", "indexed": false, "nullable": true, "db_column": "state", "docstring": null, "generated": false, "field_type": "CharEnumFieldInstance", "constraints": {"max_length": 12}, "description": "NOT_FINISHED: not_finished\\nWIN: win\\nLOSE: lose", "python_type": "str", "db_field_types": {"": "VARCHAR(12)"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}}
69	4_20241024162339_None.py	models	{"models.Aerich": {"app": "models", "name": "models.Aerich", "table": "aerich", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": null, "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": true, "field_type": "IntField", "constraints": {"ge": -2147483648, "le": 2147483647}, "description": null, "python_type": "int", "db_field_types": {"": "INT"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "version", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "version", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 255}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(255)"}}, {"name": "app", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "app", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 100}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(100)"}}, {"name": "content", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "content", "docstring": null, "generated": false, "field_type": "JSONField", "constraints": {}, "description": null, "python_type": "Union[dict, list]", "db_field_types": {"": "JSON", "mssql": "NVARCHAR(MAX)", "oracle": "NCLOB", "postgres": "JSONB"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}, "models.BetModel": {"app": "models", "name": "models.BetModel", "table": "betmodel", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": "<function uuid.uuid4>", "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "created_at", "unique": false, "default": null, "indexed": false, "auto_now": false, "nullable": true, "db_column": "created_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "updated_at", "unique": false, "default": null, "indexed": false, "auto_now": true, "nullable": true, "db_column": "updated_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "amount", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "amount", "docstring": null, "generated": false, "field_type": "DecimalField", "constraints": {}, "description": null, "python_type": "decimal.Decimal", "db_field_types": {"": "DECIMAL(14,2)", "sqlite": "VARCHAR(40)"}}, {"name": "event_id", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "event_id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, {"name": "state", "unique": false, "default": "BetState.NOT_FINISHED", "indexed": false, "nullable": true, "db_column": "state", "docstring": null, "generated": false, "field_type": "CharEnumFieldInstance", "constraints": {"max_length": 12}, "description": "NOT_FINISHED: not_finished\\nWIN: win\\nLOSE: lose", "python_type": "str", "db_field_types": {"": "VARCHAR(12)"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}}
70	5_20241024232446_None.py	models	{"models.Aerich": {"app": "models", "name": "models.Aerich", "table": "aerich", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": null, "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": true, "field_type": "IntField", "constraints": {"ge": -2147483648, "le": 2147483647}, "description": null, "python_type": "int", "db_field_types": {"": "INT"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "version", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "version", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 255}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(255)"}}, {"name": "app", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "app", "docstring": null, "generated": false, "field_type": "CharField", "constraints": {"max_length": 100}, "description": null, "python_type": "str", "db_field_types": {"": "VARCHAR(100)"}}, {"name": "content", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "content", "docstring": null, "generated": false, "field_type": "JSONField", "constraints": {}, "description": null, "python_type": "Union[dict, list]", "db_field_types": {"": "JSON", "mssql": "NVARCHAR(MAX)", "oracle": "NCLOB", "postgres": "JSONB"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}, "models.BetModel": {"app": "models", "name": "models.BetModel", "table": "betmodel", "indexes": [], "abstract": false, "pk_field": {"name": "id", "unique": true, "default": "<function uuid.uuid4>", "indexed": true, "nullable": false, "db_column": "id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, "docstring": null, "fk_fields": [], "m2m_fields": [], "o2o_fields": [], "data_fields": [{"name": "created_at", "unique": false, "default": null, "indexed": false, "auto_now": false, "nullable": true, "db_column": "created_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "updated_at", "unique": false, "default": null, "indexed": false, "auto_now": true, "nullable": true, "db_column": "updated_at", "docstring": null, "generated": false, "field_type": "DatetimeField", "constraints": {"readOnly": true}, "description": null, "python_type": "datetime.datetime", "auto_now_add": true, "db_field_types": {"": "TIMESTAMP", "mssql": "DATETIME2", "mysql": "DATETIME(6)", "oracle": "TIMESTAMP WITH TIME ZONE", "postgres": "TIMESTAMPTZ"}}, {"name": "amount", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "amount", "docstring": null, "generated": false, "field_type": "DecimalField", "constraints": {}, "description": null, "python_type": "decimal.Decimal", "db_field_types": {"": "DECIMAL(14,2)", "sqlite": "VARCHAR(40)"}}, {"name": "event_id", "unique": false, "default": null, "indexed": false, "nullable": false, "db_column": "event_id", "docstring": null, "generated": false, "field_type": "UUIDField", "constraints": {}, "description": null, "python_type": "uuid.UUID", "db_field_types": {"": "CHAR(36)", "postgres": "UUID"}}, {"name": "state", "unique": false, "default": "BetState.NOT_FINISHED", "indexed": false, "nullable": true, "db_column": "state", "docstring": null, "generated": false, "field_type": "CharEnumFieldInstance", "constraints": {"max_length": 12}, "description": "NOT_FINISHED: not_finished\\nWIN: win\\nLOSE: lose", "python_type": "str", "db_field_types": {"": "VARCHAR(12)"}}], "description": null, "unique_together": [], "backward_fk_fields": [], "backward_o2o_fields": []}}
\.


--
-- Data for Name: betmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.betmodel (created_at, updated_at, id, amount, event_id, state) FROM stdin;
2024-10-24 15:53:53.167+00	2024-10-24 16:03:57.527568+00	b8ec0724-3a69-4fe9-8fb5-af98620920c0	500.00	408cad58-21b0-4aba-a624-a3223b591617	lose
2024-10-24 15:53:53.167+00	2024-10-24 16:06:47.995669+00	e0afc2e2-8bf1-44ff-a943-3f50d5aa9415	500.00	408cad58-21b0-4aba-a624-a3223b591617	lose
2024-10-24 16:06:55.44+00	2024-10-24 17:31:27.672923+00	c6b9b406-4317-421b-9fb2-92a6e17c4f31	500.00	408cad58-21b0-4aba-a624-a3223b591617	lose
2024-10-24 16:06:55.44+00	2024-10-24 17:34:43.753277+00	ec2b429a-e0e7-4441-9a66-10c5cd79b01c	500.02	408cad58-21b0-4aba-a624-a3223b591617	lose
2024-10-24 16:06:55.44+00	2024-10-24 17:56:04.457332+00	cb345d72-97c3-45a2-9e63-e5cc34f99191	500.02	408cad58-21b0-4aba-a624-a3223b591617	lose
2024-10-24 16:06:55.44+00	2024-10-24 17:57:02.517343+00	6c759508-3647-48df-bbfe-8c629832c04c	500.02	408cad58-21b0-4aba-a624-a3223b591617	lose
2024-10-24 16:06:55.44+00	2024-10-24 17:58:04.012381+00	679bf558-a3eb-4d83-a79c-1f453719bf7c	500.02	408cad58-21b0-4aba-a624-a3223b591617	lose
2024-10-24 16:06:55.44+00	2024-10-24 17:58:09.543959+00	f05ffc41-3385-402e-aa25-6e09b2008c10	500.02	408cad58-21b0-4aba-a624-a3223b591617	lose
2024-10-24 16:06:55.44+00	2024-10-24 17:58:29.544205+00	b84854b7-f09c-474a-a3e8-4dd026e0e0fb	500.02	408cad58-21b0-4aba-a624-a3223b591617	lose
2024-10-24 23:39:03.037+00	2024-10-24 23:39:42.741086+00	fbd7e62e-afbd-4e4e-9387-f9d5f2437372	0.01	1ecac239-2050-43cc-bdfb-1bc2f34b122e	win
2024-10-24 23:39:03.037+00	2024-10-24 23:39:16.221657+00	9ad1859d-aaed-4cc8-a292-8018faec6da9	0.01	6aca84b7-19b8-4000-8dad-1bf5f4d1d3a7	win
2024-10-24 23:39:03.037+00	2024-10-25 00:57:28.018064+00	dab014ca-6e45-48fd-ace6-59099f841eff	0.01	408cad58-21b0-4aba-a624-a3223b591617	lose
\.


--
-- Name: aerich_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aerich_id_seq', 70, true);


--
-- Name: aerich aerich_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aerich
    ADD CONSTRAINT aerich_pkey PRIMARY KEY (id);


--
-- Name: betmodel betmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.betmodel
    ADD CONSTRAINT betmodel_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

