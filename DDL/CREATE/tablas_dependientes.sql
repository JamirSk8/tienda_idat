-- ===================
-- PRODUCTOS
-- =================== 
CREATE TABLE productos (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    producto VARCHAR2(180) NOT NULL,
    categoria_id NUMBER NOT NULL,
    proveedor_id NUMBER NOT NULL,
    precio_actual NUMBER(7,2) NOT NULL,  -- 99,999.00 (7,2) -> no creo que pasen los 10,000.00so

    fecha_creacion DATE DEFAULT SYSDATE,

    CONSTRAINT fk_productos_categorias
        FOREIGN KEY (categoria_id) REFERENCES categorias(id),

    CONSTRAINT fk_productos_proveedores
        FOREIGN KEY (proveedor_id) REFERENCES proveedores(id),

    CONSTRAINT check_productos_precio_actual CHECK(precio_actual > 0)

);


-- ===================
-- INVENTARIOS
-- =================== 

CREATE TABLE inventarios(
    producto_id NUMBER PRIMARY KEY,
    stock NUMBER NOT NULL,
    stock_minimo NUMBER NOT NULL,

    CONSTRAINT fk_invetarios_productos
        FOREIGN KEY (producto_id) REFERENCES productos(id),

    CONSTRAINT check_inventarios_stock CHECK(stock >= 0),

    CONSTRAINT check_inventarios_stock_minimo CHECK(stock_minimo >= 0)

);
