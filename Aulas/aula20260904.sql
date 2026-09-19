use Livraria;

-- 1 Retornar os nomes dos autores
select distinct nome from Autor;

-- 2 Retorne os nomes dos livros
select titulo from Livro;

-- 3 Retorne as pessoas que estão com saldo 0
select * from Pessoa
where saldo = 0;

-- 4 Retorne as pessoas menores de idade
select * from Pessoa
where data_nasc > '2008-09-04';

select * from Pessoa
where data_nasc > date_sub(current_date(), interval 18 year);

-- 5 Retorne os nomes dos autores e dos livros
select A.nome, L.titulo
from
Autor A inner join Livro L
on A.ID = L.autor_id;

-- 6 Retorne os nomes dos autores que não tem livros escritos
insert into Autor (nome) values ("Fulano");

select A.nome
from
Autor A left join Livro L
on A.ID = L.autor_id
where L.ISBN is null;

-- 7 Retorne o nome da Pessoa e o nome do livro que ela comprou
select p.nome, l.titulo, v.ts_compra
from Pessoa p
inner join Vendas v
	on p.id = v.pessoa_id
inner join Livro l
	on v.livro_isbn = l.isbn;






