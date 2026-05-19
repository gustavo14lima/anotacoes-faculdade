/*
	Criando e utilizando banco de dados para a atividade
*/

CREATE DATABASE para_praticar_muito;
USE para_praticar_muito;

/*
	Comando da questão:
		Corrija todos os erros de sintaxe e lógica do script.
		Execute o script corrigido no seu ambiente MySQL.
		Comente cada correção feita, explicando o porquê.
		Faça a modelagem Lógica de cada exercício proposto.
*/

-- Exercício 1:

-- Criação das tabelas
CREATE TABLE usuarios (
    id INT PRIMARY KEY, -- Corrigindo a sintaxe (de 'PRIMARI' para 'PRIMARY'
    nome VARCHAR(100),
    email VARCHAR(100), -- Corringo a sintaxa (de VCHAR(100) para VARCHAR(100))
    data_nascimento DATE
);

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    usuario_id INT, -- Corrigindo chave estrangeira -> Deixando-a igual a FOREING KEY (por questões de padronização e melhor entendimento)
    data_pedido DATETIME,
    valor DECIMAL(10,2),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Inserção de dados
INSERT INTO usuarios (id, nome, email, data_nascimento) VALUES 
		(1, 'João Silva', 'joao@email.com', '1988-05-12'),
       (2, 'Maria Souza', 'maria@email', '1992-08-23');

INSERT INTO pedidos (id, usuario_id, data_pedido, valor) VALUES 
		(1, 1, '2023-03-10 14:30', 259.90),
       (2, 2, '2023-04-02 10:45', '399.50');

-- Atualização de dados
UPDATE usuarios
SET email = 'joao.silva@email.com'
WHERE nome = 'João Silva';-- Adicionando aspas simples, assim, informando que o campo se trata de uma String. Mesmo sendo melhor utilizar o id como parâmetro. 
-- Como no exemplo abaixo:
	-- WHERE id = 1; 

-- Remoção de pedidos com valor menor que 300
DELETE FROM pedidos -- Adicionando o 'FROM', específicando de qual tabela se trata
WHERE valor < 300;

-- Consulta com JOIN
SELECT u.nome, p.data_pedido, p.valor
FROM usuarios u
JOIN pedidos p ON u.id = p.id;

-- Consulta com LEFT JOIN
SELECT u.nome, p.data_pedido
FROM usuarios u
LEFT JOIN pedidos p ON u.id = p.usuario_id;

-- Consulta com RIGHT JOIN
SELECT u.nome, p.data_pedido
FROM usuarios u
RIGHT JOIN pedidos p ON p.usuario_id = u.id; -- Corrigindo erro: A referencia da chave estrangeira 'usuario_id', estava apontando para a tabela com apelido 'u'. Troquei para a tabela com apelido 'p'

-- Alteração da tabela
ALTER TABLE usuarios
MODIFY COLUMN email VARCHAR(150), -- Adicionando a propriedade 'COLUMN' ao lado do atributo 'MODIFY' e adicionando a virgula(,) para modificar a coluna e adicionar a coluna em um só comando
ADD COLUMN telefone VARCHAR(20);

-- Exercício 2:

-- Criação das tabelas
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100), -- Corrigindo erro de sintaxe: corrigindo de 'VARCH' para 'VARCHAR'
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE vendas (
    id INT PRIMARY KEY,
    id_cliente INT,
    data_venda DATE,
    valor_total DECIMAL(10,2), -- Corrigindo erro de sintaxe: corrigindo de 'DECIML' para 'DECIMAL'
    FOREIGN KEY (id_cliente) REFERENCES clientes(id) -- Alterando campo da chave estrangeira. A chave estrangeira não estava igual ao campo criado
);

-- Inserção de dados
INSERT INTO clientes (id, nome, telefone, email) VALUES 
		(1, 'Carlos Lima', '1199999999', 'carlos@email.com'),
       (2, 'Fernanda Dias', NULL, 'fernanda@email.com');

INSERT INTO vendas (id, id_cliente, data_venda, valor_total) VALUES 
		(1, 1, '2023-02-15', 150.00),
       (2, 2, '2023-03-01', NULL);

-- Consulta com WHERE e ORDER BY
SELECT nome, valor_total
FROM vendas v 
JOIN clientes c ON v.id_cliente = c.id
WHERE valor_total >= 100
ORDER BY valor_total DESC; -- Corrigindo erro de sintaxe: Adicionando o BY após o atributo 'ORDER' e Corrigindo o campo 'valot_total' para 'valor_total'

-- Uso de IFNULL
SELECT nome, IFNULL(telefone, 'Sem telefone')
FROM clientes;

-- Uso de CONCAT
SELECT CONCAT(nome, ' - ', email) AS contato -- Alterando concatenação entre o campo nome com a string '-' para virgula ao invés de '+'. A função confunde com uma operação matematica
FROM clientes;

