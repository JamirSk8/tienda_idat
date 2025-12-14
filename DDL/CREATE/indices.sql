

-- Productos

CREATE INDEX indice_productos_categoria
ON productos (categoria_id);

CREATE INDEX indice_productos_proveedor
ON productos (proveedor_id);

-- Pedidos
CREATE INDEX indice_pedidos_cliente
ON pedidos (cliente_id);


-- Detalle pedidos
CREATE INDEX indice_detalle_pedidos_producto
ON detalle_pedidos (producto_id);

CREATE INDEX indice_detalle_pedidos_pedido
ON detalle_pedidos (pedido_id);