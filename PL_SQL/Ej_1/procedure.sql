CREATE OR REPLACE PROCEDURE actualizar_trayectos (
    contrato_p IN Contrato.referencia%TYPE
)    
AS
    v_num_trayectos number;
    no_trayectos EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_num_trayectos FROM Trayecto WHERE Trayecto.referencia = contrato_p;
    
    UPDATE Contrato SET
    num_trayectos = v_num_trayectos
    WHERE Contrato.referencia = contrato_p;
    
    IF v_num_trayectos = 0 THEN
        RAISE no_trayectos;
    END IF;
     
    DBMS_OUTPUT.PUT_LINE(contrato_p || ' tiene: ' || v_num_trayectos || ' trayectos.');
    
    COMMIT;
    
EXCEPTION
    WHEN no_trayectos THEN
        DBMS_OUTPUT.PUT_LINE('El contrato no tiene trayectos registrados.');

END;