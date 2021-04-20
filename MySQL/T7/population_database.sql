use CONDOMINIUM;
INSERT INTO PREDIO(Nome, Morada, Cidade, Codigo_postal, Latitude, Longitude, Area) VALUES
('Predio1', 'Travessa dos Cabanais', 'Vagos', '3840-460', 40.563032, -8.682822, 10000),
('Predio2', 'Rua da Alegria', 'Porto', '4000-032', 41.163334, -8.599512, 4000),
('Predio3', 'Travessa de Fonte Cova', 'São Mamede Este', '4715-490', 41.556370, -8.346001, 2000);

-- SELECT * FROM CONDOMINIUM.PREDIO

INSERT INTO FRACAO(Piso, Zona, ID_predio, quota, Area, Tipo) VALUES
(0, 'ESQ', 1, 10, 10.00, 'Estacionamento'),
(0, 'DIR', 1, 10, 10.00, 'Estacionamento'),
(1, 'ESQ', 1, 40, 160.00, 'Comercial'),
(1, 'DIR', 1, 40, 160.00, 'Comercial'),
(2, 'ESQ', 1, 30, 120.00, 'Habitação'),
(2, 'DIR', 1, 30, 120.00, 'Habitação'),
(3, 'ESQ', 1, 30, 120.00, 'Habitação'),
(3, 'DIR', 1, 30, 120.00, 'Habitação');

-- SELECT * FROM CONDOMINIUM.FRACAO

INSERT INTO PAGAMENTO_QUOTA(Data, Balanco, ID_Fracao) VALUES
('20170110', 30, 1),
('20170220', 30, 2),
('20170313', 40, 3),
('20170327', 40, 4);

-- SELECT * FROM CONDOMINIUM.PAGAMENTO_RENDA

INSERT INTO CONDOMINO (CC, Nome, NIF, e_mail) VALUES 
('12345678', 'Diogo Ferreira', '123456789', 'diogodanielsoaresferreira@ua.pt'),
('87654321', 'Leonardo Oliveira', '987654321', 'leonardooliveira@ua.pt'),
('34594949', 'Pedro Marques', '538838456', 'pedrocas98@ua.pt'),
('38596842', 'Ana Castro', '100492135', 'castro.ana6@ua.pt');

-- SELECT * FROM CONDOMINIUM.CONDOMINO

INSERT INTO COMPRA (ID_Fracao, CC_Condomino, Data_Compra) VALUES
(1, '12345678', '20151202'),
(2, '87654321', '20151003'),
(3, '34594949', '20160607'),
(4, '38596842', '20170104');

-- SELECT * FROM CONDOMINIUM.COMPRA

INSERT INTO SUJEITO_FISCAL (NIF, Nome, e_mail, Morada) VALUES
(500069824, 'OTIS', 'servico1@otis.com', 'Estrada de Mem Martins, nº 7, 2725-109 Mem Martins'),
(294857375, 'Tintas Frescas & Lda.', 'apoio@tintasfrescas.com', 'Rua do Carvão, nº 234, 3800-504 Aveiro'),
(508771935, 'Águas da Região de Aveiro, S.A.', 'adra@adra.pt', 'Travessa Rua da Paz, nº 4, 3800-587 Cacia, Aveiro');

-- SELECT * FROM CONDOMINIUM.SUJEITO_FISCAL

INSERT INTO OUTROS_PAGAMENTOS (ID_Predio, Data, Balanco, Descricao, suj_fiscal_nif) VALUES
(1, '20161110', -980,'Reparação do elevador', 500069824),
(3, '20170102', -15,'Água do Condomínio', 508771935);

-- SELECT * FROM CONDOMINIUM.OUTROS_PAGAMENTOS

INSERT INTO REUNIAO ( ID_Predio, Data, Titulo, Descricao, Ata) VALUES
(1, '20170303', 'Reunião de Ano Novo', 'Reunião Anual para fazer um balanço do ano transato', 'Aos três dias do mês de Março do ano de 2017...');

-- SELECT * FROM CONDOMINIUM.REUNIAO

INSERT INTO CONDOMINO_PARTICIPA_REUNIAO (ID_Reuniao, ID_Predio, CC) VALUES
(1, 1, 12345678),
(1, 1, 87654321),
(1, 1, 38596842);

-- SELECT * FROM CONDOMINIUM.CONDOMINO_PARTICIPA_REUNIAO

-- Soma do dinheiro recebido de todas as rendas
SELECT sum(Balanco)
FROM PAGAMENTO_RENDA;

-- Obter todas as compras efetuadas por um condómino
SELECT ID
FROM COMPRA JOIN CONDOMINO ON CC_Condomino=CC
WHERE CC='12345678';