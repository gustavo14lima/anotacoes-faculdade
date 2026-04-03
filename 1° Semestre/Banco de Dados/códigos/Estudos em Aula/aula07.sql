/*
	Atributo atômico: menor fora de um atributo
    Atributo composto: composto por vários elementos
*/

CREATE DATABASE 1ccoasprint2;
USE 1ccoasprint2;

CREATE TABLE pessoa (
	id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60),
    cpf CHAR(11) UNIQUE NOT NULL
);

/*
	Atributo mutilvalorado = possui mias de um valor
		|- ele é diferente do composto -> ele possui vários valores dentro do mesmo campo
*/
CREATE TABLE telefone (
	id_telefone INT PRIMARY KEY AUTO_INCREMENT,
	-- tudo o que é dado pessoal é VARCHAR
	numero VARCHAR(11),
    fkPessoa INT,
    CONSTRAINT ctFkPessoa FOREIGN KEY (fkPessoa) REFERENCES pessoa(id_pessoa)
);

-- tabela com relacionamento fraco
CREATE TABLE dependente (
	id_dependente INT AUTO_INCREMENT,
    nome VARCHAR(60),
    cpf CHAR(11) UNIQUE NOT NULL,
    fk_pessoa INT,
    PRIMARY KEY (id_dependente, fk_pessoa),
    -- Criando chave estraingeira sem ser uma constraint
    FOREIGN KEY (fk_pessoa) REFERENCES pessoa(id_pessoa)
);

INSERT INTO pessoa (nome, cpf) VALUES 
	('Clara Faria', '11111111111'),
    ('Fernando Brandão', '11111111112'),
    ('Julia Araripe', '11111111113');
    
INSERT INTO telefone (numero, fkPessoa) VALUES
	('11988888888', 1),
    ('11988888889', 1),
    ('988888867', 3);
    
INSERT INTO telefone (numero, fkPessoa) VALUES
	('11988888878', null);
    
INSERT INTO dependente (nome, cpf, fk_pessoa) VALUES
	('Pedro Silva', '11111111114', 1),
    ('Carlos', '11111111115', 2); -- Por causa da chave primaria, o fk_pessoa não pode ser null | caso o campo não fosse primary key, poderia deixar o campo como null
    
SELECT     * FROM pessoa 
LEFT JOIN telefone ON  fkPessoa = id_pessoa;

SELECT * FROM pessoa AS p -- agora a tabela 'pessoa' não se chama/ não será referenciada como pessoa agora, para referenciar/chamar ela, precisa utilizar o 'p'
JOIN telefone ON fkPessoa = id_pessoa
JOIN dependente ON fk_pessoa = id_pessoa;

ALTER TABLE pessoa ADD COLUMN fk_chefe INT;
ALTER TABLE pessoa ADD CONSTRAINT ctFkChefe FOREIGN KEY (fk_chefe) REFERENCES pessoa(id_pessoa);

UPDATE pessoa
SET fk_chefe = 2
WHERE id_pessoa = 3;

SELECT * FROM pessoa p
JOIN pessoa c
ON p.fk_chefe = c.id_pessoa;

SELECT 
IFNULL(c.nome , 'Sem Chefe') AS 'Nome do Chefe',
p.nome AS 'Nome da Pessoa'
FROM pessoa p
LEFT JOIN pessoa c
ON p.fk_chefe = c.id_pessoa
WHERE p.nome LIKE '%a%'
ORDER BY p.nome;

-- Exemplo de atributo derivado
SELECT
	TIMESTAMPDIFF(YEAR, '1988-10-10', NOW()) -- Mostra a diferença entre datas. Nesse exemplo, estou passando como parametro, a diferença de anos de um ano especifico até a data atual
	AS 'Idade';
    
-- Atributo identificador (determinante) = indentificador da tabela -> que seria a primary key
-- Atributo monovalorado = tem somente 1 valor	