select 
    ec.nome,
    count(c.id_empresa_construtor)

from construtor as c
join empresa_construtor as ec on (c.id_empresa_construtor = ec.id)
group by ec.nome