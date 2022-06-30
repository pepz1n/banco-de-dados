select
    c.nome,
    mg.quantidade_gasto*mc.valor_compra as valor_gasto,
    ec.nome as nome_empresa


from materiais_gastos as mg
join construtor as c on (mg.id_construtor = c.id)
join materiais as m on (mg.id_materiais = m.id)
join materiais_comprados as mc on (m.id = mc.id_materiais)
join empresa_construtor as ec on (c.id_empresa_construtor = ec.id)