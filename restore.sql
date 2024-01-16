--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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

DROP DATABASE "medicalequipment_DW";
--
-- Name: medicalequipment_DW; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "medicalequipment_DW" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "medicalequipment_DW" OWNER TO postgres;

\connect "medicalequipment_DW"

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
-- Name: medicaldw; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA medicaldw;


ALTER SCHEMA medicaldw OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: allocationdim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.allocationdim (
    allocationkey integer NOT NULL,
    allocationid character varying(255),
    allocationdate date,
    returndate date,
    equipmentkey integer
);


ALTER TABLE medicaldw.allocationdim OWNER TO postgres;

--
-- Name: allocationdim_allocationkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.allocationdim_allocationkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.allocationdim_allocationkey_seq OWNER TO postgres;

--
-- Name: allocationdim_allocationkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.allocationdim_allocationkey_seq OWNED BY medicaldw.allocationdim.allocationkey;


--
-- Name: city; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.city (
    citykey integer NOT NULL,
    cityname character varying(255),
    statekey integer
);


ALTER TABLE medicaldw.city OWNER TO postgres;

--
-- Name: city_citykey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.city_citykey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.city_citykey_seq OWNER TO postgres;

--
-- Name: city_citykey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.city_citykey_seq OWNED BY medicaldw.city.citykey;


--
-- Name: decommissioningdim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.decommissioningdim (
    decommissionkey integer NOT NULL,
    decommissioningid character varying,
    equipkey integer,
    decommissioningdate date,
    reason text
);


ALTER TABLE medicaldw.decommissioningdim OWNER TO postgres;

--
-- Name: decommissioningdim_decommissionkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.decommissioningdim_decommissionkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.decommissioningdim_decommissionkey_seq OWNER TO postgres;

--
-- Name: decommissioningdim_decommissionkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.decommissioningdim_decommissionkey_seq OWNED BY medicaldw.decommissioningdim.decommissionkey;


--
-- Name: departmentdim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.departmentdim (
    departmentkey integer NOT NULL,
    departmentid integer,
    departmentname character varying(255)
);


ALTER TABLE medicaldw.departmentdim OWNER TO postgres;

--
-- Name: departmentdim_departmentkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.departmentdim_departmentkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.departmentdim_departmentkey_seq OWNER TO postgres;

--
-- Name: departmentdim_departmentkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.departmentdim_departmentkey_seq OWNED BY medicaldw.departmentdim.departmentkey;


--
-- Name: equipmentdim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.equipmentdim (
    equipmentkey integer NOT NULL,
    equipmentid integer,
    equipmentname character varying(255),
    equipmentcode character varying(255),
    regulationkey integer,
    departmentkey integer
);


ALTER TABLE medicaldw.equipmentdim OWNER TO postgres;

--
-- Name: equipmentdim_equipmentkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.equipmentdim_equipmentkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.equipmentdim_equipmentkey_seq OWNER TO postgres;

--
-- Name: equipmentdim_equipmentkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.equipmentdim_equipmentkey_seq OWNED BY medicaldw.equipmentdim.equipmentkey;


--
-- Name: hospitaldim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.hospitaldim (
    hospitalkey integer NOT NULL,
    hospitalid integer,
    hospitalname character varying(255),
    address character varying(255),
    zipcode character varying(255),
    citykey integer,
    equipkey integer,
    departmentkey integer,
    phoneno character varying(255),
    revenue double precision
);


ALTER TABLE medicaldw.hospitaldim OWNER TO postgres;

--
-- Name: hospitaldim_hospitalkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.hospitaldim_hospitalkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.hospitaldim_hospitalkey_seq OWNER TO postgres;

--
-- Name: hospitaldim_hospitalkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.hospitaldim_hospitalkey_seq OWNED BY medicaldw.hospitaldim.hospitalkey;


--
-- Name: itemdescdim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.itemdescdim (
    itemkey integer NOT NULL,
    itemdescription character varying(255),
    partdescription character varying(255)
);


