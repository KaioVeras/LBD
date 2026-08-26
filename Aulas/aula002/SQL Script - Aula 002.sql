CREATE DATABASE db_supermercado;
USE db_supermercado;

CREATE TABLE pessoa (
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    logradouro VARCHAR(120),
    cidade VARCHAR(60) DEFAULT 'BRASILIA',
    uf CHAR(2) DEFAULT 'DF',
    cep VARCHAR(9),
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE cliente (
	codigo INT PRIMARY KEY,
    cpf VARCHAR(13) NOT NULL,
    data_cadastro TIMESTAMP,
    FOREIGN KEY (codigo) REFERENCES pessoa (codigo)
);

CREATE TABLE vendedor (
	codigo INT PRIMARY KEY,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    salario DECIMAL(7,2),
    faixa_comissao ENUM ('A', 'B', 'c'),
    aitvo TINYINT,
    FOREIGN KEY (codigo) REFERENCES pessoa (codigo)
);

CREATE TABLE login (
	pessoa_codigo INT PRIMARY KEY,
	usuario VARCHAR(40) NOT NULL,
    senha_hash VARCHAR(60) NOT NULL,
    ultimo_acesso DATETIME DEFAULT NOW(),
    FOREIGN KEY (pessoa_codigo) REFERENCES pessoa (codigo)
);

