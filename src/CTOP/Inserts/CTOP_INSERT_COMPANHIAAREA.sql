-- Dado importante: Indicativo de chamada. DEF: É uma designação única de uma estação de transmissão de rádio. 

-- Formatar Datas usamos a função TO_DATE('VALUE DATE', 'FORMAT')
INSERT ALL
    INTO CompanhiaAerea VALUES('LAT', 'LAE', 'Latam', 'Brasil', 150, 107, TO_DATE('1976-01-01', 'YYYY-MM-DD'))
    INTO CompanhiaAerea VALUES ('G3', 'GLO', 'GOL', 'Brasil', 77, 144, TO_DATE('2001-01-15', 'YYYY-MM-DD'))
    INTO CompanhiaAerea VALUES('AD', 'AZU', 'AZUL', 'Brasil', 140, 160, TO_DATE('2008-01-04', 'YYYY-MM-DD'))
    -- Voapass possui dois codigo IATA (2Z & 7M) e dois codigos ICAO (PTB & PAM)
    INTO CompanhiaAerea VALUES('2Z', 'PTB', 'Voepass', 'Brasil', 47, 13, TO_DATE('1995-07-03', 'YYYY-MM-DD'))
SELECT 1 FROM DUAL
-- SELECT 1 FROM DUAL é necessário, pois o comando INSERT ALL precisa de um SELECT no final para indicar que a inserção é valida e deve ser executada
-- Em SQL, A tabela DUAL é uma tabela FICTICIA usada para consultas que precisam retornar um valor real mas não possuem tabelas reais pra consultar
-- o DUAL é apenas uma convensão do Oracle. Ela tem uma única linha e coluna, então SELECT 1 FROM DUAL retorna apenas um valor, 
-- o que é suficiente para que o Oracle execute o INSERT ALL.