ALTER TABLE medicaldw.itemdescdim OWNER TO postgres;

--
-- Name: itemdescdim_itemkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.itemdescdim_itemkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.itemdescdim_itemkey_seq OWNER TO postgres;

--
-- Name: itemdescdim_itemkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.itemdescdim_itemkey_seq OWNED BY medicaldw.itemdescdim.itemkey;


--
-- Name: maintenancedate; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.maintenancedate (
    datekey integer NOT NULL,
    daydate date,
    monthkey integer
);


ALTER TABLE medicaldw.maintenancedate OWNER TO postgres;

--
-- Name: maintenancedate_datekey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.maintenancedate_datekey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.maintenancedate_datekey_seq OWNER TO postgres;

--
-- Name: maintenancedate_datekey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.maintenancedate_datekey_seq OWNED BY medicaldw.maintenancedate.datekey;


--
-- Name: maintenancefact; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.maintenancefact (
    maintenancefactkey integer NOT NULL,
    maintenanacetechkey integer,
    maintenancelogkey integer,
    orderdetailskey integer,
    hospitalkey integer,
    paymentkey integer,
    maintenancetypekey integer,
    totalmaintenanceamount double precision,
    amountpaidmaintenance double precision,
    maintenancepercent double precision,
    hospitalrevenue double precision
);


ALTER TABLE medicaldw.maintenancefact OWNER TO postgres;

--
-- Name: maintenancefact_maintenancefactkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.maintenancefact_maintenancefactkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.maintenancefact_maintenancefactkey_seq OWNER TO postgres;

--
-- Name: maintenancefact_maintenancefactkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.maintenancefact_maintenancefactkey_seq OWNED BY medicaldw.maintenancefact.maintenancefactkey;


--
-- Name: maintenancelogdim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.maintenancelogdim (
    logkey integer NOT NULL,
    logid integer,
    equipkey integer,
    maintenancetechid integer,
    maintenancedate date,
    maintenancetypeid integer,
    description text,
    historicalmaintenancetypeid integer
);


ALTER TABLE medicaldw.maintenancelogdim OWNER TO postgres;

--
-- Name: maintenancelogdim_logkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.maintenancelogdim_logkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.maintenancelogdim_logkey_seq OWNER TO postgres;

--
-- Name: maintenancelogdim_logkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.maintenancelogdim_logkey_seq OWNED BY medicaldw.maintenancelogdim.logkey;


--
-- Name: maintenancemonth; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.maintenancemonth (
    monthkey integer NOT NULL,
    maintenancemonth integer,
    year integer
);


ALTER TABLE medicaldw.maintenancemonth OWNER TO postgres;

--
-- Name: maintenancemonth_monthkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.maintenancemonth_monthkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.maintenancemonth_monthkey_seq OWNER TO postgres;

--
-- Name: maintenancemonth_monthkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.maintenancemonth_monthkey_seq OWNED BY medicaldw.maintenancemonth.monthkey;


--
-- Name: maintenancetechdim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.maintenancetechdim (
    maintenancetechkey integer NOT NULL,
    technicianid integer,
    fullname character varying(255),
    supplierid integer,
    historicalsupplierid integer
);


ALTER TABLE medicaldw.maintenancetechdim OWNER TO postgres;

--
-- Name: maintenancetechdim_maintenancetechkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.maintenancetechdim_maintenancetechkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.maintenancetechdim_maintenancetechkey_seq OWNER TO postgres;

--
-- Name: maintenancetechdim_maintenancetechkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.maintenancetechdim_maintenancetechkey_seq OWNED BY medicaldw.maintenancetechdim.maintenancetechkey;


--
-- Name: maintenancetypedim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.maintenancetypedim (
    maintenancetypekey integer NOT NULL,
    maintenancetypeid integer,
    maintenancetypename character varying(255),
    description text,
    maintenancecost integer,
    validfrom date,
    validto date,
    iscurrent boolean
);


