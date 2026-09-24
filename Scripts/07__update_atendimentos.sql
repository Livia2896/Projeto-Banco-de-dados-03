-- Muda alguns atendimentos para Trocas e Garantias

UPDATE atendimento
SET id_fila = 4
WHERE id_atendimento IN (7, 12, 18);