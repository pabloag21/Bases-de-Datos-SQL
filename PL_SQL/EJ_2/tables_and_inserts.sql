-- DROP TABLE Empleado; ***caution: this will delete the table and all its data***
-- DROP TABLE Departamento; ***caution: this will delete the table and all its data***

CREATE TABLE Departamento (
    codigo CHAR(5) PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE Empleado (
    NIF CHAR(9) PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    cod_dept CHAR(5) REFERENCES Departamento(codigo),
    salario NUMBER(4) NOT NULL
);


-- =========================
-- INSERTS TABLA DEPARTAMENTO
-- =========================
INSERT INTO Departamento VALUES ('D001', 'Ventas');
INSERT INTO Departamento VALUES ('D002', 'Informatica');
INSERT INTO Departamento VALUES ('D003', 'Recursos Humanos');
INSERT INTO Departamento VALUES ('D004', 'Finanzas');

-- =========================
-- INSERTS TABLA EMPLEADO
-- =========================

-- Departamento Ventas (D001)
INSERT INTO Empleado VALUES ('11111111A', 'Ana Lopez', 'D001', 1800);
INSERT INTO Empleado VALUES ('22222222B', 'Carlos Perez', 'D001', 1500);
INSERT INTO Empleado VALUES ('33333333C', 'Marta Ruiz', 'D001', 1200);
INSERT INTO Empleado VALUES ('44444444D', 'Luis Gomez', 'D001', 1000);

-- Departamento Informatica (D002)
INSERT INTO Empleado VALUES ('55555555E', 'Pedro Sanchez', 'D002', 2000);
INSERT INTO Empleado VALUES ('66666666F', 'Laura Martin', 'D002', 1700);
INSERT INTO Empleado VALUES ('77777777G', 'Jorge Diaz', 'D002', 1400);
INSERT INTO Empleado VALUES ('88888888H', 'Sofia Torres', 'D002', 1300);

-- Departamento Recursos Humanos (D003)
INSERT INTO Empleado VALUES ('99999999I', 'Elena Navarro', 'D003', 1600);
INSERT INTO Empleado VALUES ('10101010J', 'Raul Moreno', 'D003', 1400);
INSERT INTO Empleado VALUES ('12121212K', 'Patricia Gil', 'D003', 1100);

-- Departamento Finanzas (D004)
INSERT INTO Empleado VALUES ('13131313L', 'Alberto Castro', 'D004', 2200);
INSERT INTO Empleado VALUES ('14141414M', 'Nuria Vega', 'D004', 1900);
INSERT INTO Empleado VALUES ('15151515N', 'Diego Ramos', 'D004', 1500);

COMMIT;