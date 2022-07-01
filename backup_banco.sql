--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-1.pgdg20.04+1)

-- Started on 2022-07-01 17:55:46 -03

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
-- TOC entry 218 (class 1259 OID 16951)
-- Name: construtor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.construtor (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    nascimento date NOT NULL,
    telefone character varying(16) NOT NULL,
    cpf character varying(30) NOT NULL,
    casado boolean NOT NULL,
    id_empresa_construtor integer NOT NULL
);


ALTER TABLE public.construtor OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16950)
-- Name: construtor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.construtor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.construtor_id_seq OWNER TO postgres;

--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 217
-- Name: construtor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.construtor_id_seq OWNED BY public.construtor.id;


--
-- TOC entry 212 (class 1259 OID 16916)
-- Name: empresa_construtor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresa_construtor (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    cnpj character varying(18) NOT NULL,
    telefone character varying(16) NOT NULL,
    uf character varying(2),
    bairro character varying(100),
    rua character varying(100),
    numero integer,
    cidade character varying(50) NOT NULL
);


ALTER TABLE public.empresa_construtor OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16915)
-- Name: empresa_construtor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empresa_construtor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresa_construtor_id_seq OWNER TO postgres;

--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 211
-- Name: empresa_construtor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empresa_construtor_id_seq OWNED BY public.empresa_construtor.id;


--
-- TOC entry 210 (class 1259 OID 16905)
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedor (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    cnpj character varying(18) NOT NULL,
    inscricao_estudal character varying(20) NOT NULL,
    uf character varying(2),
    bairro character varying(100),
    rua character varying(100),
    numero integer,
    cidade character varying(16)
);


ALTER TABLE public.fornecedor OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16904)
-- Name: fornecedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fornecedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fornecedor_id_seq OWNER TO postgres;

--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 209
-- Name: fornecedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fornecedor_id_seq OWNED BY public.fornecedor.id;


--
-- TOC entry 214 (class 1259 OID 16927)
-- Name: materiais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materiais (
    id integer NOT NULL,
    unidade_medida character varying(20) NOT NULL,
    nome character varying(200) NOT NULL,
    quantidade_estoque integer NOT NULL,
    tipo_material character varying(20)
);


ALTER TABLE public.materiais OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16934)
-- Name: materiais_comprados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materiais_comprados (
    id integer NOT NULL,
    valor_compra numeric,
    id_fornecedor integer NOT NULL,
    id_materiais integer NOT NULL,
    quantidade integer,
    data_compra timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.materiais_comprados OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16933)
-- Name: materiais_comprados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materiais_comprados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materiais_comprados_id_seq OWNER TO postgres;

--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 215
-- Name: materiais_comprados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materiais_comprados_id_seq OWNED BY public.materiais_comprados.id;


--
-- TOC entry 220 (class 1259 OID 16979)
-- Name: materiais_gastos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materiais_gastos (
    id integer NOT NULL,
    quantidade_gasto integer NOT NULL,
    id_materiais integer NOT NULL,
    id_construtor integer NOT NULL,
    data_gasto timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.materiais_gastos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16978)
-- Name: materiais_gastos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materiais_gastos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materiais_gastos_id_seq OWNER TO postgres;

--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 219
-- Name: materiais_gastos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materiais_gastos_id_seq OWNED BY public.materiais_gastos.id;


--
-- TOC entry 213 (class 1259 OID 16926)
-- Name: materiais_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materiais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materiais_id_seq OWNER TO postgres;

--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 213
-- Name: materiais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materiais_id_seq OWNED BY public.materiais.id;


--
-- TOC entry 221 (class 1259 OID 17011)
-- Name: vw_estoque_antes_dos_gastos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_estoque_antes_dos_gastos AS
 SELECT m.nome,
    (m.quantidade_estoque + mc.quantidade) AS quantidade_estoque_total,
    (((m.quantidade_estoque + mc.quantidade))::numeric * mc.valor_compra) AS valor_total_produtos
   FROM (public.materiais_comprados mc
     JOIN public.materiais m ON ((mc.id_materiais = m.id)));


