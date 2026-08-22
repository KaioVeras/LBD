# LBD

[![Linguagem principal](https://img.shields.io/badge/Linguagem-SQL%20%2F%20MySQL-blue.svg)](https://dev.mysql.com/doc/)
[![Uso educacional](https://img.shields.io/badge/Contexto-Disciplina%20%2F%20Estudos-brightgreen.svg)](#aulas)
[![Última atualização](https://img.shields.io/badge/Atualizado-12%2F08%2F2026-orange.svg)](#atualiza%C3%A7%C3%A3o)

> Laboratório de Banco de Dados - conteúdo em SQL organizado por aulas, com foco em modelagem relacional, criação de tabelas e relacionamentos entre entidades.

Repositório público da disciplina de Laboratório de Banco de Dados, com scripts práticos, exercícios e implementações pensados para consulta rápida, revisão antes das aulas e evolução contínua ao longo do semestre.

**O que você encontra aqui:** scripts incrementais em SQL (MySQL), organizados do básico ao mais estruturado, com cada aula servindo como ponto de entrada para os scripts relacionados.

## Acesso Rápido

- [Visão geral](#lbd)
- [Aulas](#aulas)
- [Trabalhos práticos](#trabalhos-práticos)
- [Como executar](#como-executar)
- [Atualização](#atualização)
- [Autor](#autor)

## Aulas

| Aula | Tema | Data |
| --- | --- | --- |
| [Aula 01](Aulas/aula001) | Criação de banco de dados e tabelas (`CREATE DATABASE`, `CREATE TABLE`), chaves primárias e estrangeiras, relacionamento 1:N entre cliente–telefone e usuário–login. | 2026-08-12 |

## Trabalhos práticos

| Trabalho | Descrição | Conceitos Utilizados |
| --- | --- | --- |
| — | Os trabalhos serão adicionados ao longo do semestre. | — |

## Como Executar

Os scripts podem ser executados no MySQL Workbench ou direto no terminal:

```bash
mysql -u root -p < "Aulas/aula001/SQL Script - AULA 001.sql"
```

Ou, dentro do cliente MySQL, basta abrir o arquivo `.sql` desejado e executar o script completo.

Observação: os scripts criam os bancos `db_aula` e `db_usuarios`. Se já existirem no seu ambiente, remova-os antes ou ajuste os nomes para evitar conflitos.

## Atualização

Última atualização: 12/08/2026

## Autor

Kaio Vítor Pinheiro Veras
