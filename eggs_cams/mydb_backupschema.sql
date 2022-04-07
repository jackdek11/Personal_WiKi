--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-0ubuntu0.21.10.1)

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
-- Name: mercantile; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA mercantile;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account; Type: TABLE; Schema: mercantile; Owner: -
--

CREATE TABLE mercantile.account (
    id integer NOT NULL,
    reference character varying,
    account character varying
);


--
-- Name: automated_trade; Type: TABLE; Schema: mercantile; Owner: -
--

CREATE TABLE mercantile.automated_trade (
    client_reference character varying NOT NULL,
    amount character varying NOT NULL,
    beneficiary character varying NOT NULL,
    account character varying NOT NULL,
    split_pins boolean NOT NULL,
    sda_used boolean,
    fia_used boolean,
    nof_fia_pins integer NOT NULL,
    deal_booked boolean DEFAULT false NOT NULL,
    external_reference character varying NOT NULL,
    deal_reference character varying,
    deal_status character varying DEFAULT 'not booked'::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    currency character varying DEFAULT 'USD'::character varying NOT NULL,
    signatory character varying DEFAULT 'Jean'::character varying NOT NULL,
    deal_key character varying,
    deal_loaded_datetime timestamp without time zone DEFAULT now() NOT NULL,
    deal_booked_datetime timestamp without time zone,
    deal_completed_datetime timestamp without time zone,
    w_boughtamount character varying,
    w_soldamount character varying,
    w_currency character varying,
    w_fxrate character varying
);


--
-- Name: automated_trade_history; Type: TABLE; Schema: mercantile; Owner: -
--

CREATE TABLE mercantile.automated_trade_history (
    client_reference character varying NOT NULL,
    amount character varying NOT NULL,
    beneficiary character varying NOT NULL,
    account character varying NOT NULL,
    split_pins boolean NOT NULL,
    sda_used boolean,
    fia_used boolean,
    nof_fia_pins integer NOT NULL,
    deal_booked boolean DEFAULT false NOT NULL,
    external_reference character varying NOT NULL,
    deal_reference character varying,
    deal_status character varying DEFAULT 'not booked'::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    currency character varying DEFAULT 'EUR'::character varying NOT NULL,
    signatory character varying DEFAULT 'Ashaylin'::character varying NOT NULL,
    deal_loaded_datetime timestamp without time zone DEFAULT now() NOT NULL,
    deal_booked_datetime timestamp without time zone,
    deal_completed_datetime timestamp without time zone,
    deal_key character varying,
    w_boughtamount character varying,
    w_soldamount character varying,
    w_currency character varying,
    w_fxrate character varying
);


--
-- Name: balance; Type: TABLE; Schema: mercantile; Owner: -
--

