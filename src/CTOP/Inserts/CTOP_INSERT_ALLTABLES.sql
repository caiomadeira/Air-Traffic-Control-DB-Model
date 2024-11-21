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
SELECT 1 FROM DUAL

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
    INTO Aviao VALUES('G3002', 'G3', 'GLO', 'Boeing 737-MAX', 839, 'Comercial')
-- Azul
    INTO Aviao VALUES('AD001', 'AD', 'AZU', 'Embraer E195', 829.0, 'Comercial')
    INTO Aviao VALUES('AD002', 'AD', 'AZU', 'ATR 72', 518.0, 'Comercial')
-- Voepass
    INTO Aviao VALUES('2Z001', '2Z', 'PTB', 'ATR 42', 556.0, 'Comercial')
    INTO Aviao VALUES('2Z002', '2Z', 'PTB', 'Cessna Caravan', 344.0, 'Comercial')
SELECT 1 FROM DUAL

----------------------
-- CONTROLADOR DE VOO
----------------------
INSERT ALL
    


SELECT 1 FROM DUAL