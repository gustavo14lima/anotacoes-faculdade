CREATE DATABASE escola;
USE escola;

CREATE TABLE curso (
    idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nomeCurso VARCHAR(100)
);

CREATE TABLE aluno (
    idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    fkCurso INT,
    FOREIGN KEY (fkCurso) REFERENCES curso(idCurso)
);

CREATE TABLE disciplina (
    idDisciplina INT PRIMARY KEY AUTO_INCREMENT,
    nomeDisciplina VARCHAR(100),
    cargaHoraria INT
);

CREATE TABLE matricula (
    idMatricula INT PRIMARY KEY AUTO_INCREMENT,
    fkAluno INT,
    fkDisciplina INT,
    nota DECIMAL(4,2),
    FOREIGN KEY (fkAluno) REFERENCES aluno(idAluno),
    FOREIGN KEY (fkDisciplina) REFERENCES disciplina(idDisciplina)
);

INSERT INTO curso (nomeCurso) VALUES
('ADS'),
('SI'),
('CCO');

INSERT INTO aluno (nome, email, fkCurso) VALUES
('Ana', 'ana@sptech.school', 1),
('Bruno', 'bruno@sptech.school', 1),
('Carlos', 'carlos@sptech.school', 2),
('Daniela', 'daniela@sptech.school', 3),
('Eduardo', 'eduardo@sptech.school', 1);

INSERT INTO disciplina (nomeDisciplina, cargaHoraria) VALUES
('Banco de Dados', 80),
('Algoritmos', 60),
('Redes', 40);

INSERT INTO matricula (fkAluno, fkDisciplina, nota) VALUES
(1, 1, 8.5),
(1, 2, 7.0),
(2, 1, 9.0),
(2, 2, 6.5),
(3, 1, 5.0),
(3, 3, 7.5),
(4, 1, 8.0),
(4, 2, 9.5),
(5, 3, 6.0);

-- =====================================================
-- EXERCÍCIOS
-- =====================================================

-- 1) Mostre a quantidade de alunos por curso.
SELECT
	COUNT(*)
FROM aluno
GROUP BY fkCurso;

-- 2) Mostre os cursos que possuem mais de 1 aluno.
SELECT
	c.nomeCurso  AS nome_curso,
    COUNT(*) AS quantidade
FROM aluno AS a
JOIN curso AS c ON a.fkCurso = c.idCurso
GROUP BY a.fkCurso
HAVING quantidade > 1;

-- 3) Mostre a média das notas por disciplina.
SELECT 
    d.nomeDisciplina AS nome_disciplina,
	ROUND(AVG(m.nota), 2) AS media
FROM matricula AS m
JOIN disciplina AS d ON m.fkDisciplina = d.idDisciplina
GROUP BY d.nomeDisciplina;

-- 4) Mostre a maior nota de cada disciplina.
SELECT
	d.nomeDisciplina AS nome_disciplina,
	MAX(m.nota) AS maior_nota
FROM matricula AS m
JOIN disciplina AS d ON m.fkDisciplina = d.idDisciplina
GROUP BY m.fkDisciplina;

-- 5) Mostre as disciplinas cuja média das notas seja maior que 7.
SELECT
	d.nomeDisciplina AS nome_disciplina,
	ROUND(AVG(m.nota), 2) AS media_disciplina
FROM matricula AS m
JOIN disciplina AS d ON m.fkDisciplina = d.idDisciplina
GROUP BY m.fkDisciplina
HAVING media_disciplina > 7;

-- 6) Mostre os alunos que possuem nota acima da média geral.
SELECT
	a.nome
FROM aluno AS a
JOIN matricula AS m ON m.fkAluno = a.idAluno
WHERE m.nota > (
		SELECT
			AVG(nota)
		FROM matricula
);
	
-- 7) Mostre o aluno que possui a maior nota.
SELECT
	nome
FROM aluno
WHERE idAluno = (
	SELECT
		fkAluno
	FROM matricula
    ORDER BY nota DESC
    LIMIT 1
);

-- 8) Mostre a disciplina com maior carga horária.
SELECT
	nomeDisciplina
FROM disciplina
WHERE cargaHoraria IN (
	SELECT
		MAX(cargaHoraria)
	FROM disciplina
);

-- 9) Mostre a quantidade de matrículas por disciplina.
SELECT
	d.nomeDisciplina AS nome_disciplina,
	COUNT(*) AS quantidade_matricula
FROM matricula AS m
JOIN disciplina AS d ON m.fkDisciplina = d.idDisciplina
GROUP BY m.fkDisciplina;

-- 10) Mostre os alunos cuja média das notas seja maior que 7.
SELECT
	a.nome AS nome_aluno,
    ROUND(AVG(m.nota), 2) AS media_nota
FROM aluno AS a
JOIN matricula AS m ON m.fkAluno = a.idAluno
GROUP BY a.nome
HAVING media_nota > 7;

-- 11) Mostre a média das médias das notas dos alunos.
SELECT
	ROUND(AVG(media), 2) AS media_media_notas
FROM (
	SELECT
		AVG(nota) AS media
	FROM matricula
    GROUP BY fkAluno
) AS calculo_media;

-- 12) Mostre a maior média entre os alunos.
SELECT
	a.nome AS nome_aluno,
    ROUND(AVG(m.nota), 2) AS media_nota
FROM aluno AS a
JOIN matricula AS m ON m.fkAluno = a.idAluno
GROUP BY a.nome
HAVING media_nota = (
	SELECT
		AVG(nota) AS media
	FROM matricula AS m
    JOIN aluno AS a ON m.fkAluno = a.idAluno
    GROUP BY a.nome
    ORDER BY media DESC
    LIMIT 1
);
		
-- 13) Mostre quantos alunos possuem média maior que 7.
SELECT
	COUNT(*) AS alunos_media_maior_sete
FROM (
	SELECT
		a.nome AS nome_aluno,
		ROUND(AVG(m.nota), 2) AS media_nota
	FROM aluno AS a
	JOIN matricula AS m ON m.fkAluno = a.idAluno
	GROUP BY a.nome
	HAVING media_nota > 7
) AS media_aluno;

-- 14) Mostre os cursos cuja quantidade de alunos seja maior ou igual a 2.
SELECT 
	c.nomeCurso AS nome_curso,
    COUNT(*) AS quantidade_aluno
FROM aluno AS a
JOIN curso AS c ON a.fkCurso = c.idCurso
GROUP BY a.fkCurso
HAVING quantidade_aluno >= 2;

-- 15) Mostre os alunos cuja média seja maior que a média das médias.
SELECT 
	a.nome AS nome_aluno,
    ROUND(AVG(m.nota), 2) AS media_nota
FROM aluno AS a
JOIN matricula AS m ON m.fkAluno = a.idAluno
GROUP BY fkAluno
HAVING media_nota > (
	SELECT
		ROUND(AVG(media), 2) AS media_media_notas
	FROM (
		SELECT
			AVG(nota) AS media
		FROM matricula
		GROUP BY fkAluno
	) AS calculo_media
);