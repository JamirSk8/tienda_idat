


SELECT 
    p.producto,
    ROUND(AVG(d.precio_unitario * d.cantidad), 2) AS Ingreso_promedio_por_venta

FROM productos p
INNER JOIN detalle_pedidos d
    ON p.id = d.producto_id
GROUP BY p.producto
ORDER BY Precio_promedio_venta DESC
;