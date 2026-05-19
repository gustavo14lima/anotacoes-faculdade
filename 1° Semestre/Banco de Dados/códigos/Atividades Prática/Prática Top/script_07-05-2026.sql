-- Criando e utilizando o banco de dados para o sistema de gerenciamento de uma academia
CREATE DATABASE sistema_geraciamento_academia;
USE sistema_geraciamento_academia;

-- Criando todas as tabelas

-- Criando a tabela plano
CREATE TABLE plano (
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45),
    preco DECIMAL(10, 2) ,
    duracao_dias INT
);

-- Criando a tabela aluno
CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) ,
    dt_nascimento DATE,
    dt_matricula DATE
);

-- Criando a tabela matriculas
CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    dt_inicio DATE,
    dt_vencimento DATE,
	fk_aluno INT,
    fk_plano INT,
    FOREIGN KEY (fk_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (fk_plano) REFERENCES plano(id_plano)
);

-- Criando a tabela formas_pagamento
CREATE TABLE formas_pagamento (
    id_forma INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

-- Criando a tabela pagamentos
CREATE TABLE pagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    valor_pago DECIMAL(10, 2) ,
    dt_pagamento DATE,
    status_pagamento VARCHAR(45) ,
	fk_matricula INT,
    fk_forma INT,
    CONSTRAINT ctCheckPagamento CHECK(status_pagamento IN('Pago', 'Atrasado', 'Cancelado')),
    FOREIGN KEY (fk_matricula) REFERENCES matriculas(id_matricula),
    FOREIGN KEY (fk_forma) REFERENCES formas_pagamento(id_forma)
);

-- Inserindo dados nas tabelas

-- Inserindo dados na tabela plano
INSERT INTO plano (titulo, preco, duracao_dias) VALUES
	('Mensal', 100.00, 30),
	('Trimestral', 270.00, 90),
	('Anual', 960.00, 365);

-- Inserindo dados na tabela aluno
INSERT INTO aluno (nome, dt_nascimento, dt_matricula) VALUES
	('Aluno 1', '1995-05-10', '2024-01-15'),
	('Aluno 2', '2000-11-20', '2024-02-01'),
	('Aluno 3', '1988-03-03', '2024-03-10'),
	('Aluno 4', '1999-07-25', '2024-04-05'),
	('Aluno 5', '1990-01-01', '2024-05-20');
    
-- Inserindo dados na tabela matriculas
INSERT INTO matriculas (fk_aluno, fk_plano, dt_inicio, dt_vencimento) VALUES
	(1, 3, '2024-01-15', '2025-01-15'),
	(2, 1, '2024-02-01', '2024-03-01'),
	(2, 1, '2024-03-01', '2024-04-01'),
	(3, 2, '2024-03-10', '2024-06-10'),
	(4, 1, '2024-04-05', '2024-05-05'),
	(5, 3, '2024-05-20', '2025-05-20');

-- Inserindo dados na tabela formas_pagamento
INSERT INTO formas_pagamento (nome) VALUES
	('Cartão'),
	('Pix'),
	('Dinheiro');

-- Inserindo dados na tabela pagamentos
INSERT INTO pagamentos (fk_matricula, fk_forma, valor_pago, dt_pagamento, status_pagamento) VALUES
	(1, 2, 960.00, '2024-01-15', 'Pago'),
	(2, 1, 100.00, '2024-02-01', 'Pago'),
	(3, 1, 100.00, '2024-03-01', 'Pago'),
	(4, 3, 270.00, '2024-03-10', 'Pago'),
	(4, 3, 50.00, '2024-04-10', 'Atrasado'),
	(5, 2, 100.00, '2024-04-05', 'Pago'),
	(6, 1, 480.00, '2024-05-20', 'Pago'),
	(6, 1, 480.00, '2024-06-20', 'Pago'),
	(1, 3, 10.00, '2024-06-01', 'Pago'),
	(3, 2, 10.00, '2024-06-05', 'Pago');
    