ALTER TABLE medicaldw.maintenancetypedim OWNER TO postgres;

--
-- Name: maintenancetypedim_maintenancetypekey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.maintenancetypedim_maintenancetypekey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.maintenancetypedim_maintenancetypekey_seq OWNER TO postgres;

--
-- Name: maintenancetypedim_maintenancetypekey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.maintenancetypedim_maintenancetypekey_seq OWNED BY medicaldw.maintenancetypedim.maintenancetypekey;


--
-- Name: maintenanceyear; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.maintenanceyear (
    year integer
);


ALTER TABLE medicaldw.maintenanceyear OWNER TO postgres;

--
-- Name: orderdetailsdim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.orderdetailsdim (
    orderdetailskey integer NOT NULL,
    orderid integer,
    ordername character varying(255),
    description character varying(255),
    itemcode character varying(255),
    itemkey integer,
    supplierid integer,
    equipkey integer,
    totalcost double precision,
    quantity integer
);


ALTER TABLE medicaldw.orderdetailsdim OWNER TO postgres;

--
-- Name: orderdetailsdim_orderdetailskey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.orderdetailsdim_orderdetailskey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.orderdetailsdim_orderdetailskey_seq OWNER TO postgres;

--
-- Name: orderdetailsdim_orderdetailskey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.orderdetailsdim_orderdetailskey_seq OWNED BY medicaldw.orderdetailsdim.orderdetailskey;


--
-- Name: patientsdim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.patientsdim (
    patientkey integer NOT NULL,
    patientid integer,
    gender character varying(10),
    agecategory character varying(255),
    description text,
    paymentamount integer,
    procedure integer,
    euipkey integer
);


ALTER TABLE medicaldw.patientsdim OWNER TO postgres;

--
-- Name: patientsdim_patientkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.patientsdim_patientkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.patientsdim_patientkey_seq OWNER TO postgres;

--
-- Name: patientsdim_patientkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.patientsdim_patientkey_seq OWNED BY medicaldw.patientsdim.patientkey;


--
-- Name: paymentdetailsdim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.paymentdetailsdim (
    paymentkey integer NOT NULL,
    paymentid integer,
    supplierid integer,
    equipkey integer,
    logid integer,
    amount double precision,
    discount integer,
    updatedamount integer,
    purchasedate date,
    paymentdescription character varying(255),
    invoiceno character varying(255)
);


ALTER TABLE medicaldw.paymentdetailsdim OWNER TO postgres;

--
-- Name: paymentdetailsdim_paymentkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.paymentdetailsdim_paymentkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.paymentdetailsdim_paymentkey_seq OWNER TO postgres;

--
-- Name: paymentdetailsdim_paymentkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.paymentdetailsdim_paymentkey_seq OWNED BY medicaldw.paymentdetailsdim.paymentkey;


--
-- Name: regulationdim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.regulationdim (
    regulationkey integer NOT NULL,
    regulationid character varying,
    regulationcode character varying(255),
    description character varying(255),
    effectivedate date,
    expirydate date
);


ALTER TABLE medicaldw.regulationdim OWNER TO postgres;

--
-- Name: regulationdim_regulationkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.regulationdim_regulationkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.regulationdim_regulationkey_seq OWNER TO postgres;

--
-- Name: regulationdim_regulationkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.regulationdim_regulationkey_seq OWNED BY medicaldw.regulationdim.regulationkey;


--
-- Name: spareinventorydim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.spareinventorydim (
    inventorykey integer NOT NULL,
    uniquevalue character varying(255),
    minprice integer,
    maxprice integer,
    brand character varying(255),
    expiryagemonths integer,
    currentstock integer
);


ALTER TABLE medicaldw.spareinventorydim OWNER TO postgres;

--
-- Name: spareinventorydim_inventorykey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.spareinventorydim_inventorykey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.spareinventorydim_inventorykey_seq OWNER TO postgres;

