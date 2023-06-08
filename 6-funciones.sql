USE venta;
-- crea una función que calcule el promedio de precios de los productos.
DELIMITER //
CREATE FUNCTION promedio_precios()
RETURNS DECIMAL(10, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE promedio DECIMAL(10, 2);
    SELECT AVG(precio) INTO promedio
    FROM producto;
    RETURN promedio;
END; //

DELIMITER ;

-- Utiliza la función para obtener el promedio de precios de todos los productos.
SELECT promedio_precios();

