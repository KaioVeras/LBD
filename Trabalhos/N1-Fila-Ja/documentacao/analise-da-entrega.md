# Análise da entrega

Revisão realizada em 19/09/2026 a partir do enunciado, do PDF atual, dos dois arquivos do brModelo e do script SQL.

## Resumo

O projeto tem tema relevante, escopo compreensível e uma implementação substancial. O SQL contém criação, população, consultas e atualizações, e demonstra entidades fortes e fracas, especialização e associações muitos-para-muitos. Entretanto, o PDF atual ainda não constitui a entrega completa e existem divergências entre texto, modelos e implementação que precisam ser resolvidas antes do envio.

## Matriz de conformidade

| Requisito | Situação | Evidência ou ação necessária |
| --- | --- | --- |
| Tema escolhido | Atendido | Saúde: gestão de filas e atendimentos em UBS. |
| Contexto e justificativa | Atendido | Presentes nas páginas 2 e 3 do PDF atual. |
| Escopo | Parcial | O PDF menciona endereços e usuários, mas o SQL não possui tabela de usuário e armazena endereço apenas em `ubs`. |
| DER conceitual | Parcial | Existe fonte `.brM`, mas o diagrama não foi inserido no PDF nem exportado para imagem. |
| Entidade forte | Atendido | Exemplos: paciente, UBS, serviço e profissional. |
| Entidade fraca | Atendido | `dependente`, identificado por `(id_paciente, numero_dependente)`. |
| Entidade associativa | Atendido | `ubs_servico` e `profissional_especialidade`. |
| Especialização | Atendido | Profissional especializado em médico, enfermeiro ou recepcionista. |
| Relacionamentos 1:1, 1:N e M:N | Atendido no SQL | 1:1 entre senha e atendimento; 1:N em paciente-dependente; M:N por tabelas associativas. Confirmar a mesma representação no DER. |
| Relacionamento com atributo | Atendido | `profissional_especialidade.data_inicio` e atributos de `ubs_servico`. |
| Atributos simples, compostos e multivalorados | Parcial | Telefone do paciente foi transformado em tabela; endereço aparece de forma diferente entre os artefatos. Documentar a transformação do atributo composto. |
| Modelo lógico | Parcial | Existe fonte `.brM`; revisar a fidelidade ao SQL e incluir exportação legível no PDF. |
| Modelo físico MySQL | Parcial | O SQL define tipos e restrições, mas o diagrama físico precisa ser identificado e incluído no PDF. |
| Criação de tabelas | Atendido | 16 tabelas físicas no script. |
| População do banco | Atendido | Há dados de demonstração para todas as áreas principais. |
| Consultas `SELECT` | Atendido | Oito consultas, incluindo junções, agregações e filtros. |
| Atualizações `UPDATE` | Atendido | Três atualizações. |
| Link do repositório | Parcial | O link está neste README, mas ainda precisa entrar no PDF final. |
| Identificação do grupo | Pendente | Só foi possível confirmar Kaio Vítor Pinheiro Veras; faltam os demais nomes no material recebido. |

## Divergências que precisam de decisão do grupo

1. **Usuários do sistema:** aparecem no escopo do PDF, mas não existem no SQL recebido. Criar a entidade/tabela em todos os modelos ou remover esse item do escopo.
2. **Endereço do paciente:** aparece nos arquivos de modelagem, mas não na tabela `paciente` do SQL. Decidir se o endereço é requisito e uniformizar os três níveis de modelagem.
3. **Endereço como entidade:** o PDF lista “Endereços” como cadastro, enquanto a implementação mantém os campos de endereço dentro de `ubs`. Ajustar a redação ou criar uma entidade própria.
4. **Especialização de profissional:** um dos modelos aparenta reunir `crm`, `coren` e `matricula` em profissional, enquanto o SQL usa tabelas separadas. Manter uma única estratégia em todos os artefatos.
5. **Odontologia:** existe serviço odontológico, porém não há especialização `dentista`/`odontologo` nem profissional associado à especialidade Odontologia nos dados de exemplo.
6. **Coerência do atendimento:** o banco permite associar ao atendimento um profissional de outra UBS ou sem a especialidade do serviço da fila. Se isso fizer parte das regras de negócio, deve ser validado pela aplicação ou por uma modelagem mais restritiva.
7. **Datas duplicadas:** `senha.data_emissao` pode divergir de `fila.data`; documentar a regra ou evitar a redundância.

## Ajustes obrigatórios no PDF final

1. substituir “DOCUMENTO DE SISTEMAS OPERACIONAIS” por “Laboratório de Banco de Dados - Trabalho N1”;
2. adicionar instituição, disciplina, professor, integrantes, turma, cidade e data;
3. inserir sumário e numerar as seções de modo consistente;
4. inserir e legendar o modelo conceitual;
5. inserir e legendar o modelo lógico;
6. inserir e legendar o modelo físico;
7. explicar as principais regras de negócio, cardinalidades, chaves e escolhas de normalização;
8. adicionar uma seção de implementação com o link do GitHub;
9. incluir uma conclusão curta;
10. revisar os espaços excessivos e a quebra da seção 1.4 entre as páginas 2 e 3.

## Validação técnica

- A leitura estática confirmou 16 comandos `CREATE TABLE`, dados de exemplo, oito `SELECT`s e três `UPDATE`s.
- As chaves estrangeiras referenciadas são criadas antes das tabelas dependentes.
- O script completo foi executado com sucesso em uma instância MySQL temporária e limpa: as 16 tabelas, os dados, as oito consultas e as três atualizações foram processados sem erro.
- Os arquivos `.brM` foram preservados como fontes editáveis. Como o GitHub não renderiza esse formato, o repositório também contém uma visão relacional em Mermaid derivada do SQL.

## Prioridade recomendada

1. Resolver as sete divergências acima.
2. Exportar os três diagramas do brModelo em PNG ou PDF com boa resolução.
3. Atualizar e fechar o PDF da entrega.
4. Executar o script completo em um MySQL limpo e registrar o resultado.
5. Fazer o commit e enviar ao GitHub antes de inserir o link definitivo no PDF.
