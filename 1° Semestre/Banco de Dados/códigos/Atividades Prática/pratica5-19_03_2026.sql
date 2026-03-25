-- Comandos essencial para todos os exercícios - Iníco

-- Criando banco de dados 
CREATE DATABASE Sprint2;

-- Usando a banco de dados
USE Sprint2;

-- Comandos essencial para todos os exercícios - Fim

/*
	Exercício 1: Início
*/ 

-- Criando a tabela 'Atleta'
CREATE TABLE Atleta (
	idAtleta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    modalidade VARCHAR(40), 
    qtdMedalha INT -- representa a quantidade de medalhas do atleta
);

-- Atribuindo dados a tabela 'Atleta'
INSERT INTO Atleta (nome, modalidade, qtdMedalha) VALUES
	('Bruno Henrique', 'Futebol', 6),
    ('Cristiano Ronaldo', 'Futebol', 999),
    ('Mike Tyson', 'Boxe', 2),
    ('Seu Madruga', 'Boxe', 999999),
    ( 'Adam Sandler', 'Golf', 67);
    
    
-- Criando a tabela 'Pais'
CREATE TABLE Pais (
	idPais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    capital VARCHAR(40)
);

-- Atribuindo dados a tabela 'Pais'
INSERT INTO Pais (nome, capital) VALUES 
	('Brasil', 'Brasilia'),
    ('Russia', 'Moscou'),
    ('Estados Unidos', 'Washington, D.C'),
    ('Japão', 'Toquio');
    
    
-- Criando a chave estrangeira na tabela correspondente conforme modelagem
ALTER TABLE Atleta
ADD COLUMN fkPais INT;

ALTER TABLE Atleta
ADD CONSTRAINT ctFkPais FOREIGN KEY (fkPais) REFERENCES Pais(idPais);

-- Atualizando o país de todos os atletas
UPDATE Atleta
SET fkPais = 1
WHERE idAtleta = 1;
 
 UPDATE Atleta
SET fkPais = 2
WHERE idAtleta = 2;

UPDATE Atleta
SET fkPais = 1
WHERE idAtleta = 3;

UPDATE Atleta
SET fkPais = 3
WHERE idAtleta = 4;

UPDATE Atleta
SET fkPais = 4
WHERE idAtleta = 5;

-- Exibindo os atletas e seu respectivo paísExibir os atletas e seu respectivo país
SELECT 
a.nome,
a.modalidade,
a.qtdMedalha,
p.nome,
p.capital
FROM Atleta AS a
JOIN Pais AS p ON a.fkPais = p.idPais;

-- Exibindo apenas o nome do atleta e o nome do respectivo país
SELECT 
a.nome  AS 'Nome do Atleta',
p.nome AS 'Nome do Pais'
FROM Atleta AS a
JOIN Pais AS p ON a.fkPais = p.idPais;

-- Exibindo os dados dos atletas, seus respectivos países, de uma determinada capital
SELECT
a.nome,
a.modalidade,
a.qtdMedalha,
p.nome,
p.capital
FROM Atleta AS a
JOIN Pais AS p ON a.fkPais = p.idPais
WHERE p.capital = 'Brasilia';

/*
	Exercício 1: Fim
    Exercício 2: Início
*/ 

