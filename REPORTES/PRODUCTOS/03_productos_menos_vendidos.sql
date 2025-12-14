


SELECT 
    p.producto,
    SUM(d.cantidad) AS Total_ventas

FROM productos p
INNER JOIN detalle_pedidos d
    ON p.id = d.producto_id
GROUP BY p.producto
-- ASC para los menos vendidos
ORDER BY Total_ventas ASC
FETCH FIRST 5 ROWS WITH TIES -- para incluir empates en el 5to lugar
;