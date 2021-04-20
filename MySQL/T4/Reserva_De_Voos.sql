CREATE SCHEMA [RESERVA_DE_VOOS];
go

CREATE TABLE RESERVA_DE_VOOS.AIRPORT (
	airport_code		INT,
	city				VARCHAR(30) NOT NULL,
	air_state			VARCHAR(30) NOT NULL,
	air_name			VARCHAR(30) NOT NULL,
	PRIMARY KEY(airport_code)
);

CREATE TABLE RESERVA_DE_VOOS.AIRPLANE_TYPE (
	type_name				VARCHAR(30),
	max_seats				INT NOT NULL,
	company					VARCHAR(30),
	PRIMARY KEY(type_name),
	CHECK(max_seats > 0)
);

CREATE TABLE RESERVA_DE_VOOS.AIRPLANE (
	airplane_id				INT,
	number_seats			INT NOT NULL,
	airplane_type			VARCHAR(30) NOT NULL,
	PRIMARY KEY(airplane_id),
	FOREIGN KEY(airplane_type) REFERENCES RESERVA_DE_VOOS.AIRPLANE_TYPE(type_name),
	CHECK(number_seats > 0)
);

CREATE TABLE RESERVA_DE_VOOS.FLIGHT (
	number_flight			INT,
	airline					VARCHAR(30) NOT NULL,
	weekdays				VARCHAR(100),
	PRIMARY KEY(number_flight)
);

CREATE TABLE RESERVA_DE_VOOS.FLIGHT_LEG (
	leg_no					INT,
	number_flight			INT,
	dep_airport				INT NOT NULL,
	dep_time				TIME NOT NULL,
	arr_airport				INT NOT NULL,
	arr_time				TIME NOT NULL,
	PRIMARY KEY(leg_no, number_flight),
	FOREIGN KEY(number_flight) REFERENCES RESERVA_DE_VOOS.FLIGHT(number_flight),
	FOREIGN KEY(dep_airport) REFERENCES RESERVA_DE_VOOS.AIRPORT(airport_code),
	FOREIGN KEY(arr_airport) REFERENCES RESERVA_DE_VOOS.AIRPORT(airport_code),
	CHECK(number_flight > 0)
);

CREATE TABLE RESERVA_DE_VOOS.FARE (
	code				INT,
	flight				INT,
	amount				MONEY NOT NULL,
	restrictions		VARCHAR(30),
	PRIMARY KEY(code, flight),
	FOREIGN KEY(flight) REFERENCES RESERVA_DE_VOOS.FLIGHT(number_flight),
	CHECK(amount >= 0)
);

CREATE TABLE RESERVA_DE_VOOS.LEG_INSTANCE (
	leg_date				DATE,
	leg_no					INT,
	number_flight			INT,
	available_seats			INT,
	airplane_id				INT NOT NULL,
	dep_airport				INT NOT NULL,
	dep_time				TIME NOT NULL,
	arr_airport				INT NOT NULL,
	arr_time				TIME NOT NULL,
	PRIMARY KEY(leg_date, leg_no, number_flight),
	FOREIGN KEY(leg_no, number_flight) REFERENCES RESERVA_DE_VOOS.FLIGHT_LEG(leg_no, number_flight),
	FOREIGN KEY(airplane_id) REFERENCES RESERVA_DE_VOOS.AIRPLANE(airplane_id),
	FOREIGN KEY(dep_airport) REFERENCES RESERVA_DE_VOOS.AIRPORT(airport_code),
	FOREIGN KEY(arr_airport) REFERENCES RESERVA_DE_VOOS.AIRPORT(airport_code)
);

CREATE TABLE RESERVA_DE_VOOS.SEAT (
	seat_no						INT,
	leg_date					DATE NOT NULL,
	leg_no						INT NOT NULL,
	number_flight				INT NOT NULL,
	customer_name				VARCHAR(30) NOT NULL,
	cphone						VARCHAR(9) NOT NULL,
	PRIMARY KEY(seat_no, leg_date, leg_no, number_flight),
	FOREIGN KEY(leg_date, leg_no, number_flight) REFERENCES RESERVA_DE_VOOS.LEG_INSTANCE(leg_date, leg_no, number_flight)
);

CREATE TABLE RESERVA_DE_VOOS.CAN_LAND (
	airport_code 		INT,
	type_name			VARCHAR(30),
	PRIMARY KEY(airport_code, type_name),
	FOREIGN KEY(airport_code) REFERENCES RESERVA_DE_VOOS.AIRPORT(airport_code),
	FOREIGN KEY(type_name) REFERENCES RESERVA_DE_VOOS.AIRPLANE_TYPE(type_name)
);