-- Trabalho N1 - Laboratorio de Banco de Dados
-- Projeto: Fila Ja - Gestao de filas e atendimentos em UBS
-- SGBD: MySQL 8.0+
--
-- Este script cria o banco, define as tabelas, inclui dados de demonstracao
-- e executa exemplos de SELECT e UPDATE. Execute-o em uma base de testes nova.

CREATE DATABASE IF NOT EXISTS fila_ja
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

USE fila_ja;

-- ============================================================
-- 1. ESTRUTURA DO BANCO
-- ============================================================

CREATE TABLE paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo CHAR(1) NOT NULL,
    email VARCHAR(100),
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE paciente_telefone (
    id_paciente INT NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_paciente, telefone),
    FOREIGN KEY (id_paciente)
        REFERENCES paciente(id_paciente)
);

CREATE TABLE dependente (
    id_paciente INT NOT NULL,
    numero_dependente INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    grau_parentesco VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_paciente, numero_dependente),
    FOREIGN KEY (id_paciente)
        REFERENCES paciente(id_paciente)
);

CREATE TABLE ubs (
    id_ubs INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(100),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    uf CHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    horario_abertura TIME NOT NULL,
    horario_fechamento TIME NOT NULL
);

CREATE TABLE servico (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    tempo_estimado INT NOT NULL,
    requer_agendamento BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE ubs_servico (
    id_ubs INT NOT NULL,
    id_servico INT NOT NULL,
    horario_inicio TIME NOT NULL,
    horario_fim TIME NOT NULL,
    quantidade_diaria INT,
    PRIMARY KEY (id_ubs, id_servico),
    FOREIGN KEY (id_ubs)
        REFERENCES ubs(id_ubs),
    FOREIGN KEY (id_servico)
        REFERENCES servico(id_servico)
);

CREATE TABLE profissional (
    id_profissional INT AUTO_INCREMENT PRIMARY KEY,
    id_ubs INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    registro_profissional VARCHAR(30) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    FOREIGN KEY (id_ubs)
        REFERENCES ubs(id_ubs)
);

CREATE TABLE medico (
    id_profissional INT PRIMARY KEY,
    crm VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (id_profissional)
        REFERENCES profissional(id_profissional)
);

CREATE TABLE enfermeiro (
    id_profissional INT PRIMARY KEY,
    coren VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (id_profissional)
        REFERENCES profissional(id_profissional)
);

CREATE TABLE recepcionista (
    id_profissional INT PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (id_profissional)
        REFERENCES profissional(id_profissional)
);

CREATE TABLE especialidade (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

CREATE TABLE profissional_especialidade (
    id_profissional INT NOT NULL,
    id_especialidade INT NOT NULL,
    data_inicio DATE NOT NULL,
    PRIMARY KEY (id_profissional, id_especialidade),
    FOREIGN KEY (id_profissional)
        REFERENCES profissional(id_profissional),
    FOREIGN KEY (id_especialidade)
        REFERENCES especialidade(id_especialidade)
);

CREATE TABLE fila (
    id_fila INT AUTO_INCREMENT PRIMARY KEY,
    id_ubs INT NOT NULL,
    id_servico INT NOT NULL,
    data DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    horario_inicio TIME NOT NULL,
    horario_fim TIME,
    FOREIGN KEY (id_ubs)
        REFERENCES ubs(id_ubs),
    FOREIGN KEY (id_servico)
        REFERENCES servico(id_servico),
    FOREIGN KEY (id_ubs, id_servico)
        REFERENCES ubs_servico(id_ubs, id_servico),
    UNIQUE (id_ubs, id_servico, data)
);

CREATE TABLE senha (
    id_senha INT AUTO_INCREMENT PRIMARY KEY,
    id_fila INT NOT NULL,
    id_paciente INT NOT NULL,
    numero INT NOT NULL,
    data_emissao DATE NOT NULL,
    horario_emissao TIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    prioridade VARCHAR(20) NOT NULL DEFAULT 'NORMAL',
    FOREIGN KEY (id_fila)
        REFERENCES fila(id_fila),
    FOREIGN KEY (id_paciente)
        REFERENCES paciente(id_paciente),
    UNIQUE (id_fila, numero)
);

CREATE TABLE atendimento (
    id_atendimento INT AUTO_INCREMENT PRIMARY KEY,
    id_senha INT NOT NULL,
    id_profissional INT NOT NULL,
    data DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME,
    observacao VARCHAR(500),
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_senha)
        REFERENCES senha(id_senha),
    FOREIGN KEY (id_profissional)
        REFERENCES profissional(id_profissional),
    UNIQUE (id_senha)
);

CREATE TABLE notificacao (
    id_notificacao INT AUTO_INCREMENT PRIMARY KEY,
    id_senha INT NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    mensagem VARCHAR(255) NOT NULL,
    data_envio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status_envio VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_senha)
        REFERENCES senha(id_senha)
);

