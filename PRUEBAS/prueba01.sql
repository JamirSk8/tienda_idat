
-- Agregar 4 productos más 2 de logi y 2 de hyperx, solo categoria perifericos (id = 2)
-- hyperx id 1, logi id 2

-- 2 de hyperx
BEGIN
    -- 2 de hyperx
    INSERT INTO productos (producto, categoria_id, proveedor_id, precio_actual)
    VALUES ('Auriculares HyperX Cloud II', 2, 1, 320);
    INSERT INTO productos (producto, categoria_id, proveedor_id, precio_actual)
    VALUES ('Teclado HyperX Alloy FPS Pro', 2, 1, 250);
    -- 2 de logi
    INSERT INTO productos (producto, categoria_id, proveedor_id, precio_actual)
    VALUES ('Teclado Logitech G915', 2, 2, 600);
    INSERT INTO productos (producto, categoria_id, proveedor_id, precio_actual)
    VALUES ('Auriculares Logitech G733', 2, 2, 350);
    COMMIT;
END;


-- Existen los productos, pero no existen en la tabla inventarios
BEGIN
    INSERT INTO inventarios (producto_id, stock, stock_minimo)
    VALUES ( (SELECT p.id FROM productos p WHERE p.producto = 'Auriculares HyperX Cloud II'), 5, 2);

    INSERT INTO inventarios (producto_id, stock, stock_minimo)
    VALUES ( (SELECT p.id FROM productos p WHERE p.producto = 'Teclado HyperX Alloy FPS Pro'), 3, 2);

    INSERT INTO inventarios (producto_id, stock, stock_minimo)
    VALUES ( (SELECT p.id FROM productos p WHERE p.producto = 'Teclado Logitech G915'), 4, 2);

    INSERT INTO inventarios (producto_id, stock, stock_minimo)
    VALUES ( (SELECT p.id FROM productos p WHERE p.producto = 'Auriculares Logitech G733'), 6, 2);
    COMMIT;
END;


-- Agregar un usuario más
INSERT INTO clientes (nombres, apellidos, dni, correo, numero, distrito)
VALUES ('Sherlock', 'Holmes', '12345678', 'sherlock@gmail.com','123456789' , 'Miraflores');
COMMIT;
-- ID: 22 WTF xD

-- Crear un pedido con ese usuario
INSERT INTO pedidos (cliente_id)
VALUES ( (SELECT c.id FROM clientes c WHERE dni = '12345678') );
COMMIT;


-- Crear los detalle pedidos con el procedure
BEGIN
-- pedido, producto, cantidad
    paquete_tienda_idat.agregar_detalle_pedido(22, 21, 1);
    paquete_tienda_idat.agregar_detalle_pedido(22, 23, 1);
END;
/   