-- Criando a tabela 'Musica'
CREATE TABLE Musica(
	idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

-- Inserindo dados na tabela 'Musica'
INSERT INTO Musica (titulo, artista, genero) VALUES 
	('Revenge', 'System of Down', 'Nu Metal'),
    ('Sad Statue', 'System of Down', 'Nu Metal'),
    ('Toxicity', 'System of Down', 'Nu Metal');
    
-- Criando a tabela 'Album'
CREATE TABLE Album (
	idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tipo VARCHAR(7),
    dtLancamento DATE,
    CONSTRAINT ctTipo CHECK(tipo = 'Digital' OR tipo='Físico')
);

-- Inserindo dados na tabela 'Album'
INSERT INTO Album (nome, tipo, dtLancamento) VALUES
	('Mezmerize', 'Digital', '2005-05-17'),
    ('Hypnotize', 'Físico', '2005-11-22');
    
-- Exibindo todos os dados das tabelas separadamente
SELECT
*
FROM Musica;

SELECT
* 
FROM Album;

-- Criando a chave estrangeira na tabela de acordo com a regra de negócio
ALTER TABLE Musica
ADD COLUMN fkAlbum INT;

ALTER TABLE Musica
ADD CONSTRAINT ckFkAlbum FOREIGN KEY (fkAlbum) REFERENCES Album(idAlbum);

-- Atualizando os álbuns de cada música
UPDATE Musica
SET fkAlbum = 1
WHERE idMusica < 3;

UPDATE Musica
SET fkAlbum = 2
WHERE idMusica = 3;

-- Exibindo as músicas e seus respectivos álbuns
SELECT 
m.titulo,
m.artista,
m.genero,
a.nome,
a.tipo,
a.dtLancamento
FROM Musica AS m
JOIN Album AS a ON m.fkAlbum = a.idAlbum;

-- Exibindo somente o título da música e o nome do seu respectivo álbum
SELECT
m.titulo,
a.nome
FROM Musica AS m
JOIN Album AS a ON m.fkAlbum = a.idAlbum;

-- Exibindo os dados das músicas e seu respectivo álbum, de um determinado tipo
SELECT 
m.titulo,
m.artista,
m.genero,
a.nome,
a.tipo,
a.dtLancamento
FROM Musica AS m
JOIN Album AS a ON m.fkAlbum = a.idAlbum
WHERE a.nome = 'Mezmerize';

/*
	Exercício 2: Fim
    Exercício 3: Início
*/ 

-- Criando tabela 'pessoa'
CREATE TABLE pessoa (
	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11)
);

-- Criando a tabela 'Reserva'
CREATE TABLE Reserva (
	idReserva INT PRIMARY KEY AUTO_INCREMENT,
    dtReserva DATETIME,
    dtRetirada DATETIME,
    dtDevolucao DATETIME,
    fkPessoa INT,
    -- Configurando chave estrangeira
    CONSTRAINT ctFkPessoa FOREIGN KEY (fkPessoa) REFERENCES pessoa(idPessoa)
);

-- Inserindo dados na tabela 'pessoa'
INSERT INTO pessoa (nome, cpf) VALUES 
	('Zé', '11111111111'),
    ('Pedro', '11111111112'),
    ('Gionani', '11111111113'),
    ('Eduarda', '11111111114'),
    ('Maria', '11111111115');
    
-- Inserindo dados na tabela 'Reserva'
INSERT INTO Reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) VALUES
	('2026-01-01 13:32:12', '2026-01-14 13:32:12', '2026-02-12 13:32:12', 1),
	('2020-04-10 13:32:12', '2021-05-20 13:32:12', '2022-02-21 13:32:12', 2),
	('2010-05-11 13:32:12', '2011-06-21 13:32:12', '2015-07-21 13:32:12', 3),
	('2008-01-10 13:32:12', '2008-02-20 13:32:12', '2010-12-21 13:32:12', 4),
	('1998-04-10 13:32:12', '1999-05-20 13:32:12', '2000-02-21 13:32:12', 5);
    
-- Exibindo dados
SELECT 
* 
FROM pessoa
JOIN Reserva ON pessoa.idPessoa = Reserva.fkPessoa;

-- Exibindo os dados com AS
SELECT 
idPessoa AS ID,
nome AS 'Nome da Pessoa',
cpf AS CPF,
dtReserva AS 'Data da Reserva', 
dtRetirada AS 'Data da Retirada', 
dtDevolucao AS 'Data da Devolução'
FROM pessoa
JOIN Reserva ON pessoa.idPessoa = Reserva.fkPessoa;

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
JOIN Reserva ON pessoa.idPessoa = Reserva.fkPessoa;

-- Exibindo dados com IFNULL()
SELECT 
idPessoa AS ID,
IFNULL(nome, 'Sem nome') AS 'Nome da Pessoa',
IFNULL(cpf, 'Sem CPF') AS CPF,
IFNULL(dtReserva, 'Sem data de reserva') AS 'Data da Reserva', 
IFNULL(dtRetirada, 'Sem data de retirada') AS 'Data da Retirada', 
IFNULL(dtDevolucao, 'Sem data de devolucao') AS 'Data da Devolução'
FROM pessoa
JOIN Reserva ON pessoa.idPessoa = Reserva.fkPessoa;

