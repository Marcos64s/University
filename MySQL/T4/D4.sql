use p1g1;

go;
CREATE SCHEMA SISTEMA_MEDICAMENTOS;
go;

CREATE TABLE SISTEMA_MEDICAMENTOS.MEDICO (
    n_medico        INT,
    especialidade   VARCHAR(30),
    nome            VARCHAR(30) NOT NULL,
    PRIMARY KEY(n_medico)
);

CREATE TABLE SISTEMA_MEDICAMENTOS.PACIENTE (
    n_utente        INT,
    nome            VARCHAR(30) NOT NULL,
    endereco        VARCHAR(30),
    data_nasc       DATE NOT NULL,
    PRIMARY KEY(n_utente)
);

CREATE TABLE SISTEMA_MEDICAMENTOS.FARMACIA (
    nome            VARCHAR(30) NOT NULL,
    endereco        VARCHAR(30) NOT NULL,
    telefone        VARCHAR(9),
    PRIMARY KEY(nome)
);

CREATE TABLE SISTEMA_MEDICAMENTOS.PRESCRICAO (
    n_prescricao    INT,
    n_medico        INT,
    n_utente        INT,
    data_presc      DATE NOT NULL,
    n_farmacia      VARCHAR(30),
    PRIMARY KEY(n_prescricao),
    FOREIGN KEY(n_medico) REFERENCES SISTEMA_MEDICAMENTOS.MEDICO(n_medico),
    FOREIGN KEY(n_utente) REFERENCES SISTEMA_MEDICAMENTOS.PACIENTE(n_utente),
    FOREIGN KEY(n_farmacia) REFERENCES SISTEMA_MEDICAMENTOS.FARMACIA(nome)
);

CREATE TABLE SISTEMA_MEDICAMENTOS.COMP_FARM (
    n_registo       INT,
    nome            VARCHAR(30) NOT NULL,
    endereco        VARCHAR(30) NOT NULL,
    PRIMARY KEY(n_registo),
);

CREATE TABLE SISTEMA_MEDICAMENTOS.FARMACO (
    n_registo       INT,
    nome_comercial  INT NOT NULL,
    formula         VARCHAR(30),
    PRIMARY KEY(n_registo, nome_comercial),
    FOREIGN KEY(nome_comercial) REFERENCES SISTEMA_MEDICAMENTOS.COMP_FARM(n_registo)
);

CREATE TABLE SISTEMA_MEDICAMENTOS.CONTEM (
    n_prescricao    INT,
    n_registo       INT,
    nome_comercial  INT,
    PRIMARY KEY(n_prescricao, n_registo, nome_comercial),
    FOREIGN KEY(n_registo, nome_comercial) REFERENCES SISTEMA_MEDICAMENTOS.FARMACO(n_registo, nome_comercial)
);