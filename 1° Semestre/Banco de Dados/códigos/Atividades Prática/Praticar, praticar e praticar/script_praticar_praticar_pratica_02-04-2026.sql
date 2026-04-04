/*
	Criando e utilizando banco de dados para a atividade
*/
CREATE DATABASE praticar_praticar_praticar;
USE praticar_praticar_praticar;

/*
	Exercício 1 - Parte 1: Inicío
*/

-- Comandos CREATE TABLE
CREATE TABLE dono (
	id_dono  INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telefone VARCHAR(11),
    bairro VARCHAR(45),
    rua VARCHAR(45),
    numero_casa INT
);

CREATE TABLE pet (
	id_pet INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dt_nascimento DATE,
    tipo_animal VARCHAR(45),
    raca_animal VARCHAR(45),
    fk_mae INT,
    fk_dono INT,
    CONSTRAINT ctFkMae FOREIGN KEY (fk_mae) REFERENCES pet(id_pet),
    CONSTRAINT ctFkDono FOREIGN KEY (fk_dono) REFERENCES dono(id_dono)
);

-- Comandos INSERT INTO 
INSERT INTO dono (nome, telefone, bairro, rua, numero_casa) VALUES
	('Vinicius Faria', '11999999998','Itaim Paulista', 'Logo ali' , 67),
    ('Clara Faria', '11999999997',  'Aqui perto', 'Aqui do lado', 76),
    ('Luiz Phelipe', '11999999996', 'Pertinho daqui', 'Mais um pouquinho chega', 98);
    
INSERT INTO pet (nome, dt_nascimento, tipo_animal, raca_animal, fk_mae, fk_dono) VALUES
	('Wofl', '2010-02-21', 'Cachorro', 'Husky', Null, 1),
    ('Destruidor de Mundos', '2024-09-23', 'Hamster', 'Anão Russo', Null, 1),
   ('Raiden', '2020-04-13', 'Cachorro', 'Husky', 1, 2),
   ('Big Boss', '1999-02-19', 'Cobra', 'Cascavél ', Null, 3);
   
-- Comandos JOIN
SELECT 
d.nome AS 'Nome do Dono',
d.telefone AS 'Telefone do Dono',
d.bairro AS 'Bairro do Dono', 
d.rua AS 'Rua do Dono',
d.numero_casa AS 'Número da Casa do Dono',
p.nome AS 'Nome do Pet',
p.dt_nascimento AS 'Data de Nascimento do Pet',
p.tipo_animal AS 'Tipo de animal do Pet',
IFNULL(m.nome, 'Sem Mãe Cadastrada') AS 'Mãe do Pet'
FROM dono AS d
JOIN pet AS p ON d.id_dono = p.fk_dono
LEFT JOIN pet AS m ON p.fk_mae = m.id_pet;

/*
	Exercício 1 - Parte 1: Fim
    Exercício 1 - Parte 2: Inicío
*/

-- Comandos CREATE TABLE
CREATE TABLE empresa (
	id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(45),
    cnpj VARCHAR(14)
);

CREATE TABLE funcionario (
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    funcao VARCHAR(45),
    fk_supervisor INT,
    fk_empresa INT,
    CONSTRAINT ctFkSupervisor FOREIGN KEY (fk_supervisor) REFERENCES funcionario(id_funcionario),
    CONSTRAINT ctFkEmpresa FOREIGN KEY (fk_empresa) REFERENCES empresa(id_empresa)
);

-- Comandos INSERT INTO 
INSERT INTO empresa (razao_social, cnpj) VALUES
	('Empresa 1', '12345678901234'),
    ('Empresa 2', '12345678901236');
    
INSERT INTO funcionario (nome, funcao, fk_supervisor, fk_empresa) VALUES
	('Clara', 'Chefe', Null, 1),
    ('Vivian', 'Chefe', Null, 2),
    ('Gustavo', 'Desenvolvedor', 1, 1),
    ('Luiz', 'Desenvolvedor', 2, 2);
    