-- ============================================================
-- 2. DADOS DE DEMONSTRACAO
-- ============================================================

INSERT INTO ubs
(nome, cnpj, telefone, email, logradouro, numero, complemento,
bairro, cidade, uf, cep, horario_abertura, horario_fechamento)
VALUES
('UBS Asa Sul', '00000000000101', '6130011001',
'asasul@filaja.com.br', 'SGAS 612', 'S/N', NULL,
'Asa Sul', 'Brasilia', 'DF', '70200000', '07:00:00', '18:00:00'),
('UBS Asa Norte', '00000000000102', '6130011002',
'asanorte@filaja.com.br', 'SQN 210', 'S/N', NULL,
'Asa Norte', 'Brasilia', 'DF', '70863000', '07:00:00', '18:00:00'),
('UBS Taguatinga', '00000000000103', '6130011003',
'taguatinga@filaja.com.br', 'QNL 24', 'S/N', NULL,
'Taguatinga', 'Brasilia', 'DF', '72152000', '07:00:00', '18:00:00');

INSERT INTO paciente
(cpf, nome, data_nascimento, sexo, email)
VALUES
('11111111101', 'Pedro Henrique', '2007-05-10', 'M', 'pedro@email.com'),
('22222222202', 'Maria Silva', '1998-08-20', 'F', 'maria@email.com'),
('33333333303', 'Joao Santos', '1975-03-15', 'M', 'joao@email.com'),
('44444444404', 'Ana Oliveira', '1989-11-25', 'F', 'ana@email.com'),
('55555555505', 'Carlos Souza', '1960-02-10', 'M', 'carlos@email.com');

INSERT INTO paciente_telefone
(id_paciente, telefone)
VALUES
(1, '61999991111'),
(1, '61988882222'),
(2, '61977773333'),
(3, '61966664444'),
(4, '61955555555'),
(5, '61944446666');

INSERT INTO dependente
(id_paciente, numero_dependente, nome, data_nascimento, grau_parentesco)
VALUES
(1, 1, 'Lucas Henrique', '2018-06-10', 'Filho'),
(1, 2, 'Mariana Henrique', '2020-09-15', 'Filha'),
(2, 1, 'Gabriel Silva', '2019-04-12', 'Filho'),
(3, 1, 'Julia Santos', '2015-12-20', 'Filha');

INSERT INTO servico
(nome, descricao, tempo_estimado, requer_agendamento)
VALUES
('Consulta Medica', 'Consulta com profissional medico', 30, TRUE),
('Vacinacao', 'Aplicacao de vacinas', 15, FALSE),
('Curativo', 'Realizacao de curativos', 20, FALSE),
('Atendimento de Enfermagem', 'Atendimento realizado pela equipe de enfermagem', 25, FALSE),
('Atendimento Odontologico', 'Consulta e procedimentos odontologicos', 40, TRUE);

INSERT INTO ubs_servico
(id_ubs, id_servico, horario_inicio, horario_fim, quantidade_diaria)
VALUES
(1, 1, '08:00:00', '17:00:00', 20),
(1, 2, '07:30:00', '16:30:00', 50),
(1, 3, '08:00:00', '17:00:00', 25),
(2, 1, '08:00:00', '17:00:00', 15),
(2, 2, '07:30:00', '16:30:00', 40),
(2, 4, '08:00:00', '17:00:00', 20),
(3, 1, '08:00:00', '17:00:00', 18),
(3, 5, '08:00:00', '16:00:00', 12);

