create database bancodedados;

create table usuarios(
id_usuario int(9) auto_increment,
email varchar(40) not null,
senha varchar(30) not null,
telefone int(11),
nome varchar(40),
primary key (id_usuarios)
);

create table salario(
salario_bruto int(12),
impostos varchar(100),
liquido int(12)
);

-- Criação da tabela de Departamentos
CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome_departamento VARCHAR(100) NOT NULL,
    gerente_id INT
);

-- Criação da tabela de Cargos
CREATE TABLE cargos (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nome_cargo VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Criação da tabela de Funcionários
CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_contratacao DATE,
    salario_base DECIMAL(10, 2),
    departamento_id INT,
    cargo_id INT,
    dias_faltas_justificadas INT DEFAULT 0,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id_departamento),
    FOREIGN KEY (cargo_id) REFERENCES cargos(id_cargo)
);

-- Criação da tabela de Holerites
CREATE TABLE holerites (
    id_holerite INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    data_emissao DATE,
    salario_bruto DECIMAL(10, 2),
    descontos DECIMAL(10, 2),
    salario_liquido DECIMAL(10, 2),
    dias_trabalhados INT,
    horas_extras DECIMAL(5, 2),
    faltas INT,
    total_horas_trabalhadas DECIMAL(5, 2),
    valor_horas_extras DECIMAL(10, 2),
    referencia_mes VARCHAR(7), -- Formato: MM/YYYY
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id_funcionario)
);

-- Criação da tabela de Descontos
CREATE TABLE descontos (
    id_desconto INT AUTO_INCREMENT PRIMARY KEY,
    holerite_id INT,
    tipo_desconto VARCHAR(100),
    valor DECIMAL(10, 2),
    FOREIGN KEY (holerite_id) REFERENCES holerites(id_holerite)
);

-- Criação da tabela de Benefícios
CREATE TABLE beneficios (
    id_beneficio INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    tipo_beneficio VARCHAR(100),
    valor DECIMAL(10, 2),
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id_funcionario)
);

-- Criação da tabela de Turnos
CREATE TABLE turnos (
    id_turno INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    horario_entrada TIME,
    horario_saida TIME,
    intervalo_inicio TIME,
    intervalo_fim TIME,
    dias_semana VARCHAR(50), -- Exemplo: "Seg-Sex" ou "Seg-Dom"
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id_funcionario)
);

-- Criação da tabela de Registro de Ponto
CREATE TABLE registros_ponto (
    id_registro_ponto INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    data DATE,
    hora_entrada TIME,
    hora_saida TIME,
    hora_intervalo_inicio TIME,
    hora_intervalo_fim TIME,
    total_horas DECIMAL(5, 2),
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id_funcionario)
);

-- Criação da tabela de Solicitações de Correção de Ponto
CREATE TABLE solicitacoes_correcao_ponto (
    id_solicitacao INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    data_solicitacao DATE,
    data_ponto_afetado DATE,
    hora_entrada_nova TIME,
    hora_saida_nova TIME,
    motivo TEXT,
    status VARCHAR(20), -- Exemplo: "Pendente", "Aprovada", "Rejeitada"
    aprovador_id INT,
    data_aprovacao DATE,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (aprovador_id) REFERENCES funcionarios(id_funcionario)
);

-- Criação da tabela de Outras Requisições de RH
CREATE TABLE solicitacoes_rh (
    id_solicitacao INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    tipo_requisicao VARCHAR(50), -- Exemplo: "Férias", "Licença", etc.
    descricao TEXT,
    data_solicitacao DATE,
    status VARCHAR(20), -- Exemplo: "Pendente", "Aprovada", "Rejeitada"
    aprovador_id INT,
    data_aprovacao DATE,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (aprovador_id) REFERENCES funcionarios(id_funcionario)
);

-- Criação da tabela de Histórico de Solicitações
CREATE TABLE historico_solicitacoes (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_solicitacao INT,
    acao VARCHAR(50), -- Exemplo: "Solicitada", "Aprovada", "Rejeitada"
    data_acao DATE,
    responsavel_acao INT,
    FOREIGN KEY (responsavel_acao) REFERENCES funcionarios(id_funcionario)
);


insert into usuarios(id_usuario,nome,email) VALUES (auto_increment, “Carlos”, “carlos@gmail.com”);
