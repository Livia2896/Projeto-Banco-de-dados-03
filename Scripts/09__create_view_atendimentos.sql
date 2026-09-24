-- Cria uma VIEW para reunir as principais informações dos atendimentos

CREATE OR REPLACE VIEW vw_atendimentos_detalhados AS
SELECT
    a.id_atendimento,
    a.data_hora,
    p_atendente.nome AS atendente,
    f.nome AS fila,
    p_cliente.nome AS cliente
FROM atendimento a
JOIN atendente at
    ON a.id_atendente = at.id_pessoa
JOIN pessoa p_atendente
    ON at.id_pessoa = p_atendente.id_pessoa
JOIN fila f
    ON a.id_fila = f.id_fila
JOIN cliente c
    ON a.id_cliente = c.id_pessoa
JOIN pessoa p_cliente
    ON c.id_pessoa = p_cliente.id_pessoa;