CREATE TABLE IF NOT EXISTS pessoa (
    id_pessoa SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS atendente (
    id_pessoa INTEGER PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    CONSTRAINT fk_atendente_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoa(id_pessoa)
);

CREATE TABLE IF NOT EXISTS cliente (
    id_pessoa INTEGER PRIMARY KEY,
    CONSTRAINT fk_cliente_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoa(id_pessoa)
);

CREATE TABLE IF NOT EXISTS fila (
    id_fila SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS atendente_fila (
    id_pessoa INTEGER NOT NULL,
    id_fila INTEGER NOT NULL,
    PRIMARY KEY (id_pessoa, id_fila),
    CONSTRAINT fk_atendente_fila_atendente
        FOREIGN KEY (id_pessoa)
        REFERENCES atendente(id_pessoa),
    CONSTRAINT fk_atendente_fila_fila
        FOREIGN KEY (id_fila)
        REFERENCES fila(id_fila)
);

CREATE TABLE IF NOT EXISTS atendimento (
    id_atendimento SERIAL PRIMARY KEY,
    data_hora TIMESTAMP NOT NULL,
    id_fila INTEGER NOT NULL,
    id_atendente INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    CONSTRAINT fk_atendimento_fila
        FOREIGN KEY (id_fila)
        REFERENCES fila(id_fila),
    CONSTRAINT fk_atendimento_atendente
        FOREIGN KEY (id_atendente)
        REFERENCES atendente(id_pessoa),
    CONSTRAINT fk_atendimento_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_pessoa)
);