-- Realizando as consultas

-- Liste o nome de todos os alunos e o título do plano que eles possuem
SELECT
    a.nome,
    p.titulo
FROM
    aluno AS a
JOIN matriculas AS m ON a.id_aluno = m.fk_aluno
JOIN plano AS p ON m.fk_plano = p.id_plano;

-- Liste o nome dos alunos que se matricularam no plano 'Anual' e que ainda estão ativos
SELECT a.nome FROM aluno AS a
JOIN matriculas AS m ON a.id_aluno = m.fk_aluno
JOIN plano AS p ON m.fk_plano = p.id_plano
WHERE
    p.titulo = 'Anual' AND m.dt_vencimento >= CURDATE();
    
-- Liste o nome de todos os alunos e o valor total que cada um já pagou à academia
SELECT
    a.nome,
    SUM(p.valor_pago) AS valor_total_pago
FROM
    aluno AS a
JOIN matriculas AS m ON a.id_aluno = m.fk_aluno
JOIN pagamentos AS p ON m.id_matricula = p.fk_matricula
GROUP BY
    a.nome;
    
-- Liste o nome dos alunos que utilizaram a forma de pagamento 'Cartão' em pelo menos um pagamento
SELECT 
    a.nome
FROM
    aluno AS a
JOIN matriculas AS m ON a.id_aluno = m.fk_aluno
JOIN pagamentos AS p ON m.id_matricula = p.fk_matricula
JOIN formas_pagamento AS f ON p.fk_forma = f.id_forma
WHERE
    f.nome = 'Cartão';
    
-- Liste o nome dos alunos que nunca fizeram um pagamento
SELECT
    a.nome
FROM
    aluno AS a
LEFT JOIN matriculas AS m ON a.id_aluno = m.fk_aluno
LEFT JOIN pagamentos AS p ON m.id_matricula = p.fk_matricula
WHERE
    p.id_pagamento IS NULL;
    
-- Calcule o valor médio dos planos da academia, arredondado para duas casas decimais
SELECT
    ROUND(AVG(preco), 2) AS valor_medio_planos
FROM plano;

-- Calcule o valor total arrecadado por cada Forma de Pagamento
SELECT
    f.nome,
    SUM(p.valor_pago) AS total_arrecadado
FROM
    formas_pagamento AS f
JOIN pagamentos AS p ON f.id_forma = p.fk_forma
GROUP BY
    f.nome;
    
-- Liste o título do plano e a quantidade de alunos que o possuem
SELECT
    p.titulo,
    COUNT(m.fk_aluno) AS quantidade_alunos
FROM
    plano AS p
JOIN matriculas AS m ON p.id_plano = m.fk_plano
GROUP BY
    p.titulo;
    
-- Liste o mês e o ano em que a academia teve a maior arrecadação total
SELECT
    DATE_FORMAT(dt_pagamento, '%Y-%m') AS mes_ano,
    SUM(valor_pago) AS arrecadacao_mensal
FROM pagamentos
GROUP BY mes_ano
ORDER BY arrecadacao_mensal DESC;

-- Calcule a idade média dos alunos da academia
SELECT
    AVG(TIMESTAMPDIFF(YEAR, dt_nascimento, CURDATE())) AS idade_media
FROM aluno;

-- Liste os títulos dos planos que geraram uma arrecadação total superior a R$ 5.000,00
SELECT
    p.titulo
FROM
    plano AS p
JOIN matriculas AS m ON p.id_plano = m.fk_plano
JOIN pagamentos AS pg ON m.id_matricula = pg.fk_matricula
GROUP BY
    p.titulo
HAVING SUM(pg.valor_pago) > 5000.00;

-- Liste os nomes dos alunos que possuem mais de uma matrícula registrada
SELECT
    a.nome
FROM
    aluno AS a
JOIN matriculas AS m ON a.id_aluno = m.fk_aluno
GROUP BY
    a.nome
