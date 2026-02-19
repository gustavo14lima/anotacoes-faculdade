-- Criar o banco de dados 
CREATE DATABASE aula3DB;

 -- Usar o banco de dados
USE aula3DB;

-- Criando uma tabela professor 
CREATE TABLE professor (
	id INT,
    nome VARCHAR(45),
    cpf CHAR(11),
    salario DECIMAL(6, 2),
    tipo VARCHAR(20),
    dtCadastrado DATETIME,
    CONSTRAINT  PKid PRIMARY KEY (id), -- restrição (regra)
    -- estou fazendo uma restrição, chamado PKid (Primary Key id) que vai ser uma chave primaria fazendo referencia ao campo id
    CONSTRAINT cTipo CHECK (tipo  IN ('Assistente', 'Titular', 'Monitor'))
    -- estou fazendo uma restrição, chamado cTipo, para checar (verificar) se oc ampo tipo está dentro da lista ('Assistente', 'Titular', 'Monitor'), ou seja, o tipo está restrito apenas a esses valores
);

-- Modificando a tabela id, adicionando o AUTO_INCREMENT
ALTER TABLE professor
MODIFY COLUMN id INT AUTO_INCREMENT;

-- Colocando dados na tabela
INSERT INTO professor (nome, cpf, salario, tipo, dtCadastrado) VALUES 
	('Clara', '11111111111', 1.99, 'Assistente', CURRENT_TIMESTAMP()), -- CURRENT_TIMESTAMP() -> função que insere a hora  e data de agora
    ('Pedro', '2222222222', 2.00, 'Monitor', NOW()), -- NOW() -> AGORA, função que pega a hora e data de agora
    ('Raphael', '33333333333', 5.00, 'Titular', NOW()),
    ('Nicole', '44444444444', '6.00', 'Titular', CURRENT_TIMESTAMP());
    -- CURDATE() -> função que pega apenas a data atual
    
    CREATE TABLE aluno (
		id INT AUTO_INCREMENT PRIMARY KEY,
		ra CHAR(8) UNIQUE , -- UNIQUE = único, esse campo é unico, não pode repetir
        nome VARCHAR(45) DEFAULT 'Sem Nome',
        dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP() -- colocando um valor padrão no campo, ou seja, no INSERT INTO, se eu não colocar nenhum valor nesse campo, o valor atribuido será CURRENT_TIMESTAMP()
	);
    
    INSERT INTO aluno (ra) VALUE 
		('04261077'),
        ('04261099'),
        ('04260100');
        
SELECT 
nome AS 'Primeiro Nome', 
ra AS 'Registro Academico'
FROM aluno;
-- AS (ALIAS) -> renomendo o campo (apelido para a tabela), apenas no select, no banco de dados estará com o mesmo nome, sem alterações

SELECT 
nome 'Primeiro Nome', 
ra 'Registro Academico'
FROM aluno;
-- AS é opcional, mas é melhor para fazer manutenção, ou seja, boa pratica utilizar o AS

SELECT
	CASE -- caso (começo condicional)
	WHEN tipo='Monitor' THEN 3.00 -- WHEN -> quando = primeira linha da condicional
    WHEN tipo='Assistente' THEN 5.00 -- THEN -> então = então faça...
    WHEN tipo='TItular' THEN 7.00
    ELSE 	0 -- ELSE -> caso nenhuma condição seja atendida
    END AS salario_teste -- END -> termina a condicional
    FROM professor;
      
    CREATE TABLE atleta (
		id INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(45),
        modalidade VARCHAR(30),
        cpf CHAR(11) UNIQUE NOT NULL, -- NOT NULL -> não pode ser vazio, ou seja, é obrigatorio ser preenchido
		dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP(),
        qtdMedalhas INT,
        CONSTRAINT cModalidade CHECK (modalidade IN (
        'Atletismo', 
        'Natação', 
        'Futebol'
        ))
	); 
    
    INSERT INTO atleta (nome, modalidade, cpf, qtdMedalhas) VALUES
		('Phelps', 'Natação', '11111111111', 28),
        ('Guilherme', 'Natação', '22222222222', 20),
        ('Raphael', 'Futebol', '33333333333', 2),
        ('Rafael', 'Futebol', '44444444444', 200);

/*
-- Estrtura do SELECT
SELECT 
	-- Campo
FROM tabela
	-- Condição
*/

-- IFNULL() -> tratamento quanto o campo é nulo
-- CONCAT() -> concatenação
	-- CONCAT('Hello ', 'World');
    
SELECT CONCAT('Hello ', 'World') AS 'Hello World';

INSERT INTO atleta (cpf) VALUE	
	('12345678901');
    
SELECT 
IFNULL(nome, 'Sem nome') AS 'Atletas'
FROM atleta;
-- Exemplo 1 - SELECT com CASE, AS, IFNULL() e CONCAT()
SELECT 
CASE
	WHEN qtdMedalhas > 2 THEN 'Nice'
    WHEN qtdMedalhas < 1 THEN 'Não Nice'
    ELSE '? Melhore.'
    END AS performance,
CASE
	WHEN modalidade = 'Futebol' THEN 'Blue Lock?'
    ELSE 'Bixa'
    END AS descrição_modalidade,
IFNULL(nome, 'Sem Nome'),
CONCAT('CPF ', cpf, ' / Cadastrado na Data: ', dtCadastro) AS info_registro
FROM atleta
WHERE nome LIKE 'R%' 
AND nome LIKE '%l'
OR nome NOT LIKE 'P%';

-- Exemplo 2
SELECT 
nome,
qtdMedalhas
FROM atleta
WHERE 
qtdMedalhas BETWEEN 20 AND 40 -- traga o nome e  a quantidade de medalhas, onde a quantidade de medalhas está ENTRE 20 e 40
AND nome LIKE 'P%'
ORDER BY nome DESC;