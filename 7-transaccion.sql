USE venta;
-- Crea una transacción que inserte un nuevo cliente y una nueva orden de compra al mismo tiempo.
DELIMITER //
CREATE PROCEDURE cliente_orden(
    IN producto_nombre VARCHAR(45),
    IN cliente_nombre VARCHAR(45),
    IN cliente_direccion VARCHAR(45),
    IN cliente_correo VARCHAR(45),
    IN compra_cantidad INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error';
    END;
START TRANSACTION;
        INSERT INTO cliente (nombre, direccion, correo) VALUES (cliente_nombre, cliente_direccion, cliente_correo);
    SET @cliente_id = LAST_INSERT_ID();
    SET @producto_id = (SELECT producto_id FROM producto WHERE nombre = producto_nombre LIMIT 1);

    INSERT INTO compra (cantidad, fecha, producto_id, cliente_id)
    VALUES (compra_cantidad, CURDATE(), @producto_id, @cliente_id);
    COMMIT;
    SELECT 'Completa';
END //
DELIMITER ;

CALL cliente_orden('Zapatos', 'Carla Capelli', 'Buenos Aires 1223','carlacapelli84@gmail.com',2);
CALL cliente_orden('producto que no existe', 'Ezequiel Velez', 'Buenos Aires 1223','ezequiel@gmail.com',3);
