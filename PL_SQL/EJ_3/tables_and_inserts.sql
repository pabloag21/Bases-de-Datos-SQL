-- DROP TABLE Firma; -- ***caution: this will delete the table and all its data***
-- DROP TABLE Articulo; -- ***caution: this will delete the table and all its data***
-- DROP TABLE Autor; -- ***caution: this will delete the table and all its data***
-- DROP TABLE Revista; -- ***caution: this will delete the table and all its data***

CREATE TABLE Autor (
 NIF CHAR(9) PRIMARY KEY,
 nombre VARCHAR2(50) NOT NULL,
 apellido VARCHAR2(50) NOT NULL,
 pais VARCHAR2(30) NOT NULL,
 num_articulos NUMBER(3) NOT NULL
);
CREATE TABLE Revista (
 ISSN VARCHAR2(9) PRIMARY KEY,
 nombre VARCHAR2(100) NOT NULL
);
CREATE TABLE Articulo (
 DOI CHAR(30) PRIMARY KEY,
 titulo VARCHAR2(100) NOT NULL,
 cod_revista VARCHAR2(9) NOT NULL REFERENCES Revista(ISSN),
 num_autores NUMBER(1) NOT NULL CHECK (num_autores BETWEEN 1 AND 4)
);
CREATE TABLE Firma (
 NIF CHAR(9) REFERENCES Autor,
 DOI CHAR(30) REFERENCES Articulo,
 PRIMARY KEY (NIF, DOI)
);

-- =========================
-- INSERTS TABLA AUTOR
-- =========================
INSERT INTO Autor VALUES ('11111111A', 'Ana', 'Lopez', 'España', 3);
INSERT INTO Autor VALUES ('22222222B', 'Carlos', 'Perez', 'España', 2);
INSERT INTO Autor VALUES ('33333333C', 'Marta', 'Ruiz', 'México', 4);
INSERT INTO Autor VALUES ('44444444D', 'Luis', 'Gomez', 'Argentina', 1);
INSERT INTO Autor VALUES ('55555555E', 'Pedro', 'Sanchez', 'España', 3);
INSERT INTO Autor VALUES ('66666666F', 'Laura', 'Martin', 'Colombia', 2);
INSERT INTO Autor VALUES ('77777777G', 'Jorge', 'Diaz', 'Chile', 1);

-- =========================
-- INSERTS TABLA REVISTA
-- =========================
INSERT INTO Revista VALUES ('1234-5678', 'Revista de Tecnología');
INSERT INTO Revista VALUES ('2345-6789', 'Ciencia y Desarrollo');
INSERT INTO Revista VALUES ('3456-7890', 'Investigación Médica');
INSERT INTO Revista VALUES ('4567-8901', 'Arte y Cultura');
INSERT INTO Revista VALUES ('5678-9012', 'Economía Aplicada');

-- =========================
-- INSERTS TABLA ARTICULO
-- =========================

-- Revista Tecnología (ISSN: 1234-5678)
INSERT INTO Articulo VALUES ('10.1234/tech001', 'Inteligencia Artificial en 2024', '1234-5678', 3);
INSERT INTO Articulo VALUES ('10.1234/tech002', 'Blockchain y seguridad', '1234-5678', 2);
INSERT INTO Articulo VALUES ('10.1234/tech003', 'Computación cuántica', '1234-5678', 2);

-- Revista Ciencia (ISSN: 2345-6789)
INSERT INTO Articulo VALUES ('10.2345/cien001', 'Cambio climático', '2345-6789', 4);
INSERT INTO Articulo VALUES ('10.2345/cien002', 'Nuevas especies marinas', '2345-6789', 3);
INSERT INTO Articulo VALUES ('10.2345/cien003', 'Energías renovables', '2345-6789', 1);

-- Revista Medicina (ISSN: 3456-7890)
INSERT INTO Articulo VALUES ('10.3456/med001', 'Avances en vacunas', '3456-7890', 3);
INSERT INTO Articulo VALUES ('10.3456/med002', 'Terapia génica', '3456-7890', 2);

