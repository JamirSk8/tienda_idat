



CREATE OR REPLACE VIEW vista_detalle_pedidos_clientes AS

SELECT
       p.id,
       c.nombres || ' ' || c.apellidos AS Nombre,
       pr.producto,
       dp.precio_unitario,
       dp.cantidad,
       (dp.precio_unitario * dp.cantidad) AS Sub_Total
FROM clientes c
INNER JOIN pedidos p
      ON c.id = p.cliente_id
INNER JOIN detalle_pedidos dp
      ON dp.pedido_id = p.id
INNER JOIN productos pr
      ON pr.id = dp.producto_id
ORDER BY p.id
;

SELECT * FROM vista_detalle_pedidos_clientes;
       
