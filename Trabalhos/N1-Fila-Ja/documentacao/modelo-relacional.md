# Visão relacional do banco

Este diagrama foi derivado do arquivo [`fila-ja.sql`](../sql/fila-ja.sql) para permitir a leitura da estrutura diretamente no GitHub. Ele é apenas um complemento, não serve para substituir os modelos conceitual e lógico.

```mermaid
erDiagram
    PACIENTE ||--o{ PACIENTE_TELEFONE : possui
    PACIENTE ||--o{ DEPENDENTE : possui
    PACIENTE ||--o{ SENHA : solicita
    UBS ||--o{ PROFISSIONAL : emprega
    UBS ||--o{ UBS_SERVICO : oferece
    SERVICO ||--o{ UBS_SERVICO : disponibilizado_em
    UBS_SERVICO ||--o{ FILA : organiza
    UBS ||--o{ FILA : mantem
    SERVICO ||--o{ FILA : destina_se
    PROFISSIONAL ||--o| MEDICO : especializa
    PROFISSIONAL ||--o| ENFERMEIRO : especializa
    PROFISSIONAL ||--o| RECEPCIONISTA : especializa
    PROFISSIONAL ||--o{ PROFISSIONAL_ESPECIALIDADE : possui
    ESPECIALIDADE ||--o{ PROFISSIONAL_ESPECIALIDADE : classifica
    FILA ||--o{ SENHA : contem
    SENHA ||--o| ATENDIMENTO : origina
    PROFISSIONAL ||--o{ ATENDIMENTO : realiza
    SENHA ||--o{ NOTIFICACAO : gera

    PACIENTE {
        int id_paciente PK
        varchar cpf UK
        varchar nome
        date data_nascimento
        char sexo
        varchar email
        datetime data_cadastro
    }
    PACIENTE_TELEFONE {
        int id_paciente PK,FK
        varchar telefone PK
    }
    DEPENDENTE {
        int id_paciente PK,FK
        int numero_dependente PK
        varchar nome
        date data_nascimento
        varchar grau_parentesco
    }
    UBS {
        int id_ubs PK
        varchar cnpj UK
        varchar nome
        varchar cidade
        char uf
        time horario_abertura
        time horario_fechamento
    }
    SERVICO {
        int id_servico PK
        varchar nome
        int tempo_estimado
        boolean requer_agendamento
    }
    UBS_SERVICO {
        int id_ubs PK,FK
        int id_servico PK,FK
        time horario_inicio
        time horario_fim
        int quantidade_diaria
    }
    PROFISSIONAL {
        int id_profissional PK
        int id_ubs FK
        varchar cpf UK
        varchar nome
        varchar registro_profissional
    }
    MEDICO {
        int id_profissional PK,FK
        varchar crm UK
    }
    ENFERMEIRO {
        int id_profissional PK,FK
        varchar coren UK
    }
    RECEPCIONISTA {
        int id_profissional PK,FK
        varchar matricula UK
    }
    ESPECIALIDADE {
        int id_especialidade PK
        varchar nome UK
        varchar descricao
    }
    PROFISSIONAL_ESPECIALIDADE {
        int id_profissional PK,FK
        int id_especialidade PK,FK
        date data_inicio
    }
    FILA {
        int id_fila PK
        int id_ubs FK
        int id_servico FK
        date data
        varchar status
        time horario_inicio
        time horario_fim
    }
    SENHA {
        int id_senha PK
        int id_fila FK
        int id_paciente FK
        int numero
        date data_emissao
        varchar status
        varchar prioridade
    }
    ATENDIMENTO {
        int id_atendimento PK
        int id_senha FK,UK
        int id_profissional FK
        date data
        time hora_inicio
        time hora_fim
        varchar status
    }
    NOTIFICACAO {
        int id_notificacao PK
        int id_senha FK
        varchar tipo
        varchar mensagem
        datetime data_envio
        varchar status_envio
    }
```
