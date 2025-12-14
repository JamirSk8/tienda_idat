


CREATE OR REPLACE PROCEDURE agregar_detalle_pedido(
    entrada_pedido_id IN NUMBER,
    entrada_producto_id IN NUMBER,
    entrada_cantidad IN NUMBER
) IS

    precio_unitario_actual productos.precio_actual%TYPE;
    stock_disponible inventarios.stock%TYPE;
BEGIN
    -- Primero el precio actual:
    SELECT precio_actual INTO precio_unitario_actual
    FROM productos
    WHERE id = entrada_producto_id;

    -- chequear el stock
    SELECT stock INTO stock_disponible
    FROM inventarios
    WHERE producto_id = entrada_producto_id;

    -- Validar si hay suficiente stock
    IF stock_disponible < entrada_cantidad THEN
    -- OJO ORACLE RESERVA -20000 … -20999 para mis errores V:<
        RAISE_APPLICATION_ERROR(-20001, 'No hay stock mi king');
    END IF;

    -- Insertar al detalle pedido
    INSERT INTO detalle_pedidos (pedido_id, producto_id, precio_unitario, cantidad)
    VALUES (entrada_pedido_id, entrada_producto_id, precio_unitario_actual, entrada_cantidad);

    -- Sumar al total del pedido que inicialmente empieza con 0 por el dafault 0
    UPDATE Pedidos
    SET total = total + (precio_unitario_actual * entrada_cantidad)
    WHERE id = entrada_pedido_id;
END;

