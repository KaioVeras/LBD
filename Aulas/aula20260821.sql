create database if not exists Livraria;

use Livraria;

create table Autor (
	ID int primary key auto_increment,
    nome varchar(100) not null
);

create table Livro (
	ISBN DECIMAL(13) primary key,
    titulo varchar(255) not null,
    ano smallint,
    preco decimal(10,2) not null,
    autor_id int not null,
    constraint fk_autor_livro -- apelido da FK
    foreign key(autor_id) references Autor(ID)
    on update cascade -- o que acontece se atualizar
    on delete restrict -- o que acontece se apagar
);

insert into Autor (nome) values ('Machado de Assis');

select * from Autor;

insert into Autor(id, nome) values (1, 'Autor com Erro'); -- ERRO PK

insert into Livro (ISBN, titulo, ano, preco, autor_id) values
('1111111111111','Quincas Borba', 1891,99.90,1),
('1111111111112','Dom Casmurro', 1899, 25.0,1);

select * from Livro;

insert into Livro (ISBN, titulo, ano, preco, autor_id) values
('1111111111111','Programação', 2025,100.00,1); -- erro PK

insert into Livro (ISBN, titulo, ano, preco, autor_id) values
('9111111111111','Algoritmos', 2025,200,2); -- erro FK

delete from Autor where ID=1;

create table Pessoa (
	ID int primary key auto_increment,
    CPF decimal(11) unique not null,
    nome varchar(255) not null,
    data_nasc date not null,
    saldo decimal(10,2) not null default 0
);

insert into Pessoa (CPF, nome, data_nasc) values
("11111111111", "Letícia", "2006-01-01");

update Pessoa
set data_nasc = '2004-03-06'
where id=1;

select * from pessoa;

create table vendas (
	ID int primary key auto_increment,
    pessoa_id int not null,
    livro_isbn decimal(13) not null,
    ts_compra timestamp not null default current_timestamp(),
    constraint fk_pessoa_vendas
    foreign key(pessoa_id) references Pessoa(ID) on delete restrict,
    constraint fk_livro_vendas
    foreign key(livro_ISBN) references Livro(ISBN) on delete restrict
);

insert into vendas(pessoa_id, livro_isbn) values
(1, '1111111111112');

select * from Vendas;