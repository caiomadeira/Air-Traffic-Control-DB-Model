----------------------------------------------------------
----------------------------------------------------------
-- INICIO DA INSERÇÃO NAS TABELAS
----------------------------------------------------------
----------------------------------------------------------
----------------------
-- COMPANHIA AEREA
----------------------
-- CODIATA é o primeiro, CODICAO é o segundo
INSERT ALL
    INTO CompanhiaAerea VALUES('LAT', 'LAE', 'Latam', 'Brasil', 150, 107, TO_DATE('1976-01-01', 'YYYY-MM-DD'))
    INTO CompanhiaAerea VALUES ('G3', 'GLO', 'GOL', 'Brasil', 77, 144, TO_DATE('2001-01-15', 'YYYY-MM-DD'))
    INTO CompanhiaAerea VALUES('AD', 'AZU', 'AZUL', 'Brasil', 140, 160, TO_DATE('2008-01-04', 'YYYY-MM-DD'))
    -- Voapass possui dois codigo IATA (2Z & 7M) e dois codigos ICAO (PTB & PAM)
    INTO CompanhiaAerea VALUES('2Z', 'PTB', 'Voepass', 'Brasil', 47, 13, TO_DATE('1995-07-03', 'YYYY-MM-DD'))
SELECT 1 FROM DUAL;

----------------------
-- AVIOES
-- Nota: Os números de caudas são arbitrários
----------------------
INSERT ALL 
-- Latam
    INTO Aviao VALUES('29000', 'LAT', 'LAE', 'Boeing 747 VC-25A', 917.0, 'Militar')
    INTO Aviao VALUES('LA0001', 'LAT', 'LAE', 'Airbus A320', 840.0, 'Comercial')
-- Gol
    INTO Aviao VALUES('G3001', 'G3', 'GLO', 'Boeing 737-800', 823.0, 'Comercial')
    INTO Aviao VALUES('G3002', 'G3', 'GLO', 'Boeing 737-MAX', 839.0, 'Comercial')
-- Azul
    INTO Aviao VALUES('AD001', 'AD', 'AZU', 'Embraer E195', 829.0, 'Comercial')
    INTO Aviao VALUES('AD002', 'AD', 'AZU', 'ATR 72', 518.0, 'Comercial')
-- Voepass
    INTO Aviao VALUES('2Z001', '2Z', 'PTB', 'ATR 42', 556.0, 'Comercial')
    INTO Aviao VALUES('2Z002', '2Z', 'PTB', 'Cessna Caravan', 344.0, 'Comercial')
SELECT 1 FROM DUAL;

----------------------
-- CONTROLADOR DE VOO
----------------------
INSERT ALL
    INTO ControladordeVoo VALUES (1, 'Alan Turing', 'Setor A', 'Diurno', 1, 1, 'LAT', 'LAE', 12345, 67890)
    INTO ControladordeVoo VALUES (2, 'Ada Lovelace', 'Setor B', 'Noturno', 2, 2, 'G3', 'GLO', 22345, 77890)
    INTO ControladordeVoo VALUES (3, 'Benoit Mandelbrot', 'Setor C', 'Diurno', 3, 1, 'AD', 'AZU', 32345, 87890)
    INTO ControladordeVoo VALUES (4, 'Leonardo Da Vinci', 'Setor D', 'Noturno', 4, 2, 'ZZ', 'PTB', 42345, 97890)
SELECT 1 FROM DUAL;

----------------------
-- VOOS
----------------------
-- TO_DATE('2024-11-21', 'YYYY-MM-DD'))

INSERT ALL
    INTO Voo VALUES (1, 1, 'LAT', 'LAE', 'São Paulo', 'Rio de Janeiro', '29000', TO_DATE('2024-11-21', 'YYYY-MM-DD'))
    INTO Voo VALUES (2, 1, 'LAT', 'LAE', 'Porto Alegre', 'Rio de Janeiro', 'LA002', TO_DATE('2024-12-28', 'YYYY-MM-DD'))

    INTO Voo VALUES (3, 1, 'G3', 'GLO', 'Brasília', 'Salvador', 'G3001', TO_DATE('2024-11-22', 'YYYY-MM-DD'))
    INTO Voo VALUES (4, 2, 'G3', 'GLO', 'Manaus', 'Florianópolis', 'G3002', TO_DATE('2024-11-22', 'YYYY-MM-DD'))
    

    INTO Voo VALUES (5, 1, 'AD', 'AZU', 'Belo Horizonte', 'Fortaleza', 'AD001', TO_DATE('2025-08-06', 'YYYY-MM-DD'))
    INTO Voo VALUES (6, 1, 'AD', 'AZU', 'Belo Horizonte', 'Fortaleza', 'AD002', TO_DATE('2024-11-23', 'YYYY-MM-DD'))

    
    INTO Voo VALUES (7, 2, 'ZZ', 'PTB', 'Manaus', 'Belém', 'ZZ001', TO_DATE('2024-11-24', 'YYYY-MM-DD'))
    INTO Voo VALUES (8, 2, 'ZZ', 'PTB', 'Manaus', 'Belém', 'ZZ001', TO_DATE('2024-10-24', 'YYYY-MM-DD'))

SELECT 1 FROM DUAL;

----------------------
-- EVENTOS
----------------------
INSERT ALL
    INTO Evento VALUES (12345, 67890, TO_DATE('2024-11-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-11-21 15:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Evento VALUES (22345, 77890, TO_DATE('2024-11-22', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-11-22 16:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Evento VALUES (32345, 87890, TO_DATE('2024-11-23', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-11-23 17:45:00', 'YYYY-MM-DD HH24:MI:SS'))
SELECT 1 FROM DUAL;

----------------------
-- FCA (Flow Constraint Area)
----------------------
INSERT ALL
    INTO FCA VALUES (12345, 67890, 'FCA_Omega', 5, 1)
    INTO FCA VALUES (22345, 77890, 'FCA_Alfa', 3, 2)
    INTO FCA VALUES (32345, 87890, 'FCA_Delta', 4, 3)
SELECT 1 FROM DUAL;

----------------------
-- Informe
----------------------

INSERT ALL
    INTO Informe VALUES ('LAT', 'LAE', 1, 1)
    INTO Informe VALUES ('G3', 'GLO', 1, 2)
    INTO Informe VALUES ('AD', 'AZU', 0, 3)
SELECT 1 FROM DUAL;

----------------------
-- Rota
----------------------
INSERT ALL
    INTO Rota VALUES (1, TO_TIMESTAMP('2024-11-21 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '00 01:30:00' DAY TO SECOND)
    INTO Rota VALUES (2, TO_TIMESTAMP('2024-11-22 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '00 02:15:00' DAY TO SECOND)
SELECT 1 FROM DUAL;

----------------------
-- Alocacao
----------------------
INSERT ALL
    INTO Alocacao VALUES (1, 1, TO_TIMESTAMP('2024-11-21 11:30:00 -03:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), TO_TIMESTAMP('2024-11-21 13:30:00 -03:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 1, 1, 'LAT', 'LAE')
    INTO Alocacao VALUES (2, 2, TO_TIMESTAMP('2024-11-22 13:30:00 -03:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), TO_TIMESTAMP('2024-11-22 15:30:00 -03:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 2, 2, 'G3', 'GLO')
SELECT 1 FROM DUAL;
----------------------------------------------------------
----------------------------------------------------------
-- FIM DA INSERÇÃO NAS TABELAS
----------------------------------------------------------
----------------------------------------------------------