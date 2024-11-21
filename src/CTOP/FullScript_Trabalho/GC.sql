----------------------------------------------------------
----------------------------------------------------------
-- Caio César Madeira Mattoso de Souza(24280006)
-- <Nome 2> (<Matricula 2>)
-- <Nome 3> (<Matricula 3>)
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
-- CRIAÇÃO DAS TABELAS
----------------------------------------------------------
----------------------------------------------------------

CREATE TABLE Aviao (
 numero_cauda VARCHAR(10) NOT NULL,
 codIATA CHAR(3) NOT NULL,
 codICAO CHAR(3) NOT NULL,
 modelo VARCHAR(10),
 velocidade_media DOUBLE PRECISION NOT NULL,
 tipo VARCHAR(10)
);

ALTER TABLE Aviao ADD CONSTRAINT PK_Aviao PRIMARY KEY (numero_cauda,codIATA,codICAO);


CREATE TABLE CompanhiaAerea (
 codIATA CHAR(3) NOT NULL,
 codICAO CHAR(3) NOT NULL,
 nome VARCHAR(10) NOT NULL,
 pais_origem VARCHAR(10) NOT NULL,
 numero_rotas INT NOT NULL,
 numero_aeronaves INT NOT NULL,
 data_fundacao DATE
);

ALTER TABLE CompanhiaAerea ADD CONSTRAINT PK_CompanhiaAerea PRIMARY KEY (codIATA,codICAO);


CREATE TABLE ControladordeVoo (
 id_controlador INT NOT NULL,
 nome VARCHAR(40),
 setor VARCHAR(10),
 turno VARCHAR(10),
 id_voo INT NOT NULL,
 prioridade INT NOT NULL,
 codIATA CHAR(3) NOT NULL,
 codICAO CHAR(3) NOT NULL,
 latitude_evento NUMBER(10) NOT NULL,
 longitude_evento NUMBER(10) NOT NULL
);

ALTER TABLE ControladordeVoo ADD CONSTRAINT PK_ControladordeVoo PRIMARY KEY (id_controlador);


CREATE TABLE Evento (
 latitude_evento NUMBER(10) NOT NULL,
 longitude_evento NUMBER(10) NOT NULL,
 inicio DATE,
 previsao_tempo TIMESTAMP
);

ALTER TABLE Evento ADD CONSTRAINT PK_Evento PRIMARY KEY (latitude_evento,longitude_evento);


CREATE TABLE FCA (
 latitude_FCA NUMBER(10) NOT NULL,
 longitude_FCA NUMBER(10) NOT NULL,
 nome VARCHAR(10) NOT NULL,
 qtd_voos_permitidos INT NOT NULL,
 id_controlador INT
);

ALTER TABLE FCA ADD CONSTRAINT PK_FCA PRIMARY KEY (latitude_FCA,longitude_FCA);


CREATE TABLE Informe (
 codIATA CHAR(3) NOT NULL,
 codICAO CHAR(3) NOT NULL,
 rota_deferida NUMBER(1) NOT NULL,
 id_controlador INT
);

ALTER TABLE Informe ADD CONSTRAINT PK_Informe PRIMARY KEY (codIATA,codICAO);


CREATE TABLE Voo (
 id_voo INT NOT NULL,
 prioridade INT NOT NULL,
 codIATA CHAR(3) NOT NULL,
 codICAO CHAR(3) NOT NULL,
 origem VARCHAR(10) NOT NULL,
 destino VARCHAR(10) NOT NULL,
 numero_cauda VARCHAR(10),
 data_voo CHAR(10)
);

ALTER TABLE Voo ADD CONSTRAINT PK_Voo PRIMARY KEY (id_voo,prioridade,codIATA,codICAO);


CREATE TABLE Rota (
 id_rota INT NOT NULL,
 horario_disponibilidade TIMESTAMP WITH TIME ZONE NOT NULL,
 -- Usando interval
 atraso INTERVAL DAY TO SECOND NOT NULL 
);

ALTER TABLE Rota ADD CONSTRAINT PK_Rota PRIMARY KEY (id_rota);