--
-- Name: spareinventorydim_inventorykey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.spareinventorydim_inventorykey_seq OWNED BY medicaldw.spareinventorydim.inventorykey;


--
-- Name: state; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.state (
    statekey integer NOT NULL,
    statename character varying(255)
);


ALTER TABLE medicaldw.state OWNER TO postgres;

--
-- Name: state_statekey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.state_statekey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.state_statekey_seq OWNER TO postgres;

--
-- Name: state_statekey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.state_statekey_seq OWNED BY medicaldw.state.statekey;


--
-- Name: supplierdim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.supplierdim (
    supplierkey integer NOT NULL,
    supplierid integer,
    suppliername character varying(255),
    suppliergender character varying(255),
    supplierspeciality character varying(255),
    supplierdesignation character varying(255),
    supplieraddress character varying(255),
    supplierzipcode character varying(255),
    supplierstate character varying(255),
    suppliercity character varying(255),
    supplierentity character varying(255),
    totalamount double precision,
    amountpaid double precision,
    amountowed double precision,
    validfrom date,
    validto date,
    iscurrent boolean
);


ALTER TABLE medicaldw.supplierdim OWNER TO postgres;

--
-- Name: supplierdim_supplierkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.supplierdim_supplierkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.supplierdim_supplierkey_seq OWNER TO postgres;

--
-- Name: supplierdim_supplierkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.supplierdim_supplierkey_seq OWNED BY medicaldw.supplierdim.supplierkey;


--
-- Name: supplierfact; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.supplierfact (
    supplierfactkey integer NOT NULL,
    equipkey integer,
    supplierkey integer,
    orderdetailskey integer,
    paymentkey integer,
    totalsupplyamount double precision,
    totalsupplycost double precision,
    amountpaid double precision,
    supplierpercent double precision
);


ALTER TABLE medicaldw.supplierfact OWNER TO postgres;

--
-- Name: supplierfact_supplierfactkey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.supplierfact_supplierfactkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.supplierfact_supplierfactkey_seq OWNER TO postgres;

--
-- Name: supplierfact_supplierfactkey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.supplierfact_supplierfactkey_seq OWNED BY medicaldw.supplierfact.supplierfactkey;


--
-- Name: useraccessdim; Type: TABLE; Schema: medicaldw; Owner: postgres
--

CREATE TABLE medicaldw.useraccessdim (
    useraccesskey integer NOT NULL,
    userid integer,
    username character varying(255),
    role character varying(255),
    phoneno character varying(255),
    supplierid integer
);


ALTER TABLE medicaldw.useraccessdim OWNER TO postgres;

--
-- Name: useraccessdim_useraccesskey_seq; Type: SEQUENCE; Schema: medicaldw; Owner: postgres
--

CREATE SEQUENCE medicaldw.useraccessdim_useraccesskey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicaldw.useraccessdim_useraccesskey_seq OWNER TO postgres;

--
-- Name: useraccessdim_useraccesskey_seq; Type: SEQUENCE OWNED BY; Schema: medicaldw; Owner: postgres
--

ALTER SEQUENCE medicaldw.useraccessdim_useraccesskey_seq OWNED BY medicaldw.useraccessdim.useraccesskey;


--
-- Name: allocationdim allocationkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.allocationdim ALTER COLUMN allocationkey SET DEFAULT nextval('medicaldw.allocationdim_allocationkey_seq'::regclass);


--
-- Name: city citykey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.city ALTER COLUMN citykey SET DEFAULT nextval('medicaldw.city_citykey_seq'::regclass);


--
-- Name: decommissioningdim decommissionkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.decommissioningdim ALTER COLUMN decommissionkey SET DEFAULT nextval('medicaldw.decommissioningdim_decommissionkey_seq'::regclass);


--
-- Name: departmentdim departmentkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.departmentdim ALTER COLUMN departmentkey SET DEFAULT nextval('medicaldw.departmentdim_departmentkey_seq'::regclass);


