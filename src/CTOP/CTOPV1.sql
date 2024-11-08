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


