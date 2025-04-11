## Documentación del Proyecto: Tienda Tecnológica (PostgreSQL)
Este proyecto implementa una base de datos para una tienda tecnológica, con funcionalidades, consultas analíticas y un procedimiento almacenado para registrar ventas. El sistema permite:

- Gestionar productos, clientes, categorías y ventas

- Registrar ventas con validación de stock

- Generar reportes de productos más vendidos y ventas por cliente

## Modelo E-R de la Base de Datos
![image](https://github.com/user-attachments/assets/758947a6-3ec9-4267-9242-aa23bc3f0e88)

## Instalación en PostgreSQL
- Requisitos
Tener PostgreSQL instalado

## Pasos para la creacionde la base de datos:
- Crear y entrar a la base de datos:

````sql
CREATE DATABASE tiendatecnologica;
\c tiendatecnologica;
````

## Ejecutar los scripts en orden:

- tiendatecnologica -db.sql
- tiendatecnologica -insert.sql
- tiendatecnologica -queries.sql
- tiendatecnologica -procedure.sql

## Descripción de Archivos
1. db.sql
Crea la estructura de la base de datos:

- CREATE TABLE categorias;
- CREATE TABLE proveedores;
- CREATE TABLE clientes;
- CREATE TABLE productos;
- CREATE TABLE ventas;
- CREATE TABLE detalles_ventas;

2. insert.sql
Inserta datos iniciales para pruebas:
````sql
INSERT INTO categorias (nombre, descripcion) VALUES
('Laptops', 'Computadoras portátiles de diferentes marcas y especificaciones'),
INSERT INTO productos VALUES (1, 'Laptop HP', 1200.00, 15, 1);

INSERT INTO proveedores (nombre, direccion, telefono, email) VALUES
('TecnoSuministros SA', 'Av. Tecnológica 123', '555-1001', 'contacto@tecnosuministros.com'),
````

3. queries.sql
1.Listar los productos con stock menor a 5 unidades.
```` sql
SELECT id, nombre, stock 
FROM productos 
WHERE stock < 5 
ORDER BY stock ASC;
```` 


## stock insuficiente

````sql
DO $$
DECLARE
    v_resultado TEXT;
BEGIN
    CALL sp_registrar_venta(
        1,                  
        ARRAY[1],           
        ARRAY[98],         
        v_resultado
    );
END;
$$;
````
