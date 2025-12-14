CREATE OR REPLACE VIEW vista_stock_productos AS
SELECT
    p.id AS producto_id,
    p.producto,
    p.precio_actual,
    i.stock
FROM productos p
JOIN inventarios i
    ON p.id = i.producto_id
;
