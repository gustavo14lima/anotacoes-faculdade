-- Criando o banco de dados 'autoRelacionamento'
CREATE DATABASE autoRelacionamento; 

-- Utilizando o banco de dados 'autoRelacionamento'
Use autoRelacionamento;

/*
	Exercício 1: Início
*/

-- Criando a tabela 'funcaoEmpresa'
CREATE TABLE funcaoEmpresa(
	idFuncao INT PRIMARY KEY AUTO_INCREMENT,
    area VARCHAR(45)
);

-- Criando a tabela 'funcionarios'
CREATE TABLE funcionarios (
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    fkFuncao INT NOT NULL,
    fkSupervisor INT,
    CONSTRAINT ctFkFuncao FOREIGN KEY (fkFuncao) REFERENCES funcaoEmpresa(idFuncao),
    CONSTRAINT ctFkSupervisor FOREIGN KEY (fkSupervisor) REFERENCES funcionarios(idFuncionario)
);

-- Inserinodo dados na tabela 'funcaoEmpresa'
INSERT INTO funcaoEmpresa (area) VALUE
	('TI'),
    ('Desenvolvimento'),
    ('Marketing'),
    ('Telemarketing'),
    ('Financeiro');
    
    -- Inserinodo dados na tabela 'funcionarios'
    INSERT INTO funcionarios (nome, cpf, fkFuncao) VALUES
		('Clara', '11111111111', 2),
        ('Vivian', '11111111112', 1),
        ('Luiz', '11111111113', 4),
        ('Gustavo', '11111111167', 2);
        
-- Inserindo supervisores nos funcionarios
UPDATE funcionarios
SET fkSupervisor = 1
WHERE idFuncionario = 4;

UPDATE funcionarios
SET fkSupervisor = 2
WHERE idFuncionario = 3;

-- Exibindo os dados juntando as tabelas 'funcaoEmpresa' com 'funcionarios'
SELECT
f.nome AS 'Nome Funcionario',
area AS 'Área que atua',
s.nome AS 'Nome Supervisor'
FROM funcionarios AS f
JOIN funcaoEmpresa ON fkFuncao = idFuncao
JOIN funcionarios AS s ON s.idFuncionario = f.fkSupervisor;

-- Exibindo os dados juntando as tabelas 'funcaoEmpresa' com 'funcionarios' onde supervisor é nulo
SELECT
nome AS 'Nome Funcionario',
area AS 'Área que atua'
FROM funcionarios 
JOIN funcaoEmpresa ON fkFuncao = idFuncao
WHERE fkSupervisor IS NULL;

-- Exibindo os dados juntando as tabelas 'funcaoEmpresa' com 'funcionarios' com estrutura de decisão 
SELECT
f.nome AS 'Nome Funcionario',
area AS 'Área que atua',
CASE
	WHEN f.fkSupervisor > 0 THEN s.nome 
    ELSE  'Não tem supervisor'
    END AS 'Nome Supervisor'
FROM funcionarios AS f
JOIN funcaoEmpresa ON fkFuncao = idFuncao
LEFT JOIN funcionarios AS s ON s.idFuncionario = f.fkSupervisor;

/*
	Exercício 1: Fim
	Exercício 2: Início
*/

-- Criando a tabela 'usuarios'
CREATE TABLE usuarios (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    funcao VARCHAR(45),
    fkGerente INT,
    CONSTRAINT ctFkGerente FOREIGN KEY (fkGerente) REFERENCES usuarios(idUsuario)
);

-- Criando a tabela 'emails'
CREATE TABLE emails (
	idEmail INT AUTO_INCREMENT,
    enderecoEmail VARCHAR(45) UNIQUE NOT NULL,
    fkUsuario INT,
    PRIMARY KEY (idEmail, fkUsuario),
    CONSTRAINT ctFkUsuario FOREIGN KEY (fkUsuario) REFERENCES usuarios(idUsuario)
);

-- Inserindo dados na tabela 'usuarios'
INSERT INTO usuarios (nome, cpf, funcao) VALUES
	('Clara', '11111111111', 'Monitora'),
    ('Vivian', '11111111112', 'Professora'),
    ('Gustavo', '11111111114', 'Desenvolvedor'),
    ('Luiz', '11111111115', 'Engenheiro de Software'),
    ('Maria', '11111111116', 'Telemarketing');
    
-- Adicionando usuários gerentes
UPDATE usuarios
SET fkGerente = 2
WHERE idUsuario IN (3, 4);
    
UPDATE usuarios
SET fkGerente = 1
WHERE idUsuario = 5;    

-- Inserindo dados na tabela 'emails'
INSERT INTO emails (enderecoEmail, fkUsuario) VALUES
	('clara.faria@sptech.school', 1),
    ('vivian.silva@sptech.school', 2),
    ('gustavo.araujo@sptech.school', 3),
    ('luiz.oliveira@sptech.school', 4),
    ('maria.tsilva@sptech.school', 5);
    
-- Exibindo os dados juntando as tabelas 'usuarios' com 'emails'
SELECT
u.nome AS 'Nome do Usuário',
u.funcao AS 'Função do Usuário',
g.nome AS 'Nome do Usuário Gerente',
enderecoEmail AS 'Email do Usuário'
FROM usuarios AS u
JOIN emails ON fkUsuario = idUsuario
LEFT JOIN usuarios AS g ON g.idUsuario = u.fkGerente;

-- Exibindo os dados juntando as tabelas 'usuarios' com 'emails' onde usuário gerente é nulo
SELECT
u.nome AS 'Nome do Usuário',
u.funcao AS 'Função do Usuário',
enderecoEmail AS 'Email do Usuário'
FROM usuarios AS u
JOIN emails ON fkUsuario = idUsuario
WHERE fkGerente IS NULL;

-- Exibindo os dados juntando as tabelas 'usuarios' com 'emails' com estrutura de decisão
SELECT
u.nome AS 'Nome do Usuário',
u.funcao AS 'Função do Usuário',
CASE
	WHEN u.fkGerente IS NOT NULL THEN g.nome 
    ELSE 'Usuário sem usuário gerente'
    END AS 'Nome do Usuário Gerente',
enderecoEmail AS 'Email do Usuário'
FROM usuarios AS u
JOIN emails ON fkUsuario = idUsuario
LEFT JOIN usuarios AS g ON g.idUsuario = u.fkGerente;