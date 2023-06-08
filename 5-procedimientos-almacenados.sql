USE venta;

-- Crea un STORE PROCEDURE que calcule el total de ventas para un cliente dado.
DELIMITER //

CREATE PROCEDURE compras_cliente(IN nro_cliente INT, OUT cantidad_compras INT)
BEGIN
    SELECT COUNT(*) INTO cantidad_compras
    FROM compra
    WHERE cliente_id = nro_cliente;
END //

DELIMITER ;

-- Utiliza el STORE PROCEDURE para obtener el total de ventas de un cliente específico.
CALL compras_cliente(10, @cantidad);
SELECT @cantidad;