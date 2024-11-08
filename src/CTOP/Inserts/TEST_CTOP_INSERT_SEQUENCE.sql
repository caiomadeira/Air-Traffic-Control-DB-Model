-- criando a sequencia 
CREATE SEQUENCE seq1
START WITH 1
INCREMENT BY 1;

-- Exclui o gatilho existente
DROP TRIGGER assinala_chave;


insert into CompanhiaAerea values('TEST', 'TEST', 'Teste', 'EUA', NULL, NULL, TO_DATE('1970-01-01', 'YYYY-MM-DD'));
select * from CompanhiaAerea;

-- Criando um gatilho
CREATE TRIGGER assinala_chave BEFORE INSERT ON CompanhiaAerea FOR EACH ROW
BEGIN
    :new.NUMERO_ROTAS := seq1.nextval;
END;