CREATE TABLE mercantile.balance (
    client_id integer,
    balance character varying,
    id integer NOT NULL,
    broker_email character varying,
    signatory character varying,
    reference character varying,
    balance_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: beneficiary; Type: TABLE; Schema: mercantile; Owner: -
--

CREATE TABLE mercantile.beneficiary (
    id integer NOT NULL,
    reference character varying,
    beneficiary character varying,
    name_beneficiary character varying
);


--
-- Name: broker; Type: TABLE; Schema: mercantile; Owner: -
--

CREATE TABLE mercantile.broker (
    reference character varying NOT NULL,
    broker_email character varying,
    id integer NOT NULL
);


--
-- Name: broker_email; Type: TABLE; Schema: mercantile; Owner: -
--

CREATE TABLE mercantile.broker_email (
    email_address character varying NOT NULL,
    broker character varying NOT NULL,
    broker_email character varying
);


--
-- Name: broker_id_seq; Type: SEQUENCE; Schema: mercantile; Owner: -
--

CREATE SEQUENCE mercantile.broker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: broker_id_seq; Type: SEQUENCE OWNED BY; Schema: mercantile; Owner: -
--

ALTER SEQUENCE mercantile.broker_id_seq OWNED BY mercantile.broker.id;


--
-- Name: clients; Type: TABLE; Schema: mercantile; Owner: -
--

CREATE TABLE mercantile.clients (
    id integer NOT NULL,
    client character varying,
    selector character varying,
    active integer DEFAULT 0,
    telegram_id character varying,
    id_number character varying,
    email character varying,
    reference character varying NOT NULL,
    found_me integer DEFAULT 1
);


--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: mercantile; Owner: -
--

CREATE SEQUENCE mercantile.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: mercantile; Owner: -
--

ALTER SEQUENCE mercantile.clients_id_seq OWNED BY mercantile.clients.id;


--
-- Name: manual_trade_history; Type: TABLE; Schema: mercantile; Owner: -
--

CREATE TABLE mercantile.manual_trade_history (
    client_reference character varying,
    amount text,
    beneficiary text,
    account character varying,
    split_pins boolean,
    sda_used boolean,
    fia_used boolean,
    nof_fia_pins integer,
    deal_booked boolean,
    external_reference text,
    deal_reference text,
    deal_status text,
    active boolean,
    currency text,
    signatory text,
    seperator text,
    client character varying,
    allowance character varying,
    email character varying,
    time_booked character varying,
    booked_beneficiary character varying,
    balance text,
    balance_date timestamp without time zone,
    checks text
);


--
-- Name: tmp_account; Type: TABLE; Schema: mercantile; Owner: -
--

CREATE TABLE mercantile.tmp_account (
    id integer NOT NULL,
    reference character varying,
    account character varying
);


--
-- Name: tmp_account_id_seq; Type: SEQUENCE; Schema: mercantile; Owner: -
--

CREATE SEQUENCE mercantile.tmp_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tmp_account_id_seq; Type: SEQUENCE OWNED BY; Schema: mercantile; Owner: -
--

ALTER SEQUENCE mercantile.tmp_account_id_seq OWNED BY mercantile.account.id;


--
-- Name: tmp_account_id_seq1; Type: SEQUENCE; Schema: mercantile; Owner: -
--

CREATE SEQUENCE mercantile.tmp_account_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tmp_account_id_seq1; Type: SEQUENCE OWNED BY; Schema: mercantile; Owner: -
--

ALTER SEQUENCE mercantile.tmp_account_id_seq1 OWNED BY mercantile.tmp_account.id;


--
-- Name: tmp_balance_id_seq; Type: SEQUENCE; Schema: mercantile; Owner: -
--

CREATE SEQUENCE mercantile.tmp_balance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tmp_balance_id_seq; Type: SEQUENCE OWNED BY; Schema: mercantile; Owner: -
--

ALTER SEQUENCE mercantile.tmp_balance_id_seq OWNED BY mercantile.balance.id;


--
-- Name: tmp_beneficiary_id_seq; Type: SEQUENCE; Schema: mercantile; Owner: -
--

CREATE SEQUENCE mercantile.tmp_beneficiary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tmp_beneficiary_id_seq; Type: SEQUENCE OWNED BY; Schema: mercantile; Owner: -
--

ALTER SEQUENCE mercantile.tmp_beneficiary_id_seq OWNED BY mercantile.beneficiary.id;


--
-- Name: trades; Type: TABLE; Schema: mercantile; Owner: -
--

CREATE TABLE mercantile.trades (
    reference character varying,
    beneficiary character varying,
    amount character varying,
    allowance character varying,
    username character varying,
    telegram_id character varying,
    time_booked timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    optional_check character varying DEFAULT 'NO'::character varying
);


--
-- Name: trades_history; Type: TABLE; Schema: mercantile; Owner: -
--

CREATE TABLE mercantile.trades_history (
    reference character varying,
    beneficiary character varying,
    amount character varying,
    allowance character varying,
    username character varying,
    telegram_id character varying,
    time_booked timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    optional_check character varying,
    time_sent timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: account id; Type: DEFAULT; Schema: mercantile; Owner: -
--

ALTER TABLE ONLY mercantile.account ALTER COLUMN id SET DEFAULT nextval('mercantile.tmp_account_id_seq'::regclass);


--
-- Name: balance id; Type: DEFAULT; Schema: mercantile; Owner: -
--

ALTER TABLE ONLY mercantile.balance ALTER COLUMN id SET DEFAULT nextval('mercantile.tmp_balance_id_seq'::regclass);


--
-- Name: beneficiary id; Type: DEFAULT; Schema: mercantile; Owner: -
--

ALTER TABLE ONLY mercantile.beneficiary ALTER COLUMN id SET DEFAULT nextval('mercantile.tmp_beneficiary_id_seq'::regclass);


--
-- Name: broker id; Type: DEFAULT; Schema: mercantile; Owner: -
--

ALTER TABLE ONLY mercantile.broker ALTER COLUMN id SET DEFAULT nextval('mercantile.broker_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: mercantile; Owner: -
--

ALTER TABLE ONLY mercantile.clients ALTER COLUMN id SET DEFAULT nextval('mercantile.clients_id_seq'::regclass);


--
-- Name: tmp_account id; Type: DEFAULT; Schema: mercantile; Owner: -
--

ALTER TABLE ONLY mercantile.tmp_account ALTER COLUMN id SET DEFAULT nextval('mercantile.tmp_account_id_seq1'::regclass);


--
-- Name: broker_email broker_email_pk; Type: CONSTRAINT; Schema: mercantile; Owner: -
--

ALTER TABLE ONLY mercantile.broker_email
    ADD CONSTRAINT broker_email_pk PRIMARY KEY (email_address);


--
-- Name: broker broker_pk; Type: CONSTRAINT; Schema: mercantile; Owner: -
--

ALTER TABLE ONLY mercantile.broker
    ADD CONSTRAINT broker_pk PRIMARY KEY (id);


--
-- Name: clients clients_pk; Type: CONSTRAINT; Schema: mercantile; Owner: -
--

ALTER TABLE ONLY mercantile.clients
    ADD CONSTRAINT clients_pk PRIMARY KEY (reference);


--
-- Name: automated_trade_deal_key_uindex; Type: INDEX; Schema: mercantile; Owner: -
--

CREATE UNIQUE INDEX automated_trade_deal_key_uindex ON mercantile.automated_trade USING btree (deal_key);


--
-- Name: broker_email_email_address_uindex; Type: INDEX; Schema: mercantile; Owner: -
--

CREATE UNIQUE INDEX broker_email_email_address_uindex ON mercantile.broker_email USING btree (email_address);


--
-- Name: broker_id_uindex; Type: INDEX; Schema: mercantile; Owner: -
--

CREATE UNIQUE INDEX broker_id_uindex ON mercantile.broker USING btree (id);


--
-- Name: clients_id_number_uindex; Type: INDEX; Schema: mercantile; Owner: -
--

CREATE UNIQUE INDEX clients_id_number_uindex ON mercantile.clients USING btree (id_number);


--
-- Name: clients_key_uindex; Type: INDEX; Schema: mercantile; Owner: -
--

CREATE UNIQUE INDEX clients_key_uindex ON mercantile.clients USING btree (id);


--
-- Name: clients_reference_uindex; Type: INDEX; Schema: mercantile; Owner: -
--

CREATE UNIQUE INDEX clients_reference_uindex ON mercantile.clients USING btree (reference);


--
-- PostgreSQL database dump complete
--

