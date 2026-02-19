-- Comando para apagar/eliminar um banco de dados
DROP DATABASE db;

-- Usando o banco de dados
USE ccoaaula2;

-- Populando um data base, criando tabelas
CREATE TABLE pessoa (
	-- AUTO_INCREMENT = ele incrementa automaticamente, não precisa ficar colocando os números para o id (começa do 1)
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(40),
    -- DATE é um tipo de dado no formato 'YYYY-MM-DD'
    -- DATETIME é um tipo de dado no formato igual ao DATE junto com horas , minutos e secundos, seu formato'YYYY-MM-DD HH:MM:SS'
    dtNasc DATE -- Data de nascimento
);

/*
Tipos de campos de dados para números
	INT - número sem casas decimais
    FLOAT - permite até 7 casas decimais
    DOUBLE  - permite até 15 casas decimais (o dobro do FLOAT)
    DECIMAL - permite decimais de "forma customizável"  -> posso escolher a quantidade de casas decimais eu posso escolher
		|->(possui a maior quantidade de casas decimais)
        |-> Exemplo do DECIMAL(5,2) -> 5 casas no total e apensa 2 casas depois da virgula. Ficaria: 999.99
	TINYINT - INT em pequena escala, tem um tamanho até 127
*/

-- Descreva a tabela pessoa
DESCRIBE pessoa;

-- Inserindo dados na tabela
INSERT INTO pessoa  (nome, dtNasc) VALUES 
	('Vivian', '1983-10-03'),
    ('Thiago', '2006-11-27');
    
INSERT INTO pessoa (nome, dtNasc) VALUES
	('Clara', '1999-06-19'),
    ('Marcos', '2006-11-05'),
    ('Enzo', '2007-01-31');
    
-- Exibindo campos da tabela
SELECT * FROM pessoa;

-- Apagando uma linha da tabela
DELETE FROM pessoa 
WHERE id = 3;

-- Atualizando a tabela que já existe, colocando mais uma coluna
-- ADD COLUMN = adiciona coluna
-- altura DECIMAL(3, 2) = novo campo/coluna
ALTER TABLE pessoa ADD COLUMN altura DECIMAL(3, 2);

-- Atualizando um registro já existente
UPDATE pessoa -- atualize a tabela 'pessoa' 
SET altura = 1.60 -- coloque a coluna altura e incremente o valor '1.60' a ela
WHERE id = 1 ; -- onde o id seja igual a 1

-- Atualizando um registro já existente a partir de uma lista de ID
UPDATE pessoa
SET altura = 1.73
WHERE id IN (2, 5); -- tudo que estiver dentro (IN) da lista, 'atualiza apenas o 2 e o 5'

-- Atualiando um registro já existente a partir de comparação (maior ou menor)
UPDATE pessoa
SET altura = 1.75
WHERE id > 3; -- onde o id é maior que 3

-- Atualizando/Alterando uma propriedade de uma coluna
ALTER TABLE pessoa
MODIFY COLUMN nome VARCHAR(70); -- antes, era VARCHAR(40), agora é VARCHAR(70)

-- Renomeando uma coluna
ALTER TABLE pessoa
RENAME COLUMN altura TO height; -- renomeia a coluna (RENAME COLUMN) de 'altura' para (TO) 'height'

-- Deletando uma coluna
ALTER TABLE pessoa
DROP COLUMN height; -- elimine a coluna (DROP COLUMN) 'height'

-- Adicionando novo campo na tabela
ALTER TABLE pessoa
ADD COLUMN ativo TINYINT; -- FLAG  = sinalizar alguma coisa
-- No exemplo acima, eu estou sinalizando se essa pessoa está ativa ou não

UPDATE pessoa
SET ativo = 0
WHERE id > 1;

UPDATE pessoa
SET ativo = 1
WHERE id=1;

-- Limpando os registros da tabela
TRUNCATE TABLE pessoa;