CREATE TABLE Alocacao (
 id_rota INT NOT NULL,
 id_controlador INT NOT NULL,
 horario_chegada TIMESTAMP WITH TIME ZONE NOT NULL,
 horario_partida TIMESTAMP WITH TIME ZONE NOT NULL,
 id_voo INT,
 prioridade INT,
 codIATA CHAR(3),
 codICAO CHAR(3)
);


-- Adição da chave estrangeira para cada tabela
ALTER TABLE Alocacao ADD CONSTRAINT PK_Alocacao PRIMARY KEY (id_rota,id_controlador);


ALTER TABLE Aviao ADD CONSTRAINT FK_Aviao_0 FOREIGN KEY (codIATA,codICAO) REFERENCES CompanhiaAerea (codIATA,codICAO);


ALTER TABLE ControladordeVoo ADD CONSTRAINT FK_ControladordeVoo_0 FOREIGN KEY (id_voo,prioridade,codIATA,codICAO) REFERENCES Voo (id_voo,prioridade,codIATA,codICAO);
ALTER TABLE ControladordeVoo ADD CONSTRAINT FK_ControladordeVoo_1 FOREIGN KEY (latitude_evento,longitude_evento) REFERENCES Evento (latitude_evento,longitude_evento);


ALTER TABLE FCA ADD CONSTRAINT FK_FCA_0 FOREIGN KEY (id_controlador) REFERENCES ControladordeVoo (id_controlador);


ALTER TABLE Informe ADD CONSTRAINT FK_Informe_0 FOREIGN KEY (codIATA,codICAO) REFERENCES CompanhiaAerea (codIATA,codICAO);
ALTER TABLE Informe ADD CONSTRAINT FK_Informe_1 FOREIGN KEY (id_controlador) REFERENCES ControladordeVoo (id_controlador);


ALTER TABLE Voo ADD CONSTRAINT FK_Voo_0 FOREIGN KEY (codIATA,codICAO) REFERENCES CompanhiaAerea (codIATA,codICAO);
ALTER TABLE Voo ADD CONSTRAINT FK_Voo_1 FOREIGN KEY (numero_cauda,codIATA,codICAO) REFERENCES Aviao (numero_cauda,codIATA,codICAO);


ALTER TABLE Alocacao ADD CONSTRAINT FK_Alocacao_0 FOREIGN KEY (id_rota) REFERENCES Rota (id_rota);
ALTER TABLE Alocacao ADD CONSTRAINT FK_Alocacao_1 FOREIGN KEY (id_controlador) REFERENCES ControladordeVoo (id_controlador);
ALTER TABLE Alocacao ADD CONSTRAINT FK_Alocacao_2 FOREIGN KEY (id_voo,prioridade,codIATA,codICAO) REFERENCES Voo (id_voo,prioridade,codIATA,codICAO);
----------------------------------------------------------
----------------------------------------------------------
-- FIM DA CRIAÇÃO DAS TABELAS
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
-- INICIO DA INSERÇÃO NAS TABELAS
----------------------------------------------------------

-- COMPANHIA AÉREA
INSERT ALL
    INTO CompanhiaAerea VALUES ('LAT', 'LAE', 'Latam', 'Brasil', 150, 107, TO_DATE('1976-01-01', 'YYYY-MM-DD'))
    INTO CompanhiaAerea VALUES ('G3', 'GLO', 'GOL', 'Brasil', 77, 144, TO_DATE('2001-01-15', 'YYYY-MM-DD'))
    INTO CompanhiaAerea VALUES ('AD', 'AZU', 'AZUL', 'Brasil', 140, 160, TO_DATE('2008-01-04', 'YYYY-MM-DD'))
    INTO CompanhiaAerea VALUES ('2Z', 'PTB', 'Voepass', 'Brasil', 47, 13, TO_DATE('1995-07-03', 'YYYY-MM-DD'))
SELECT 1 FROM DUAL;


