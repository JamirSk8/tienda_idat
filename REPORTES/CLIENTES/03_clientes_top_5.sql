

SELECT
    c.nombres || ' ' || c.apellidos AS Nombre,
    c.correo AS Correo,
    c.distrito AS Distrito,
    COUNT(p.id) AS Total_pedidos

FROM clientes c
-- left porque puede que haya clientes sin pedidos
LEFT JOIN pedidos p 
    ON c.id = p.cliente_id

GROUP BY c.nombres, c.apellidos, c.correo, c.distrito
ORDER BY Total_pedidos DESC
-- TOP 5:
FETCH FIRST 5 ROWS ONLY
;