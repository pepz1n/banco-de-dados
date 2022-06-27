-- ESTRUTURAIS

-- Criar e Manipular Bases de Dados
create database meu_banco; --cria um banco de dados com o nome "meu_banco"
drop database meu_banco; --exclui o banco de dados "meu_banco"

-- Criar e Manipular Tabelas
create table minha_tabela ( --cria uma tabela com o nome "minha_tabela"
    --padrao: nome_coluna tipo_coluna(tamanho caso necessario) propriedades
        -- primary key: chave primaria da tabela
        -- not null: não permite que a coluna fique sem valor
        -- unique: define que essa coluna é uma chave unica na tabela, para essa coluna;
        -- serial: gera um sequenciador automatico
        -- default: default "valor", valor padrao que a coluna assume no registro caso nao seja informada na inserção;
    id serial primary key,
    cpf varchar(16) not null unique,
    nome varchar(200) not null,
    valor numeric(15,4) not null
);

drop table minha_tabela; -- excluir a tabela

-- Criar e Manipular Colunas
alter table minha_tabela
    add column nova_coluna varchar(16) not null unique;

alter table minha_table
    drop column minha_coluna;



-- Criar e Manipular Dados

-- Seleção - SELECT - GET
select (colunas) from minha_tabela;

-- Inserção - INSERT - POST
insert into minha_tabela (nome, id, cpf) values ('Gabriel', 1,'123.546.789-10');

-- Atualizar - UPDATE - PUT/PATCH
update minha_tabela set 
    minha_coluna = 'valor', 
    minha_outra_coluna = 'valor_2'
where id = 1 --MUITO IMPORTANTE UPDATE COM WHERE

-- Deletar - DELETE - DELETE
delete from minha_tabela
where id = 1;

-- emprestimos

-- id
-- id_usuario
-- data_inicio
-- data_final

-- emprestimo_livros

-- id
-- id_emprestimo //fk
-- id_livro //fk