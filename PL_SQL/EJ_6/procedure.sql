-- =============================================
-- Autor: Pablo Aguilar
-- Fecha: 08-03-2026
-- =============================================

CREATE OR REPLACE PROCEDURE listar_visitas (
    p_catastro Vivienda.catastro%TYPE
)
IS
    CURSOR inmo IS
        SELECT r.NIF_inmobiliaria, i.nombre FROM Representa r
        JOIN Inmobiliaria i ON r.NIF_INMOBILIARIA = i.NIF
        WHERE r.catastro = p_catastro;

    CURSOR vis (pc_nif_inmo Visita.NIF_inmobiliaria%TYPE) IS
        SELECT c.nombre, v.NIF_comprador FROM Visita v
        JOIN Comprador c ON v.NIF_COMPRADOR = c.NIF
        WHERE v.CATASTRO = p_catastro
        AND v.NIF_INMOBILIARIA = pc_nif_inmo;
    
    v_num_visitas NUMBER;
    v_catastro NUMBER;
    no_existe EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_catastro FROM VIVIENDA v WHERE v.CATASTRO = p_catastro;

    IF v_catastro = 0 THEN
        RAISE no_existe;
    END IF;

    FOR inmob IN inmo LOOP
        DBMS_OUTPUT.PUT_LINE('Inmobiliaria: ' || inmob.nombre);
        v_num_visitas := 0;
        FOR visit IN vis(inmob.NIF_inmobiliaria) LOOP
            DBMS_OUTPUT.PUT_LINE('Visitante: ' || visit.nombre || ' (NIF: ' || visit.NIF_comprador || ')');
            v_num_visitas := v_num_visitas + 1;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Total de visitas: ' || v_num_visitas);
        DBMS_OUTPUT.PUT_LINE('---');
    END LOOP;

EXCEPTION

WHEN no_existe THEN
    DBMS_OUTPUT.PUT_LINE('No se encontraron visitas para la vivienda con número de catastro ' || p_catastro);
END;


SET SERVEROUTPUT ON;
EXECUTE LISTAR_VISITAS('CAT001');