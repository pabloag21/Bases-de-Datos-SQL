-- =============================================
-- Autor: Pablo Aguilar
-- Fecha: 07-03-2026
-- =============================================

CREATE OR REPLACE PROCEDURE mostrar_alojamiento (
    p_ciudad Alojamiento.ciudad%TYPE
)
IS
    CURSOR alojamientos_ciudad (pc_ciudad Alojamiento.ciudad%TYPE) IS
        SELECT id_alojamiento, propietario FROM Alojamiento
        WHERE ciudad = pc_ciudad;

    CURSOR reservas_alojamiento (pc_alojamiento Alojamiento.id_alojamiento%TYPE) IS
        SELECT id_reserva, fecha_entrada, precio FROM Reserva
        WHERE id_alojamiento = pc_alojamiento;

    v_ciudad NUMBER := 0;
    v_propietario Alojamiento.propietario%TYPE;
    v_total_reservas NUMBER := 0;
    v_total_precio NUMBER := 0;
    no_existe EXCEPTION;
    
BEGIN
    
    SELECT COUNT(*) INTO v_ciudad FROM Alojamiento WHERE ciudad = p_ciudad;

    IF v_ciudad = 0 THEN
        RAISE no_existe;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Número de Alojamientos de ' || p_ciudad || ': ' || v_ciudad);
    DBMS_OUTPUT.PUT_LINE('---');


    FOR alj IN alojamientos_ciudad(p_ciudad) LOOP
        DBMS_OUTPUT.PUT_LINE('Alojamiento: ' || alj.id_alojamiento || ' Propietario: ' || alj.propietario);

        FOR r IN reservas_alojamiento(alj.id_alojamiento) LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || r.id_reserva || ' Entrada: ' || r.fecha_entrada || ' Precio: ' || r.precio);
            v_total_reservas := v_total_reservas + 1;
            v_total_precio := v_total_precio + r.precio;
            DBMS_OUTPUT.PUT_LINE('---');
        END LOOP;    
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total Reservas: ' || v_total_reservas || ' Total Precio: '|| v_total_precio);

EXCEPTION

    WHEN no_existe THEN
        DBMS_OUTPUT.PUT_LINE('No existen alojamientos en ' || p_ciudad);

END;