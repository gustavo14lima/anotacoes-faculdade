/*
	Ligação forte = uma tabela não depende da outra (na modelagem, utilizamos a linha tracejada)
    Ligação fraca = uma tabela depende da outra para existir, utilizamos duas chaves primarias (na modelagem, utilizamos a linha sólida)
*/

CREATE DATABASE 1ccoa;

USE 1ccoa;

-- Script da Modelagem1

CREATE TABLE funcionario (
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11) UNIQUE NOT NULL,
    salario DECIMAL(7,2),
    fkSupervisor INT,
    -- Criando uma chave estrangeira com a prórpria tabela
	-- Eu apenas
    CONSTRAINT ctFkSupervisor FOREIGN KEY (fkSupervisor) REFERENCES funcionario(idFuncionario)
);

CREATE TABLE dependente (
	idDependente INT,
    nome VARCHAR(45),
    cpf CHAR(11) UNIQUE NOT NULL,
    fkFuncionario INT,
    -- Criando uma chave composta, ou seja, uma chave primaria que depende de dois valores
    CONSTRAINT chaveComposta PRIMARY KEY (idDependente, fkFuncionario),
    CONSTRAINT ctFkFuncionario FOREIGN KEY (fkFuncionario) REFERENCES funcionario(idFuncionario)
);

INSERT INTO funcionario (nome, cpf, salario, fkSupervisor)  VALUES 
	('Clara Faria', '11111111111', 15000, null),
    ('Vivian Silva', '11111111112', 16000, null),
    ('Marcos Paulo', '11111111113', 1000, 1),
    ('Raphael Canudo', '11111111114', 500, 2);
    
SELECT * FROM funcionario;

SELECT 
IFNULL(s.nome, 'Sem Supervisor') AS 'Nome Supervisor',
f.nome AS 'Nome Funcionario'
 FROM 
funcionario AS f
LEFT JOIN funcionario AS s
ON s.idFuncionario = f.fkSupervisor;

-- Script Modelagem2

CREATE TABLE tipoAnimal (
	idAnimal INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45)
);

CREATE TABLE raca (
	idRaca INT PRIMARY KEY AUTO_INCREMENT,
    descricacao VARCHAR(45),
    fkAnimal INT,
    CONSTRAINT ctFkAnimal FOREIGN KEY (fkAnimal) REFERENCES tipoAnimal (idAnimal)
);

CREATE TABLE dono (
	idDono INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11)
);

CREATE TABLE pet (
	idPet INT AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNascimento DATE,
    fkPai INT,
    fkMae INT,
    fkRaca INT,
    fkDono INT,
    PRIMARY KEY (idPet, fkDono),
    CONSTRAINT ctFkPai FOREIGN KEY (fkPai) REFERENCES pet (idPet),
    CONSTRAINT ctFkMae FOREIGN KEY (fkMae) REFERENCES pet (idPet),
    CONSTRAINT ctFkRaca FOREIGN KEY (fkRaca) REFERENCES raca(idRaca),
    CONSTRAINT ctFkDono FOREIGN KEY (fkDono) REFERENCES dono(idDono)
);

INSERT INTO tipoAnimal (descricao) VALUE
	('Gato'),
    ('Cachorro');
    
INSERT INTO dono (nome, cpf) VALUES
	('Thiago', '22222222222'),
    ('Luiz', '22222222221');
    
INSERT INTO raca (descricacao, fkAnimal) VALUE
	('Persa', 1),
    ('Siamês', 1),
    ('Golden Retriever', 2),
    ('Salsicha', 2);
    
INSERT INTO pet (nome, dtNascimento, fkPai, fkMae, fkDono, fkRaca) VALUES
	('Sombra', '2020-07-20', null, null, 1, 2),
    ('Bob',  '2023-11-01', null, null, 2, 2),
    ('Smoke',  '2025-10-21', 2, null, 2, 1);
    
    SELECT * FROM pet;
    
    SELECT 
    dono.nome AS 'Nome Dono', 
    pet.nome AS 'Nome Pet',
    raca.descricacao AS 'Raça',
    tipoAnimal.descricao AS 'Animal'
    FROM pet
    JOIN dono ON idDono = fkDono
    JOIN raca ON idRaca = fkRaca
    JOIN tipoAnimal ON idAnimal = fkAnimal;