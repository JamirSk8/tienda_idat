SELECT * FROM vista_stock_productos;

SELECT * FROM vista_stock_productos
WHERE stock <= stock_minimo
;

BEGIN
    paquete_tienda_idat.reponer_stock(
        21,  -- producto_id
        3  -- unidades repuestas
    );

    DBMS_OUTPUT.PUT_LINE('Stock repuesto correctamente.');
END;