ALTER TABLE public.vw_estoque_antes_dos_gastos OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17029)
-- Name: vw_gastos_por_empresas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_gastos_por_empresas AS
 SELECT f.id,
    f.nome,
    sum((mc.valor_compra * (mc.quantidade)::numeric)) AS valor_gasto_por_empresa
   FROM (public.materiais_comprados mc
     JOIN public.fornecedor f ON ((mc.id_fornecedor = f.id)))
  GROUP BY f.id, f.nome;


ALTER TABLE public.vw_gastos_por_empresas OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17024)
-- Name: vw_gastos_por_pessoa; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_gastos_por_pessoa AS
 SELECT c.nome,
    sum(((mg.quantidade_gasto)::numeric * mc.valor_compra)) AS valor_gasto,
    ec.nome AS nome_empresa
   FROM ((((public.materiais_gastos mg
     JOIN public.construtor c ON ((mg.id_construtor = c.id)))
     JOIN public.materiais m ON ((mg.id_materiais = m.id)))
     JOIN public.materiais_comprados mc ON ((m.id = mc.id_materiais)))
     JOIN public.empresa_construtor ec ON ((c.id_empresa_construtor = ec.id)))
  GROUP BY c.nome, ec.nome;


ALTER TABLE public.vw_gastos_por_pessoa OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17038)
-- Name: vw_idade_trabalho; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_idade_trabalho AS
 SELECT c.id,
    c.nome,
    to_char((c.nascimento)::timestamp with time zone, 'DD/MM/YYYY'::text) AS data_nascimento,
    to_char((CURRENT_DATE)::timestamp with time zone, 'DD/MM/YYYY'::text) AS data_atual,
    to_char(age((CURRENT_DATE)::timestamp with time zone, (c.nascimento)::timestamp with time zone), 'YY "ano(s)"'::text) AS idade,
    ec.nome AS empresa_que_trabalha
   FROM (public.construtor c
     JOIN public.empresa_construtor ec ON ((c.id_empresa_construtor = ec.id)))
  ORDER BY (age((CURRENT_DATE)::timestamp with time zone, (c.nascimento)::timestamp with time zone)) DESC;


ALTER TABLE public.vw_idade_trabalho OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17043)
-- Name: vw_quantidade_fornecerdores_estado; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_quantidade_fornecerdores_estado AS
 SELECT fornecedor.uf AS estado,
    count(fornecedor.nome) AS quantidade
   FROM public.fornecedor
  GROUP BY fornecedor.uf
  ORDER BY (count(fornecedor.nome)) DESC;


ALTER TABLE public.vw_quantidade_fornecerdores_estado OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17020)
-- Name: vw_trabalhadores_por_empresa; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_trabalhadores_por_empresa AS
 SELECT ec.nome,
    count(c.id_empresa_construtor) AS trabalhadores
   FROM (public.construtor c
     JOIN public.empresa_construtor ec ON ((c.id_empresa_construtor = ec.id)))
  GROUP BY ec.nome;


ALTER TABLE public.vw_trabalhadores_por_empresa OWNER TO postgres;

