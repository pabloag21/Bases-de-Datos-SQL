DROP TABLE Visita; -- ***caution: this will delete the table and all its data***
DROP TABLE Representa; -- ***caution: this will delete the table and all its data***
DROP TABLE Inmobiliaria; -- ***caution: this will delete the table and all its data***
DROP TABLE Comprador; -- ***caution: this will delete the table and all its data***
DROP TABLE Vivienda; -- ***caution: this will delete the table and all its data***

CREATE TABLE Vivienda (
    catastro VARCHAR2(20) PRIMARY KEY,
    direccion VARCHAR2(50) NOT NULL,
    planta NUMBER(2) NOT NULL,
    metros NUMBER(5,2) NOT NULL
);
CREATE TABLE Inmobiliaria (
    NIF CHAR(9) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    direccion VARCHAR2(50) NOT NULL
);
CREATE TABLE Comprador (
    NIF CHAR(9) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    localidad VARCHAR2(50) NOT NULL
);
CREATE TABLE Representa (
    catastro VARCHAR2(20) REFERENCES Vivienda,
    NIF_inmobiliaria CHAR(9) REFERENCES Inmobiliaria (NIF),
    PRIMARY KEY (catastro, NIF_inmobiliaria)
);
CREATE TABLE Visita (
    catastro VARCHAR2(20),
    NIF_inmobiliaria CHAR(9),
    NIF_comprador CHAR(9) REFERENCES Comprador (NIF),
    PRIMARY KEY (catastro, NIF_inmobiliaria, NIF_comprador),
    FOREIGN KEY (catastro, NIF_inmobiliaria) REFERENCES Representa
);


-- =========================
-- INSERTS TABLA VIVIENDA
-- =========================

INSERT INTO Vivienda VALUES ('CAT001','Calle Mayor 10',2,85.50);
INSERT INTO Vivienda VALUES ('CAT002','Avenida Sol 25',1,60.00);
INSERT INTO Vivienda VALUES ('CAT003','Calle Luna 14',3,120.75);
INSERT INTO Vivienda VALUES ('CAT004','Plaza España 5',5,95.00);
INSERT INTO Vivienda VALUES ('CAT005','Calle Norte 8',4,70.30);
INSERT INTO Vivienda VALUES ('CAT006','Avenida Sur 11',2,110.20);
INSERT INTO Vivienda VALUES ('CAT007','Calle Jardines 3',1,55.00);
INSERT INTO Vivienda VALUES ('CAT008','Calle Central 18',6,140.90);


-- =========================
-- INSERTS TABLA INMOBILIARIA
-- =========================

INSERT INTO Inmobiliaria VALUES ('A11111111','InmoMadrid','Calle Alcalá 100');
INSERT INTO Inmobiliaria VALUES ('B22222222','Casas del Sur','Avenida Andalucía 45');
INSERT INTO Inmobiliaria VALUES ('C33333333','Viviendas Centro','Gran Via 12');
INSERT INTO Inmobiliaria VALUES ('D44444444','Hogar Ideal','Calle Serrano 50');


-- =========================
-- INSERTS TABLA COMPRADOR
-- =========================

INSERT INTO Comprador VALUES ('11111111A','Juan Perez','Madrid');
INSERT INTO Comprador VALUES ('22222222B','Ana Lopez','Sevilla');
INSERT INTO Comprador VALUES ('33333333C','Luis Garcia','Valencia');
INSERT INTO Comprador VALUES ('44444444D','Marta Ruiz','Bilbao');
INSERT INTO Comprador VALUES ('55555555E','Carlos Sanz','Madrid');
INSERT INTO Comprador VALUES ('66666666F','Laura Diaz','Granada');


-- =========================
-- INSERTS TABLA REPRESENTA
-- =========================

INSERT INTO Representa VALUES ('CAT001','A11111111');
INSERT INTO Representa VALUES ('CAT002','A11111111');
INSERT INTO Representa VALUES ('CAT003','B22222222');
INSERT INTO Representa VALUES ('CAT004','C33333333');
INSERT INTO Representa VALUES ('CAT005','B22222222');
INSERT INTO Representa VALUES ('CAT006','D44444444');
INSERT INTO Representa VALUES ('CAT007','C33333333');
INSERT INTO Representa VALUES ('CAT008','A11111111');


-- =========================
-- INSERTS TABLA VISITA
-- =========================

INSERT INTO Visita VALUES ('CAT001','A11111111','11111111A');
INSERT INTO Visita VALUES ('CAT001','A11111111','22222222B');
INSERT INTO Visita VALUES ('CAT002','A11111111','33333333C');
INSERT INTO Visita VALUES ('CAT003','B22222222','44444444D');
INSERT INTO Visita VALUES ('CAT003','B22222222','11111111A');
INSERT INTO Visita VALUES ('CAT004','C33333333','55555555E');
INSERT INTO Visita VALUES ('CAT005','B22222222','66666666F');
INSERT INTO Visita VALUES ('CAT006','D44444444','33333333C');
INSERT INTO Visita VALUES ('CAT007','C33333333','22222222B');
INSERT INTO Visita VALUES ('CAT008','A11111111','11111111A');