# Fila Já

[![SGBD](https://img.shields.io/badge/SGBD-MySQL-4479A1?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Status](https://img.shields.io/badge/Status-em%20revis%C3%A3o-F4A261)](documentacao/analise-da-entrega.md)

Sistema de banco de dados para organizar filas e atendimentos em Unidades Básicas de Saúde (UBSs). O projeto registra pacientes, dependentes, profissionais, serviços, filas, senhas, atendimentos e notificações, com o objetivo de reduzir a espera presencial e apoiar a gestão das unidades.

## Entrega

| Item | Arquivo | Observação |
| --- | --- | --- |
| Documento atual | [PDF](documentacao/fila-ja-documento-atual.pdf) | Versão recebida em 19/09/2026; ainda precisa incorporar os diagramas e os dados da entrega. |
| Modelo conceitual | [arquivo do brModelo](modelos/fila-ja-modelo-conceitual.brM) | Fonte editável. |
| Modelo lógico/físico | [arquivo do brModelo](modelos/fila-ja-modelo-logico-fisico.brM) | Fonte editável. |
| Visão relacional | [documentação em Mermaid](documentacao/modelo-relacional.md) | Diagrama navegável diretamente no GitHub, derivado do SQL. |
| Implementação | [fila-ja.sql](sql/fila-ja.sql) | Criação, população, oito consultas e três atualizações. |
| Orientações | [orientacoes-do-trabalho.md](documentacao/orientacoes-do-trabalho.md) | Enunciado fornecido pelo professor, transcrito em Markdown. |
| Revisão | [analise-da-entrega.md](documentacao/analise-da-entrega.md) | Matriz de atendimento e pendências antes da entrega. |

## Escopo implementado

O banco possui 16 tabelas:

- cadastros: `paciente`, `paciente_telefone`, `dependente`, `ubs`, `servico`, `profissional` e `especialidade`;
- especializações de profissional: `medico`, `enfermeiro` e `recepcionista`;
- associações: `ubs_servico` e `profissional_especialidade`;
- operação: `fila`, `senha`, `atendimento` e `notificacao`.

Entre os conceitos modelados estão entidade fraca (`dependente`), atributo multivalorado transformado em tabela (`paciente_telefone`), generalização/especialização de profissionais e relacionamentos muitos-para-muitos resolvidos por tabelas associativas.

## Como executar

### Pré-requisitos

- MySQL 8.0 ou versão compatível;
- usuário com permissão para criar o banco `fila_ja`.

No terminal:

```bash
mysql -u seu_usuario -p < sql/fila-ja.sql
```

No MySQL Workbench, abra [`sql/fila-ja.sql`](sql/fila-ja.sql), revise o banco selecionado e execute o script completo. O arquivo cria o banco, as tabelas e os dados de demonstração antes de executar as consultas e atualizações.

O script foi preparado para uma base nova. Se o banco `fila_ja` já contiver as tabelas, use outro ambiente de testes ou remova a base anterior conscientemente antes de executar novamente.

O arquivo foi validado de ponta a ponta em uma instância MySQL limpa em 19/09/2026.

## Estrutura

```text
N1-Fila-Ja/
├── documentacao/
│   ├── analise-da-entrega.md
│   ├── fila-ja-documento-atual.pdf
│   ├── modelo-relacional.md
│   └── orientacoes-do-trabalho.md
├── modelos/
│   ├── fila-ja-modelo-conceitual.brM
│   └── fila-ja-modelo-logico-fisico.brM
├── sql/
│   └── fila-ja.sql
└── README.md
```

## Repositório

Código-fonte: [github.com/KaioVeras/LBD](https://github.com/KaioVeras/LBD)

## Autoria

- Kaio Vítor Pinheiro Veras;
- demais integrantes: incluir os nomes completos antes da entrega.

Trabalho N1 da disciplina de Laboratório de Banco de Dados, ministrada pelo professor Jefferson Salomão Rodrigues.
