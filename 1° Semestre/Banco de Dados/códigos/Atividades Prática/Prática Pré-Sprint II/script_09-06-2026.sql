/*
	Criando e utilizando o banco de dados
*/ 
CREATE DATABASE escola_gastronomia;
USE escola_gastronomia;

/*
	2. Criação do Banco
*/

-- Criando a tabela 'chefe'
CREATE TABLE chefe (
	id_chefe INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    especialidade VARCHAR(45),
    salario DECIMAL(9,2),
    fk_supervisor INT,
    CONSTRAINT ctFkSupervisor FOREIGN KEY (fk_supervisor) REFERENCES chefe(id_chefe),
    CONSTRAINT ctSalario CHECK(salario > 0)
);

-- Criando a tabela 'turma'
CREATE TABLE turma (
	id_turma INT AUTO_INCREMENT,
    nome VARCHAR(45),
    turno VARCHAR(45),
    sala INT,
    fk_chefe_responsavel INT,
    PRIMARY KEY (id_turma, fk_chefe_responsavel),
    CONSTRAINT ctFkChefeResponsavel FOREIGN KEY (fk_chefe_responsavel) REFERENCES chefe(id_chefe),
    CONSTRAINT ctTurno CHECK(turno = 'Matutino' OR turno = 'Tarde' OR turno = 'Noturno')
);

-- Criando a tabela 'aula_pratica'
CREATE TABLE aula_pratica (
	id_aula INT PRIMARY KEY AUTO_INCREMENT,
    tema VARCHAR(45),
    data DATETIME,
    observacao VARCHAR(200),
    fk_turma INT,
    fk_chefe_responsavel INT,
    CONSTRAINT ctFkTurma FOREIGN KEY (fk_turma) REFERENCES turma(id_turma),
    CONSTRAINT ctFkTurmaChefeResponsavel FOREIGN KEY (fk_chefe_responsavel) REFERENCES chefe(id_chefe)
);

-- Criando a tabela 'aluno'
CREATE TABLE aluno (
	id_aluno INT AUTO_INCREMENT,
    nome VARCHAR(45),
    telefone VARCHAR(11),
    situacao_academica VARCHAR(45),
     fk_turma INT,
    fk_chefe_responsavel INT,
    PRIMARY KEY(id_aluno, fk_turma, fk_chefe_responsavel),
    CONSTRAINT chFkTurma FOREIGN KEY (fk_turma) REFERENCES turma(id_turma),
    CONSTRAINT chFkTurmaChefeResponsavel FOREIGN KEY (fk_chefe_responsavel) REFERENCES chefe(id_chefe),
    -- 4. Alterações na Estrutura - reforcando uma validação (CHECK) do campo de situação acadêmica da tabela aluno (pode ser necessário alterar registros já existentes para esta validação).
    CONSTRAINT ctSituacaoAcademica CHECK(situacao_academica = 'Ativo' OR situacao_academica = 'Trancado' OR situacao_academica = 'Formado')
);

-- Criando a tabela 'matricula'
CREATE TABLE matricula (
	id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    dt_matricula DATE,
    situacao VARCHAR(45),
    fk_aluno INT,	
    fk_turma INT,
    fk_chefe_responsavel INT,
    CONSTRAINT cstAluno FOREIGN KEY (fk_aluno) REFERENCES aluno(id_aluno),
	CONSTRAINT cstFkTurma FOREIGN KEY (fk_turma) REFERENCES turma(id_turma),
    CONSTRAINT cstFkTurmaChefeResponsavel FOREIGN KEY (fk_chefe_responsavel) REFERENCES chefe(id_chefe),
    CONSTRAINT cstSituacao CHECK(situacao='Ativa' OR situacao = 'Desativada')
);

-- Criando a tabela 'recepcionista'
CREATE TABLE recepcionista (
	id_recepcionista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    turno VARCHAR(45),
    fk_matricula INT,
    CONSTRAINT ctFkMatricula FOREIGN KEY (fk_matricula) REFERENCES matricula(id_matricula),
    CONSTRAINT chTurno CHECK(turno = 'Matutino' OR turno = 'Tarde' OR turno = 'Noturno')
);

/*
	3. Inserção de Dados
*/

-- Inserindo 5 chefes
INSERT INTO chefe (nome, especialidade, salario, fk_supervisor) VALUES
	('Chefe 1', 'Macarrão', '2000.00', Null),
    ('Chefe 2', 'Miojo', '100.00', 1),
    ('Chefe 3', 'Cup Noodles', '150.00', 1),
    ('Chefe 4', 'Feijão com farinha', '2000.00', Null),
    ('Chefe 5', 'Farofa', '200.00', 4);
    
-- Inserindo 4 turmas
INSERT INTO turma (nome, turno, sala, fk_chefe_responsavel) VALUES 
	('Turma 1', 'Matutino', 2, 1),
    ('Turma 2', 'Tarde', 67, 2),
    ('Turma 3', 'Noturno', 69, 1),
    ('Turma 4', 'Matutino', 8430, 4);
        
-- Inserindo 6 aulas práticas
INSERT INTO aula_pratica (tema, data, observacao, fk_turma, fk_chefe_responsavel) VALUES
	('Strogonoff', '2026-04-22', 'Strogonoff de Frango vs Strogonoff de Carne', 1, 1),
    ('Miojo', '2026-01-22', 'Miojo de Tomate', 2, 2),
    ('Macarrão com Salsinha', '2025-02-12', 'Ficou gostoso', Null, Null),
    ('Frango xadrez', '2026-02-23', 'Recomandação do Luiz', 4, 4),
	('Sorvete', '2026-04-22', 'Cuidado: é gelado', Null, Null),
    ('Café', '2026-03-22', 'Hummmmmm... Gostoso',3 , 1);
    
