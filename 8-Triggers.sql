-- Crea un TRIGGER que actualice el stock de un producto después de realizar una orden de compra.
DELIMITER //
CREATE TRIGGER actualizar_stock AFTER INSERT ON compra
FOR EACH ROW
BEGIN
  UPDATE producto SET stock = stock - NEW.cantidad WHERE producto_id = NEW.producto_id;
END//
DELIMITER ;

-- Verifica que el TRIGGER se dispare correctamente y actualice el stock de manera adecuada.

SELECT stock from producto WHERE nombre = 'blusa';
CALL cliente_orden('blusa', 'Maria Pazos', 'Rivadavia 132','maria-pazos@gmail.com',3);
SELECT stock from producto WHERE nombre = 'blusa';