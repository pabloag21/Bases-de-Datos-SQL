DROP TABLE Formaliza; -- ***caution: this will delete the table and all its data***
DROP TABLE Reserva; -- ***caution: this will delete the table and all its data***
DROP TABLE Participante; -- ***caution: this will delete the table and all its data***
DROP TABLE Alojamiento; -- ***caution: this will delete the table and all its data***


CREATE TABLE Alojamiento (
    id_alojamiento NUMBER PRIMARY KEY,
    max_personas NUMBER(2),
    propietario CHAR(10) NOT NULL,
    ciudad CHAR(9) NOT NULL,
    num_reservas NUMBER,
    total_ganancias NUMBER
);

CREATE TABLE Reserva (
    id_reserva NUMBER PRIMARY KEY,
    id_alojamiento NUMBER NOT NULL REFERENCES Alojamiento,
    fecha_entrada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    precio NUMBER(8,2) NOT NULL
);

CREATE TABLE Participante (
    NIF CHAR(9) PRIMARY KEY,
    nombre VARCHAR2(10) NOT NULL,
    apellido VARCHAR2(10) NOT NULL,
    ciudad VARCHAR2(20) NOT NULL,
    telefono CHAR(9)
);

CREATE TABLE Formaliza (
    id_reserva NUMBER REFERENCES Reserva,
    NIF CHAR(9) REFERENCES Participante,
    PRIMARY KEY (id_reserva, NIF)
);

-- =========================
-- INSERTS TABLA ALOJAMIENTO
-- =========================

INSERT INTO Alojamiento VALUES (1, 4, 'P001', 'Madrid', 0, 0);
INSERT INTO Alojamiento VALUES (2, 2, 'P002', 'Sevilla', 0, 0);
INSERT INTO Alojamiento VALUES (3, 6, 'P003', 'Valencia', 0, 0);
INSERT INTO Alojamiento VALUES (4, 3, 'P004', 'Bilbao', 0, 0);
INSERT INTO Alojamiento VALUES (5, 5, 'P005', 'Malaga', 0, 0);
INSERT INTO Alojamiento VALUES (6, 4, 'P006', 'Granada', 0, 0);
INSERT INTO Alojamiento VALUES (7, 2, 'P007', 'Cordoba', 0, 0);
INSERT INTO Alojamiento VALUES (8, 8, 'P008', 'Alicante', 0, 0);
INSERT INTO Alojamiento VALUES (9, 3, 'P009', 'Toledo', 0, 0);
INSERT INTO Alojamiento VALUES (10, 6, 'P010', 'Murcia', 0, 0);

-- =========================
-- INSERTS TABLA RESERVA
-- =========================

INSERT INTO Reserva VALUES (101, 1, TO_DATE('01-03-2025','DD-MM-YYYY'), TO_DATE('05-03-2025','DD-MM-YYYY'), 320);
INSERT INTO Reserva VALUES (102, 2, TO_DATE('10-03-2025','DD-MM-YYYY'), TO_DATE('12-03-2025','DD-MM-YYYY'), 150);
INSERT INTO Reserva VALUES (103, 3, TO_DATE('15-03-2025','DD-MM-YYYY'), TO_DATE('20-03-2025','DD-MM-YYYY'), 600);
INSERT INTO Reserva VALUES (104, 4, TO_DATE('02-04-2025','DD-MM-YYYY'), TO_DATE('06-04-2025','DD-MM-YYYY'), 350);
INSERT INTO Reserva VALUES (105, 5, TO_DATE('10-04-2025','DD-MM-YYYY'), TO_DATE('15-04-2025','DD-MM-YYYY'), 520);
INSERT INTO Reserva VALUES (106, 6, TO_DATE('18-04-2025','DD-MM-YYYY'), TO_DATE('22-04-2025','DD-MM-YYYY'), 410);
INSERT INTO Reserva VALUES (107, 7, TO_DATE('25-04-2025','DD-MM-YYYY'), TO_DATE('28-04-2025','DD-MM-YYYY'), 200);
INSERT INTO Reserva VALUES (108, 8, TO_DATE('01-05-2025','DD-MM-YYYY'), TO_DATE('07-05-2025','DD-MM-YYYY'), 780);
INSERT INTO Reserva VALUES (109, 9, TO_DATE('10-05-2025','DD-MM-YYYY'), TO_DATE('13-05-2025','DD-MM-YYYY'), 260);
INSERT INTO Reserva VALUES (110, 10, TO_DATE('20-05-2025','DD-MM-YYYY'), TO_DATE('25-05-2025','DD-MM-YYYY'), 640);

-- =========================
-- INSERTS TABLA PARTICIPANTE
-- =========================

INSERT INTO Participante VALUES ('12345678A','Juan','Perez','Madrid','600123456');
INSERT INTO Participante VALUES ('23456789B','Ana','Lopez','Sevilla','611234567');
INSERT INTO Participante VALUES ('34567890C','Luis','Garcia','Valencia','622345678');
INSERT INTO Participante VALUES ('45678901D','Marta','Ruiz','Bilbao','633456789');
INSERT INTO Participante VALUES ('56789012E','Carlos','Sanz','Malaga','644567890');
INSERT INTO Participante VALUES ('67890123F','Laura','Diaz','Granada','655678901');
INSERT INTO Participante VALUES ('78901234G','Pedro','Martin','Cordoba','666789012');
INSERT INTO Participante VALUES ('89012345H','Elena','Navarro','Alicante','677890123');
INSERT INTO Participante VALUES ('90123456I','Sergio','Torres','Toledo','688901234');
INSERT INTO Participante VALUES ('01234567J','Paula','Vega','Murcia','699012345');

-- =========================
-- INSERTS TABLA FORMALIZA
-- =========================

INSERT INTO Formaliza VALUES (101,'12345678A');
INSERT INTO Formaliza VALUES (101,'23456789B');

INSERT INTO Formaliza VALUES (102,'34567890C');

INSERT INTO Formaliza VALUES (103,'45678901D');
INSERT INTO Formaliza VALUES (103,'56789012E');

INSERT INTO Formaliza VALUES (104,'67890123F');

INSERT INTO Formaliza VALUES (105,'78901234G');
INSERT INTO Formaliza VALUES (105,'89012345H');

INSERT INTO Formaliza VALUES (106,'90123456I');

INSERT INTO Formaliza VALUES (107,'01234567J');

INSERT INTO Formaliza VALUES (108,'12345678A');
INSERT INTO Formaliza VALUES (108,'34567890C');

INSERT INTO Formaliza VALUES (109,'45678901D');

INSERT INTO Formaliza VALUES (110,'56789012E');
INSERT INTO Formaliza VALUES (110,'67890123F');
