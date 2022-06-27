--Listar título, nome da sessão e nome do autor dos livros que o usuário id 5 pegou emprestado (mesma lógica da anterior, caso não tenha usuario com id 5, 
--substituir por um id de usuario existente)


select 
    l.titulo,
    s.nome,
    l.nome_autor
    


from livros as l

inner join sessoes as s on (l.id_sessao = s.id)
inner join emprestimo_livro as el on (l.id = el.id_livros)
inner join emprestimos as e on (el.id_emprestimos = e.id)

where e.id_usuario = 1

--feito