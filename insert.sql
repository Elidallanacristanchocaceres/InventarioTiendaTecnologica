INSERT INTO categorias (nombre, descripcion) VALUES
('Laptops', 'Computadoras portátiles de diferentes marcas y especificaciones'),
('Teléfonos', 'Smartphones y teléfonos móviles'),
('Accesorios', 'Accesorios para dispositivos electrónicos'),
('Componentes', 'Componentes de hardware para computadoras'),
('Periféricos', 'Dispositivos periféricos para computadoras');

INSERT INTO proveedores (nombre, direccion, telefono, email) VALUES
('TecnoSuministros SA', 'Av. Tecnológica 123', '555-1001', 'contacto@tecnosuministros.com'),
('ElectroParts', 'Calle Circuito 456', '555-1002', 'ventas@electroparts.com'),
('DigitalGlobal', 'Boulevard Digital 789', '555-1003', 'info@digitalglobal.com'),
('CompuMundo', 'Av. Microchip 101', '555-1004', 'contacto@compumundo.com'),
('TechImport', 'Calle Silicona 202', '555-1005', 'ventas@techimport.com'),
('ElectroVenta', 'Av. Transistores 303', '555-1006', 'info@electroventa.com'),
('ComponentesPC', 'Calle RAM 404', '555-1007', 'ventas@componentespc.com'),
('AccesoriosTech', 'Boulevard USB 505', '555-1008', 'contacto@accesoriostech.com'),
('MobileWorld', 'Av. Smartphone 606', '555-1009', 'ventas@mobileworld.com'),
('LaptopCity', 'Calle Portátil 707', '555-1010', 'info@laptopcity.com'),
('GadgetZone', 'Av. Innovación 808', '555-1011', 'contacto@gadgetzone.com'),
('ChipSet', 'Calle Procesador 909', '555-1012', 'ventas@chipset.com'),
('TechSolutions', 'Boulevard Software 1010', '555-1013', 'info@techsolutions.com'),
('DigitalWarehouse', 'Av. Almacenamiento 1111', '555-1014', 'ventas@digitalwarehouse.com'),
('ElectroNova', 'Calle Energía 1212', '555-1015', 'contacto@electronova.com');

INSERT INTO clientes (nombre, email, telefono, direccion) VALUES
('Juan Pérez', 'juan.perez@email.com', '555-2001', 'Calle Primavera 123'),
('María González', 'maria.gonzalez@email.com', '555-2002', 'Av. Flores 456'),
('Carlos López', 'carlos.lopez@email.com', '555-2003', 'Boulevard Árboles 789'),
('Ana Martínez', 'ana.martinez@email.com', '555-2004', 'Calle Sol 101'),
('Luis Rodríguez', 'luis.rodriguez@email.com', '555-2005', 'Av. Luna 202'),
('Sofía Hernández', 'sofia.hernandez@email.com', '555-2006', 'Calle Estrella 303'),
('Pedro García', 'pedro.garcia@email.com', '555-2007', 'Boulevard Planeta 404'),
('Laura Sánchez', 'laura.sanchez@email.com', '555-2008', 'Av. Galaxia 505'),
('Jorge Ramírez', 'jorge.ramirez@email.com', '555-2009', 'Calle Universo 606'),
('Mónica Flores', 'monica.flores@email.com', '555-2010', 'Av. Vía Láctea 707'),
('Ricardo Torres', 'ricardo.torres@email.com', '555-2011', 'Boulevard Cometa 808'),
('Elena Castro', 'elena.castro@email.com', '555-2012', 'Calle Meteorito 909'),
('Fernando Ruiz', 'fernando.ruiz@email.com', '555-2013', 'Av. Asteroide 1010'),
('Diana Mendoza', 'diana.mendoza@email.com', '555-2014', 'Calle Nebulosa 1111'),
('Roberto Vargas', 'roberto.vargas@email.com', '555-2015', 'Boulevard Eclipse 1212');

