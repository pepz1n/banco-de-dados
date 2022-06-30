create view vw_idade_trabalho
as
select
    c.id,
    c.nome,
    to_char(c.nascimento, 'DD/MM/YYYY') as data_nascimento,
    to_char(current_date, 'DD/MM/YYYY')as data_atual,
    to_char ( AGE (current_date, c.nascimento) , 'YY "ano(s)"') as idade,
    ec.nome as empresa_que_trabalha
    
from construtor as c 
join empresa_construtor as ec on (c.id_empresa_construtor = ec.id)
order by AGE (current_date, c.nascimento) desc