

-- voy a comprar 1 mouse logi y 2 memorias hyperx de 32 para tener 64 en mi pcerda
-- pedido id 1

-- Prirmero el mouse

-- El primer roche que tengo es no saber el precio unitario del producto, �C�mo hago para ubicarlo? o insertarlo?
-- 1. Un select o 2. Un procedure?
INSERT INTO detalle_pedidos (pedido_id, producto_id, precio_unitario, cantidad)
VALUES (1, 2,'no se el precio' , 1);


-- las memorias
INSERT INTO detalle_pedidos (pedido_id, producto_id, precio_unitario, cantidad)
VALUES (1, 1,'no se el precio' , 2);

-- ===========================================
-- Ya he creado el procedure y el trigger ⚠️⚠️⚠️⚠️ <- Pongo un emojis para acordarme y NO ES IA 👀
-- ===========================================
-- Procedure creado, ahora toca crear el trigger para reducir el stock
-- El mouse

-- POR ALGUNA RAZON MI ID PEDIDO ES 2 Y YA NO 1, ODIO ORACLE!
BEGIN
-- pedido, producto, cantidad
    agregar_detalle_pedido(2, 2, 1);  
END;
/

-- las ram
BEGIN
-- pedido, producto, cantidad
    agregar_detalle_pedido(2, 1, 2);  
END;
/


-- agregaré un 1 ram más al mismo pedido:
BEGIN
-- pedido, producto, cantidad
    agregar_detalle_pedido(2, 1, 1);  
END;
/