HAVING COUNT(m.id_matricula) > 1;

-- Liste as Formas de Pagamento que foram utilizadas em menos de 3 pagamentos
SELECT
    f.nome
FROM
    formas_pagamento AS f
JOIN pagamentos AS p ON f.id_forma = p.fk_forma
GROUP BY
    f.nome
HAVING COUNT(p.id_pagamento) < 3;

-- UPDATE: Atualize o preço do plano 'Mensal' em 10%
UPDATE plano
SET preco = preco * 1.10
WHERE titulo = 'Mensal';

-- UPDATE: Altere a forma de pagamento de todos os pagamentos feitos no mês passado para 'Pix'
UPDATE pagamentos
SET fk_forma = (
	SELECT 
		id_forma 
	FROM formas_pagamento 
	WHERE nome = 'Pix'
)
WHERE dt_pagamento <= MONTH(NOW());

-- DELETE: Exclua todos os pagamentos que foram feitos com a forma de pagamento 'Dinheiro'
DELETE FROM pagamentos
WHERE fk_forma = (
	SELECT 
		id_forma 
	FROM formas_pagamento 
    WHERE nome = 'Dinheiro'
);

-- DELETE: Exclua o aluno com o menor valor total pago à academia
DELETE FROM aluno
WHERE id_aluno = (
    SELECT id_aluno FROM (
        SELECT
            a.id_aluno
        FROM aluno AS a
        JOIN matriculas AS m ON a.id_aluno = m.fk_aluno
        JOIN pagamentos AS p ON m.id_matricula = p.fk_matricula
        GROUP BY
            a.id_aluno
        ORDER BY
            SUM(p.valor_pago) ASC
    ) AS AlunoMenosPago
);

-- Subquery no WHERE: Alunos cujo valor pago é superior à média
SELECT
    a.nome
FROM aluno AS a
JOIN matriculas AS m ON a.id_aluno = m.fk_aluno
JOIN pagamentos AS p ON m.id_matricula = p.fk_matricula
GROUP BY
    a.nome
HAVING
    SUM(p.valor_pago) > (
        SELECT AVG(TotalPago)
        FROM (
            SELECT SUM(valor_pago) AS TotalPago
            FROM pagamentos
            GROUP BY fk_matricula
        ) AS MediaGeral
    );
    
-- Tabela Derivada: Diferença entre o plano do aluno e a média geral
SELECT
    a.nome,
    p.preco - MediaPlanos.media_geral AS diferenca_plano_media
FROM
    aluno AS a
JOIN matriculas AS m ON a.id_aluno = m.fk_aluno
JOIN plano p ON m.fk_plano = p.id_plano
JOIN (
SELECT 
	AVG(preco) AS media_geral 
    FROM plano
) AS MediaPlanos;

-- Crie uma VIEW chamada V_RELATORIO_FINANCEIRO que liste o nome do aluno, o título do plano, o valor do plano e o valor total pago pelo aluno até o momento.
CREATE VIEW V_RELATORIO_FINANCEIRO AS
	SELECT
		a.nome,
		p.titulo AS titulo_plano,
		p.preco AS valor_plano,
		SUM(pg.valor_pago)AS total_pago
	FROM
		aluno AS a
	JOIN matriculas AS m ON a.id_aluno = m.fk_aluno
	JOIN plano AS p ON m.fk_plano = p.id_plano
	LEFT JOIN pagamentos pg ON m.id_matricula = pg.fk_matricula
	GROUP BY
		a.nome, p.titulo, p.preco;
        
SELECT * FROM V_RELATORIO_FINANCEIRO;

-- Criando e utilizando o banco de dados para a Pesquisa de Consumidor
CREATE DATABASE pesquisa_consumidor;
USE pesquisa_consumidor;

-- Criando todas as tabelas

-- Criando a tabela pesquisas
CREATE TABLE pesquisas (
    id_pesquisa INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45),
    dt_criacao DATE
);