-- Comandos JOIN
SELECT 
e.razao_social AS 'Eazão Social da Empresa',
e.cnpj AS 'CNPJ da Empresa',
f.nome AS 'Nome do Funcionario',
f.funcao AS 'Função do Funcionario',
IFNULL(s.nome, 'Sem Supervisor') AS 'Supervisor do Funcionario'
FROM empresa AS e
JOIN funcionario AS f ON e.id_empresa = f.fk_empresa
LEFT JOIN funcionario AS s ON s.id_funcionario = f.fk_supervisor;

/*
	Exercício 1 - Parte 2: Fim
    Exercício 1 - Parte 3: Inicío
*/

-- Comandos CREATE TABLE
CREATE TABLE endereco (
	id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(45),
    bairro VARCHAR(45),
    rua VARCHAR(45),
    numero_casa INT
);

CREATE TABLE pessoa (
	id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11),
    fk_sombra INT,
    fk_endereco INT,
    CONSTRAINT ctFkSombra FOREIGN KEY (fk_sombra) REFERENCES pessoa(id_pessoa),
    CONSTRAINT ctFkEndereco FOREIGN KEY (fk_endereco) REFERENCES endereco(id_endereco)
);

-- Comandos INSERT INTO
INSERT INTO endereco(cidade, bairro, rua, numero_casa) VALUES
	( 'São Paulo', 'Itaim Paulista', 'Logo ali' , 67),
    ( 'São Paulo', 'Aqui perto', 'Aqui do lado', 76),
    ('São Paulo', 'Pertinho daqui', 'Mais um pouquinho chega', 98);
    
INSERT INTO pessoa (nome, cpf, fk_sombra, fk_endereco) VALUES
	('Vinicius Faria', '11111111111', 1, 1),
    ('Gustavo Lima', '11111111112', 2, 3),
    ('Luiz Phelipe', '11111111113', 3, 2);
    
-- Comandos JOIN
SELECT 
p.nome AS 'Nome da Pessoa',
p.cpf AS 'CPF da Pessoa',
s.nome AS 'Proprietário da Sombra',
e.cidade AS 'CIdade da Pesoa',
e.bairro AS 'Bairro da Pessoa',
e.rua AS 'Rua da Pessoa',
e.numero_casa AS 'Número da Casa da Pessoa'
FROM pessoa AS p
JOIN pessoa AS s ON p.fk_sombra = s.id_pessoa
JOIN endereco AS e ON p.fk_endereco = e.id_endereco;

/*
	Exercício 1 - Parte 3: Fim
    Desafio: Inicío
*/

-- Comandos CREATE TABLE
CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	cnh VARCHAR(11),
	endereco VARCHAR(100)
);