/*
	Exercício 3: Fim
    Exercício 4: Início
*/ 
-- Criando a tabela 'Pessoa1'
CREATE TABLE Pessoa1 (
	idPessoa1 INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNascimento DATE
);

-- Criando a tabela 'Pessoa2'
CREATE TABLE Pessoa2(
	idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNascimento DATE,
    fkPessoa1 INT,
    -- Configurando chave estrangeira
    CONSTRAINT ctFkPessoa1 FOREIGN KEY (fkPessoa1) REFERENCES Pessoa1(idPessoa1)
);

-- Inserindo 5 registros na tabela 'Pessoa1'
INSERT INTO Pessoa1 (nome, dtNascimento) VALUES
	('Gustavo', '2008-01-14'),
    ('Guilherme', '2006-03-23'),
	('Kauê', '2008-06-24'),
    ('Vinicius', '2007-11-23'),
    ('Enzo', '2006-02-12');

-- Inserindo 5 registros na tabela 'Pessoa2'
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
IFNULL(Pessoa2.nome, 'Coronel da Duplinha sem Nome') AS 'Nome Coronel Duplinha'
FROM Pessoa1
JOIN Pessoa2 ON Pessoa1.idPessoa1= Pessoa2.idPessoa2;

/*
	Exercício 4: Fim
    Exercício 5: Início
*/ 

-- Criando a tabela 'Motorista'
CREATE TABLE Motorista (
	idMotorista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    cpf CHAR(11)
);

-- Criando a tabela 'Habilitacao'
CREATE TABLE Habilitacao (
	idHabilitacao INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(5),
    dtEmissao DATE,
    dtVencimento DATE,
    fkMotorista INT,
    CONSTRAINT ctCategoria CHECK(categoria IN ('A', 'B', 'A e B')),
    CONSTRAINT ctFkMotorista FOREIGN KEY (fkMotorista) REFERENCES Motorista(idMotorista)
);

-- Inserindo 5 registros na 'Motorista'
INSERT INTO Motorista (nome, cpf) VALUES
	('Roberto', '11111111111'),
    ('Vivian', '11111111112'),
    ('Claudelino', '11111111113'),
    ('Clara', '11111111114'),
    ('Roberto', '11111111115');

-- Inserindo 5 registros na tabela 'Habilitacao'
INSERT INTO Habilitacao (categoria, dtEmissao, dtVencimento, fkMotorista) VALUES
	('A', '2025-01-14', '2026-01-14', 1),
    ('B', '2015-06-06', '2016-06-06', 4),
    ('A', '2025-12-12', '2026-12-12', 2),
    ('A e B', '2026-01-23', '2027-02-23', 3),
	('B', '2026-03-20', '2027-03-20', 5);
    
-- Exibindo os dados
SELECT
*
FROM Motorista
JOIN Habilitacao ON idMotorista = fkMotorista;

-- Exibindo os dados com AS
SELECT 
nome AS 'Nome do Motorista',
cpf AS 'CPF do Motorista',
categoria AS 'Categoria da Habilitação',
dtEmissao AS 'Data de Emissão da Habilitação',
dtVencimento AS 'Data de Vencimento da Habilitação'
FROM Motorista
JOIN Habilitacao ON idMotorista = fkMotorista;

-- Exibindo os dados com CASE
SELECT 
nome AS 'Nome do Motorista',
cpf AS 'CPF do Motorista',
categoria AS 'Categoria da Habilitação',
dtEmissao AS 'Data de Emissão da Habilitação',
dtVencimento AS 'Data de Vencimento da Habilitação',
CASE
	WHEN YEAR(dtEmissao) + 1 > YEAR(dtVencimento) THEN 'Habilitação Vencida'
    ELSE 'Habilitação em Dia'
    END AS 'Verificação Habilitação'
FROM Motorista
JOIN Habilitacao ON idMotorista = fkMotorista;

-- Exibindo os dados com IFNULL()
SELECT 
nome AS 'Nome do Motorista',
cpf AS 'CPF do Motorista',
IFNULL(categoria, 'Sem Habilitação') AS 'Categoria da Habilitação',
IFNULL(dtEmissao, 'Sem Habilitação') AS 'Data de Emissão da Habilitação',
IFNULL(dtVencimento, 'Sem Habilitação') AS 'Data de Vencimento da Habilitação'
FROM Motorista
JOIN Habilitacao ON idMotorista = fkMotorista;