-- Criando a tabela pergunstas
CREATE TABLE pergunstas (
    id_pergunta INT PRIMARY KEY AUTO_INCREMENT,
    texto TEXT,
    tipo_resposta VARCHAR(45),
    CONSTRAINT ctCheckResposta CHECK(tipo_resposta IN('Nota', 'Multipla Escolha', 'Texto'))
);

-- Criando a tabela pesquisa_pergunta (N:N)
CREATE TABLE pesquisa_pergunta (
    fk_pesquisa INT,
    fk_pergunta INT,
    PRIMARY KEY (fk_pesquisa, fk_pergunta),
    FOREIGN KEY (fk_pesquisa) REFERENCES pesquisas(id_pesquisa),
    FOREIGN KEY (fk_pergunta) REFERENCES pergunstas(id_pergunta)
);

-- Criando a tabela consumidores
CREATE TABLE consumidores (
    id_consumidor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) ,
    idade INT,
    cidade VARCHAR(45)
);

-- Criando a tabela sessao_resposta
CREATE TABLE sessao_resposta (
    id_sessao INT PRIMARY KEY AUTO_INCREMENT,
    fk_consumidor INT,
    fk_pesquisa INT,
    data_resposta DATETIME,
    FOREIGN KEY (fk_consumidor) REFERENCES consumidores(id_consumidor),
    FOREIGN KEY (fk_pesquisa) REFERENCES pesquisas(id_pesquisa)
);

-- Criando a tabela respostas
CREATE TABLE respostas (
    id_resposta INT PRIMARY KEY AUTO_INCREMENT,
    fk_sessao INT,
    fk_pergunta INT,
    valor_resposta VARCHAR(45), 
    nota_resposta INT,
    FOREIGN KEY (fk_sessao) REFERENCES sessao_resposta(id_sessao),
    FOREIGN KEY (fk_pergunta) REFERENCES pergunstas(id_pergunta)
);

-- Inserindo dados nas tabelas

-- Inserindo dados na tabela consumidores
INSERT INTO consumidores (nome, idade, cidade) VALUES
	('Alice Silva', 35, 'São Paulo'),
	('Bruno Costa', 22, 'Rio de Janeiro'),
	('Carla Souza', 45, 'São Paulo'),
	('David Lima', 28, 'Belo Horizonte'),
	('Eva Santos', 50, 'Rio de Janeiro');

-- Inserindo dados na tabela pesquisas
INSERT INTO pesquisas (titulo, dt_criacao) VALUES
	('Satisfação do Produto X', '2024-01-10'),
	('Pesquisa de Atendimento', '2024-05-20');

-- Inserindo dados na tabela pergunstas
INSERT INTO pergunstas (texto, tipo_resposta) VALUES
	('Qual sua nota de 1 a 5 para o produto?', 'Nota'),
	('Qual sua cidade de origem?', 'Texto'),
	('O atendimento foi satisfatório (1 a 5)?', 'Nota'),
	('Recomendaria o produto a um amigo (Sim/Não)?', 'Multipla Escolha'),
	('Qual sua principal crítica?', 'Texto');

-- Inserindo dados na tabela pesquisa_pergunta
INSERT INTO pesquisa_pergunta (fk_pesquisa, fk_pergunta) VALUES
	(1, 1), 
    (1, 2), 
    (1, 4),
	(2, 3), 
    (2, 5), 
    (2, 2);

-- Inserindo dados na tabela sessao_resposta
INSERT INTO sessao_resposta (fk_consumidor, fk_pesquisa, data_resposta) VALUES
	(1, 1, '2024-01-15 10:00:00'),
	(2, 1, '2024-01-15 11:00:00'),
	(3, 2, '2024-05-25 14:30:00'),
	(4, 1, '2024-01-16 09:00:00'),
	(5, 2, '2024-05-26 16:00:00');

