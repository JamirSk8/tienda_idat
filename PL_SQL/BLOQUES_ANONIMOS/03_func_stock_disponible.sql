

SELECT * FROM vista_stock_productos;

DECLARE
    entrada_producto productos.producto%TYPE;
    entrada_stock NUMBER;
    entrada_producto_id NUMBER := 1;-- <- Modificar el id del producto según se requiera 
BEGIN

    SELECT p.producto
    INTO entrada_producto
    FROM productos p
    WHERE p.id = entrada_producto_id;

    entrada_stock := paquete_tienda_idat.function_stock_disponible(entrada_producto_id);

    DBMS_OUTPUT.PUT_LINE('Producto: ' || entrada_producto);
    DBMS_OUTPUT.PUT_LINE('Stock disponible: ' || entrada_stock);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el producto con ID: ' || entrada_producto_id);
END;