-- AVIÃO
INSERT ALL
    INTO Aviao VALUES ('29000', 'LAT', 'LAE', '747VC-25A', 917.0, 'Militar')
    INTO Aviao VALUES ('LA0001', 'LAT', 'LAE', 'AirA320', 840.0, 'Comercial')
    INTO Aviao VALUES ('G3001', 'G3', 'GLO', '737-800', 823.0, 'Comercial')
    INTO Aviao VALUES ('G3002', 'G3', 'GLO', '737-MAX', 839.0, 'Comercial')
    INTO Aviao VALUES ('AD001', 'AD', 'AZU', 'EmbrE195', 829.0, 'Comercial')
    INTO Aviao VALUES ('AD002', 'AD', 'AZU', 'ATR72', 518.0, 'Comercial')
    INTO Aviao VALUES ('2Z001', '2Z', 'PTB', 'ATR42', 556.0, 'Comercial')
    INTO Aviao VALUES ('2Z002', '2Z', 'PTB', 'Cessna', 344.0, 'Comercial')
SELECT 1 FROM DUAL;

-- VOO
INSERT ALL
    INTO Voo VALUES (1, 1, 'LAT', 'LAE', 'SP', 'EJ', '29000', TO_DATE('2024-11-21', 'YYYY-MM-DD'))
    INTO Voo VALUES (2, 1, 'LAT', 'LAE', 'POA', 'RJ', 'LA0001', TO_DATE('2024-12-28', 'YYYY-MM-DD'))
    INTO Voo VALUES (3, 1, 'G3', 'GLO', 'AM', 'BH', 'G3001', TO_DATE('2024-11-22', 'YYYY-MM-DD'))
    INTO Voo VALUES (4, 2, 'G3', 'GLO', 'CE', 'ES', 'G3002', TO_DATE('2024-11-22', 'YYYY-MM-DD'))
    INTO Voo VALUES (5, 1, 'AD', 'AZU', 'SP', 'CE', 'AD001', TO_DATE('2025-08-06', 'YYYY-MM-DD'))
    INTO Voo VALUES (6, 1, 'AD', 'AZU', 'POA', 'SP', 'AD002', TO_DATE('2024-11-23', 'YYYY-MM-DD'))
SELECT 1 FROM DUAL;


-- EVENTO
INSERT ALL
    INTO Evento VALUES (12345, 67890, TO_DATE('2024-11-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-11-21 15:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Evento VALUES (22345, 77890, TO_DATE('2024-11-22', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-11-22 16:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Evento VALUES (32345, 87890, TO_DATE('2024-11-23', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-11-23 17:45:00', 'YYYY-MM-DD HH24:MI:SS'))
SELECT 1 FROM DUAL;

