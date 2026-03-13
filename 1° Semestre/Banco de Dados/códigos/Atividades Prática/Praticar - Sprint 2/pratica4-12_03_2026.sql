CREATE DATABASE sprint2;
USE sprint2;

/*
	Exercício 1: Início
*/

-- Criando as tabelas
CREATE TABLE pessoa(
	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11)
);

CREATE TABLE reserva (
	idReserva INT PRIMARY KEY AUTO_INCREMENT, 
    dtReserva DATETIME,
    dtRetirada DATETIME,
    dtDevolucao DATETIME, 
    fkPessoa INT,
    -- Configurado chave estrangeira
    CONSTRAINT ctFkPesssoa FOREIGN KEY (fkPessoa) REFERENCES pessoa(idPessoa)
);

-- Inserindo 5 registro
INSERT INTO pessoa (nome, cpf) VALUES 
	('Zé', '11111111111'),
    ('Pedro', '11111111112'),
    ('Gionani', '11111111113'),
    ('Eduarda', '11111111114'),
    ('Maria', '11111111115');
    
INSERT INTO reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) VALUES
	('2026-01-01 13:32:12', '2026-01-14 13:32:12', '2026-02-12 13:32:12', 1),
	('2020-04-10 13:32:12', '2021-05-20 13:32:12', '2022-02-21 13:32:12', 2),
	('2010-05-11 13:32:12', '2011-06-21 13:32:12', '2015-07-21 13:32:12', 3),
	('2008-01-10 13:32:12', '2008-02-20 13:32:12', '2010-12-21 13:32:12', 4),
	('1998-04-10 13:32:12', '1999-05-20 13:32:12', '2000-02-21 13:32:12', 5);
    
-- Exibindo os dados
SELECT 
*
FROM pessoa
JOIN reserva ON pessoa.idPessoa= reserva.fkPessoa;
    
-- Exibindo os dados com AS
SELECT 
idPessoa AS ID,
nome AS 'Nome da Pessoa',
cpf AS CPF,
dtReserva AS 'Data da Reserva', 
dtRetirada AS 'Data da Retirada', 
dtDevolucao AS 'Data da Devolução'
FROM pessoa
JOIN reserva ON pessoa.idPessoa = reserva.fkPessoa;

-- Exibindo os dados com CASE
 SELECT 
idPessoa AS ID,
 nome AS 'Nome da Pessoa',
 cpf AS CPF,
 dtReserva AS 'Data da Reserva', 
 dtRetirada AS 'Data da Retirada', 
 dtDevolucao AS 'Data da Devolução',
CASE
	WHEN dtDevolucao < '2010-01-10' THEN 'Mais um pouquinho e era seu 🙏'
    WHEN dtDevolucao < '2020-01-10' THEN 'Demorou... Mas pelo menos devolveu'
    WHEN dtDevolucao < '2025-01-01' THEN 'Perfeito'
    WHEN dtDevolucao >  '2025-01-01'  THEN 'GÊNIO'
    ELSE '... Sem comentários...'
    END AS 'Comentário da Devolução'
FROM pessoa
JOIN reserva ON pessoa.idPessoa = reserva.fkPessoa;

-- Exibindo dados com IFNULL()
SELECT 
idPessoa AS ID,
IFNULL(nome, 'Sem nome') AS 'Nome da Pessoa',
IFNULL(cpf, 'Sem CPF') AS CPF,
IFNULL(dtReserva, 'Sem data de reserva') AS 'Data da Reserva', 
IFNULL(dtRetirada, 'Sem data de retirada') AS 'Data da Retirada', 
IFNULL(dtDevolucao, 'Sem data de devolucao') AS 'Data da Devolução'
FROM pessoa
JOIN reserva ON pessoa.idPessoa = reserva.fkPessoa;

/*
	Exercício 1: Fim
    Exercício 2: Início
*/

-- Criando as tabelas
CREATE TABLE Pessoa1 (
	idPessoa1 INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNascimento DATE
);

CREATE TABLE Pessoa2(
	idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNascimento DATE,
    fkPessoa1 INT,
    -- Configurando chave estrangeira
    CONSTRAINT ctFkPessoa1 FOREIGN KEY (fkPessoa1) REFERENCES Pessoa1(idPessoa1)
);

-- Inserindo 5 registros
INSERT INTO Pessoa1 (nome, dtNascimento) VALUES
	('Gustavo', '2008-01-14'),
    ('Guilherme', '2006-03-23'),
	('Kauê', '2008-06-24'),
    ('Vinicius', '2007-11-23'),
    ('Enzo', '2006-02-12');

