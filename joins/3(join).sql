--Listar o título e data de publicação dos livros emprestados para usuarios com DDD (55)



select 
    l.titulo
    l.publicacao

from emprestimos as e
inner join emprestimo_livros as el on (e.id = el.id_emprestimos)
inner join usuarios as u on (e.id_usuario = u.id)
inner join livros as l on (el.id_livros = l.id)
where u.telefone like '(55)%'
--feito