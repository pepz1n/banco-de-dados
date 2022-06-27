-- 3. consulta que liste o titulo, autor e
-- data de publicacao de todos os livros
-- DESAFIO: exibir a data no formato DD/MM/YYYY
-- Pesquisar sobre o uso da funcao to_char()


select 
    titulo, 
    nome_autor, 
    to_char(publicacao, 'DD/MM/YYYY') as "DataPublicação"
from livros

--feito