--
-- TOC entry 3228 (class 2604 OID 16954)
-- Name: construtor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construtor ALTER COLUMN id SET DEFAULT nextval('public.construtor_id_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 16919)
-- Name: empresa_construtor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa_construtor ALTER COLUMN id SET DEFAULT nextval('public.empresa_construtor_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 16908)
-- Name: fornecedor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor ALTER COLUMN id SET DEFAULT nextval('public.fornecedor_id_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 16930)
-- Name: materiais id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiais ALTER COLUMN id SET DEFAULT nextval('public.materiais_id_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 16937)
-- Name: materiais_comprados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiais_comprados ALTER COLUMN id SET DEFAULT nextval('public.materiais_comprados_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 16982)
-- Name: materiais_gastos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiais_gastos ALTER COLUMN id SET DEFAULT nextval('public.materiais_gastos_id_seq'::regclass);


--
-- TOC entry 3414 (class 0 OID 16951)
-- Dependencies: 218
-- Data for Name: construtor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.construtor VALUES (3, 'Kauê Leandro Pinto', '1990-02-03', '(79) 3867-0001', '108.693.268-48', false, 1);
INSERT INTO public.construtor VALUES (4, 'Jennifer Heloisa Helena Moreira', '1976-02-11', '(31) 3992-4394', '028.238.125-20', false, 1);
INSERT INTO public.construtor VALUES (5, 'Nicolas Vinicius Almeida', '2004-04-20', '(32) 3578-8891', '686.610.869-14', false, 1);
INSERT INTO public.construtor VALUES (6, 'Francisco Ian Dias', '1958-01-23', '(81) 3941-1843', '733.080.958-66', false, 1);
INSERT INTO public.construtor VALUES (7, 'Priscila Débora Rocha', '1987-02-03', '(83) 2944-9499', '264.435.526-52', false, 1);
INSERT INTO public.construtor VALUES (8, 'Guilherme Caio Almada', '1996-06-01', '(83) 3889-0933', '514.509.020-06', true, 2);
INSERT INTO public.construtor VALUES (9, 'Martin Julio Peixoto', '1970-04-03', '(13) 2733-4432', '436.238.240-20', true, 2);
INSERT INTO public.construtor VALUES (10, 'Ricardo Otávio Ribeiro', '2001-03-13', '(68) 3669-4673', '289.081.336-31', true, 2);
INSERT INTO public.construtor VALUES (11, 'Maya Laura Marcela Fogaça', '1989-04-24', '(82) 2502-8253', '404.034.487-19', false, 2);
INSERT INTO public.construtor VALUES (12, 'Rita Patrícia Bernardes', '1988-06-12', '(16) 3683-7641', '889.813.972-10', true, 2);
INSERT INTO public.construtor VALUES (13, 'Adriana Flávia Aurora Galvão', '1954-05-07', '(69) 3822-2031', '646.705.162-99', true, 3);
INSERT INTO public.construtor VALUES (14, 'Cecília Gabriela Santos', '1995-05-04', '(61) 3928-6914', '835.501.328-08', true, 3);
INSERT INTO public.construtor VALUES (15, 'Noah Matheus André de Paula', '1999-05-18', '(65) 2914-4663', '234.202.302-22', true, 3);
INSERT INTO public.construtor VALUES (16, 'Aurora Luzia Assis', '1963-05-06', '(63) 2798-2904', '519.483.560-40', true, 3);
INSERT INTO public.construtor VALUES (17, 'Hadassa Lara Isabella da Cunha', '1956-03-03', '(83) 2840-6679', '952.840.222-46', true, 3);
INSERT INTO public.construtor VALUES (18, 'Rosângela Marina Barbosa', '1986-01-14', '(93) 2995-6960', '249.244.551-80', true, 1);
INSERT INTO public.construtor VALUES (19, 'Enrico Yago Araújo', '1945-04-22', '(87) 2782-9240', '877.927.689-02', true, 1);
INSERT INTO public.construtor VALUES (20, 'Rosângela Jennifer da Cruz', '2004-05-26', '(71) 2908-6684', '254.385.443-60', true, 1);
INSERT INTO public.construtor VALUES (22, 'Débora Rebeca Porto', '1969-01-27', '(15) 2695-4560', '942.204.440-50', true, 1);
INSERT INTO public.construtor VALUES (23, 'Marina Débora Brito', '1992-03-07', '(67) 3598-3033', '276.786.732-99', true, 1);
INSERT INTO public.construtor VALUES (24, 'Rafaela Emilly Mariana Rezende', '1978-04-11', '(84) 3995-2286', '857.417.934-52', true, 1);
INSERT INTO public.construtor VALUES (25, 'Jennifer Nair Daiane Alves', '1976-02-18', '(69) 2779-3193', '375.737.379-04', true, 1);
INSERT INTO public.construtor VALUES (26, 'Rosa Silvana Pereira', '1970-02-03', '(28) 3696-6861', '530.514.880-46', true, 1);
INSERT INTO public.construtor VALUES (27, 'Marlene Ayla Melo', '1986-01-10', '(79) 2876-0289', '174.675.337-48', true, 1);
INSERT INTO public.construtor VALUES (28, 'Lucas Geraldo Lopes', '1986-04-05', '(63) 2744-4955', '722.002.046-55', true, 1);
INSERT INTO public.construtor VALUES (29, 'Elza Flávia Mendes', '1946-04-20', '(85) 3566-7908', '678.927.398-07', true, 1);
INSERT INTO public.construtor VALUES (30, 'Diego Otávio Jorge Freitas', '1944-01-03', '(63) 3500-5322', '412.498.104-00', true, 1);
INSERT INTO public.construtor VALUES (21, 'Marina Eliane da Mata', '1977-03-17', '(51) 3757-4970', '690.963.533-74', true, 2);
INSERT INTO public.construtor VALUES (1, 'Maria Rita Aparício', '1971-05-18', '(79) 3860-4188', '429.293.557-27', false, 2);
INSERT INTO public.construtor VALUES (2, 'Daiane Flávia Monteiro', '1948-05-13', '(65) 3645-2537', '820.813.099-04', false, 3);


--
-- TOC entry 3408 (class 0 OID 16916)
-- Dependencies: 212
-- Data for Name: empresa_construtor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empresa_construtor VALUES (1, 'Leonardo e Josefa Consultoria Financeira ME', '38.020.619/0001-30', '(48) 2930-5545', 'SC', 'Barra da Lagoa', 'Servidão Manoel Marçal Vieira', 190, 'Florianopolis');
INSERT INTO public.empresa_construtor VALUES (2, 'Eduarda e Isaac pedreiros', '77.008.575/0001-85', '(47) 3592-9421', 'SC', 'Centro', 'Rua Jaguaruna', 190, 'Joinville');
INSERT INTO public.empresa_construtor VALUES (3, 'Cecília e Vanessa construtores', '06.161.450/0001-42', '(47) 3780-4147', 'SC', 'Vila Nova', 'Rua Jacinto Cristofolini', 931, 'Joinvile');


--
-- TOC entry 3406 (class 0 OID 16905)
-- Dependencies: 210
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fornecedor VALUES (1, 'Louise e Rebeca Tijolos', '21.928.869/0001-70', '132.095.276.277', 'SP', 'Alto da Serra', 'Rua Araponga', 410, 'Sao Paulo ');
INSERT INTO public.fornecedor VALUES (2, 'Raul e Jennifer Construções Ltda', '69.077.170/0001-70', '048.994.195.450', 'SP', 'Jardim Wanel Ville V', 'Rua Zeferino Xavier de Faria', 520, 'Sao Paulo ');
INSERT INTO public.fornecedor VALUES (3, 'Emanuel e Danilo Entregas Expressas ME', '00.788.415/0001-71', '465.134.859.282', 'SP', 'Loteamento Linda Chib', 'Rua Janete Clair', 152, 'Mogi Mirim');
INSERT INTO public.fornecedor VALUES (4, 'Caleb e Raul Publicidade e Propaganda Ltda', '18.954.803/0001-40', '769.071.924.506', 'SP', 'Dic VI (Conjunto Habitacional Santo Dias Silva)', 'Rua Odilla Silveira Pinto de Moura', 788, 'Campinas');
INSERT INTO public.fornecedor VALUES (5, 'Aurora e Thiago Lavanderia Ltda', '73.939.376/0001-30', '449.981.996.760', 'SP', 'Conjunto Habitacional Sitio Conceição', 'Rua Estado do Paraná', 184, 'Sao Paulo');
INSERT INTO public.fornecedor VALUES (6, 'Ryan e Calebe Casa Noturna ME', '40.789.702/0001-10', '717.268.540.724', 'SP', 'Jardim Amanda I', 'Rua Padre Manoel Bernardes', 807, 'Hortolandia');
INSERT INTO public.fornecedor VALUES (7, 'Bruna e Yago bebidas', '35.294.382/0001-98', '912.976.306', 'SC', 'Progresso', 'Rua Guilherme Sestrem', 358, 'Blumenau');


--
-- TOC entry 3410 (class 0 OID 16927)
-- Dependencies: 214
-- Data for Name: materiais; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.materiais VALUES (1, 'KG', 'cimento', 1235, 'Construção');
INSERT INTO public.materiais VALUES (2, 'UND', 'tijolos', 23123, 'Construção');
INSERT INTO public.materiais VALUES (3, 'KG', 'Areia', 21543, 'Construção');
INSERT INTO public.materiais VALUES (4, 'KG', 'Brita', 23688, 'Construção');
INSERT INTO public.materiais VALUES (5, 'UDN', 'Betoneira 400l Menegotti', 2, 'Ferramentas');
INSERT INTO public.materiais VALUES (6, 'UND', 'Coca cola', 100, 'Bebida');
INSERT INTO public.materiais VALUES (7, 'mts', 'madeira simples', 0, 'Construção');
INSERT INTO public.materiais VALUES (8, 'ltrs', 'tinta acrilica', 0, 'tinta');


--
-- TOC entry 3412 (class 0 OID 16934)
-- Dependencies: 216
-- Data for Name: materiais_comprados; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.materiais_comprados VALUES (4, 0.1, 4, 4, 10, '2022-06-30 14:21:25.767189-03');
INSERT INTO public.materiais_comprados VALUES (5, 3000, 2, 5, 5, '2022-06-30 14:21:25.767189-03');
INSERT INTO public.materiais_comprados VALUES (1, 0.75, 3, 1, 32, '2022-06-30 14:21:25.767189-03');
INSERT INTO public.materiais_comprados VALUES (2, 0.10, 1, 3, 12, '2022-06-30 14:21:25.767189-03');
INSERT INTO public.materiais_comprados VALUES (3, 0.10, 4, 2, 53, '2022-06-30 14:21:25.767189-03');
INSERT INTO public.materiais_comprados VALUES (7, 19.50, 6, 7, 100, '2022-07-01 13:45:48.046359-03');
INSERT INTO public.materiais_comprados VALUES (8, 33, 1, 3, 100, '2022-07-01 13:51:23.329511-03');
INSERT INTO public.materiais_comprados VALUES (6, 4, 7, 6, 100, '2022-06-30 14:36:23.004259-03');
INSERT INTO public.materiais_comprados VALUES (9, 17.50, 3, 8, 50, '2022-07-01 14:33:00.777989-03');


--
-- TOC entry 3416 (class 0 OID 16979)
-- Dependencies: 220
-- Data for Name: materiais_gastos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.materiais_gastos VALUES (1, 10, 2, 3, '2022-06-30 14:23:08.795257-03');
INSERT INTO public.materiais_gastos VALUES (2, 100, 1, 5, '2022-06-30 14:23:08.795257-03');
INSERT INTO public.materiais_gastos VALUES (3, 100, 3, 1, '2022-06-30 14:23:08.795257-03');
INSERT INTO public.materiais_gastos VALUES (4, 100, 4, 4, '2022-06-30 14:23:08.795257-03');
INSERT INTO public.materiais_gastos VALUES (5, 2, 3, 2, '2022-06-30 14:25:13.914964-03');
INSERT INTO public.materiais_gastos VALUES (6, 1000, 1, 2, '2022-06-30 14:25:24.548563-03');
INSERT INTO public.materiais_gastos VALUES (7, 1000, 4, 2, '2022-06-30 14:25:29.118496-03');
INSERT INTO public.materiais_gastos VALUES (8, 1000, 3, 5, '2022-06-30 14:25:34.82222-03');
INSERT INTO public.materiais_gastos VALUES (9, 35, 7, 9, '2022-07-01 13:47:27.178444-03');
INSERT INTO public.materiais_gastos VALUES (10, 2, 6, 15, '2022-07-01 13:53:01.22128-03');
INSERT INTO public.materiais_gastos VALUES (11, 37, 8, 18, '2022-07-01 14:34:35.546291-03');


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 217
-- Name: construtor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.construtor_id_seq', 30, true);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 211
-- Name: empresa_construtor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empresa_construtor_id_seq', 3, true);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 209
-- Name: fornecedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fornecedor_id_seq', 7, true);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 215
-- Name: materiais_comprados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materiais_comprados_id_seq', 9, true);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 219
-- Name: materiais_gastos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materiais_gastos_id_seq', 11, true);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 213
-- Name: materiais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materiais_id_seq', 8, true);


--
-- TOC entry 3248 (class 2606 OID 16960)
-- Name: construtor construtor_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construtor
    ADD CONSTRAINT construtor_cpf_key UNIQUE (cpf);


--
-- TOC entry 3250 (class 2606 OID 16956)
-- Name: construtor construtor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construtor
    ADD CONSTRAINT construtor_pkey PRIMARY KEY (id);


--
-- TOC entry 3252 (class 2606 OID 16958)
-- Name: construtor construtor_telefone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construtor
    ADD CONSTRAINT construtor_telefone_key UNIQUE (telefone);


--
-- TOC entry 3238 (class 2606 OID 16923)
-- Name: empresa_construtor empresa_construtor_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa_construtor
    ADD CONSTRAINT empresa_construtor_cnpj_key UNIQUE (cnpj);


--
-- TOC entry 3240 (class 2606 OID 16921)
-- Name: empresa_construtor empresa_construtor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa_construtor
    ADD CONSTRAINT empresa_construtor_pkey PRIMARY KEY (id);


--
-- TOC entry 3242 (class 2606 OID 16925)
-- Name: empresa_construtor empresa_construtor_telefone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa_construtor
    ADD CONSTRAINT empresa_construtor_telefone_key UNIQUE (telefone);


--
-- TOC entry 3232 (class 2606 OID 16912)
-- Name: fornecedor fornecedor_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_cnpj_key UNIQUE (cnpj);


--
-- TOC entry 3234 (class 2606 OID 16996)
-- Name: fornecedor fornecedor_inscricao_estudal_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_inscricao_estudal_key UNIQUE (inscricao_estudal);


--
-- TOC entry 3236 (class 2606 OID 16910)
-- Name: fornecedor fornecedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (id);


--
-- TOC entry 3246 (class 2606 OID 16939)
-- Name: materiais_comprados materiais_comprados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiais_comprados
    ADD CONSTRAINT materiais_comprados_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 16984)
-- Name: materiais_gastos materiais_gastos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiais_gastos
    ADD CONSTRAINT materiais_gastos_pkey PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 16932)
-- Name: materiais materiais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiais
    ADD CONSTRAINT materiais_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 16990)
-- Name: materiais_gastos fk_construtor_to_materiais_gastos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiais_gastos
    ADD CONSTRAINT fk_construtor_to_materiais_gastos FOREIGN KEY (id_construtor) REFERENCES public.construtor(id);


--
-- TOC entry 3257 (class 2606 OID 16961)
-- Name: construtor fk_empresa_construtor_to_construtor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construtor
    ADD CONSTRAINT fk_empresa_construtor_to_construtor FOREIGN KEY (id_empresa_construtor) REFERENCES public.empresa_construtor(id);


--
-- TOC entry 3255 (class 2606 OID 16940)
-- Name: materiais_comprados fk_fornecedor_to_materiais_comprados; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiais_comprados
    ADD CONSTRAINT fk_fornecedor_to_materiais_comprados FOREIGN KEY (id_fornecedor) REFERENCES public.fornecedor(id);


--
-- TOC entry 3256 (class 2606 OID 16945)
-- Name: materiais_comprados fk_materiais_to_materiais_comprados; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiais_comprados
    ADD CONSTRAINT fk_materiais_to_materiais_comprados FOREIGN KEY (id_materiais) REFERENCES public.materiais(id);


--
-- TOC entry 3258 (class 2606 OID 16985)
-- Name: materiais_gastos fk_materiais_to_materiais_gastos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiais_gastos
    ADD CONSTRAINT fk_materiais_to_materiais_gastos FOREIGN KEY (id_materiais) REFERENCES public.materiais(id);


-- Completed on 2022-07-01 17:55:47 -03

--
-- PostgreSQL database dump complete
--

