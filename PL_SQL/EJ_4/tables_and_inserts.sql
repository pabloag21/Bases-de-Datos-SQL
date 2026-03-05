-- DROP TABLE Billete; -- ***caution: this will delete the table and all its data***
-- DROP TABLE VUELO; -- ***caution: this will delete the table and all its data***
-- DROP TABLE AEROPUERTO; -- ***caution: this will delete the table and all its data***


CREATE TABLE Aeropuerto (
    codigo CHAR(6) PRIMARY KEY,
    nombre VARCHAR2(30) NOT NULL,
    pais VARCHAR2(30) NOT NULL
);

CREATE TABLE Vuelo (
    num_vuelo CHAR(6),
    fecha_vuelo DATE,
    origen CHAR(6) NOT NULL REFERENCES Aeropuerto (codigo),
    destino CHAR(6) NOT NULL REFERENCES Aeropuerto (codigo),
    importe NUMBER(6,2) NOT NULL,
    plazas NUMBER(3) DEFAULT 100,
    PRIMARY KEY (num_vuelo, fecha_vuelo),
    UNIQUE (fecha_vuelo, origen, destino),
    CHECK (origen <> destino)
);

CREATE TABLE Billete (
    num_billete CHAR(6),
    fecha_billete DATE,
    pasaporte CHAR(10),
    PRIMARY KEY (num_billete, fecha_billete, pasaporte),
    FOREIGN KEY (num_billete, fecha_billete)
    REFERENCES Vuelo (num_vuelo, fecha_vuelo)
);

-- =========================
-- INSERTS TABLA AEROPUERTO
-- =========================
INSERT INTO Aeropuerto VALUES ('MAD001', 'Barajas', 'España');
INSERT INTO Aeropuerto VALUES ('BCN001', 'El Prat', 'España');
INSERT INTO Aeropuerto VALUES ('PAR001', 'CharlesDeGaulle', 'Francia');
INSERT INTO Aeropuerto VALUES ('ROM001', 'Fiumicino', 'Italia');
INSERT INTO Aeropuerto VALUES ('BER001', 'Brandenburg', 'Alemania');

-- =========================
-- INSERTS TABLA VUELO
-- =========================

-- Vuelos Madrid → Barcelona (misma fecha)
INSERT INTO Vuelo VALUES ('V001', TO_DATE('10/03/2026','DD/MM/YYYY'), 'MAD001', 'BCN001', 120.50, 3);
INSERT INTO Vuelo VALUES ('V002', TO_DATE('10/03/2026','DD/MM/YYYY'), 'MAD001', 'BCN001', 130.00, 2);

-- Vuelo Madrid → París (vuelo pequeño)
INSERT INTO Vuelo VALUES ('V003', TO_DATE('10/03/2026','DD/MM/YYYY'), 'MAD001', 'PAR001', 200.00, 2);

-- Vuelo Barcelona → Roma
INSERT INTO Vuelo VALUES ('V004', TO_DATE('10/03/2026','DD/MM/YYYY'), 'BCN001', 'ROM001', 180.00, 2);

-- Vuelo otro día (para probar que no lo encuentre)
INSERT INTO Vuelo VALUES ('V005', TO_DATE('11/03/2026','DD/MM/YYYY'), 'MAD001', 'BCN001', 125.00, 2);

-- =========================
-- INSERTS TABLA BILLETE
-- =========================

-- Ocupamos 2 plazas del V001 (queda 1 libre)
INSERT INTO Billete VALUES ('V001', TO_DATE('10/03/2026','DD/MM/YYYY'), 'PAS001');
INSERT INTO Billete VALUES ('V001', TO_DATE('10/03/2026','DD/MM/YYYY'), 'PAS002');

-- Llenamos completamente V003 (2 plazas ocupadas)
INSERT INTO Billete VALUES ('V003', TO_DATE('10/03/2026','DD/MM/YYYY'), 'PAS003');
INSERT INTO Billete VALUES ('V003', TO_DATE('10/03/2026','DD/MM/YYYY'), 'PAS004');

COMMIT;