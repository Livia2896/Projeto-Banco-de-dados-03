-- Adiciona as relações necessárias entre atendentes e filas.

INSERT INTO atendente_fila (id_pessoa, id_fila)
VALUES
(1, 4),
(2, 3)
ON CONFLICT DO NOTHING;