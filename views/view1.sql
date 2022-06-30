select 
    m.nome,
    m.quantidade_estoque + mc.quantidade as quantidade_estoque_total,
    (m.quantidade_estoque + mc.quantidade ) * mc.valor_compra as valor_total_produtos,
    quantidade_estoque_total -  mg.quantidade_gasto as quantidade_produtos_gasto,
    valor_total_produtos -  mg.quantidade_gasto* mc.valor_compra as valor_apos_gasto
from materiais_comprados as mc
join materiais as m on (mc.id_materiais = m.id)
join materiais_gastos as mg on (m.id = mg.id_materiais)
