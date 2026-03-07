CREATE OR REPLACE TRIGGER actualizar_alojamiento
AFTER INSERT OR UPDATE OR DELETE
ON Reserva FOR EACH ROW

BEGIN
    IF INSERTING THEN
    UPDATE Alojamiento a SET a.num_reservas = a.num_reservas + 1, a.total_ganancias = a.total_ganancias + :NEW.precio
    WHERE a.id_alojamiento = :NEW.id_alojamiento;
    END IF;

    IF UPDATING THEN
        UPDATE Alojamiento a SET a.num_reservas = a.num_reservas + 1, a.total_ganancias = a.total_ganancias + :NEW.precio
        WHERE a.id_alojamiento = :NEW.id_alojamiento;

        UPDATE Alojamiento a SET a.num_reservas = a.num_reservas - 1, a.total_ganancias = a.total_ganancias - :OLD.precio
        WHERE a.id_alojamiento = :OLD.id_alojamiento;
    END IF;

    IF DELETING THEN
    UPDATE Alojamiento a SET a.num_reservas = a.num_reservas - 1, a.total_ganancias = a.total_ganancias - :OLD.precio
    WHERE a.id_alojamiento = :OLD.id_alojamiento;
    END IF;
    
END;
