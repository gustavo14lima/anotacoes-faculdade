-- Criando e utilizando o banco de dados
CREATE DATABASE guilda_de_aventureiros;
USE guilda_de_aventureiros;

-- Criando a tabela País
CREATE TABLE Pais (
    id_pais INT PRIMARY KEY AUTO_INCREMENT,
    nome_pais VARCHAR(50) NOT NULL,
    clima_predominante VARCHAR(50) NOT NULL
);

-- Criando a tabela Guilda
CREATE TABLE Guilda (
    id_guilda INT PRIMARY KEY AUTO_INCREMENT,
    nome_organizacao VARCHAR(50) NOT NULL,
    lema VARCHAR(500),
    fk_pais INT NOT NULL,
    FOREIGN KEY (fk_pais) REFERENCES Pais(id_pais)
);

-- Criando a tabela Cidades
CREATE TABLE Cidades (
    id_cidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    fk_pais INT NOT NULL,
    FOREIGN KEY (fk_pais) REFERENCES Pais(id_pais)
);

-- Criando a tabela Filial
-- Criada antes de Equipe e Dungeon para evitar erros de dependência
CREATE TABLE Filial (
    id_filial INT PRIMARY KEY AUTO_INCREMENT,
    orcamento_disponivel INT DEFAULT 0,
    nivel_seguranca INT,
    fk_guilda INT NOT NULL,
    fk_cidade INT NOT NULL,
    fk_mestre_responsavel INT, -- Pode ser nulo até um mestre ser atribuído
    FOREIGN KEY (fk_guilda) REFERENCES Guilda(id_guilda),
    FOREIGN KEY (fk_cidade) REFERENCES Cidades(id_cidade)
);

-- Criando a tabela Equipe (Clã)
CREATE TABLE Equipe (
    id_equipe INT PRIMARY KEY AUTO_INCREMENT,
    nome_cla VARCHAR(45) NOT NULL,
    nivel_medio_equipe INT NOT NULL,
    status_legal TINYINT DEFAULT 1,
    fk_filial INT NOT NULL,
    FOREIGN KEY (fk_filial) REFERENCES Filial(id_filial)
);

-- Criando a tabela Aventureiro
CREATE TABLE Aventureiro (
    id_aventureiro INT PRIMARY KEY AUTO_INCREMENT,
    nome_aventureiro VARCHAR(50) NOT NULL,
    nivel_individual INT NOT NULL,
    status_atividade TINYINT DEFAULT 1,
    fk_equipe INT NOT NULL,
    FOREIGN KEY (fk_equipe) REFERENCES Equipe(id_equipe)
);

-- Agora adicionamos a FK do mestre na Filial que ficou pendente
ALTER TABLE Filial ADD CONSTRAINT fk_mestre 
FOREIGN KEY (fk_mestre_responsavel) REFERENCES Aventureiro(id_aventureiro);

-- Criando a tabela Dungeon
CREATE TABLE Dungeon (
    id_dungeon INT PRIMARY KEY AUTO_INCREMENT,
    nivel_minimo INT NOT NULL,
    taxa_mortalidade INT DEFAULT 0,
    fk_filial INT NOT NULL,
    FOREIGN KEY (fk_filial) REFERENCES Filial(id_filial)
);

-- Criando a tabela Missao_Equipe
CREATE TABLE Missao_Equipe (
    id_missao INT PRIMARY KEY AUTO_INCREMENT,
    rank_dificuldade CHAR(1) NOT NULL, 
    inicio DATETIME DEFAULT CURRENT_TIMESTAMP,
    fim DATETIME,
    status_missao TINYINT NOT NULL,
    fk_dungeon INT NOT NULL,
    fk_equipe INT NOT NULL,
    FOREIGN KEY (fk_dungeon) REFERENCES Dungeon(id_dungeon),
    FOREIGN KEY (fk_equipe) REFERENCES Equipe(id_equipe),
    CONSTRAINT ctRank CHECK (rank_dificuldade IN ('S', 'A', 'B', 'C', 'D', 'E', 'F'))
);

-- Criando a tabela Recompensa
CREATE TABLE Recompensa (
    id_recompensa INT PRIMARY KEY AUTO_INCREMENT,
    montante_ouro INT NOT NULL,
    item_especial VARCHAR(50),
    fk_missao INT NOT NULL,
    FOREIGN KEY (fk_missao) REFERENCES Missao_Equipe(id_missao)
);

-- Inserindo dados na tabela Países
INSERT INTO Pais (nome_pais, clima_predominante) VALUES 
('Reinos do Norte', 'Temperado Frio'), 
('Reino de Belzerg', 'Temperado'),  
('Costa da Espada', 'Variado'),
('Ilha do Castelo', 'Temperado Insular'),
('Gondor', 'Temperado Mediterrâneo'),
('Rohan', 'Estepes Ventosas'),
('Mordor', 'Aridez Vulcânica'),
('Condado', 'Temperado Suave');

