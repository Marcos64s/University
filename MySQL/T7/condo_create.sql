CREATE DATABASE CONDOMINIUM;


CREATE TABLE PREDIO (
	ID int IDENTITY(1,1),
	Nome varchar(50) NOT NULL,
	Morada varchar(100),
	Cidade varchar(25),
	Codigo_Postal char(8),
	Latitude decimal(12,9) NOT NULL,
	Longitude decimal(12,9) NOT NULL,
	Area decimal(8,2),
	PRIMARY KEY(ID),
	CHECK(Area >= 0),
	CHECK(Latitude <= 90 AND Latitude >= -90),
	CHECK(Longitude <= 180 AND Longitude >= -180)
);

CREATE TABLE FOTOS_PREDIO (
	ID int,
	Localizacao_ficheiro varchar(100),
	PRIMARY KEY(ID, Localizacao_ficheiro),
	FOREIGN KEY (ID) REFERENCES PREDIO(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MATERIAL (
	Nome varchar(50),
	ID_Predio int,
	[Local] varchar(25),
	Quantidade int,
	PRIMARY KEY(Nome, ID_Predio),
	FOREIGN KEY (ID_Predio) REFERENCES PREDIO(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ORCAMENTO (
	ID int IDENTITY(1,1),
	Titulo varchar(25) NOT NULL,
	Descricao varchar(100),
	Data_Inicial date NOT NULL,
	Data_Final date NOT NULL,
	ID_Predio int,
	PRIMARY KEY(ID),
	FOREIGN KEY (ID_Predio) REFERENCES PREDIO(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ITEM (
	nome varchar(50),
	orcamento_ID int,
	balanco DECIMAL(19,2) NOT NULL,
	PRIMARY KEY(nome, orcamento_ID),
	FOREIGN KEY(orcamento_ID) REFERENCES ORCAMENTO(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE FRACAO (
	ID int IDENTITY(1,1),
	Piso int,
	Zona varchar(15),
	Quota DECIMAL(19,2),
	Area DECIMAL(8,2) NOT NULL,
	Tipo Varchar(25) NOT NULL,
	ID_Predio int,
	PRIMARY KEY(ID),
	FOREIGN KEY (ID_Predio) REFERENCES PREDIO(ID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CHECK (Area>=0),
	CHECK (Quota>=0)
);

CREATE TABLE FOTO_FRACAO (
	ID_Fracao int,
	Localizacao_ficheiro varchar(100),
	PRIMARY KEY(ID_Fracao, Localizacao_ficheiro),
	FOREIGN KEY(ID_Fracao) REFERENCES FRACAO(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PAGAMENTO_QUOTA (
	ID int IDENTITY(1,1),
	Data date NOT NULL,
	Balanco DECIMAL(19,2) NOT NULL,
	ID_Fracao int,
	PRIMARY KEY(ID),
	FOREIGN KEY(ID_Fracao) REFERENCES FRACAO(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DOCUMENTO_QUOTA (
	ID int,
	Localizacao_ficheiro varchar(100),
	PRIMARY KEY(ID, Localizacao_ficheiro),
	FOREIGN KEY (ID) REFERENCES PAGAMENTO_QUOTA(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE SUJEITO_FISCAL (
	NIF char(9),
	Nome varchar(50) NOT NULL,
	e_mail varchar(50),
	Morada varchar(100),
	PRIMARY KEY(NIF)
);

CREATE TABLE OUTROS_PAGAMENTOS (
	ID int IDENTITY(1,1),
	Data date NOT NULL,
	Balanco DECIMAL(19,2) NOT NULL,
	Descricao varchar(100),
	suj_fiscal_nif char(9) NOT NULL,
	ID_Predio int,
	PRIMARY KEY(ID),
	FOREIGN KEY (ID_Predio) REFERENCES PREDIO(ID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (suj_fiscal_nif) REFERENCES SUJEITO_FISCAL(NIF)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DOCUMENTO_OUTROS_PAGAMENTOS (
	ID int,
	Localizacao_ficheiro varchar(100),
	PRIMARY KEY(ID, Localizacao_ficheiro),
	FOREIGN KEY(ID) REFERENCES OUTROS_PAGAMENTOS(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CONDOMINO(
	CC char(8),
	Nome varchar(50) NOT NULL,
	NIF char(9) NOT NULL,
	e_mail varchar(50),
	PRIMARY KEY(CC),
	UNIQUE(NIF),
	UNIQUE(e_mail)
);

CREATE TABLE COMPRA (
	ID int IDENTITY(1,1),
	ID_Fracao int,
	CC_Condomino char(8),
	Data_compra date NOT NULL,
	Data_venda date,
	PRIMARY KEY(ID, ID_Fracao, CC_Condomino),
	FOREIGN KEY(ID_Fracao) REFERENCES FRACAO(ID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (CC_Condomino) REFERENCES CONDOMINO(CC)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CHECK(Data_venda>Data_Compra OR DATA_venda IS NULL)
);


CREATE TABLE REUNIAO (
	ID int IDENTITY(1,1),
	ID_Predio int,
	Data date NOT NULL,
	Titulo varchar(25) NOT NULL,
	Descricao varchar(100),
	Ata varchar(1000),
	PRIMARY KEY(ID, ID_Predio),
	FOREIGN KEY (ID_Predio) REFERENCES PREDIO(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE NOTA (
	ID int IDENTITY(1,1),
	ID_Predio int,
	Data date NOT NULL,
	Titulo varchar(25) NOT NULL,
	Descricao varchar(100),
	PRIMARY KEY(ID, ID_Predio),
	FOREIGN KEY (ID_Predio) REFERENCES PREDIO(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE AVISO (
	ID int IDENTITY(1,1),
	ID_Predio int,
	Data date NOT NULL,
	Titulo varchar(25) NOT NULL,
	Descricao varchar(100),
	PRIMARY KEY(ID, ID_Predio),
	FOREIGN KEY (ID_Predio) REFERENCES PREDIO(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MANUTENCAO (
	ID int IDENTITY(1,1),
	ID_Predio int,
	Data date NOT NULL,
	Titulo varchar(25) NOT NULL,
	Descricao varchar(100),
	tipo varchar(25),
	Id_Outros_Pagamentos int,
	PRIMARY KEY(ID, ID_Predio),
	FOREIGN KEY (Id_Outros_Pagamentos) REFERENCES OUTROS_PAGAMENTOS(ID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (ID_Predio) REFERENCES PREDIO(ID)
);

CREATE TABLE DOCUMENTO_REUNIAO (
	ID_Reuniao int,
	ID_Predio int,
	Localizacao varchar(100),
	PRIMARY KEY(ID_Reuniao, ID_Predio, Localizacao),
	FOREIGN KEY (ID_Reuniao, ID_Predio) REFERENCES REUNIAO(ID, ID_Predio)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DOCUMENTO_AVISO (
	ID_Aviso int,
	ID_Predio int,
	Localizacao varchar(100),
	PRIMARY KEY(ID_Aviso, ID_Predio, Localizacao),
	FOREIGN KEY (ID_Aviso, ID_Predio) REFERENCES AVISO(ID, ID_Predio)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DOCUMENTO_NOTAS (
	ID_Nota int,
	ID_Predio int,
	Localizacao varchar(100),
	PRIMARY KEY(ID_Nota, ID_Predio, Localizacao),
	FOREIGN KEY (ID_Nota, ID_Predio) REFERENCES NOTA(ID, ID_Predio)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DOCUMENTO_MANUTENCAO (
	ID_Manutencao int,
	ID_Predio int,
	Localizacao varchar(100),
	PRIMARY KEY(ID_Manutencao, ID_Predio, Localizacao),
	FOREIGN KEY (ID_Manutencao, ID_Predio) REFERENCES MANUTENCAO(ID, ID_Predio)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CONDOMINO_PARTICIPA_REUNIAO (
	ID_Reuniao int,
	ID_Predio int,
	CC char(8),
	PRIMARY KEY(ID_Reuniao, ID_Predio, CC),
	FOREIGN KEY (ID_Reuniao, ID_Predio) REFERENCES REUNIAO(ID, ID_Predio)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (CC) REFERENCES CONDOMINO(CC)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CONDOMINO_RECEBE_AVISO (
	ID_Aviso int,
	ID_Predio int,
	CC char(8),
	PRIMARY KEY(ID_Aviso, ID_Predio, CC),
	FOREIGN KEY (ID_Aviso, ID_Predio) REFERENCES AVISO(ID, ID_Predio)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (CC) REFERENCES CONDOMINO(CC)
	ON DELETE CASCADE ON UPDATE CASCADE
);