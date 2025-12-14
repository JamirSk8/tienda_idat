-- ===================
-- PEDIDOS
-- ===================
CREATE TABLE pedidos(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente_id NUMBER NOT NULL,
    fecha_pedido DATE DEFAULT SYSDATE,
    total NUMBER(9,2) DEFAULT 0 NOT NULL,

    CONSTRAINT fk_pedidos_clientes
        FOREIGN KEY (cliente_id) REFERENCES clientes(id),

    CONSTRAINT check_pedidos_total CHECK(total >= 0)
);


-- ===================
-- DETALLE PEDIDOS
-- ===================
CREATE TABLE detalle_pedidos(
    pedido_id NUMBER NOT NULL,
    producto_id NUMBER NOT NULL,
    precio_unitario NUMBER(7,2) NOT NULL,
    cantidad NUMBER NOT NULL,

    CONSTRAINT pk_detalle_pedidos PRIMARY KEY(pedido_id, producto_id),

    CONSTRAINT fk_detalle_pedidos_pedidos
        FOREIGN KEY (pedido_id) REFERENCES pedidos(id),

    CONSTRAINT fk_detalle_pedidos_productos
        FOREIGN KEY (producto_id) REFERENCES productos(id),

    CONSTRAINT check_detalle_pedidos_precio_unitario CHECK(precio_unitario > 0),

    CONSTRAINT check_detalle_pedidos_cantidad CHECK(cantidad > 0)

);
