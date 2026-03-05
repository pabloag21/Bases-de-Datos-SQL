-- =============================================
-- Autor: Pablo Aguilar
-- Fecha: 04-03-2026
-- =============================================

CREATE OR REPLACE PROCEDURE reservar_vuelo (
    p_fecha Billete.fecha_billete%TYPE,
    p_cod_orig Aeropuerto.codigo%TYPE,
    p_cod_dest Aeropuerto.codigo%TYPE,
    p_pasaporte Billete.pasaporte%TYPE
)
IS
    CURSOR vuelos IS
        SELECT v.num_vuelo FROM Vuelo v
            WHERE v.fecha_vuelo = p_fecha
            AND v.origen = p_cod_orig
            AND v.destino = p_cod_dest
            AND v.plazas > 0;

    hay_vuelos BOOLEAN := FALSE;
    registrado BOOLEAN := FALSE;
    v_vuelo Vuelo.num_vuelo%TYPE;
    v_billete NUMBER;
    no_hay EXCEPTION;
    ya_comprado EXCEPTION;
BEGIN

    FOR vuel IN vuelos LOOP
        v_vuelo := vuel.num_vuelo;
        hay_vuelos := TRUE;

        SELECT COUNT(*) INTO v_billete FROM Billete b
        WHERE b.fecha_billete = p_fecha
        AND b.pasaporte = p_pasaporte
        AND b.num_billete = v_vuelo;

        IF v_billete = 0 THEN
            INSERT INTO Billete VALUES(v_vuelo, p_fecha, p_pasaporte);
            registrado := TRUE;
            UPDATE Vuelo v SET v.plazas = v.plazas - 1 WHERE v.num_vuelo = v_vuelo;
            EXIT;
        END IF;

    END LOOP;

    IF NOT hay_vuelos THEN
        RAISE no_hay;
    END IF;

    IF NOT registrado THEN
        RAISE ya_comprado;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Vuelo reservado correctamente.');
    DBMS_OUTPUT.PUT_LINE('Numero de billete: ' || v_vuelo || ' pasaporte: ' || p_pasaporte || ' fecha: ' || p_fecha);
    COMMIT;

EXCEPTION

    WHEN no_hay THEN
        DBMS_OUTPUT.PUT_LINE('No hay vuelos disponibles con las características deseadas.');

    WHEN ya_comprado THEN
        DBMS_OUTPUT.PUT_LINE('Ya hay un billete registrado a todos los vuelos disponibles.')

END;