INSERT INTO Pessoa2 (nome, dtNascimento, fkPessoa1) VALUES
	('Luiz', '2008-06-06', 1),
    ('Karina', '2007-11-23', 2),
	('Matheus', '2007-11-23', 3),
    ('Maria', '2008-06-24', 4),
    ('Gus', '2008-06-24', 5);
    
-- Exibindo os dados
SELECT 
*
FROM Pessoa1
JOIN Pessoa2 ON Pessoa1.idPessoa1= Pessoa2.idPessoa2;
    
-- Exibindo os dados com AS
SELECT 
idPessoa1 AS ID,
Pessoa1.nome AS 'Nome Capitão Duplinha',
Pessoa2.nome AS 'Nome Coronel Duplinha'
FROM Pessoa1
JOIN Pessoa2 ON Pessoa1.idPessoa1= Pessoa2.idPessoa2;

-- Exibindo os dados com CASE
SELECT 
idPessoa1 AS ID,
Pessoa1.nome AS 'Nome Capitão Duplinha',
Pessoa2.nome AS 'Nome Coronel Duplinha',
CASE 
	WHEN idPessoa1 = idPessoa2 THEN 'Duplinhas Certas'
    ELSE 'Duplinhas Erradas'
    END AS 'As duplinhas estão certas?'
FROM Pessoa1
JOIN Pessoa2 ON Pessoa1.idPessoa1= Pessoa2.idPessoa2;

-- Exibindo dados com IFNULL()
SELECT 
idPessoa1 AS ID,
IFNULL(Pessoa1.nome, 'Capitão da Duplinha sem Nome') AS 'Nome Captião Duplinnha',
IFNULL(Pessoa2.nome, 'Coronel da Duplinha sem Nome') AS 'Nome Coronel Duplinha',
FROM Pessoa1
JOIN Pessoa2 ON Pessoa1.idPessoa1= Pessoa2.idPessoa2;

/*
	Exercício 2: Fim
    Exercício 3: Início
*/

-- Criando as tabelas
CREATE TABLE categoria (
	idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(16),
    descricao VARCHAR(30)
);

CREATE TABLE carteiraHabilitacao (
	idMotorista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtEmissao DATE,
    dtValidade DATE,
    fkCategoria INT,
    -- Configurando a chave estrangeira
    CONSTRAINT ctFkCategoria FOREIGN KEY (fkCategoria) REFERENCES categoria(idCategoria)
);

-- Inserindo 5 registros
INSERT INTO categoria (categoria, descricao) VALUES
	('Categoria A', 'moto e similar'),
    ('Categoria B', 'carro e similar'),
    ('Categoria A e B', 'carro e moto, e similar');

INSERT INTO carteiraHabilitacao (nome, dtEmissao, dtValidade, fkCategoria) VALUES
	('Claudelino', '2025-01-14', '2026-01-14', 1),
    ('Luiz', '2015-06-06', '2016-06-06', 3),
    ('Clara', '2025-12-12', '2026-12-12', 2),
    ('Vivian', '2026-01-23', '2027-02-23', 3),
    ('Gustavo', NULL, NULL, NULL);
    
-- Exibindo dados
SELECT
*
FROM carteiraHabilitacao 
JOIN categoria ON fkCategoria = idCategoria;

-- Exibindo dados com AS
SELECT
nome AS 'Motorista',
dtEmissao AS 'Data de Emissão do Documento', 
dtValidade AS 'Data de Vencimento do Documento',
categoria AS 'Categoria do Documento',
descricao AS 'Descrição do Documento'
FROM carteiraHabilitacao 
JOIN categoria ON fkCategoria = idCategoria;

-- Exibindo dados com CASE
SELECT
nome AS 'Motorista',
dtEmissao AS 'Data de Emissão do Documento', 
dtValidade AS 'Data de Vencimento do Documento',
categoria AS 'Categoria do Documento',
descricao AS 'Descrição do Documento',
CASE 
	WHEN dtValidade < CURDATE() THEN 'Documento Vencido! Pode apreender...'
    ELSE 'Documento em dia. Tá de boa'
    END AS 'Verificando Documento'
FROM carteiraHabilitacao 
JOIN categoria ON fkCategoria = idCategoria;

