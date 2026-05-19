CREATE DATABASE 1ccoa_bd_20260430;
USE 1ccoa_bd_20260430;

CREATE TABLE aluno (
	id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80),
    cpf CHAR(11),
    dt_nascimento DATE
);

CREATE TABLE curso(
	id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

-- Criação da tabela N:N
CREATE TABLE aluno_curso (
	fk_aluno INT,
    fk_curso INT,
    PRIMARY KEY (fk_aluno, fk_curso),
    FOREIGN KEY (fk_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (fk_curso) REFERENCES curso(id_curso)
);

-- Realizando alguns INSERTS
INSERT INTO aluno (nome, cpf, dt_nascimento) VALUES
	('Clara', '11111111111', '1999-06-19'),
    ('João', '11111111112', '2004-05-10');
    
INSERT INTO curso (nome) VALUES
	('JavaScript'),
    ('CSS'),
    ('Python');
    
INSERT INTO aluno_curso (fk_aluno, fk_curso) VALUES
	(1, 1),
    (1,  3),
    (2, 1),
    (2, 2),
    (2, 3);
    
SELECT  * FROM
aluno
JOIN aluno_curso
ON aluno_curso.fk_aluno = aluno.id_aluno
JOIN curso
ON aluno_curso.fk_curso = curso.id_curso;

SELECT 
a.nome nome_aluno,
c.nome nome_curso,
TIMESTAMPDIFF(YEAR, a.dt_nascimento, CURDATE()) AS idade
FROM aluno a 
JOIN aluno_curso 
ON aluno_curso.fk_aluno = a.id_aluno
JOIN curso c
ON aluno_curso.fk_curso = c.id_curso;

-- Criando uma tabela virtual
CREATE VIEW info_aluno_curso AS
SELECT 
a.nome nome_aluno,
c.nome nome_curso,
TIMESTAMPDIFF(YEAR, a.dt_nascimento, CURDATE()) AS idade
FROM aluno a 
JOIN aluno_curso 
ON aluno_curso.fk_aluno = a.id_aluno
JOIN curso c
ON aluno_curso.fk_curso = c.id_curso;

SELECT * FROM info_aluno_curso;