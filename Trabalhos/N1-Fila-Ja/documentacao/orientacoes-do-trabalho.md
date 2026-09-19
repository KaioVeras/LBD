# Orientações do trabalho N1

## Objetivo

Desenvolver uma proposta de sistema de banco de dados, com modelagem conceitual, lógica e física e sua implementação.

## Etapas

### 1. Escolha do tema

O grupo deve escolher um tema de relevância social, econômica ou tecnológica, como saúde, educação, acessibilidade, transporte, alimentação, varejo, mobilidade urbana, finanças, sustentabilidade, segurança, agronegócio, turismo ou animais de estimação. Outros temas dependem de aprovação prévia do professor.

### 2. Documento de entrega

O grupo deve entregar um documento em PDF contendo:

- tema escolhido;
- descrição detalhada do tema, com contexto, justificativa e escopo;
- DER conceitual completo;
- modelagem lógica coerente com o modelo conceitual;
- modelagem física para MySQL;
- link do repositório com a implementação.

#### Requisitos do DER conceitual

- entidades fortes, fracas, associativas e especializadas;
- relacionamentos 1:1, 1:N e M:N;
- relacionamentos com atributos, quando pertinente;
- relacionamentos binários, ternários ou de outros graus, quando pertinentes;
- atributos simples, compostos e multivalorados;
- chaves primárias, estrangeiras e compostas, que podem ser apresentadas nos demais diagramas quando necessário.

#### Requisitos da modelagem lógica

- tabelas e atributos;
- tipos de dados;
- chaves primárias e estrangeiras;
- coerência com o modelo conceitual.

#### Requisitos da modelagem física

- MySQL como SGBD;
- tipos de dados específicos;
- restrições de integridade;
- normalização;
- estrutura física das tabelas.

#### Requisitos da implementação

O repositório deve conter scripts `.sql` para:

- criação das tabelas;
- inserção de dados;
- consultas com `SELECT`;
- atualizações com `UPDATE`.

Todo o código pode estar em um único arquivo. A implementação deve ser fiel aos diagramas e demonstrar qualidade técnica, organização e boas práticas.

## Critérios de avaliação

- clareza e coerência da descrição do tema;
- complexidade e diversidade da modelagem;
- correção técnica do DER;
- coerência entre os modelos conceitual, lógico e físico;
- apresentação visual e organização do documento;
- qualidade, correção e funcionamento dos scripts;
- clareza da documentação;
- participação dos integrantes.

## Entrega

Formato final: PDF, acompanhado do link do repositório com os códigos.
