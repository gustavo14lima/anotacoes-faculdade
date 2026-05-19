-- Criando e utilizando o banco de dados

CREATE DATABASE 1ccoa_db_20260507;
USE 1ccoa_db_20260507;

CREATE TABLE departamento(
	id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

CREATE TABLE funcionario (
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80),
    salario DECIMAL(10, 2),
    fk_departamento INT,
    FOREIGN KEY (fk_departamento) REFERENCES departamento (id_departamento)
);

INSERT INTO departamento (nome) VALUES
	('TI'),
    ('RH'),
    ('DP'),
    ('Vendas');
    
INSERT INTO funcionario (nome, salario, fk_departamento) VALUES 
	('Clara', 5000, 1),
    ('Vivian', 5500, 1),
    ('Pedro', 6200, 2),
    ('Walter', 9999, 4);
    
-- Subquerys - Consulta dentro de uma consulta. Elas são separadas a paritr de parenteses ().

-- Trazendo nome e salario de todos que estão dentro do departamento de TI.
-- Exemplo de subquey utilizada como condição após o WHERE:
SELECT 
	nome,
	salario
FROM funcionario
WHERE fk_departamento IN (
	SELECT id_departamento 
    FROM departamento
    WHERE nome = 'TI'
);

-- Trazendo o nome dos funcionarios onde o salario é maior que a media
-- Exemplo de subquey utilizada como condição após o WHERE:
SELECT nome
FROM funcionario
WHERE salario > (
	SELECT AVG(salario)
    FROM funcionario
);

-- Exemplo de subquery utilizada no FROM. Assim, trazendo uma tabela virtual com o resultado da subquery. Como o resultado é uma tabela, o alias (AS) é fundamental
SELECT * FROM 
(
	SELECT fk_departamento,
		AVG(salario) AS media_salario
	FROM funcionario
    GROUP BY fk_departamento
) AS medias
WHERE media_salario > 4000;

-- Trazendo o nome e a media salarial
SELECT nome_dp, media_salarial FROM
	(
	SELECT departamento.nome AS nome_dp,
		AVG(salario) AS media_salarial
	FROM funcionario
    JOIN departamento ON fk_departamento = id_departamento
    GROUP BY departamento.nome
) AS medias;

CREATE VIEW dp_salario AS 
	SELECT nome_dp, media_salarial FROM
		(
		SELECT departamento.nome AS nome_dp,
			AVG(salario) AS media_salarial
		FROM funcionario
		JOIN departamento ON fk_departamento = id_departamento
		GROUP BY departamento.nome
	) AS medias;
    
    SELECT 
		ROUND(AVG(media_salarial) , 2)AS media_total
    FROM dp_salario;
    
    SELECT * FROM dp_salario;
    
    CREATE TABLE empresa (
		id_empresa INT PRIMARY KEY AUTO_INCREMENT,
        nome_empresa VARCHAR(45),
        cpnj CHAR(14)
	);
    
    ALTER TABLE departamento 
    ADD COLUMN fk_empresa INT;
    
   ALTER TABLE departamento
   ADD CONSTRAINT ctFkEmpresa FOREIGN KEY (fk_empresa) REFERENCES empresa (id_empresa);
   
INSERT INTO empresa (nome_empresa, cpnj) VALUES
	('Empresa da Clara', '111111111111');
    
UPDATE departamento 
SET fk_empresa = 1
WHERE id_departamento IN ( 1, 2, 3, 4);

INSERT INTO empresa (nome_empresa, cpnj) VALUES
	('Empresa do Matheus', '111111111112');
    

SELECT * FROM empresa
LEFT JOIN departamento ON fk_empresa = id_empresa
LEFT JOIN funcionario ON fk_departamento = id_departamento;