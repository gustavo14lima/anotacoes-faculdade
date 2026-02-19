-- Criando um novo usuário
CREATE USER 'nome_usuario'@'host' IDENTIFIED BY 'senha_usuario';

-- Dando todos os privilegios para o usuario em um determinado banco de dados 
GRANT ALL PRIVILEGES ON db_user.* TO 'nome_usuario'@'localhost';

-- Atualizando privilegios 
FLUSH PRIVILEGES