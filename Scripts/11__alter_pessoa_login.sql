-- Adapta a tabela pessoa para suportar cadastro e login (cadastro.html / login.html)

ALTER TABLE pessoa ADD COLUMN senha VARCHAR(255);

UPDATE pessoa SET senha = 'alterar123' WHERE senha IS NULL;

ALTER TABLE pessoa ALTER COLUMN senha SET NOT NULL;

ALTER TABLE pessoa ALTER COLUMN email SET NOT NULL;
ALTER TABLE pessoa ADD CONSTRAINT uq_pessoa_email UNIQUE (email);

ALTER TABLE pessoa ALTER COLUMN cpf DROP NOT NULL;