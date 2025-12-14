
SELECT * FROM pedidos;
SELECT * FROM productos;
SELECT * FROM detalle_pedidos;

BEGIN

    paquete_tienda_idat.agregar_detalle_pedido(
        entrada_pedido_id   => 2,
        entrada_producto_id => 21,
        entrada_cantidad    => 3
    );
    
    DBMS_OUTPUT.PUT_LINE('Detalle agregado correctamente.');

END;
