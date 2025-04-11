CREATE DATABASE tiendatecnologica;
\c tiendatecnologica;

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

CREATE TABLE proveedores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT,
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    direccion TEXT,
    fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) CHECK (precio > 0),
    stock INTEGER NOT NULL CHECK (stock >= 0),
    categoria_id INTEGER REFERENCES categorias(id),
    proveedor_id INTEGER REFERENCES proveedores(id),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ventas (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) CHECK (total >= 0),
    estado VARCHAR(20) DEFAULT 'completada' CHECK (estado IN ('completada', 'cancelada', 'pendiente'))
);

CREATE TABLE detalles_venta (
    id SERIAL PRIMARY KEY,
    venta_id INTEGER REFERENCES ventas(id),
    producto_id INTEGER REFERENCES productos(id),
    cantidad INTEGER CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) CHECK (precio_unitario > 0),
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED
);

CREATE INDEX idx_productos_categoria ON productos(categoria_id);
CREATE INDEX idx_productos_proveedor ON productos(proveedor_id);
CREATE INDEX idx_ventas_cliente ON ventas(cliente_id);
CREATE INDEX idx_ventas_fecha ON ventas(fecha);
CREATE INDEX idx_detalles_venta_producto ON detalles_venta(producto_id);
