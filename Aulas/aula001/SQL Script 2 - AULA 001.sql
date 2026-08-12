CREATE DATABASE db_usuarios;
USE db_usuarios;

CREATE TABLE usuario (
	codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE login (
	codigo INT PRIMARY KEY,
    username VARCHAR(100),
    senha VARCHAR(50),
    codigo_usuario INT,
    FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo)
);

CREATE TABLE telefone (
	codigo INT PRIMARY KEY,
	ddd VARCHAR(3),
    numero VARCHAR(12),
    codigo_usuario INT,
    FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo)
);