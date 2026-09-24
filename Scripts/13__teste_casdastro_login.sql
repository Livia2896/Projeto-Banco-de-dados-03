-- Testes para a funcionalidade de cadastro e login

-- 1) Cadastrar uma pessoa como ATENDENTE (Nome + E-mail + Senha)
WITH nova_pessoa AS (
    INSERT INTO pessoa (nome, cpf, telefone, email, senha)
    VALUES ('Fernanda Costa', NULL, NULL, 'fernanda@email.com', 'senha123')
    RETURNING id_pessoa
)
INSERT INTO atendente (id_pessoa, matricula)
SELECT id_pessoa, NULL FROM nova_pessoa;

-- 2) Cadastrar uma pessoa como CLIENTE (Nome + E-mail + Senha)
WITH nova_pessoa AS (
    INSERT INTO pessoa (nome, cpf, telefone, email, senha)
    VALUES ('Gabriel Rocha', NULL, NULL, 'gabriel@email.com', 'senha456')
    RETURNING id_pessoa
)
INSERT INTO cliente (id_pessoa)
SELECT id_pessoa FROM nova_pessoa;

-- 3) Consultar os usuários cadastrados
SELECT id_pessoa, nome, email
FROM pessoa
ORDER BY id_pessoa;

-- 4) Testar login com e-mail e senha corretos
SELECT id_pessoa, nome, email
FROM pessoa
WHERE email = 'fernanda@email.com'
  AND senha = 'senha123';
-- Deve retornar 1 linha (login válido)

-- 5) Testar login com senha incorreta
SELECT id_pessoa, nome, email
FROM pessoa
WHERE email = 'fernanda@email.com'
  AND senha = 'senhaerrada';
-- Deve retornar 0 linhas (login inválido)

-- 6) Verificar que não é possível cadastrar dois usuários com o mesmo e-mail
INSERT INTO pessoa (nome, cpf, telefone, email, senha)
VALUES ('Outra Pessoa', NULL, NULL, 'fernanda@email.com', 'outrasenha');
-- Deve falhar com erro de violação da UNIQUE (uq_pessoa_email)

-- 7) Verificar que a pessoa cadastrada como ATENDENTE aparece em atendente
SELECT p.id_pessoa, p.nome, p.email, a.matricula
FROM pessoa p
JOIN atendente a ON a.id_pessoa = p.id_pessoa
WHERE p.email = 'fernanda@email.com';

-- 8) Verificar que a pessoa cadastrada como CLIENTE aparece em cliente
FROM pessoa p
JOIN cliente c ON c.id_pessoa = p.id_pessoa
WHERE p.email = 'gabriel@email.com';

-- Extra: descobrir se um login é de um atendente ou de um cliente
-- (útil para decidir a tela após o login)
SELECT
    p.id_pessoa,
    p.nome,
    p.email,
    CASE
        WHEN a.id_pessoa IS NOT NULL THEN 'atendente'
        WHEN c.id_pessoa IS NOT NULL THEN 'cliente'
    END AS tipo_conta
FROM pessoa p
LEFT JOIN atendente a ON a.id_pessoa = p.id_pessoa
LEFT JOIN cliente c ON c.id_pessoa = p.id_pessoa
WHERE p.email = 'fernanda@email.com'
  AND p.senha = 'senha123';