-- Adapta as filas para a loja e cria Trocas e Garantias

UPDATE fila
SET nome = 'Vendas',
    descricao = 'Atendimento para dúvidas e compras de equipamentos'
WHERE id_fila = 1;

UPDATE fila
SET nome = 'Suporte Técnico',
    descricao = 'Atendimento para problemas técnicos em equipamentos'
WHERE id_fila = 2;

UPDATE fila
SET nome = 'Financeiro',
    descricao = 'Atendimento relacionado a pagamentos e questões financeiras'
WHERE id_fila = 3;

INSERT INTO fila (nome, descricao)
VALUES (
    'Trocas e Garantias',
    'Atendimento para trocas, devoluções e garantia de produtos'
);