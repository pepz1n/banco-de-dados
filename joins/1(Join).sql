--Listar o nome, email e telefone do usuarios que pegaram emprestado algum livro do setor id 2 
--(caso não tenha setor id 2 no banco de dados de vocês, substituir por um id existente);

select 
    u.nome,
    u.email,
    u.telefone
from usuarios as u

inner join emprestimos as e on (u.id = e.id_usuario)
inner join emprestimo_livros as el on (e.id = el.id_emprestimo)
inner join livros as l on (el.id_livros = l.id)


where l.id_sessao = 2

--feito