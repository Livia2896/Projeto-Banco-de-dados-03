-- Consulta os dados usados no dashboard.

-- Total de atendimentos
SELECT COUNT(*) AS total_atendimentos
FROM atendimento;


-- Atendimentos por atendente
SELECT
    p.nome AS atendente,
    COUNT(*) AS total_atendimentos
FROM atendimento a
JOIN atendente at
    ON a.id_atendente = at.id_pessoa
JOIN pessoa p
    ON at.id_pessoa = p.id_pessoa
GROUP BY p.nome;


-- Atendimentos por fila
SELECT
    f.nome AS fila,
    COUNT(*) AS total_atendimentos
FROM atendimento a
JOIN fila f
    ON a.id_fila = f.id_fila
GROUP BY f.nome;


-- Atendimentos por dia
SELECT
    DATE(data_hora) AS dia,
    COUNT(*) AS total_atendimentos
FROM atendimento
GROUP BY DATE(data_hora)
ORDER BY dia;


-- Atendimentos mais recentes
SELECT
    data_hora,
    cliente,
    atendente,
    fila
FROM vw_atendimentos_detalhados
ORDER BY data_hora DESC
LIMIT 3;