-- Uso de CASE
SELECT nome, valor_total,
    CASE 
		-- Adicionando o WHEN na operação Case. Sem ele, é como se tivessemos uma estrutura de condição sem o 'if'
        WHEN valor_total > 200 THEN 'Alto' 
        WHEN valor_total BETWEEN 100 AND 200 THEN 'Médio' 
        ELSE 'Baixo'
    END AS categoria
FROM vendas v
JOIN clientes c ON c.id = v.id_cliente;

-- Exercício 3:

-- Criação das tabelas
CREATE TABLE livros (
    id INT PRIMARY KEY, -- Corrigindo sintaxe: Adicionando o KEY após a propriedade PRIMARY. Assim criando a chave primaria corretamente
    titulo VARCHAR(150),
    autor VARCHAR(100),
    ano_publicacao INT,
    disponivel BOOL
);

CREATE TABLE emprestimos (
    id INT PRIMARY KEY,
    livro_id INT,
    nome_leitor VARCHAR(100),
    data_emprestimo DATE,
    data_devolucao DATE, -- Adicionando a virgula para adicionar mais um campo a tabela
    FOREIGN KEY (livro_id) REFERENCES livros(id) -- Corrigindo sintaxe: de KEYS para KEY. Tirando do plural em resumo
);

-- Inserção de dados
INSERT INTO livros (id, titulo, autor, ano_publicacao, disponivel) VALUES 
		(1, '1984', 'George Orwell', 1949, true),
       (2, 'Dom Casmurro', 'Machado de Assis', 1899, false);

INSERT INTO emprestimos (id, livro_id, nome_leitor, data_emprestimo, data_devolucao) VALUES 
		(1, 2, 'Ana Paula', '2023-01-10', NULL),
       (2, 1, 'Carlos Alberto', '2023-02-05', '2023-02-20'); -- Atualizando o usuário do emprestimo de livro. Não temos cadastrado o usuário com ID = 3

-- Consulta com WHERE e ORDER BY
SELECT titulo, ano_publicacao
FROM livros
WHERE disponivel = 'true'
ORDER BY ano_publicacao DESC; -- Corrigindo erro de sintaxe: Adicionando o BY após o atributo 'ORDER'

-- Uso de IFNULL
SELECT nome_leitor, IFNULL(data_devolucao, 'Não devolvido')
FROM emprestimos;

-- Uso de CONCAT
SELECT CONCAT(nome_leitor, ' - ', titulo) AS leitura -- Alterando concatenação entre o campo nome com a string '-' para virgula ao invés de '+'. A função confunde com uma operação matematica
FROM emprestimos e
JOIN livros l ON e.livro_id = l.id;

-- Uso de CASE
SELECT titulo, disponivel,
    CASE 
      -- Corrigindo erro de sintaxe: Adicionando o BY após o atributo 'ORDER' e Corrigindo o campo 'valot_total' para 'valor_total'
        WHEN disponivel = true THEN 'Disponível'
        WHEN disponivel = false THEN 'Emprestado'
        ELSE 'Desconhecido'
    END AS status
FROM livros;

-- Exercício 4:

-- Criação das tabelas
CREATE TABLE alunos (
    id INT PRIMARY KEY, -- Corrigindo sintaxe: de 'PRIMERY' para 'PRIMARY', assim criando a chave primaria corretamente
    nome VARCHAR(100),
    data_nascimento DATE,
    peso FLOAT,
    altura FLOAT,
    telefone VARCHAR(15)
);

CREATE TABLE treinos (
    id INT PRIMARY KEY,
    aluno_id INT,
    tipo VARCHAR(50),
    duracao INT, -- em minutos
    data DATE,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id) -- Adicionando parenteses no valor da chave estrangeira.
);

-- Inserção de dados
INSERT INTO alunos (id, nome, data_nascimento, peso, altura, telefone) VALUES 
		(1, 'Lucas Nogueira', '1995-09-12', 78.5, 1.75, '11988776655'),
       (2, 'Patrícia Alves', '1988-03-22', 65.3, NULL, '11999887766');

INSERT INTO treinos (id, aluno_id, tipo, duracao, data) VALUES 
		(1, 1, 'Cardio', 45, '2023-05-10'),
       (2, 2, 'Musculação', 60, '2023-05-12'); -- valor numérico como string -> Isso é incorreto, por causa da definição da tabela tipo é INT

-- Consulta com WHERE e ORDER BY
SELECT nome, peso, altura
FROM alunos
WHERE peso > 70 AND altura IS NOT NULL
ORDER BY altura DESC;  -- Corrigindo erro de sintaxe: Adicionando o BY após o atributo 'ORDER'

-- IFNULL para altura
SELECT nome, IFNULL(altura, 0) AS altura
FROM alunos;