-- Inserindo 8 alunos 
INSERT INTO aluno (nome, telefone, situacao_academica, fk_turma, fk_chefe_responsavel) VALUES
	('Aluno 1', '11999999999', 'Ativo', 1, 1),
    ('Aluno 2', '11999999997', 'Trancado',  2, 2),
    ('Aluno 3', Null, 'Formado', 1, 1),
    ('Aluno 4', '11999999996', 'Ativo', 3, 1),
    ('Aluno 5', Null, 'Trancado', 2, 2),
    ('Aluno 6', '11999999967', 'Formado', 2,2),
    ('Aluno 7', '11999999992', 'Ativo', 4, 4),
    ('Aluno 8', Null, 'Ativo', 3, 1);

-- Inserindo 8 matriculas
INSERT INTO matricula (dt_matricula, situacao, fk_aluno, fk_turma, fk_chefe_responsavel) VALUES
	('2022-01-22', 'Ativa', 1, 1, 1),
    ('2021-01-22', 'Desativada', Null, Null, Null),
    ('2008-01-20', 'Desativada', Null, Null, Null),
    ('2002-01-31', 'Ativa', 4, 3, 1),
    ('2001-01-19', 'Desativada', Null, Null, Null),
    ('2019-01-24', 'Desativada', 6, 2, 2),
    ('2022-01-22', 'Ativa', 7, 4, 4),
    ('2021-01-23', 'Ativa', Null, Null, Null);
    
-- Inserindo 3 recepcionistas
    INSERT INTO recepcionista (nome, email, turno, fk_matricula) VALUES
		('Recepcionista 1', 'recepcionista1@email.com', 'Matutino', 1),
        ('Recepcionista 2', 'recepcionista2@email.com', 'Tarde', Null),
        ('Recepcionista 3', 'recepcionista3@email.com', 'Noturno', 6);
    
/*
	4. Alterações na Estrutura
*/

-- renomeiendo a coluna nome da tabela chef para nomeChef
ALTER TABLE chefe
RENAME TO nomeChef;

/*
	5. Manipulação de Dados
*/

-- excluindo a matrícula de id 4
DELETE FROM matricula
WHERE id_matricula = 4;

-- excluindo a aula prática de id 6
DELETE FROM aula_pratica
WHERE id_aula = 6;

-- excluindo o aluno de id 8
DELETE FROM aluno
WHERE id_aluno = 8;

/*
	6. Consultas SQL
*/

--  Exibindo os alunos com: nome formatado; telefone; turma.
SELECT 
aluno.nome, 
telefone,
turma.nome
FROM aluno
JOIN turma ON fk_turma = id_turma;

-- Exibindo as turmas com: chef responsável e sala.
SELECT 
nomeChef.nome,
sala
FROM turma
JOIN nomeChef ON fk_chefe_responsavel = id_chefe;

-- Exibindo todos os chefs com seus respectivos supervisores, quando houver.
SELECT 
nomeChef.nome AS 'Chef',
chefSupervisor.nome AS 'Chef Supervisor'
FROM nomeChef AS nomeChef
JOIN nomeChef AS chefSupervisor ON nomeChef.fk_supervisor = chefSupervisor.id_chefe;

-- Exibindo as turmas com: chef responsável;  tema da aula prática.
-- A consulta deve exibir também turmas sem aula prática cadastrada.

SELECT 
nomeChef.nome,
aula_pratica.tema
FROM turma
LEFT JOIN nomeChef ON fk_chefe_responsavel = id_chefe
LEFT JOIN aula_pratica ON fk_turma = id_turma;

-- Exibindo os seguintes dados: aluno; turma; chef responsável; recepcionista que realizou a matrícula; situação da matrícula.
SELECT 
aluno.nome,
turma.nome,
nomeChef.nome,
recepcionista.nome,
matricula.situacao
FROM aluno
LEFT JOIN turma ON fk_turma = id_turma
LEFT JOIN nomeChef ON turma.fk_chefe_responsavel = id_chefe
LEFT JOIN matricula ON fk_aluno = id_aluno
LEFT JOIN recepcionista ON fk_matricula = id_matricula
ORDER BY aluno.nome;

-- Exibindo uma listagem final contendo: nome formatado do aluno; telefone; turma; situação da matrícula; uma classificação textual coerente com a situação do aluno no sistema. Essa consulta deve ser organizada em ordem alfabética por aluno.
SELECT
aluno.nome,
telefone,
matricula.situacao,
CASE 
-- situacao_academica = 'Ativo' OR situacao_academica = 'Trancado' OR situacao_academica = 'Formado
	WHEN situacao_academica = 'Ativo' THEN 'Está cursando'
    WHEN situacao_academica = 'Formado' THEN 'Terminou o curso'
    ELSE 'Desistiu do curso'
    END AS classificacao_academica
FROM aluno
LEFT JOIN turma ON fk_turma = id_turma
LEFT JOIN nomeChef ON turma.fk_chefe_responsavel = id_chefe
LEFT JOIN matricula ON fk_aluno = id_aluno
LEFT JOIN recepcionista ON fk_matricula = id_matricula
ORDER BY aluno.nome;