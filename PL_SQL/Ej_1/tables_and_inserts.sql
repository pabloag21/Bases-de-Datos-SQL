-- DROP TABLE Trayecto; ***caution: this will delete the table and all its data***
-- DROP TABLE Contrato; ***caution: this will delete the table and all its data***

CREATE TABLE Contrato (
referencia VARCHAR2(10) PRIMARY KEY,
empresa VARCHAR2(100) NOT NULL,
fecha_inicio DATE NOT NULL,
num_trayectos NUMBER(3)
);

CREATE TABLE Trayecto (
referencia VARCHAR2(10)REFERENCES Contrato,
origen VARCHAR2(50),
destino VARCHAR2(50),
vehiculo VARCHAR2(20),
PRIMARY KEY (referencia, origen, destino)
);

-- =========================
-- INSERTS TABLA CONTRATO
-- =========================

INSERT INTO Contrato VALUES ('C001', 'Transporte Norte SL', TO_DATE('01-01-2024','DD-MM-YYYY'), NULL);
INSERT INTO Contrato VALUES ('C002', 'Logistica Sur SA', TO_DATE('15-02-2024','DD-MM-YYYY'), NULL);
INSERT INTO Contrato VALUES ('C003', 'Express Iberia', TO_DATE('10-03-2024','DD-MM-YYYY'), NULL);
INSERT INTO Contrato VALUES ('C004', 'Cargo Mediterraneo', TO_DATE('20-04-2024','DD-MM-YYYY'), NULL);
INSERT INTO Contrato VALUES ('C005', 'Transportes Atlantico', TO_DATE('05-05-2024','DD-MM-YYYY'), NULL);
INSERT INTO Contrato VALUES ('C006', 'Movilidad Central', TO_DATE('12-06-2024','DD-MM-YYYY'), NULL);
INSERT INTO Contrato VALUES ('C007', 'Distribuciones Europa', TO_DATE('01-07-2024','DD-MM-YYYY'), NULL);
INSERT INTO Contrato VALUES ('C008', 'Rutas del Sur', TO_DATE('18-08-2024','DD-MM-YYYY'), NULL);
INSERT INTO Contrato VALUES ('C009', 'TransExpress Madrid', TO_DATE('09-09-2024','DD-MM-YYYY'), NULL);
INSERT INTO Contrato VALUES ('C010', 'Logistica Global', TO_DATE('30-10-2024','DD-MM-YYYY'), NULL);

-- =========================
-- INSERTS TABLA TRAYECTO
-- =========================

-- C001
INSERT INTO Trayecto VALUES ('C001','Madrid','Barcelona','Camion');
INSERT INTO Trayecto VALUES ('C001','Barcelona','Valencia','Furgoneta');
INSERT INTO Trayecto VALUES ('C001','Valencia','Sevilla','Camion');
INSERT INTO Trayecto VALUES ('C001','Sevilla','Bilbao','Trailer');

-- C002
INSERT INTO Trayecto VALUES ('C002','Malaga','Granada','Furgoneta');
INSERT INTO Trayecto VALUES ('C002','Granada','Cordoba','Camion');
INSERT INTO Trayecto VALUES ('C002','Cordoba','Madrid','Camion');

-- C003
INSERT INTO Trayecto VALUES ('C003','Bilbao','Santander','Furgoneta');
INSERT INTO Trayecto VALUES ('C003','Santander','Oviedo','Camion');

-- C004
INSERT INTO Trayecto VALUES ('C004','Valencia','Alicante','Furgoneta');
INSERT INTO Trayecto VALUES ('C004','Alicante','Murcia','Camion');
INSERT INTO Trayecto VALUES ('C004','Murcia','Almeria','Trailer');
INSERT INTO Trayecto VALUES ('C004','Almeria','Malaga','Camion');
INSERT INTO Trayecto VALUES ('C004','Malaga','Cadiz','Furgoneta');

-- C005
INSERT INTO Trayecto VALUES ('C005','Vigo','Coruña','Camion');
INSERT INTO Trayecto VALUES ('C005','Coruña','Lugo','Furgoneta');

-- C006
INSERT INTO Trayecto VALUES ('C006','Zaragoza','Pamplona','Camion');
INSERT INTO Trayecto VALUES ('C006','Pamplona','Logroño','Furgoneta');
INSERT INTO Trayecto VALUES ('C006','Logroño','Burgos','Camion');

-- C007
INSERT INTO Trayecto VALUES ('C007','Madrid','Toledo','Furgoneta');

-- C008
INSERT INTO Trayecto VALUES ('C008','Sevilla','Huelva','Camion');
INSERT INTO Trayecto VALUES ('C008','Huelva','Badajoz','Trailer');

-- C009
INSERT INTO Trayecto VALUES ('C009','Barcelona','Girona','Furgoneta');
INSERT INTO Trayecto VALUES ('C009','Girona','Lleida','Camion');
INSERT INTO Trayecto VALUES ('C009','Lleida','Tarragona','Camion');