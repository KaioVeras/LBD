use Livraria;

select min(ano) as Ano_minimo from Livro;

select avg(ano) from Livro;

select count(*) as qnt from Livro;

-- 8. Mostre quantos livros foram escritos por autor
select A.id, A.nome, count(L.ISBN) as qnt
from Autor A left join Livro L
		on A.id = L.autor_id
group by A.id;

-- 9. Mostre quantos livros foram escritos por autor,
-- 		apenas autores que escreveram pelo menos 2 livros,
-- 		ordene pelos autores que escreveram mais livros
select A.id, A.nome, count(L.ISBN) as qnt
from Autor A inner join Livro L
		on A.id = L.autor_id
group by A.id
having qnt >= 2
order by qnt desc;

-- 10. Apresente quantos livros foram comprados por pessoa
-- 		apenas nos anos de 2024 e 2025,
-- 		ordene por quem mais comprou livros
select p.id, p.nome, count(v.id) as qnt
from Pessoa p
inner join Vendas v on p.id = v.pessoa_id
where ts_compra between "2024-01-01 00:00:00" and "2025-12-31 23:59:59:999999"
group by p.id;