-- Revista Arte (ISSN: 4567-8901)
INSERT INTO Articulo VALUES ('10.4567/art001', 'Pintura renacentista', '4567-8901', 1);
INSERT INTO Articulo VALUES ('10.4567/art002', 'Arte digital moderno', '4567-8901', 2);

-- Revista Economía (ISSN: 5678-9012)
INSERT INTO Articulo VALUES ('10.5678/eco001', 'Inflación post-pandemia', '5678-9012', 3);
INSERT INTO Articulo VALUES ('10.5678/eco002', 'Criptomonedas y mercados', '5678-9012', 2);
INSERT INTO Articulo VALUES ('10.5678/eco003', 'Economía circular', '5678-9012', 2);

-- =========================
-- INSERTS TABLA FIRMA (Relación Autor-Artículo)
-- =========================

-- Artículo: Inteligencia Artificial en 2024 (Autores: Ana, Carlos, Marta)
INSERT INTO Firma VALUES ('11111111A', '10.1234/tech001');
INSERT INTO Firma VALUES ('22222222B', '10.1234/tech001');
INSERT INTO Firma VALUES ('33333333C', '10.1234/tech001');

-- Artículo: Blockchain y seguridad (Autores: Ana, Luis)
INSERT INTO Firma VALUES ('11111111A', '10.1234/tech002');
INSERT INTO Firma VALUES ('44444444D', '10.1234/tech002');

-- Artículo: Computación cuántica (Autores: Pedro, Laura)
INSERT INTO Firma VALUES ('55555555E', '10.1234/tech003');
INSERT INTO Firma VALUES ('66666666F', '10.1234/tech003');

-- Artículo: Cambio climático (Autores: Ana, Carlos, Marta, Jorge)
INSERT INTO Firma VALUES ('11111111A', '10.2345/cien001');
INSERT INTO Firma VALUES ('22222222B', '10.2345/cien001');
INSERT INTO Firma VALUES ('33333333C', '10.2345/cien001');
INSERT INTO Firma VALUES ('77777777G', '10.2345/cien001');

-- Artículo: Nuevas especies marinas (Autores: Marta, Pedro, Laura)
INSERT INTO Firma VALUES ('33333333C', '10.2345/cien002');
INSERT INTO Firma VALUES ('55555555E', '10.2345/cien002');
INSERT INTO Firma VALUES ('66666666F', '10.2345/cien002');

-- Artículo: Energías renovables (Autor: Pedro)
INSERT INTO Firma VALUES ('55555555E', '10.2345/cien003');

-- Artículo: Avances en vacunas (Autores: Laura, Jorge, Luis)
INSERT INTO Firma VALUES ('66666666F', '10.3456/med001');
INSERT INTO Firma VALUES ('77777777G', '10.3456/med001');
INSERT INTO Firma VALUES ('44444444D', '10.3456/med001');

-- Artículo: Terapia génica (Autores: Ana, Carlos)
INSERT INTO Firma VALUES ('11111111A', '10.3456/med002');
INSERT INTO Firma VALUES ('22222222B', '10.3456/med002');

-- Artículo: Pintura renacentista (Autor: Marta)
INSERT INTO Firma VALUES ('33333333C', '10.4567/art001');

-- Artículo: Arte digital moderno (Autores: Luis, Jorge)
INSERT INTO Firma VALUES ('44444444D', '10.4567/art002');
INSERT INTO Firma VALUES ('77777777G', '10.4567/art002');

-- Artículo: Inflación post-pandemia (Autores: Pedro, Laura, Ana)
INSERT INTO Firma VALUES ('55555555E', '10.5678/eco001');
INSERT INTO Firma VALUES ('66666666F', '10.5678/eco001');
INSERT INTO Firma VALUES ('11111111A', '10.5678/eco001');

-- Artículo: Criptomonedas y mercados (Autores: Carlos, Marta)
INSERT INTO Firma VALUES ('22222222B', '10.5678/eco002');
INSERT INTO Firma VALUES ('33333333C', '10.5678/eco002');

-- Artículo: Economía circular (Autores: Luis, Laura)
INSERT INTO Firma VALUES ('44444444D', '10.5678/eco003');
INSERT INTO Firma VALUES ('66666666F', '10.5678/eco003');

COMMIT;
