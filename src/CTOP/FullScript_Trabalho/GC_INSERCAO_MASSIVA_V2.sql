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
----------------------------------------------------------