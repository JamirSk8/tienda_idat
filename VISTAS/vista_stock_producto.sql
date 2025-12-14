CREATE OR REPLACE VIEW vista_stock_productos AS
SELECT
    p.id AS producto_id,
    p.producto,
    p.precio_actual,
    i.stock,
    i.stock_minimo,

    CASE
        WHEN i.stock < i.stock_minimo THEN 'DESABASTECIMIENTO'
        WHEN i.stock = i.stock_minimo THEN 'URGENTE SOLICITAR STOCK'
        WHEN i.stock = i.stock_minimo + 2 THEN 'STOCK BAJO'
        ELSE 'STOCK ADECUADO'
    END AS estado_stock
FROM productos p
JOIN inventarios i
    ON p.id = i.producto_id
;
