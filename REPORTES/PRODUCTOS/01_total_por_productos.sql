
SELECT 
    p.producto,
    SUM(d.cantidad) AS Ventas_totales

FROM productos p
INNER JOIN detalle_pedidos d
    ON p.id = d.producto_id
GROUP BY p.producto
ORDER BY Ventas_totales DESC
;