/*
	Exercício 5: Fim
    Exercício 6: Início
*/ 

-- Criando a tabela 'endereco'
CREATE TABLE endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    ruaEndereco VARCHAR(45),
    bairroEndereco VARCHAR(45),
    numeroEndereco INT
);

-- Criando a tabela 'farmacia'
CREATE TABLE farmacia (
	idFarmacia INT PRIMARY KEY AUTO_INCREMENT,
    fkEndereco INT UNIQUE,
    -- Configurando chaves estrangeiras
    CONSTRAINT ctFkEndereco FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco)
);

-- Criando a tabela farmaceutico
CREATE TABLE farmaceutico (
	idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNascimento DATE,
    fkFarmacia INT,
    -- Configurando chave estrangeira
    CONSTRAINT ctFkFarmacia FOREIGN KEY (fkFarmacia) REFERENCES farmacia(idFarmacia)
);
    
-- Inserindo 5 registros
    
INSERT INTO endereco (ruaEndereco, bairroEndereco, numeroEndereco) VALUES
	('Rua Basilide', 'Jardim das Esmeraldas', 1324),
    ('Rua Mimas', 'Cidade Satélite Santa Bárbara', 21),
    ('Rua Francisco Credentino', 'Jardim Satélite', 523),
    ('Rua Doutor Mário de Campos', 'Americanópolis', 54),
    ('Rua Vuturuna', 'Vila do Bosque', 58);
    
-- Inserindo dados na tabela 'farmacia'
INSERT INTO farmacia (fkEndereco) VALUES
	(1),
	(2),
	(3),
    (4),
    (5);
    
-- Inserindo dados na tabela 'farmaceutico'
INSERT INTO farmaceutico (nome, dtNascimento, fkFarmacia) VALUES
	('Geraldo', '1990-02-21', 1),
    ('Kratos', '1890-01-02', 3), 
    ('Leon', '1999-02-20', 2),
    ('Ada', '1999-02-20', 5),
    ('Maculado', '2008-01-14', 4);
    
-- Exibindo dados
SELECT 
*
FROM farmacia
JOIN endereco ON fkEndereco = idEndereco
JOIN farmaceutico ON fkFarmacia = idFarmacia;

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
JOIN farmaceutico ON fkFarmacia = idFarmacia;

-- Exibindo dados com CASE
SELECT 
idFarmacia AS 'ID',
nome AS 'Nome Farmacêutico',
dtNascimento 'Data de Nascimento do Farmacêutico',
ruaEndereco AS 'Rua da Farmacia', 
bairroEndereco AS 'Bairro da Farmacia', 
numeroEndereco AS 'Número da Farmacia',
CASE 
	WHEN fkFarmacia > 0 THEN 'Está atuando na área'
    ELSE 'Não está atuando na área'
    END AS 'Atuando na área'
FROM farmacia
JOIN endereco ON fkEndereco = idEndereco
JOIN farmaceutico ON fkFarmacia = idFarmacia;

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
JOIN farmaceutico ON fkFarmacia = idFarmacia;

/*
	Exercício 6: Fim
    DESAFIO: Início
*/ 

-- Criando a tabela 'Time'
CREATE TABLE Time(
	idTime INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    estado CHAR(2)
);

-- Criando a tabela 'Tecnico'
CREATE TABLE Tecnico (
	idTecnico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    fkTime INT UNIQUE,
    -- Configurando chave estrangeira
    CONSTRAINT ctFkTime FOREIGN KEY (fkTime) REFERENCES Time(idTime)
);

-- Criando a tabela 'Escalacao'
CREATE TABLE Escalacao (
	idEscalacao INT PRIMARY KEY AUTO_INCREMENT,
    numJogador CHAR(3),
    nome VARCHAR(45),
    posicao VARCHAR(45),
    tipo VARCHAR(45),
    dtJogo DATETIME,
    fkTecnico INT,
    -- Configurando chave estrangeira
    CONSTRAINT ctFkTecnico FOREIGN KEY (fkTecnico) REFERENCES Tecnico(idTecnico)
);