CREATE SCHEMA [GESTAO_STOCKS];
go

CREATE TABLE GESTAO_STOCKS.PRODUTO (
	codigo				CHAR(9),
	preco				MONEY,
	iva					NUMERIC(3,2) DEFAULT 0,
	nome				VARCHAR(30) NOT NULL,
	PRIMARY KEY(codigo),
	CHECK(preco >= 0)
);

CREATE TABLE GESTAO_STOCKS.TIPO_FORNECEDOR (
	codigo				CHAR(9),
	designacao			VARCHAR(9) NOT NULL,
	PRIMARY KEY(CODIGO),
);

CREATE TABLE GESTAO_STOCKS.FORNECEDOR(
	nif						CHAR(9),
	nome					VARCHAR(30),
	fax						CHAR(9),
	endereco				VARCHAR(30),
	pagamento				MONEY,
	codigo_fornecedor		CHAR(9) NOT NULL,
	PRIMARY KEY(nif),
	UNIQUE(nome),
	FOREIGN KEY(codigo_fornecedor) REFERENCES GESTAO_STOCKS.TIPO_FORNECEDOR(codigo)
);

CREATE TABLE GESTAO_STOCKS.ENCOMENDA(
	num_encomenda	INT,
	data			DATE NOT NULL,
	nif_fornecedor		CHAR(9) NOT NULL,
	PRIMARY KEY(num_encomenda),
	FOREIGN KEY(nif_fornecedor) REFERENCES GESTAO_STOCKS.FORNECEDOR(nif),
	CHECK(num_encomenda > 0)
);

CREATE TABLE GESTAO_STOCKS.CONTEM (
	codigo_produto			CHAR(9),
	num_encomenda			INT NOT NULL,
	PRIMARY KEY(codigo_produto),
	FOREIGN KEY(codigo_produto) REFERENCES GESTAO_STOCKS.PRODUTO(codigo),
	FOREIGN KEY(num_encomenda) REFERENCES GESTAO_STOCKS.ENCOMENDA(num_encomenda)
);