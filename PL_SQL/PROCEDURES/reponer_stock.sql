


CREATE OR REPLACE PROCEDURE reponer_stock(
    entrada_producto_id IN NUMBER,
    entrada_cantidad IN NUMBER
) IS
BEGIN
    UPDATE inventarios
    SET stock = stock + entrada_cantidad
    WHERE producto_id = entrada_producto_id;
END;
/


