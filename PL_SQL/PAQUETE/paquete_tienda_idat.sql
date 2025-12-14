

-- CABECERA 

CREATE OR REPLACE PACKAGE paquete_tienda_idat AS

    PROCEDURE agregar_detalle_pedido(
        entrada_pedido_id   IN NUMBER,
        entrada_producto_id IN NUMBER,
        entrada_cantidad    IN NUMBER
    );

    PROCEDURE reponer_stock(
        entrada_producto_id IN NUMBER,
        entrada_cantidad    IN NUMBER
    );

    FUNCTION function_stock_disponible(
        entrada_producto_id IN NUMBER
    ) RETURN NUMBER;

END paquete_tienda_idat;
/


-- CUERPO
CREATE OR REPLACE PACKAGE BODY paquete_tienda_idat AS

    PROCEDURE agregar_detalle_pedido(
        entrada_pedido_id   IN NUMBER,
        entrada_producto_id IN NUMBER,
        entrada_cantidad    IN NUMBER
    ) IS
        precio_unitario_actual productos.precio_actual%TYPE;
        stock_disponible inventarios.stock%TYPE;
    BEGIN
        SELECT precio_actual
        INTO precio_unitario_actual
        FROM productos
        WHERE id = entrada_producto_id;

        SELECT stock
        INTO stock_disponible
        FROM inventarios
        WHERE producto_id = entrada_producto_id;

        IF stock_disponible < entrada_cantidad THEN
            RAISE_APPLICATION_ERROR(-20001, 'No hay stock mi king');
        END IF;

        INSERT INTO detalle_pedidos (pedido_id, producto_id, precio_unitario, cantidad)
        VALUES (entrada_pedido_id, entrada_producto_id, precio_unitario_actual, entrada_cantidad);

        UPDATE pedidos
        SET total = total + (precio_unitario_actual * entrada_cantidad)
        WHERE id = entrada_pedido_id;
    END agregar_detalle_pedido;


    PROCEDURE reponer_stock(
        entrada_producto_id IN NUMBER,
        entrada_cantidad IN NUMBER
    ) IS
    BEGIN
        UPDATE inventarios
        SET stock = stock + entrada_cantidad
        WHERE producto_id = entrada_producto_id;
    END reponer_stock;


    FUNCTION function_stock_disponible(
        entrada_producto_id IN NUMBER
    ) RETURN NUMBER IS
        stock_disponible_producto inventarios.stock%TYPE;
    BEGIN
        SELECT stock
        INTO stock_disponible_producto
        FROM inventarios
        WHERE producto_id = entrada_producto_id;

        RETURN stock_disponible_producto;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
    END function_stock_disponible;

END paquete_tienda_idat;
/