--
-- Name: equipmentdim equipmentkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.equipmentdim ALTER COLUMN equipmentkey SET DEFAULT nextval('medicaldw.equipmentdim_equipmentkey_seq'::regclass);


--
-- Name: hospitaldim hospitalkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.hospitaldim ALTER COLUMN hospitalkey SET DEFAULT nextval('medicaldw.hospitaldim_hospitalkey_seq'::regclass);


--
-- Name: itemdescdim itemkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.itemdescdim ALTER COLUMN itemkey SET DEFAULT nextval('medicaldw.itemdescdim_itemkey_seq'::regclass);


--
-- Name: maintenancedate datekey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.maintenancedate ALTER COLUMN datekey SET DEFAULT nextval('medicaldw.maintenancedate_datekey_seq'::regclass);


--
-- Name: maintenancefact maintenancefactkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.maintenancefact ALTER COLUMN maintenancefactkey SET DEFAULT nextval('medicaldw.maintenancefact_maintenancefactkey_seq'::regclass);


--
-- Name: maintenancelogdim logkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.maintenancelogdim ALTER COLUMN logkey SET DEFAULT nextval('medicaldw.maintenancelogdim_logkey_seq'::regclass);


--
-- Name: maintenancemonth monthkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.maintenancemonth ALTER COLUMN monthkey SET DEFAULT nextval('medicaldw.maintenancemonth_monthkey_seq'::regclass);


--
-- Name: maintenancetechdim maintenancetechkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.maintenancetechdim ALTER COLUMN maintenancetechkey SET DEFAULT nextval('medicaldw.maintenancetechdim_maintenancetechkey_seq'::regclass);


--
-- Name: maintenancetypedim maintenancetypekey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.maintenancetypedim ALTER COLUMN maintenancetypekey SET DEFAULT nextval('medicaldw.maintenancetypedim_maintenancetypekey_seq'::regclass);


--
-- Name: orderdetailsdim orderdetailskey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.orderdetailsdim ALTER COLUMN orderdetailskey SET DEFAULT nextval('medicaldw.orderdetailsdim_orderdetailskey_seq'::regclass);


--
-- Name: patientsdim patientkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.patientsdim ALTER COLUMN patientkey SET DEFAULT nextval('medicaldw.patientsdim_patientkey_seq'::regclass);


--
-- Name: paymentdetailsdim paymentkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.paymentdetailsdim ALTER COLUMN paymentkey SET DEFAULT nextval('medicaldw.paymentdetailsdim_paymentkey_seq'::regclass);


--
-- Name: regulationdim regulationkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.regulationdim ALTER COLUMN regulationkey SET DEFAULT nextval('medicaldw.regulationdim_regulationkey_seq'::regclass);


--
-- Name: spareinventorydim inventorykey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.spareinventorydim ALTER COLUMN inventorykey SET DEFAULT nextval('medicaldw.spareinventorydim_inventorykey_seq'::regclass);


--
-- Name: state statekey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.state ALTER COLUMN statekey SET DEFAULT nextval('medicaldw.state_statekey_seq'::regclass);


--
-- Name: supplierdim supplierkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.supplierdim ALTER COLUMN supplierkey SET DEFAULT nextval('medicaldw.supplierdim_supplierkey_seq'::regclass);


--
-- Name: supplierfact supplierfactkey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.supplierfact ALTER COLUMN supplierfactkey SET DEFAULT nextval('medicaldw.supplierfact_supplierfactkey_seq'::regclass);


--
-- Name: useraccessdim useraccesskey; Type: DEFAULT; Schema: medicaldw; Owner: postgres
--

ALTER TABLE ONLY medicaldw.useraccessdim ALTER COLUMN useraccesskey SET DEFAULT nextval('medicaldw.useraccessdim_useraccesskey_seq'::regclass);


--
-- Data for Name: allocationdim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3477.dat

--
-- Data for Name: city; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3464.dat