INSERT INTO profissional
(id_ubs, nome, cpf, registro_profissional, telefone, email)
VALUES
(1, 'Dr. Roberto Almeida', '66666666606', 'MED001', '61933331111', 'roberto@filaja.com'),
(1, 'Enf. Juliana Costa', '77777777707', 'ENF001', '61933332222', 'juliana@filaja.com'),
(1, 'Marcos Pereira', '88888888808', 'REC001', '61933333333', 'marcos@filaja.com'),
(2, 'Dra. Fernanda Lima', '99999999909', 'MED002', '61933334444', 'fernanda@filaja.com'),
(2, 'Enf. Ricardo Alves', '10101010110', 'ENF002', '61933335555', 'ricardo@filaja.com'),
(3, 'Dra. Camila Rocha', '12121212112', 'MED003', '61933336666', 'camila@filaja.com');

INSERT INTO medico
(id_profissional, crm)
VALUES
(1, 'CRM-DF-10001'),
(4, 'CRM-DF-10002'),
(6, 'CRM-DF-10003');

INSERT INTO enfermeiro
(id_profissional, coren)
VALUES
(2, 'COREN-DF-20001'),
(5, 'COREN-DF-20002');

INSERT INTO recepcionista
(id_profissional, matricula)
VALUES
(3, 'REC1001');

INSERT INTO especialidade
(nome, descricao)
VALUES
('Clinica Geral', 'Atendimento medico geral'),
('Pediatria', 'Atendimento medico infantil'),
('Enfermagem', 'Atendimento e cuidados de enfermagem'),
('Odontologia', 'Atendimento odontologico');

INSERT INTO profissional_especialidade
(id_profissional, id_especialidade, data_inicio)
VALUES
(1, 1, '2024-01-10'),
(1, 2, '2025-02-15'),
(2, 3, '2024-03-10'),
(4, 1, '2023-08-20'),
(5, 3, '2024-05-12'),
(6, 1, '2025-01-20');

INSERT INTO fila
(id_ubs, id_servico, data, status, horario_inicio, horario_fim)
VALUES
(1, 1, '2026-09-18', 'ABERTA', '08:00:00', NULL),
(1, 2, '2026-09-18', 'ABERTA', '07:30:00', NULL),
(1, 3, '2026-09-18', 'ENCERRADA', '08:00:00', '17:00:00'),
(2, 1, '2026-09-18', 'ABERTA', '08:00:00', NULL),
(2, 2, '2026-09-18', 'ABERTA', '07:30:00', NULL),
(3, 1, '2026-09-18', 'ABERTA', '08:00:00', NULL);

INSERT INTO senha
(id_fila, id_paciente, numero, data_emissao, horario_emissao, status, prioridade)
VALUES
(1, 1, 1, '2026-09-18', '08:05:00', 'ATENDIDA', 'NORMAL'),
(1, 2, 2, '2026-09-18', '08:10:00', 'CHAMADA', 'NORMAL'),
(1, 3, 3, '2026-09-18', '08:15:00', 'AGUARDANDO', 'NORMAL'),
(2, 4, 1, '2026-09-18', '07:45:00', 'ATENDIDA', 'PRIORITARIA'),
(4, 5, 1, '2026-09-18', '08:20:00', 'EM_ATENDIMENTO', 'PRIORITARIA'),
(5, 1, 1, '2026-09-18', '08:00:00', 'AGUARDANDO', 'NORMAL');

INSERT INTO atendimento
(id_senha, id_profissional, data, hora_inicio, hora_fim, observacao, status)
VALUES
(1, 1, '2026-09-18', '08:30:00', '09:00:00',
'Consulta realizada sem intercorrencias.', 'CONCLUIDO'),
(4, 2, '2026-09-18', '08:10:00', '08:30:00',
'Procedimento realizado normalmente.', 'CONCLUIDO'),
(5, 5, '2026-09-18', '08:25:00', NULL,
'Atendimento em andamento.', 'EM_ANDAMENTO');

