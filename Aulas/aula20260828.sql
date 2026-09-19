use Livraria;

select * from Autor;

insert into Autor (nome) values ("Jefferson");

insert into Livro (ISBN, titulo, ano, preco, autor_id) values
("12345678901", "Algoritmos", 2024, 53.48, 2),
("12345678902", "Banco de Dados", 2025, 62.54, 2),
("12345678909", "Livro com problema", 2028, 2587.66, 2);

select * from Livro;

update Livro
set ano=2026
where ano > 2026; -- Erro, safe mode

select * from Livro where ano > 2026;

update Livro
set ano=2026, preco=200
where ISBN='12345678909';

delete from Livro
where ISBN='12345678909';

select distinct nome from Autor;

select * from Livro where ano <= 1900;

select * from Livro where autor_id <> 1;

select * from Livro
where ano >= 2025 and autor_id=2;

select * from Livro where ano is null;

select * from Livro where 
titulo like '%Dados%' or titulo like 'A%';

select * from Livro where ano in (1990, 1995, 2000, 2020, 2025);

-- subquery
select * from Livro where
autor_id in (select id from Autor where nome = 'Machado de Assis');

select * from Livro
where ano between 1800 and 1899;

select * from Livro
limit 3; -- sintaxe depende do SGBD

select * from Livro
order by preco desc;

-- Apresente os nomes de todos os autores
-- Apresente quais nomes de autores temos (use distinct)
-- Apresente os livros que custam menos de R$50
-- Apresente as pessoas que são maiores de idade






