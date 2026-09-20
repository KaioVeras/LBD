# Fila Já

Sistema de banco de dados para gerenciamento de filas e atendimentos em Unidades Básicas de Saúde (UBSs).

Trabalho N1 da disciplina de Laboratório de Banco de Dados.

## Entrega

| Artefato | Descrição |
| --- | --- |
| [Documentação](documentacao/fila-ja-documentacao-final.pdf) | Relatório com contexto, regras de negócio, modelos conceitual e lógico, implementação e conclusão. |
| [Script SQL](sql/fila-ja.sql) | Implementação física para MySQL 8.0+: criação do banco, 16 tabelas, dados de demonstração, 8 consultas e 3 atualizações. |
| [Modelo conceitual](modelos/fila-ja-modelo-conceitual.brM) | Arquivo-fonte do brModelo. |
| [Modelo lógico](modelos/fila-ja-modelo-logico-fisico.brM) | Arquivo-fonte do brModelo. |
| [Visão relacional](documentacao/modelo-relacional.md) | Diagrama em Mermaid, visualizável diretamente no GitHub. |

> Os arquivos .brM são fontes legadas do brModelo 2, criadas por um dos integrantes do grupo. Os diagramas também estão disponíveis como figuras na documentação final, e o modelo físico foi implementado no script SQL.

## Escopo implementado

O banco possui 16 tabelas, cobrindo pacientes, dependentes, UBSs, serviços, profissionais, especialidades, filas, senhas, atendimentos e notificações. A estrutura inclui especialização de profissionais, entidade fraca, chaves compostas e relacionamentos muitos-para-muitos resolvidos por tabelas associativas.

## Como executar

Pré-requisitos: MySQL 8.0 ou versão compatível e permissão para criar o banco `fila_ja`.

```bash
mysql -u seu_usuario -p < sql/fila-ja.sql
```

O script deve ser executado em uma base de testes. Ele cria o banco, popula os dados de demonstração e executa as consultas e atualizações documentadas.

## Estrutura

```text
N1-Fila-Ja/
├── documentacao/
│   ├── fila-ja-documentacao-final.pdf
│   └── modelo-relacional.md
├── modelos/
│   ├── fila-ja-modelo-conceitual.brM
│   └── fila-ja-modelo-logico-fisico.brM
├── sql/
│   └── fila-ja.sql
└── README.md
```

## Autoria

Grupo 01: Tiago Alcântara Puttini, Pedro Henrique Garcia, Ronald Salome e Kaio Veras.