-- ROTA
INSERT ALL
    INTO Rota VALUES (1, TO_TIMESTAMP('2024-11-21 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '01:30:00' HOUR TO SECOND)
    INTO Rota VALUES (2, TO_TIMESTAMP('2024-11-22 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '02:15:00' HOUR TO SECOND)
SELECT 1 FROM DUAL;

-- Controlador de Voo
-- Controlador de Voo (ID_controlador, nome, setor, turno, id_voo, prioridade, codIATA, codICAO, latitude_evento, longitude_evento
INSERT ALL
      INTO ControladordeVoo VALUES (1, 'Alan Turing', 'Setor A', 'Diurno', 1, 1, 'LAT', 'LAE', 12345, 67890)
      INTO ControladordeVoo VALUES (2, 'Ada Lovelace', 'Setor B', 'Noturno', 3, 1, 'G3', 'GLO', 22345, 77890)
SELECT 1 FROM DUAL;


-- FCA (Flow Constraint Area)
-- FCA (latitude_FCA, longitude_FCA, nome, qtd_voos_permitidos, id_controlador(FK))
INSERT ALL
    INTO FCA VALUES (12345, 67890, 'FCA_Omega', 5, 1)
    INTO FCA VALUES (22345, 77890, 'FCA_Alfa', 3, 2)
    INTO FCA VALUES (32345, 87890, 'FCA_Delta', 4, 2)
SELECT 1 FROM DUAL;

-- INFORME
INSERT ALL
    INTO Informe VALUES ('LAT', 'LAE', 1, 1)
    INTO Informe VALUES ('G3', 'GLO', 1, 2)
    INTO Informe VALUES ('AD', 'AZU', 0, 2)
SELECT 1 FROM DUAL;


-- ALOCAÇÃO
INSERT ALL
    INTO Alocacao VALUES (1, 1, TO_TIMESTAMP('2024-11-21 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-11-21 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, 'LAT', 'LAE')
    INTO Alocacao VALUES (2, 2, TO_TIMESTAMP('2024-11-22 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-11-22 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 1, 'G3', 'GLO')
SELECT 1 FROM DUAL;


----------------------------------------------------------
-- FIM DA INSERÇÃO NAS TABELAS
---------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
-- JUNÇÃO DE TABELAS COM FILTROS E ORDENAÇÃO:

-- Consulta 1:
--  • Junção de pelo menos 2 tabelas
--  • Seleções PARA CADA UMA das tabelas;
--   - Filtrar registros em TODAS as tabelas;
--   - Seleção sobre colunas que não pertençam às chaves primárias
--  das tabelas;
--  - Seleção por DESIGUALDADE (outros operadores do que a
--  igualdade (=)) em pelo menos 1 filtro;
--  • Ordenar a saída; definir o critério de ordenação.
----------------------------------------------------------
----------------------------------------------------------
-- Explicação: Aqui obtemos informações sobre voos e os controlados que estão
-- associados a eles levando em conta apenas voos que ocorreram após
-- 2024-11-20. Como resultado, a consulta retorna o nome do controlador, o numero
-- de cauda do avião, o modelo do avião e o destino do voo, ordenados pelo
-- nome do controlador.
SELECT c.nome AS nome_controlador, v.numero_cauda, av.modelo, v.destino
FROM ControladordeVoo c 
JOIN Voo v ON c.id_voo = v.id_voo AND c.codIATA = v.codIATA AND c.codICAO = v.codICAO
JOIN Aviao av ON v.numero_cauda = av.numero_cauda
WHERE v.data_voo > '2024-11-20' ORDER BY c.nome;
----------------------------------------------------------
----------------------------------------------------------
-- CONSULTA 2: SUBCONSULTA C/ FUNCÃO DE ATRASO
-- Consulta 2:
 -- • Consulta com sub-consulta;
-- • Sub-consulta retorna pelo menos 1 valor por função de agregação;
--- Função de agregação na sub-consulta. 
----------------------------------------------------------
----------------------------------------------------------
-- AQui exibimos os voos que possuem o atraso maior que
-- a média dos atrasos de todas as rotas registradas, mostrando
-- o ID do voo, o atraso e o horário de disponibilidade da rota.
-- Explicação do Extract: Recebemos o erro ao tentar comparar INTERVAL com NUMERIC
-- Para isso pesquisamos soluções de como converter um tipo de dado para outro formato
-- A solução escolhida foi o uso do EXTRACT
SELECT 
    v.id_voo, 
    r.atraso, 
    r.horario_disponibilidade
FROM 
    Rota r 
JOIN 
    Alocacao aloc ON r.id_rota = aloc.id_rota
JOIN 
    Voo v ON aloc.id_voo = v.id_voo
WHERE
--O EXTRACT( DAY FROM r.atraso) Extrai o numero de dias do intervalo e converte para minutos utilizando do calculo basico do produto 24 * 60
-- Já o EXTRACT(HOUR FROM ...) e EXTRACT(MINUTES FROM ...) extraem as horas e minutos do intervalo de atraso
EXTRACT(DAY FROM r.atraso) * 24 * 60 * EXTRACT(HOUR FROM r.atraso) * 60 + EXTRACT(MINUTE FROM r.atraso) >
( SELECT AVG(EXTRACT(DAY FROM r2.atraso) * 24 * 60 * EXTRACT(HOUR FROM r2.atraso) * 60 * EXTRACT(MINUTE FROM r2.atraso)) FROM Rota r2)


