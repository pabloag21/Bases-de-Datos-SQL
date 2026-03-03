-- =============================================
-- Autor: Pablo Aguilar
-- Fecha: 02-03-2026
-- =============================================

CREATE OR REPLACE PROCEDURE listar_empleados_debajo_umbral() 
IS

CURSOR  departamentos () IS
    SELECT codigo FROM Departamento;

CURSOR empleados_debajo_umbral(p_cod_dept Departamento.codigo%TYPE, umbral NUMBER) IS
    SELECT nombre, salario FROM Empleado WHERE cod_dept = p_cod_dept AND salario < umbral;

v_total := 0 NUMBER;
BEGIN

    FOR dept IN departamentos LOOP
        dbms_OUTPUT.PUT_LINE('Departamento ' || dept || ": ");
        FOR emp IN empleados_debajo_umbral(dept, )