-- CONCAT para mensagem personalizada
SELECT CONCAT('Aluno: ', nome, ' - Telefone: ', telefone) AS nome_telefone -- Adicionando apelido (alías) para visualização mais agradavél
FROM alunos;

-- CASE para avaliação do treino
SELECT
	-- Adicionando algumas referencias nos campos de acordo com os apelidos das tabelas
	a.nome, 
    t.tipo, 
    t.duracao,
    CASE
		 -- Corrigindo erro de sintaxe: Adicionando o BY após o atributo 'ORDER' e Corrigindo o campo 'valot_total' para 'valor_total'
        WHEN t.duracao < 30 THEN 'Curto'
        WHEN t.duracao BETWEEN 30 AND 60 THEN 'Moderado'
        ELSE 'Longo'
    END AS intensidade
-- Criando apelidos para as tabelas
FROM treinos AS t
JOIN alunos AS a ON a.id = t.aluno_id; -- Adicionando JOIN para que aparece os dados de ambas as tabelas, como por exemplo nome do aluno, tipo e duração do treino 

-- Exercício 5:

-- Criação das tabelas
CREATE TABLE jogadores (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    nickname VARCHAR(50),
    pais_origem VARCHAR(50)
);

CREATE TABLE torneios (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    premiacao DECIMAL(8,2),
    data_torneio DATE
);

CREATE TABLE inscricoes (
    jogador_id INT,
    torneio_id INT,
    data_inscricao DATE,
    status VARCHAR(20),
    PRIMARY KEY (jogador_id, torneio_id), -- Adicionando KEY após o atributo PRIMARY e os parenteses nas chaves primarias. Assim definindo as chaves primarias corretamente.
    FOREIGN KEY (jogador_id) REFERENCES jogadores(id), -- Corrigindo sintaxe: de REFERENCE para REFERENCES, em resumo apenas colocando no plural. 
    FOREIGN KEY (torneio_id) REFERENCES torneios(id)
);

-- Inserção de dados
INSERT INTO jogadores (id, nome, nickname, pais_origem) VALUES 
		(1, 'Lucas Pereira', 'Lukao', 'Brasil'),
       (2, 'Emily Chan', 'ShadowQueen', 'China');

INSERT INTO torneios (id, nome, premiacao, data_torneio) VALUES 
		(1, 'Summer Cup', 5000, '2023-07-10'),
       (2, 'Winter Clash', 7500.00, '2023-12-15');

INSERT INTO inscricoes (jogador_id, torneio_id, data_inscricao, status) VALUES 
		(1, 1, '2023-06-01', 'confirmado'),
       (2, 2, '2023-11-20', NULL);

-- Atualização
UPDATE inscricoes
SET status = 'confirmado' -- Modificando o valor de status para string. Caso contrario, seria interpretado como coluna
WHERE jogador_id = 2 AND torneio_id = 2;

-- Exclusão
DELETE FROM inscricoes -- Adicionando o 'FROM', específicando de qual tabela se trata
WHERE status IS NULL;

-- Consulta com JOIN
SELECT j.nome, t.nome, i.status
FROM jogadores j
JOIN inscricoes i ON i.jogador_id = j.id
JOIN torneios t ON t.id = i.torneio_id;

-- LEFT JOIN
SELECT j.nome, t.nome
FROM jogadores j
LEFT JOIN inscricoes i ON j.id = i.jogador_id
LEFT JOIN torneios t ON i.torneio_id = t.id;

-- RIGHT JOIN
SELECT j.nome, t.nome
FROM jogadores j
RIGHT JOIN inscricoes i ON j.id = i.jogador_id
RIGHT JOIN torneios t ON i.torneio_id = t.id;

-- WHERE e ORDER BY
SELECT nickname, pais_origem
FROM jogadores
WHERE pais_origem = 'Brasil'
ORDER BY pais_origem; -- Corrigindo erro de sintaxe: Adicionando o BY após o atributo 'ORDER'

-- IFNULL e CONCAT
SELECT CONCAT(nome, ' (', nickname, ')') AS jogador,
       IFNULL(pais_origem, 'Não informado') AS pais
FROM jogadores;

-- CASE
SELECT j.nome, i.status,
    CASE
     -- Corrigindo erro de sintaxe: Adicionando o BY após o atributo 'ORDER' e Corrigindo o campo 'valot_total' para 'valor_total'
        WHEN i.status = 'confirmado' THEN 'Participante'
        WHEN i.status IS NULL THEN 'Aguardando'
        ELSE 'Outro'
    END AS situacao
FROM jogadores j
JOIN inscricoes i ON j.id = i.jogador_id;

-- ALTER TABLE
ALTER TABLE jogadores
-- Especificando COLUMN em todos os atributos do comando ALTER TABLE
ADD COLUMN nacionalidade VARCHAR(50),
MODIFY COLUMN nickname VARCHAR(100);