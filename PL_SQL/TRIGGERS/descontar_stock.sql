

CREATE OR REPLACE TRIGGER trigger_descontar_stock
AFTER INSERT ON detalle_pedidos
FOR EACH ROW
BEGIN
    UPDATE inventarios
    SET stock = stock - :NEW.cantidad
    WHERE producto_id = :NEW.producto_id;
END;
/