-- =============================================
-- Autor: Pablo Aguilar
-- Fecha: 02-03-2026
-- =============================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE listar_empleados_debajo_umbral
IS
    CURSOR  departamentos IS
        SELECT codigo FROM Departamento;

    CURSOR empleados_debajo_umbral(p_cod_dept Departamento.codigo%TYPE) IS
        SELECT e.nombre, e.salario
        FROM Empleado e
        WHERE e.cod_dept = p_cod_dept
        AND e.salario < (
              SELECT AVG(salario)
              FROM Empleado
              WHERE cod_dept = p_cod_dept
        );

    v_media NUMBER := 0;
    v_total NUMBER := 0;
BEGIN
    FOR dept IN departamentos LOOP
        v_total := 0;
        dbms_OUTPUT.PUT_LINE('Departamento ' || dept.codigo);

        FOR emp IN empleados_debajo_umbral(dept.codigo) LOOP
            dbms_OUTPUT.PUT_LINE(emp.nombre || ': ' || emp.salario);
            v_total := v_total + emp.salario;
        END LOOP;
        
        dbms_OUTPUT.PUT_LINE('El coste total de los salarios del departamento es: ' || v_total);
        dbms_OUTPUT.PUT_LINE('');
    END LOOP;
END;


