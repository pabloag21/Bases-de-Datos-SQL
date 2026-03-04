-- =============================================
-- Autor: Pablo Aguilar
-- Fecha: 03-03-2026
-- =============================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE mostrar_revista (
    p_nombre_revista Revista.nombre%TYPE
)
IS
    v_issn Revista.ISSN%TYPE;
    num_revistas NUMBER;
    no_existe EXCEPTION;

    CURSOR autores_revista (p_issn Revista.ISSN%TYPE) IS
        SELECT a.nombre, a.apellido FROM Autor a
        JOIN Firma f ON a.NIF = f.NIF
        JOIN Articulo ar ON f.DOI = ar.DOI
        WHERE p_issn = ar.cod_revista;

BEGIN

    SELECT COUNT(*) INTO num_revistas FROM Revista r Where r.nombre = p_nombre_revista;

    IF num_revistas = 0 THEN
        RAISE no_existe;
    END IF;

    SELECT ISSN INTO v_issn FROM Revista r WHERE r.nombre = p_nombre_revista;

    DBMS_OUTPUT.PUT_LINE('Nombre:' || p_nombre_revista || ' ISSN: ' || v_issn);
    DBMS_OUTPUT.PUT_LINE('');

    FOR aut IN autores_revista(v_issn) LOOP
        DBMS_OUTPUT.PUT_LINE(aut.nombre || ' ' || aut.apellido);
    END LOOP;

EXCEPTION

    WHEN no_existe THEN
        DBMS_OUTPUT.PUT_LINE('No hay ninguna revista con ese nombre.');
    
END;