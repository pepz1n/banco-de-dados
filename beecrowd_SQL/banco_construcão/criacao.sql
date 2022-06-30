
-- criação da tabela Materiais, nenhuma chave estrangeira
CREATE TABLE IF NOT EXISTS public.materiais
(
    id integer NOT NULL DEFAULT nextval('materiais_id_seq'::regclass),
    unidade_medida character varying(20) COLLATE pg_catalog."default" NOT NULL,
    nome character varying(200) COLLATE pg_catalog."default" NOT NULL,
    quantidade_estoque integer NOT NULL,
    valor character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT materiais_pkey PRIMARY KEY (id)
);

-- criaçao da tabela do fornecedor, nenhuma chave estrangeira
CREATE TABLE IF NOT EXISTS public.fornecedor
(
    id integer NOT NULL DEFAULT nextval('fornecedor_id_seq'::regclass),
    nome character varying(200) COLLATE pg_catalog."default" NOT NULL,
    cnpj character varying(18) COLLATE pg_catalog."default" NOT NULL,
    inscricao_estudal character varying(20) COLLATE pg_catalog."default" NOT NULL,
    uf character varying(2) COLLATE pg_catalog."default",
    bairro character varying(100) COLLATE pg_catalog."default",
    rua character varying(100) COLLATE pg_catalog."default",
    numero integer,
    cidade character varying(16) COLLATE pg_catalog."default",
    CONSTRAINT fornecedor_pkey PRIMARY KEY (id),
    CONSTRAINT fornecedor_cnpj_key UNIQUE (cnpj),
    CONSTRAINT fornecedor_inscricao_estudal_key UNIQUE (inscricao_estudal)
);


-- criação da tabela empresa_constutor, nenhuma chave estrangeira
CREATE TABLE IF NOT EXISTS public.empresa_construtor
(
    id integer NOT NULL DEFAULT nextval('empresa_construtor_id_seq'::regclass),
    nome character varying(200) COLLATE pg_catalog."default" NOT NULL,
    cnpj character varying(18) COLLATE pg_catalog."default" NOT NULL,
    telefone character varying(16) COLLATE pg_catalog."default" NOT NULL,
    uf character varying(2) COLLATE pg_catalog."default",
    bairro character varying(100) COLLATE pg_catalog."default",
    rua character varying(100) COLLATE pg_catalog."default",
    numero integer,
    cidade character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT empresa_construtor_pkey PRIMARY KEY (id),
    CONSTRAINT empresa_construtor_cnpj_key UNIQUE (cnpj),
    CONSTRAINT empresa_construtor_telefone_key UNIQUE (telefone)
);

-- criação da tabela construtor, uma chave estangeira, citando a tabela empresa_constutor
CREATE TABLE IF NOT EXISTS public.construtor
(
    id integer NOT NULL DEFAULT nextval('construtor_id_seq'::regclass),
    nome character varying(200) COLLATE pg_catalog."default" NOT NULL,
    nascimento date NOT NULL,
    telefone character varying(16) COLLATE pg_catalog."default" NOT NULL,
    cpf character varying(30) COLLATE pg_catalog."default" NOT NULL,
    casado boolean NOT NULL,
    id_empresa_construtor integer NOT NULL,
    CONSTRAINT construtor_pkey PRIMARY KEY (id),
    CONSTRAINT construtor_cpf_key UNIQUE (cpf),
    CONSTRAINT construtor_telefone_key UNIQUE (telefone),
    CONSTRAINT fk_empresa_construtor_to_construtor FOREIGN KEY (id_empresa_construtor)
        REFERENCES public.empresa_construtor (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


-- criação da tabela materiais_comprados, duas chaves estrangeiras, citando a tabela fornecedor e citando a tabela materiais
CREATE TABLE IF NOT EXISTS public.materiais_comprados
(
    id integer NOT NULL DEFAULT nextval('materiais_comprados_id_seq'::regclass),
    valor_compra double precision,
    id_fornecedor integer NOT NULL,
    id_materiais integer NOT NULL,
    quantidade integer NOT NULL,
    CONSTRAINT materiais_comprados_pkey PRIMARY KEY (id),
    CONSTRAINT fk_fornecedor_to_materiais_comprados FOREIGN KEY (id_fornecedor)
        REFERENCES public.fornecedor (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_materiais_to_materiais_comprados FOREIGN KEY (id_materiais)
        REFERENCES public.materiais (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


-- criaçao da tabela materiais_gastos, duas chaves estrangeiras, citando a tabela construtor e a tabela materiais
CREATE TABLE IF NOT EXISTS public.materiais_gastos
(
    id integer NOT NULL DEFAULT nextval('materiais_gastos_id_seq'::regclass),
    quantidade_gasto integer NOT NULL,
    id_materiais integer NOT NULL,
    id_construtor integer NOT NULL,
    CONSTRAINT materiais_gastos_pkey PRIMARY KEY (id),
    CONSTRAINT fk_construtor_to_materiais_gastos FOREIGN KEY (id_construtor)
        REFERENCES public.construtor (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_materiais_to_materiais_gastos FOREIGN KEY (id_materiais)
        REFERENCES public.materiais (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)



