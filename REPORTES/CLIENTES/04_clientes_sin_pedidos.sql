

SELECT
    c.nombres || ' ' || c.apellidos AS Nombre,
    c.correo AS Correo,
    c.distrito AS Distrito,

FROM clientes c
-- left porque puede que haya clientes sin pedidos
LEFT JOIN pedidos p 
    ON c.id = p.cliente_id
WHERE p.id IS NULL;