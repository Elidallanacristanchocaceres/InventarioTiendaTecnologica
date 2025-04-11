1.Listar los productos con stock menor a 5 unidades.

```` 
SELECT id, nombre, stock 
FROM productos 
WHERE stock < 5 
ORDER BY stock ASC;
```` 

2.Calcular ventas totales de un mes específico.
````
SELECT 
    EXTRACT(MONTH FROM fecha) AS mes,
    EXTRACT(YEAR FROM fecha) AS año,
    SUM(total) AS ventas_totales
FROM ventas
WHERE EXTRACT(MONTH FROM fecha) = 3 AND EXTRACT(YEAR FROM fecha) = 2023
GROUP BY mes, año;
```` 

3.Obtener el cliente con más compras realizadas.
````
SELECT 
    c.id,
    c.nombre,
    COUNT(v.id) AS total_compras,
    SUM(v.total) AS monto_total_gastado
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
GROUP BY c.id, c.nombre
ORDER BY total_compras DESC
LIMIT 1;
````

4. Listar los 5 productos más vendidos.
````
SELECT 
    p.id,
    p.nombre,
    SUM(dv.cantidad) AS unidades_vendidas,
    SUM(dv.subtotal) AS ingresos_totales
FROM productos p
JOIN detalles_venta dv ON p.id = dv.producto_id
GROUP BY p.id, p.nombre
ORDER BY unidades_vendidas DESC
LIMIT 5;
````

5.Consultar ventas realizadas en un rango de fechas de tres Días y un Mes.
````
SELECT 
    id,
    fecha,
    total,
    (SELECT nombre FROM clientes WHERE id = v.cliente_id) AS cliente
FROM ventas v
WHERE fecha >= CURRENT_DATE - INTERVAL '3 days'
ORDER BY fecha DESC;
````

6. Identificar clientes que no han comprado en los últimos 6 meses.
````
SELECT 
    id,
    nombre,
    email,
    (SELECT MAX(fecha) FROM ventas WHERE cliente_id = c.id) AS ultima_compra
FROM clientes c
WHERE NOT EXISTS (
    SELECT 1 FROM ventas v 
    WHERE v.cliente_id = c.id 
    AND v.fecha >= CURRENT_DATE - INTERVAL '6 months'
)
ORDER BY ultima_compra DESC NULLS LAST;
````