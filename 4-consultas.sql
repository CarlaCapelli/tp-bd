USE venta;

-- Realiza una consulta utilizando SELECT JOIN para obtener la información de los productos comprados por cada cliente.
SELECT 
    c.nombre AS cliente_nombre, p.*
FROM
    compra co
        INNER JOIN
    cliente c ON co.cliente_id = c.cliente_id
        INNER JOIN
    producto p ON co.producto_id = p.producto_id;
    
-- Crea una VIEW que muestre los productos con descuento.
CREATE VIEW productos_con_descuento AS
    SELECT 
        *
    FROM
        producto
    WHERE
        descuento > 0 WITH CHECK OPTION;
        
        SELECT * FROM productos_con_descuento;

-- Crea un INDEX en la columna "nombre" de la tabla "Productos" para mejorar la velocidad de las consultas.
CREATE INDEX indice_nombre ON producto(nombre);