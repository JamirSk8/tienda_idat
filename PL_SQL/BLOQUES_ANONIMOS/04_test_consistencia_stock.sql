SELECT * FROM vista_stock_productos;
SELECT * FROM vista_detalle_pedidos_clientes;

BEGIN
    paquete_tienda_idat.agregar_detalle_pedido(
        2, -- pedido id
        1, -- producto id
        9999  -- extremooo Cantidad V:<< 
    );
END;

