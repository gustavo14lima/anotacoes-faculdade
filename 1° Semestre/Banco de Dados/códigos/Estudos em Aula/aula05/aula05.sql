USE ccoa;

CREATE TABLE aluno (
	id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    ra CHAR(8) UNIQUE NOT NULL,
    fk_empresa INT,
    CONSTRAINT ctFkEmpresa 
    FOREIGN KEY (fk_empresa) REFERENCES empresa(id_empresa)
);

CREATE TABLE empresa(
	id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(45),
    cnpj CHAR (14) UNIQUE NOT NULL,
    fk_responsavel INT UNIQUE,
    CONSTRAINT ctFkResponsavel
    FOREIGN KEY (fk_responsavel) REFERENCES responsavel(id_responsavel)
);

CREATE TABLE responsavel (
	id_responsavel INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11) UNIQUE NOT NULL,
    salario DECIMAL (7, 2)
);

INSERT INTO responsavel (nome, cpf, salario) VALUES 
	('Marcus Brenno', '11111111111', 5000.00),
    ('Jacob', '22222222222', 100.00);
    
INSERT INTO empresa (razao_social, cnpj, fk_responsavel) VALUES
	('Assai atacadista', 1111111111111, 1),
    ('BK', 22222222222222, 2);
    
INSERT INTO aluno (nome, ra, fk_empresa) VALUES
	('Luiz', '04261119', 2),
    ('Zuca', '04268182', 1);
    
SELECT
-- apelidando as tabelas para pegar suas colunas
a.nome AS 'Nome Aluno', -- Aluno = a
e.razao_social AS 'Razão Social da Empresa', -- Empresa = e
r.nome 'Nome Responsável' -- Responsável = r
FROM  empresa AS e x-- Não importa a tabela que eu vou colocar primeiro
JOIN aluno AS a
	ON e.id_empresa = a.fk_empresa
JOIN responsavel r 
	ON r.id_responsavel = e.fk_responsavel;

-- o JOIN só devolve os registros que estão dentro de ambas as tabelas. Por exemplo, se em aluno eu tiver 3 alunos, mas apenas dois estão em uma empresa, ele devolve apenas os dois alunos que teriam uma empresa
-- Para saber se usar LEFT ou RIGHT, apenas compare a tabela que está no FROM. Por exemplo, na tabela empresa, caso eu queria pegar todos os alunos que não tenham relacionamento com empresa, utilizo o LEFT (compare com o diagrama)