-- Inserindo dados na tabela respostas
INSERT INTO respostas (fk_sessao, fk_pergunta, valor_resposta, nota_resposta) VALUES
	(1, 1, 'Minas Gerais', 5), 
    (1, 2, 'São Paulo', 6), 
    (1, 4, 'Sim', 7),
    (2, 2, 'Rio de Janeiro', 5), 
    (2, 4, 'Não', 6),
    (3, 5, 'Demora na entrega', 4), 
    (3, 2, 'São Paulo', 5),
	(4, 1, 'Muito bom produto', 4), 
    (4, 2, 'Belo Horizonte', 10), 
    (5, 5, 'Produto excelente', 9), 
    (5, 2, 'Rio de Janeiro', 8);

-- Realizando as consultas

-- Liste o nome de todos os consumidores e o título da pesquisa que eles responderam
SELECT
    c.nome,
    p.titulo
FROM
    consumidores AS c
JOIN sessao_resposta AS s ON c.id_consumidor = s.fk_consumidor
JOIN pesquisas AS p ON s.fk_pesquisa = p.id_pesquisa;

-- Liste o título das pesquisas que contêm a palavra 'Satisfação' no título
SELECT 
    titulo 
FROM 
    pesquisas 
WHERE 
    titulo LIKE '%Satisfação%';

-- Liste o nome dos consumidores que responderam a pesquisas criadas antes de 2024
SELECT DISTINCT
    c.nome
FROM
    consumidores AS c
JOIN sessao_resposta AS s ON c.id_consumidor = s.fk_consumidor
JOIN pesquisas AS p ON s.fk_pesquisa = p.id_pesquisa
WHERE
    YEAR(p.dt_criacao) < 2024;

-- Liste o texto de todas as perguntas e o título da pesquisa em que elas foram utilizadas
SELECT
    q.texto,
    p.titulo
FROM
    pergunstas AS q
JOIN pesquisa_pergunta AS pp ON q.id_pergunta = pp.fk_pergunta
JOIN pesquisas AS p ON pp.fk_pesquisa = p.id_pesquisa;

-- Liste o nome dos consumidores que não responderam a nenhuma pesquisa
SELECT
    c.nome
FROM
    consumidores AS c
LEFT JOIN sessao_resposta AS s ON c.id_consumidor = s.fk_consumidor
WHERE
    s.id_sessao IS NULL;

-- Calcule a idade média dos consumidores, arredondada para zero casas decimais
SELECT
    ROUND(AVG(idade), 0) AS idade_media
FROM
    consumidores;

-- Calcule a nota média de todas as respostas
SELECT
    AVG(nota_resposta) AS nota_media_geral
FROM
    respostas
WHERE
    nota_resposta IS NOT NULL;

-- Liste a cidade e a quantidade de consumidores que responderam a pesquisas em cada cidade
SELECT
    c.cidade,
    COUNT(DISTINCT c.id_consumidor) AS total_consumidores
FROM
    consumidores AS c
JOIN sessao_resposta AS s ON c.id_consumidor = s.fk_consumidor
GROUP BY
    c.cidade;

-- Liste o título da pesquisa e a quantidade total de respostas que ela recebeu
SELECT
    p.titulo,
    COUNT(r.id_resposta) AS total_respostas
FROM
    pesquisas AS p
JOIN sessao_resposta AS s ON p.id_pesquisa = s.fk_pesquisa
JOIN respostas AS r ON s.id_sessao = r.fk_sessao
GROUP BY
    p.titulo;

-- Calcule a nota máxima e a nota mínima dadas para a pergunta de ID = 1
SELECT
    MAX(nota_resposta) AS nota_maxima,
    MIN(nota_resposta) AS nota_minima
FROM
    respostas
WHERE
    fk_pergunta = 1;

-- Liste o título da pesquisa que teve uma nota média de resposta inferior a 3.0
SELECT
    p.titulo
FROM
    pesquisas AS p