INSERT INTO notificacao
(id_senha, tipo, mensagem, status_envio)
VALUES
(1, 'CONFIRMACAO', 'Senha emitida com sucesso.', 'ENVIADA'),
(1, 'PROXIMO', 'Voce esta proximo de ser atendido.', 'ENVIADA'),
(2, 'CHAMADA', 'Dirija-se ao local de atendimento.', 'ENVIADA'),
(3, 'FILA', 'Sua senha esta aguardando atendimento.', 'ENVIADA'),
(4, 'CONFIRMACAO', 'Seu atendimento foi confirmado.', 'ENVIADA'),
(5, 'CHAMADA', 'Seu atendimento esta sendo realizado.', 'ENVIADA');

-- ============================================================
-- 3. CONSULTAS DE DEMONSTRACAO
-- ============================================================

SELECT
    id_paciente,
    nome,
    cpf,
    data_nascimento,
    email
FROM paciente;

SELECT
    p.nome AS profissional,
    u.nome AS ubs
FROM profissional p
INNER JOIN ubs u
    ON p.id_ubs = u.id_ubs;

SELECT
    u.nome AS ubs,
    s.nome AS servico,
    us.horario_inicio,
    us.horario_fim,
    us.quantidade_diaria
FROM ubs_servico us
INNER JOIN ubs u
    ON us.id_ubs = u.id_ubs
INNER JOIN servico s
    ON us.id_servico = s.id_servico
ORDER BY u.nome, s.nome;

SELECT
    f.id_fila,
    u.nome AS ubs,
    s.nome AS servico,
    f.data,
    COUNT(se.id_senha) AS quantidade_pacientes
FROM fila f
INNER JOIN ubs u
    ON f.id_ubs = u.id_ubs
INNER JOIN servico s
    ON f.id_servico = s.id_servico
LEFT JOIN senha se
    ON f.id_fila = se.id_fila
GROUP BY
    f.id_fila,
    u.nome,
    s.nome,
    f.data;

SELECT
    a.id_atendimento,
    p.nome AS paciente,
    pr.nome AS profissional,
    s.nome AS servico,
    u.nome AS ubs,
    a.data,
    a.hora_inicio,
    a.hora_fim,
    a.status
FROM atendimento a
INNER JOIN senha se
    ON a.id_senha = se.id_senha
INNER JOIN paciente p
    ON se.id_paciente = p.id_paciente
INNER JOIN profissional pr
    ON a.id_profissional = pr.id_profissional
INNER JOIN fila f
    ON se.id_fila = f.id_fila
INNER JOIN servico s
    ON f.id_servico = s.id_servico
INNER JOIN ubs u
    ON f.id_ubs = u.id_ubs;

SELECT
    se.numero AS senha,
    p.nome AS paciente,
    s.nome AS servico,
    u.nome AS ubs,
    se.prioridade,
    se.horario_emissao
FROM senha se
INNER JOIN paciente p
    ON se.id_paciente = p.id_paciente
INNER JOIN fila f
    ON se.id_fila = f.id_fila
INNER JOIN servico s
    ON f.id_servico = s.id_servico
INNER JOIN ubs u
    ON f.id_ubs = u.id_ubs
WHERE se.status = 'AGUARDANDO'
ORDER BY
    CASE se.prioridade
        WHEN 'PRIORITARIA' THEN 1
        ELSE 2
    END,
    se.horario_emissao;

SELECT
    p.nome AS profissional,
    e.nome AS especialidade
FROM profissional_especialidade pe
INNER JOIN profissional p
    ON pe.id_profissional = p.id_profissional
INNER JOIN especialidade e
    ON pe.id_especialidade = e.id_especialidade
ORDER BY p.nome;

SELECT
    p.nome AS profissional,
    COUNT(a.id_atendimento) AS total_atendimentos
FROM profissional p
LEFT JOIN atendimento a
    ON p.id_profissional = a.id_profissional
GROUP BY
    p.id_profissional,
    p.nome
ORDER BY total_atendimentos DESC;

-- ============================================================
-- 4. ATUALIZACOES DE DEMONSTRACAO
-- ============================================================

UPDATE senha
SET status = 'CHAMADA'
WHERE id_senha = 3;

UPDATE paciente
SET email = 'pedro.novo@email.com'
WHERE id_paciente = 1;

UPDATE atendimento
SET
    hora_fim = '09:10:00',
    status = 'CONCLUIDO',
    observacao = 'Atendimento finalizado normalmente.'
WHERE id_atendimento = 1;
