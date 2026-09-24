INSERT INTO pessoa (nome, cpf, telefone, email) VALUES 
('Ana Souza', '11111111111', '69999990001', 'ana@email.com'), 
('Bruno Lima', '22222222222', '69999990002', 'bruno@email.com'), 
('Carla Mendes', '33333333333', '69999990003', 'carla@email.com'), 
('Diego Santos', '44444444444', '69999990004', 'diego@email.com'), 
('Eduarda Alves', '55555555555', '69999990005', 'eduarda@email.com'); 
 
INSERT INTO atendente (id_pessoa, matricula) VALUES 
(1, 'AT001'), 
(2, 'AT002'); 
 
INSERT INTO cliente (id_pessoa) VALUES 
(1), 
(3), 
(4), 
(5); 
 
INSERT INTO fila (nome, descricao) VALUES 
('Atendimento Geral', 'Atendimento para dúvidas e solicitações gerais'), 
('Suporte Técnico', 'Atendimento para problemas técnicos'), 
('Financeiro', 'Atendimento relacionado a questões financeiras'); 
 
INSERT INTO atendente_fila (id_pessoa, id_fila) VALUES 
(1, 1), 
(1, 2), 
(2, 1), 
(2, 3); 
 
INSERT INTO atendimento (data_hora, id_fila, id_atendente, id_cliente) VALUES 
('2026-09-01 08:30:00', 1, 1, 3), 
('2026-09-01 09:15:00', 2, 1, 4), 
('2026-09-01 10:00:00', 1, 2, 5), 
('2026-09-01 11:20:00', 3, 2, 1), 
('2026-09-02 08:45:00', 1, 1, 3);