JOIN sessao_resposta AS s ON p.id_pesquisa = s.fk_pesquisa
JOIN respostas AS r ON s.id_sessao = r.fk_sessao
WHERE
    r.nota_resposta IS NOT NULL
GROUP BY
    p.titulo
HAVING
    AVG(r.nota_resposta) < 3.0;

-- Liste o nome do consumidor que respondeu a mais de uma pesquisa
SELECT
    c.nome
FROM
    consumidores AS c
JOIN sessao_resposta AS s ON c.id_consumidor = s.fk_consumidor
GROUP BY
    c.nome
HAVING
    COUNT(s.fk_pesquisa) > 1;

-- Liste as cidades que têm mais de 2 consumidores registrados
SELECT
    cidade
FROM
    consumidores
GROUP BY
    cidade
HAVING
    COUNT(id_consumidor) > 2;

-- UPDATE: Altere a cidade de todos os consumidores com idade superior a 40 anos para 'São Paulo'
UPDATE consumidores
SET cidade = 'São Paulo'
WHERE idade > 40;

-- UPDATE: Altere o texto da pergunta de ID = 2 para 'Qual sua opinião sobre o atendimento?'
UPDATE pergunstas
SET texto = 'Qual sua opinião sobre o atendimento?'
WHERE id_pergunta = 2;

-- DELETE: Exclua todas as respostas dadas por consumidores da cidade de 'Rio de Janeiro'
DELETE FROM respostas
WHERE fk_sessao IN (
    SELECT s.id_sessao
		FROM sessao_resposta AS s
    JOIN consumidores AS c ON s.fk_consumidor = c.id_consumidor
    WHERE c.cidade = 'Rio de Janeiro'
);

-- DELETE: Exclua a pesquisa que teve o menor número de respostas
DELETE FROM pesquisas
WHERE id_pesquisa = (
    SELECT id_pesquisa FROM (
        SELECT
            p.id_pesquisa
        FROM
            pesquisas AS p
        JOIN sessao_resposta AS s ON p.id_pesquisa = s.fk_pesquisa
        JOIN respostas AS r ON s.id_sessao = r.fk_sessao
        GROUP BY
            p.id_pesquisa
        ORDER BY
            COUNT(r.id_resposta) ASC
        LIMIT 1
    ) AS PesquisaMenosRespondida
);

-- Liste o nome dos consumidores cuja idade é superior à idade média de todos os consumidores
SELECT
    nome
FROM
    consumidores
WHERE
    idade > (SELECT AVG(idade) FROM consumidores);

-- Liste o título da pesquisa e a diferença entre a nota média da pesquisa e a nota média geral
SELECT
    p.titulo,
    AVG(r.nota_resposta) - MediaGeral.media_total AS diferenca_media
FROM
    pesquisas AS p
JOIN sessao_resposta AS s ON p.id_pesquisa = s.fk_pesquisa
JOIN respostas AS r ON s.id_sessao = r.fk_sessao
JOIN (SELECT AVG(nota_resposta) AS media_total FROM respostas WHERE nota_resposta IS NOT NULL) AS MediaGeral
WHERE
    r.nota_resposta IS NOT NULL
GROUP BY
    p.titulo, MediaGeral.media_total;

-- VIEW: Crie uma VIEW chamada V_ANALISE_RESPOSTAS que liste o título da pesquisa, o texto da pergunta e a nota média obtida para aquela pergunta naquela pesquisa.
CREATE VIEW V_ANALISE_RESPOSTAS AS
SELECT
    p.titulo AS titulo_pesquisa,
    q.texto,
    AVG(r.nota_resposta) AS nota_media
FROM
    pesquisas AS p
JOIN sessao_resposta AS s ON p.id_pesquisa = s.fk_pesquisa
JOIN respostas AS r ON s.id_sessao = r.fk_sessao
JOIN pergunstas AS q ON r.fk_pergunta = q.id_pergunta
WHERE
    r.nota_resposta IS NOT NULL
GROUP BY
    p.titulo, q.texto;