INSERT INTO productos (nombre, descripcion, precio, stock, categoria_id, proveedor_id) VALUES
('Laptop HP Pavilion', 'Laptop HP Pavilion 15.6", Intel Core i5, 8GB RAM, 512GB SSD', 899.99, 10, 1, 1),
('Smartphone Samsung Galaxy S21', 'Smartphone Samsung Galaxy S21 128GB, 5G, 6.2" AMOLED', 799.99, 15, 2, 2),
('Teclado Mecánico RGB', 'Teclado mecánico gaming con retroiluminación RGB', 89.99, 25, 5, 3),
('Mouse Inalámbrico Logitech', 'Mouse inalámbrico Logitech MX Master 3', 99.99, 30, 5, 4),
('Monitor LG 27" 4K', 'Monitor LG 27" Ultra HD 4K, IPS, HDR10', 349.99, 8, 5, 5),
('Disco Duro Externo 1TB', 'Disco duro externo Seagate 1TB USB 3.0', 59.99, 20, 4, 6),
('Tarjeta Gráfica NVIDIA RTX 3060', 'Tarjeta gráfica NVIDIA GeForce RTX 3060 12GB', 499.99, 5, 4, 7),
('Auriculares Sony WH-1000XM4', 'Auriculares inalámbricos Sony WH-1000XM4 con cancelación de ruido', 349.99, 12, 3, 8),
('Tablet Samsung Galaxy Tab S7', 'Tablet Samsung Galaxy Tab S7 11", 128GB, S Pen incluido', 649.99, 7, 2, 9),
('Router Wi-Fi 6 TP-Link', 'Router Wi-Fi 6 AX3000 Dual Band', 129.99, 15, 3, 10),
('Impresora Multifunción HP', 'Impresora multifunción HP LaserJet Pro MFP', 199.99, 9, 5, 11),
('SSD NVMe 1TB', 'Unidad SSD NVMe M.2 1TB, 3500MB/s', 129.99, 18, 4, 12),
('Cargador Portátil 20000mAh', 'Batería externa 20000mAh con carga rápida', 39.99, 22, 3, 13),
('Webcam Logitech C920', 'Webcam HD 1080p con micrófono integrado', 79.99, 14, 5, 14),
('Altavoz Bluetooth JBL', 'Altavoz Bluetooth portátil JBL Flip 5', 119.99, 11, 3, 15);


INSERT INTO ventas (cliente_id, fecha, total) VALUES
(1, '2023-01-15 10:30:00', 1049.98),
(2, '2023-01-16 11:45:00', 499.99),
(3, '2023-02-05 14:20:00', 229.98),
(4, '2023-02-10 16:15:00', 349.99),
(5, '2023-03-01 09:30:00', 179.98),
(6, '2023-03-15 13:10:00', 649.99),
(7, '2023-04-02 15:45:00', 129.99),
(8, '2023-04-20 10:20:00', 199.99),
(9, '2023-05-05 12:30:00', 129.99),
(10, '2023-05-18 14:50:00', 39.99),
(11, '2023-06-01 11:15:00', 79.99),
(12, '2023-06-15 16:30:00', 119.99),
(13, '2023-07-03 10:45:00', 899.99),
(14, '2023-07-20 13:20:00', 799.99),
(15, '2023-08-05 15:10:00', 89.99);

INSERT INTO detalles_venta (venta_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 899.99),
(1, 4, 1, 99.99),
(2, 7, 1, 499.99),
(3, 3, 1, 89.99),
(3, 5, 1, 349.99),
(4, 9, 1, 649.99),
(5, 6, 2, 59.99),
(6, 10, 1, 129.99),
(7, 11, 1, 199.99),
(8, 12, 1, 129.99),
(9, 13, 1, 39.99),
(10, 14, 1, 79.99),
(11, 15, 1, 119.99),
(12, 1, 1, 899.99),
(13, 2, 1, 799.99),
(14, 3, 1, 89.99);