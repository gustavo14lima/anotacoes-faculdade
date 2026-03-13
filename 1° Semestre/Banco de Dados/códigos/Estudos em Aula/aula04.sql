/*
	Estudos sobre criação de usuários e comandos DCL
*/

-- Criando usuário com comandos

-- crie um usuario com o nome 'gestor' que poderá ser acessada por qualquer IP, identificado pela senha 'Senha@123'
CREATE USER 'gestor'@'%' IDENTIFIED BY 'Senha@123';

-- eu garanto todos os privilegios no banco de dados 'sprint1' em todas as tabelas (todas as tabelas = *) para o gestor
GRANT ALL PRIVILEGES ON sprint1.* TO 'gestor'@'%';

-- Confirmando os privilegios para todos os GRANT acima dele
FLUSH PRIVILEGES;

-- garantindo que os privilegios SELECT e UPDATE no banco de 'sprint1' em toda as tabelas para o estagiario
GRANT SELECT, UPDATE ON sprint1.* TO 'estagiario'@'%';

-- retirando todos os privilegios do banco de dados 'sprint' do usuário 'gestor'
-- posso especificar os privilegios igual no GRANT :)
REVOKE ALL PRIVILEGES ON sprint1.* FROM 'gestor'@'%';

FLUSH PRIVILEGES;

-- apagando usuário
DROP USER 'gestor'@'%';

/*
Entrando em um usuário pelo terminal

entrei no mysql utilizando o usuário (-u) 'estagiario' e peça a senha(-p)
mysql -u estagiario -p 

*/


-- localhost -> pode ser acessado apenas na máquina
-- % -> pode ser acessado de qualquer IP  

/*
	Estudos sobre relacionamento de colunas e chave estrangeira
*/

CREATE DATABASE ccoa;

USE ccoa;

CREATE TABLE turma (
	id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(20),
    periodo YEAR
);
    
-- Toda FK vai ficar onde fica o 'muitos' -> 1:N
    
CREATE TABLE aluno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    ra CHAR(8),
    dtNascimento DATE,
    fkTurma INT,
    CONSTRAINT ctFKTurma FOREIGN KEY (fkTurma) REFERENCES turma(id)
);

INSERT INTO turma (descricao, periodo) VALUES
	('1CCOA 20261', 2026),
    ('1CCOB 20261', 2026),
    ('1CCOK 20252', 2025);
    
INSERT INTO aluno (nome, ra, dtNascimento, fkTurma) VALUES
	('Luiz Phelipe', '04261999', '2008-06-12', 1),
    ('Gustavo Lima', '04261998', '2008-01-14', 1),
    ('Rafael Canudo', '04261997', '2007-01-13', 2),
    ('George Smith', '04251999', '1998-09-09', 2);

-- ON = comparação de chave primária com chave estrangeira
-- selecionando tudo da tabela aluno juntando com a tabela turma, onde a chave primária da tabela aluno for igual a chave estrangeira da tabela turma
SELECT * FROM aluno JOIN turma ON aluno.fkTurma = turma.id;

/*
	Caso eu quisse usar mais de um JOIN:
		SELECT 
		*
		FROM 
		aluno
		JOIN turma ON aluno.fkTurma = turma.id
        JOIN disciplina ON disciplina.fkTurma = turma.id;
        
        LEFT JOIN = estou fazendo aparecer todos os registros do JOIN + todos os registros da tabela a esquerda do JOIN
        RIGHT JOIN = estou fazendo aparecer todos os registros do JOIN + todos os registros da tabela a direita do JOIN
        INNER JOIN = estou pegando apenas os registros do JOIN
*/

CREATE TABLE empresa  (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(45),
    cnpj CHAR(14)
);

CREATE TABLE pessoa (
	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
	cpf CHAR(11),
    fkEmpresa INT,
    CONSTRAINT ctFkEmpresa
    FOREIGN KEY (fkEmpresa)
    REFERENCES empresa(idEmpresa)
);

INSERT INTO empresa (razao_social, cnpj) VALUES
	('Safra', '00000000000001');
    
INSERT INTO pessoa (nome, cpf, fkEmpresa) VALUES
	('Raphael Canudo', '99999999999', 1);
    
SELECT
razao_social, 
nome
FROM empresa
JOIN pessoa ON empresa.idEmpresa = pessoa.fkEmpresa;

SELECT
razao_social, 
nome
FROM empresa
JOIN pessoa ON empresa.idEmpresa = pessoa.fkEmpresa
WHERE razao_social LIKE 'Safra%'
ORDER BY nome DESC;