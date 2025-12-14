

CREATE OR REPLACE FUNCTION  function_stock_disponible(
    entrada_producto_id IN NUMBER
)
RETURN NUMBER
IS 
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
END;


/* 
TEST:
---------

BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Stock producto 1: ' || function_stock_disponible(1)
    );
END;



*/