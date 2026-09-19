# Laboratório de Banco de Dados

[![Banco de dados](https://img.shields.io/badge/SGBD-MySQL-4479A1?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Linguagem](https://img.shields.io/badge/Linguagem-SQL-1f6feb)](https://dev.mysql.com/doc/)
[![Status](https://img.shields.io/badge/Status-em%20desenvolvimento-F4A261)](#organização-do-repositório)
[![Licença](https://img.shields.io/badge/Licen%C3%A7a-MIT-2EA44F)](LICENSE)

Repositório da disciplina de **Laboratório de Banco de Dados (LBD)**. Ele centraliza materiais de aula, exercícios, scripts em SQL e os trabalhos desenvolvidos ao longo do semestre, mantendo o conteúdo organizado para consulta, execução e revisão.

## Navegação

- [Visão geral](#visão-geral)
- [Organização do repositório](#organização-do-repositório)
- [Aulas](#aulas)
- [Trabalhos](#trabalhos)
- [Como executar scripts SQL](#como-executar-scripts-sql)

## Visão geral

O conteúdo deste repositório acompanha o aprendizado prático de modelagem e implementação de bancos de dados relacionais. Os materiais podem incluir:

- modelagem conceitual, lógica e física;
- diagramas entidade-relacionamento (DER);
- criação e alteração de tabelas;
- chaves primárias, estrangeiras e compostas;
- normalização e restrições de integridade;
- população de banco de dados;
- consultas e manipulação de dados em MySQL.

> Os materiais são adicionados progressivamente. Cada pasta deve conter arquivos suficientes para que seu conteúdo possa ser entendido e executado de forma independente.

## Organização do repositório

```text
LBD/
├── Aulas/                    # Materiais, exemplos e exercícios organizados por aula
├── Trabalhos/
│   └── N1-Fila-Ja/           # Trabalho N1: Fila Já
├── README.md                 # Guia de navegação do repositório
└── LICENSE                   # Licença MIT
```

| Área | Conteúdo esperado |
| --- | --- |
| [`Aulas/`](Aulas/) | Scripts, anotações, exercícios e materiais usados nas aulas. |
| [`Trabalhos/`](Trabalhos/) | Documentação, diagramas e scripts dos projetos em grupo. |

## Aulas

| Aula | Data | Resumo |
| --- | --- | --- |
| [Aula 01](Aulas/aula20260821.sql) | 21/08/2026 | Criação do banco `Livraria`, tabelas, chaves primárias e estrangeiras, restrições de integridade e operações básicas de inserção, consulta, atualização e exclusão. |
| [Aula 02](Aulas/aula20260828.sql) | 28/08/2026 | Consultas com filtros, operadores lógicos, `LIKE`, `IN`, `BETWEEN`, subconsultas, ordenação e limite de resultados. |
| [Aula 03](Aulas/aula20260904.sql) | 04/09/2026 | Consultas com `JOIN`, identificação de registros sem relacionamento e cálculo de idade com datas. |
| [Aula 04](Aulas/aula20260911.sql) | 11/09/2026 | Funções de agregação, agrupamento com `GROUP BY`, filtros com `HAVING` e ordenação de resultados agregados. |

> Ao adicionar uma aula, inclua nesta tabela o link para sua pasta, a data e uma breve descrição dos conceitos ou exercícios abordados.

## Trabalhos

| Trabalho | Data | Grupo | Status | Resumo |
| --- | --- | --- | --- | --- |
| [N1 - Fila Já](Trabalhos/N1-Fila-Ja/) | 20/09/2026 | Kaio Vítor Pinheiro Veras e grupo | Em revisão | Modelagem e implementação MySQL de um sistema de gestão de filas e atendimentos em UBS. |

O trabalho reúne a proposta, os modelos editáveis do brModelo, o script de criação e população do banco, consultas, atualizações e uma análise de conformidade com o enunciado.

## Como executar scripts SQL

Os scripts deste repositório são destinados ao **MySQL**. Antes de executar um arquivo, leia seus comentários iniciais e confira se ele cria ou utiliza um banco de dados já existente.

No terminal, um arquivo `.sql` pode ser executado assim:

```bash
mysql -u seu_usuario -p < caminho/para/arquivo.sql
```

No MySQL Workbench:

1. Abra o arquivo `.sql` desejado.
2. Revise o banco selecionado pelo script.
3. Execute o conteúdo completo ou os trechos necessários.
4. Verifique os resultados com consultas `SELECT`.

> Use um banco local de testes. Scripts que recriam tabelas ou bancos podem substituir estruturas existentes.

## Licença

Este projeto está sob a licença [MIT](LICENSE).