CREATE TABLE telefone (
	id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    telefone VARCHAR(15),
    fk_cliente INT,
    FOREIGN KEY (fk_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE carro (
	id_carro INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(8),
    modelo VARCHAR(20),
    ano INT,
    diaria DOUBLE
);

CREATE TABLE esportivo (
	velocidade DOUBLE,
    fk_carro INT,
    FOREIGN KEY (fk_carro) REFERENCES carro(id_carro)
);

CREATE TABLE sedã (
	passageiros INT,
    fk_carro INT,
    FOREIGN KEY (fk_carro) REFERENCES carro(id_carro)
);

-- Tabela responsável pela ligação N:N
CREATE TABLE aluguel (
	id_aluguel INT PRIMARY KEY AUTO_INCREMENT,
    dt_inicial DATE,
    dt_final DATE,
    fk_cliente INT,
    fk_carro INT,
    FOREIGN KEY (fk_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (fk_carro) REFERENCES carro(id_carro)
);

-- Comandos INSERT INTO
INSERT INTO cliente (nome, cnh, endereco) VALUES 
    ('Vinicius Faria', '12345678901', 'Rua Logo Ali, 67 - Itaim Paulista'),
    ('Clara Faria', '98765432100', 'Rua Aqui do Lado, 76 - São Paulo'),
    ('Luiz Phelipe', '55544433322', 'Rua Mais um Pouquinho Chega, 98 - Centro');

INSERT INTO carro (placa, modelo, ano, diaria) VALUES 
    ('ABC1D23', 'Ferrari F40', 1992, 1500.00),
    ('XYZ9E88', 'Toyota Corolla', 2024, 250.00),
    ('KJH4R12', 'Porsche 911', 2023, 1200.00);
    
INSERT INTO aluguel (dt_inicial, dt_final, fk_cliente, fk_carro) VALUES 
    ('2024-03-01', '2024-03-05', 1, 1),
    ('2024-03-10', '2024-03-12', 2, 2), 
    ('2024-03-15', '2024-03-20', 3, 3),
    ('2024-04-01', '2024-04-03', 1, 2);
    
INSERT INTO telefone (telefone, fk_cliente) VALUES 
    ('11999999998', 1),
    ('11999999997', 2),
    ('11988887777', 2),
    ('11999999996', 3);

INSERT INTO esportivo (velocidade, fk_carro) VALUES 
    (324.0, 1),
    (267.0, 2),
    (310.0, 3);

INSERT INTO sedã (passageiros, fk_carro) VALUES 
	(2, 1),
    (5, 2),
    (2, 3);
    
-- Comandos JOIN
SELECT 
    c.nome AS 'Nome do Cliente',
    c.cnh AS 'CNH do Cliente',
    t.telefone AS 'Telefone de Contato',
    ca.modelo AS 'Modelo do Carro',
    ca.placa AS 'Placa do Caro',
    e.velocidade AS 'Velocidade do Carro', 
    s.passageiros AS 'Quantidade de Passageiros do Carro',
    ca.diaria AS 'Valor da Diária',
    a.dt_inicial AS 'Início do Aluguel',
    a.dt_final AS 'Fim do Aluguel'
FROM cliente AS c
JOIN telefone AS t ON t.fk_cliente = c.id_cliente
JOIN aluguel AS a ON a.fk_cliente = c.id_cliente
JOIN carro AS ca ON a.fk_carro = ca.id_carro
JOIN esportivo AS e ON e.fk_carro = ca.id_carro
JOIN sedã AS s ON s.fk_carro = ca.id_carro;

/*
	Desafio: Fim
    Tabela para práticar: Inicío
*/

CREATE TABLE cliente2 (
	código INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Endereco VARCHAR(45),
    Bairro VARCHAR(45),
    Cidade VARCHAR(45),
    UF VARCHAR(2),
    Telefone VARCHAR(45)
) AUTO_INCREMENT = 10;

CREATE TABLE titulo (
	código INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Tipo VARCHAR(45),
    Locado BIT(1)
) AUTO_INCREMENT = 10;

CREATE TABLE locacoes (
	código INT PRIMARY KEY AUTO_INCREMENT,
    codigoCliente INT,
    codigoTitulo INT,
    DataSaida DATETIME,
    DataRetorno DATETIME,
    FOREIGN KEY (codigoCliente) REFERENCES cliente2(código),
    FOREIGN KEY (codigoTitulo) REFERENCES titulo(código)
    ) AUTO_INCREMENT = 10;
    
-- Comandos INSERT INTO
INSERT INTO cliente2(Nome, Endereco, Bairro, Cidade, UF, Telefone) VALUES
	('Gusto Lima', 'Sáo Paulo', 'Logo Ali', 'Aqui Perto', 'SP', '11111111111'),
    ('Luiz Phelipe', 'Sáo Paulo', 'Ali na Esquila', 'Virando ali', 'SP', '11111111112');
    
INSERT INTO titulo(Nome, Tipo, Locado) VALUES
	('Excalibur', 'Dark Fantasy', 1),
    ('Jogos Mortais', 'Teror', 1);
    
INSERT INTO locacoes (codigoCliente, codigoTitulo, DataSaida, DataRetorno) VALUES
	(10, 10, '2026-04-04 10:00:00', '2026-04-10 10:00:00'),
    (11, 11, '2026-04-04 12:30:00','2026-04-10 12:30:00');
    
-- Comandos JOIN
SELECT
c.Nome AS 'Nome do Cliente',
c.Telefone AS 'Telefone do Cliente',
t.Nome AS 'Nome do Filme',
t.Tipo AS 'Tipo do Filme',
t.Locado AS 'Filme está locado ou não',
l.DataSaida AS 'Data que foi Locado',
l.DataRetorno AS 'Data de devolução'
FROM cliente2 AS c
JOIN locacoes AS l ON l.codigoCliente = c.código
JOIN titulo AS t ON l.codigoCliente = t.código;

/*
	Tabela para práticar: Fim
	Desafio 2: Início
*/

-- Comandos CREATE TABLE
CREATE TABLE motorista (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    fone VARCHAR(45)
);

CREATE TABLE veiculo (
	id INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(45),
    modelo VARCHAR(45),
    cor VARCHAR(45),
    ano INT,
    motorista_id INT,
    FOREIGN KEY (motorista_id) REFERENCES motorista(id)
);

CREATE TABLE cliente3 (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    fone VARCHAR(45),
    endereco VARCHAR(45)
);

CREATE TABLE viagem (
	id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE,
    time TIME,
    valor FLOAT,
    origem VARCHAR(45),
    destino VARCHAR(45),
    cliente_id INT,
    motorista_id INT,
    FOREIGN KEY (cliente_id) REFERENCES cliente3(id),
    FOREIGN KEY (motorista_id) REFERENCES motorista(id)
);

-- Comandos INSERT INTO
INSERT INTO motorista (nome, fone) VALUES 
    ('Vinicius Faria', '11999998888'),
    ('Gustavo Lima', '11988887777'),
    ('Luiz Phelipe', '11977776666');
    
INSERT INTO veiculo (placa, modelo, cor, ano, motorista_id) VALUES 
    ('ABC-1234', 'Uno com Escada', 'Preto', 2022, 1),
    ('XYZ-5678', 'Gol Quadrado', 'Prata', 2023, 2),
    ('KJH-9090', 'Opala', 'Branco', 2021, 3);

INSERT INTO cliente3 (nome, fone, endereco) VALUES 
    ('Maria', '11911112222', 'Logo Ali, 67'),
    ('Kaue', '11933334444', 'Aqui pertinho, 96');

INSERT INTO viagem (data, time, valor, origem, destino, cliente_id, motorista_id) VALUES 
    ('2024-03-20', '14:30:00', 45.50, 'Logo Ali', 'Depois de cá', 1, 1),
    ('2024-03-20', '16:00:00', 22.00, 'Aqui pertinho', 'Faculdade', 2, 2);
    
-- Comandos JOIN
SELECT 
m.nome AS 'Nome do Motorista',
m.fone AS 'Telefone do Motorista',
v.placa AS 'Placa do Carro',
v.modelo AS 'Modelo do Carro',
v.cor AS 'Cor do carro',
v.ano AS 'Ano do Carro',
c.nome AS 'Nome do Cliente', 
c.fone AS 'Telefone do Cliente',
c.endereco AS 'Local de Partida',
vi.destino AS 'Local de Destino',
vi.valor AS 'Valor da Viagem',
vi.data AS 'Data da Viagem',
vi.time AS 'Horário de iniício da Viagem'
FROM motorista AS m
LEFT  JOIN viagem AS vi ON m.id = vi.motorista_id
LEFT  JOIN cliente3 AS c ON vi.cliente_id = c.id
LEFT  JOIN veiculo AS v ON v.motorista_id = m.id;

/*
    Tabela para práticar: Fim
*/