-- Inserindo dados na tabela Cidades
INSERT INTO Cidades (nome, fk_pais) VALUES 
('Novigrad', 1),
('Axel', 2),
('Neverwinter', 3),
('Waterdeep', 3),
('Vila da Superfície', 4),
('Minas Tirith', 5),
('Edoras', 6),
('Barad-dûr', 7),
('Vila dos Hobbits', 8),
('Bri', 8);

-- Inserindo dados na tabela Guildas
INSERT INTO Guilda (nome_organizacao, lema, fk_pais) VALUES 
('Escola do Lobo', 'O mal é o mal, menor, maior, médio...', 1),
('Guilda de Axel', 'Onde aventureiros inúteis se tornam lendas (ou não)', 2),
('Aliança dos Lordes', 'Pela ordem e prosperidade da Costa da Espada', 3),
('Exploradores do Enclave', 'Comer é viver, mesmo nas profundezas.', 4),
('Sociedade do Anel', 'Um anel para a todos governar... mas nós vamos destruir.', 5),
('Cavaleiros de Rohan', 'Morte e Glória!', 6),
('Servos do Olho', 'Não há vida no vazio, apenas morte.', 7);

-- Inserindo dados na tabela Filiais
-- Lembrando: fk_mestre_responsavel começa como NULL por conta da restrição circular
INSERT INTO Filial (orcamento_disponivel, nivel_seguranca, fk_guilda, fk_cidade) VALUES 
(5000, 8, 1, 1),
(150, 2, 2, 2), 
(10000, 9, 3, 3),
(1200, 5, 4, 5),
(50000, 10, 5, 1), 
(15000, 7, 6, 2),  
(99999, 10, 7, 3),
(500, 3, 5, 5);

-- Inserindo dados na tabela Equipes (Clãs)
INSERT INTO Equipe (nome_cla, nivel_medio_equipe, fk_filial) VALUES 
('Caçadores de Monstros', 40, 1),
('Time Kazuma', 15, 2),
('Heróis de Phandalin', 5, 3),
('Grupo do Laios', 35, 4),
('A Comitiva', 60, 5),
('Exploradores de Isengard', 45, 7),
('Guarda da Cidadela', 50, 5);

-- Inserindo dados na tabela Aventureiros
INSERT INTO Aventureiro (nome_aventureiro, nivel_individual, fk_equipe) VALUES 
('Geralt de Rivia', 50, 1),
('Satou Kazuma', 12, 2),
('Aqua', 20, 2),
('Megumin', 25, 2),
('Darkness', 22, 2),
('Drizzt Do''Urden', 18, 3),
('Laios Touden', 38, 4),
('Marcille Donato', 40, 4),
('Chilchuck Tims', 30, 4),
('Senshi de Izganda', 42, 4),
('Aragorn', 85, 5),
('Legolas', 82, 5),
('Gimli', 81, 5),
('Frodo Bolseiro', 20, 5),
('Samwise Gamgee', 35, 5),
('Uglúk', 40, 6),
('Beregond', 45, 7);

-- Atualizando o Mestre da Filial (Agora que os aventureiros existem)
UPDATE Filial SET fk_mestre_responsavel = 1 WHERE id_filial = 1; 
UPDATE Filial SET fk_mestre_responsavel = 2 WHERE id_filial = 2; 
UPDATE Filial SET fk_mestre_responsavel = 10 WHERE id_filial = 4;
UPDATE Filial SET fk_mestre_responsavel = 11 WHERE id_filial = 5; 
UPDATE Filial SET fk_mestre_responsavel = 14 WHERE id_filial = 8;

-- Inserindo dados na tabela Dungeons
INSERT INTO Dungeon (nivel_minimo, taxa_mortalidade, fk_filial) VALUES 
(35, 60, 1), 
(5, 10, 2),  
(3, 25, 3),
(25, 45, 4),
(80, 95, 7),
(65, 80, 5), 
(40, 30, 8);

-- Inserindo dados na tabela Missões
INSERT INTO Missao_Equipe (rank_dificuldade, status_missao, fk_dungeon, fk_equipe) VALUES 
('S', 1, 1, 1), 
('F', 1, 2, 2),
('B', 1, 3, 3),
('A', 1, 4, 4),
('S', 1, 5, 5), 
('A', 1, 6, 5),
('C', 0, 7, 5);

-- Inserindo dados na tabela Recompensas
INSERT INTO Recompensa (montante_ouro, item_especial, fk_missao) VALUES 
(2000, 'Espada de Prata de Mestre', 1),
(50, 'Garrafa de Saquê de Luxo', 2),
(500, 'Manoplas de Força de Ogro', 3),
(500, 'Ensopado de Dragão Vermelho', 4),
(0, 'Livro de Receitas da Dungeon', 4),
(0, 'Andúril, a Chama do Oeste', 5),
(0, 'Cota de Malha de Mithril', 6),
(100, 'Adagas de Ponente', 7);