--
-- Data for Name: decommissioningdim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3458.dat

--
-- Data for Name: departmentdim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3448.dat

--
-- Data for Name: equipmentdim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3450.dat

--
-- Data for Name: hospitaldim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3475.dat

--
-- Data for Name: itemdescdim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3481.dat

--
-- Data for Name: maintenancedate; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3469.dat

--
-- Data for Name: maintenancefact; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3491.dat

--
-- Data for Name: maintenancelogdim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3479.dat

--
-- Data for Name: maintenancemonth; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3467.dat

--
-- Data for Name: maintenancetechdim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3456.dat

--
-- Data for Name: maintenancetypedim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3471.dat

--
-- Data for Name: maintenanceyear; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3465.dat

--
-- Data for Name: orderdetailsdim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3483.dat

--
-- Data for Name: patientsdim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3460.dat

--
-- Data for Name: paymentdetailsdim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3485.dat

--
-- Data for Name: regulationdim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3452.dat

--
-- Data for Name: spareinventorydim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3487.dat

--
-- Data for Name: state; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3462.dat

--
-- Data for Name: supplierdim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3454.dat

--
-- Data for Name: supplierfact; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3489.dat

--
-- Data for Name: useraccessdim; Type: TABLE DATA; Schema: medicaldw; Owner: postgres
--

\i $$PATH$$/3473.dat

--
-- Name: allocationdim_allocationkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.allocationdim_allocationkey_seq', 6000, true);


--
-- Name: city_citykey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.city_citykey_seq', 4543, true);


--
-- Name: decommissioningdim_decommissionkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.decommissioningdim_decommissionkey_seq', 200, true);


--
-- Name: departmentdim_departmentkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.departmentdim_departmentkey_seq', 197, true);


--
-- Name: equipmentdim_equipmentkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.equipmentdim_equipmentkey_seq', 6843, true);


--
-- Name: hospitaldim_hospitalkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.hospitaldim_hospitalkey_seq', 473, true);


--
-- Name: itemdescdim_itemkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.itemdescdim_itemkey_seq', 516, true);


--
-- Name: maintenancedate_datekey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.maintenancedate_datekey_seq', 4018, true);


--
-- Name: maintenancefact_maintenancefactkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.maintenancefact_maintenancefactkey_seq', 14000, true);


--
-- Name: maintenancelogdim_logkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.maintenancelogdim_logkey_seq', 1, false);


--
-- Name: maintenancemonth_monthkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.maintenancemonth_monthkey_seq', 132, true);


--
-- Name: maintenancetechdim_maintenancetechkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.maintenancetechdim_maintenancetechkey_seq', 1, false);


--
-- Name: maintenancetypedim_maintenancetypekey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.maintenancetypedim_maintenancetypekey_seq', 1, false);


--
-- Name: orderdetailsdim_orderdetailskey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.orderdetailsdim_orderdetailskey_seq', 6000, true);


--
-- Name: patientsdim_patientkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.patientsdim_patientkey_seq', 19999, true);


--
-- Name: paymentdetailsdim_paymentkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.paymentdetailsdim_paymentkey_seq', 14998, true);


--
-- Name: regulationdim_regulationkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.regulationdim_regulationkey_seq', 30, true);


--
-- Name: spareinventorydim_inventorykey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.spareinventorydim_inventorykey_seq', 538, true);


--
-- Name: state_statekey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.state_statekey_seq', 55, true);


--
-- Name: supplierdim_supplierkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.supplierdim_supplierkey_seq', 1, false);


--
-- Name: supplierfact_supplierfactkey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.supplierfact_supplierfactkey_seq', 538, true);


--
-- Name: useraccessdim_useraccesskey_seq; Type: SEQUENCE SET; Schema: medicaldw; Owner: postgres
--

SELECT pg_catalog.setval('medicaldw.useraccessdim_useraccesskey_seq', 225, true);


--
-- PostgreSQL database dump complete
--

