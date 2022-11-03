-- Criando um usuário
CREATE USER 'username'@'localhost' IDENTIFIED BY '@Ab12345';

-- Alteração de senha
SET PASSWORD FOR 'username'@'localhost' = '$Cd67890';


-- LINK
-- https://www.diegomacedo.com.br/administracao-de-usuarios-e-privilegios-no-banco-de-dados/
-- https://www.digitalocean.com/community/tutorials/como-criar-um-novo-usuario-e-conceder-permissoes-no-mysql-pt

FLUSH PRIVILEGES;