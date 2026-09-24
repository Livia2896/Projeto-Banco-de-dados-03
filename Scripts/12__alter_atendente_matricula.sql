-- O formulário de cadastro (cadastro.html) não pede matrícula.

ALTER TABLE atendente ALTER COLUMN matricula DROP NOT NULL;