-- Exibindo dados com IFNULL()
SELECT
IFNULL(nome, 'Sem Nome do Motorista') AS 'Motorista',
IFNULL(dtEmissao, 'Sem Documento') AS 'Data de Emissão do Documento', 
IFNULL(dtValidade, 'Sem Documento') AS 'Data de Vencimento do Documento',
IFNULL(categoria, 'Sem Documento') AS 'Categoria do Documento',
IFNULL(descricao, 'Sem Documento') AS 'Descrição do Documento'
FROM carteiraHabilitacao 
LEFT JOIN categoria ON fkCategoria = idCategoria;

/*
	Exercício 3: Fim
    Exercício 4: Início
*/

-- Criando as tabelas
CREATE TABLE endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    ruaEndereco VARCHAR(45),
    bairroEndereco VARCHAR(45),
    numeroEndereco INT
);

CREATE TABLE farmaceutico (
	idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNascimento DATE
);

CREATE TABLE farmacia (
	idFarmacia INT PRIMARY KEY AUTO_INCREMENT,
    fkEndereco INT UNIQUE,
    fkFarmaceutico INT UNIQUE,
    -- Configurando chaves estrangeiras
    CONSTRAINT ctFkEndereco FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco),
    CONSTRAINT ctFkFarmaceutico FOREIGN KEY (fkFarmaceutico) REFERENCES farmaceutico(idFarmaceutico)
);
    
-- Inserindo 5 registros
    
INSERT INTO endereco (ruaEndereco, bairroEndereco, numeroEndereco) VALUES
	('Rua Basilide', 'Jardim das Esmeraldas', 1324),
    ('Rua Mimas', 'Cidade Satélite Santa Bárbara', 21),
    ('Rua Francisco Credentino', 'Jardim Satélite', 523),
    ('Rua Doutor Mário de Campos', 'Americanópolis', 54),
    ('Rua Vuturuna', 'Vila do Bosque', 58);
    
INSERT INTO farmaceutico (nome, dtNascimento) VALUES
	('Geraldo', '1990-02-21'),
    ('Kratos', '1890-01-02'), 
    ('Leon', '1999-02-20'),
    ('Ada', '1999-02-20'),
    ('Maculado', '2008-01-14');
    
INSERT INTO farmacia (fkEndereco, fkFarmaceutico) VALUES
	(1,5),
	(2,4),
	(3,3),
    (4, 2),
    (5, 1);
    
-- Exibindo dados
SELECT 
*
FROM farmacia
JOIN endereco ON fkEndereco = idEndereco
JOIN farmaceutico ON fkFarmaceutico = idFarmaceutico;

-- Exibindo dados com AS
SELECT 
idFarmacia AS 'ID',
nome AS 'Nome Farmacêutico',
dtNascimento 'Data de Nascimento do Farmacêutico',
ruaEndereco AS 'Rua da Farmacia', 
bairroEndereco AS 'Bairro da Farmacia', 
numeroEndereco AS 'Número da Farmacia'
FROM farmacia
JOIN endereco ON fkEndereco = idEndereco
JOIN farmaceutico ON fkFarmaceutico = idFarmaceutico;

-- Exibindo dados com CASE
SELECT 
idFarmacia AS 'ID',
nome AS 'Nome Farmacêutico',
dtNascimento 'Data de Nascimento do Farmacêutico',
ruaEndereco AS 'Rua da Farmacia', 
bairroEndereco AS 'Bairro da Farmacia', 
numeroEndereco AS 'Número da Farmacia',
CASE 
	WHEN dtNascimento > '2008-04-01' THEN 'Atuando sem Faculdade'
    ELSE 'Atuando com Faculdade'
    END AS 'Tem faculdade ou não'
FROM farmacia
JOIN endereco ON fkEndereco = idEndereco
JOIN farmaceutico ON fkFarmaceutico = idFarmaceutico;

-- Exibindo dados com IFNULL
SELECT 
idFarmacia AS 'ID',
IFNULL(nome, 'Farmacêtico sem Nome') AS 'Nome Farmacêutico',
IFNULL(dtNascimento, 'Farmacêtico sem Data de Nascimento') AS 'Data de Nascimento do Farmacêutico',
IFNULL(ruaEndereco, 'Farmacia sem Endereço') AS 'Rua da Farmacia', 
IFNULL(bairroEndereco, 'Farmacia sem Endereço') AS 'Bairro da Farmacia', 
IFNULL(numeroEndereco, 'Farmacia sem Endereço') AS 'Número da Farmacia'
FROM farmacia
JOIN endereco ON fkEndereco = idEndereco
JOIN farmaceutico ON fkFarmaceutico = idFarmaceutico;]

/*
    Exercício 4: Fim
*/