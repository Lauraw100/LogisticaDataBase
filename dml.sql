-- Paises --
INSERT INTO paises (id_pais, nombre) VALUES 
('COL', 'Colombia'), 
('USA', 'United States'), 
('MEX', 'Mexico'), 
('ARG', 'Argentina'), 
('BRA', 'Brazil'), 
('CHL', 'Chile');

-- Ciudades --
INSERT INTO ciudades (id_ciudades, nombre, id_pais) VALUES 
('BOG', 'Bogotá', 'COL'), 
('NYC', 'New York', 'USA'), 
('CDMX', 'Ciudad de México', 'MEX'), 
('BUE', 'Buenos Aires', 'ARG'), 
('RIO', 'Rio de Janeiro', 'BRA'), 
('SCL', 'Santiago', 'CHL');

-- Sucursales --
INSERT INTO sucursales (direccion, id_ciudad) VALUES 
('Calle 123', 'BOG'), 
('Avenida 456', 'NYC'), 
('Boulevard 789', 'CDMX'), 
('Calle 1', 'BUE'), 
('Rua 2', 'RIO'), 
('Avenida 3', 'SCL');

-- Marcas --
INSERT INTO marcas (nombre) VALUES 
('Toyota'), 
('Ford'), 
('Chevrolet'), 
('Nissan'), 
('Honda'), 
('Hyundai');

-- Modelos --
INSERT INTO modelos (nombre, id_marca) VALUES 
('Corolla', 1), 
('Focus', 2), 
('Malibu', 3), 
('Sentra', 4), 
('Civic', 5), 
('Elantra', 6);

-- Camiones --
INSERT INTO camiones (placa, capacidad_carga, modelo_id, sucursal_id) VALUES 
('ABC123', 1000.00, 1, 1), 
('DEF456', 1200.00, 2, 2), 
('GHI789', 1500.00, 3, 3), 
('JKL012', 1300.00, 4, 4), 
('MNO345', 1100.00, 5, 5), 
('PQR678', 1600.00, 6, 6);

-- Tipodocumentos --
INSERT INTO tipodocumentos (nombre) VALUES 
('Cédula'), 
('Pasaporte'), 
('Licencia de Conducción'), 
('NIT'), 
('Tarjeta de Identidad'), 
('Registro Civil');

-- Conductores --
INSERT INTO conductores (id_conductor, nombre, id_tipdoc) VALUES 
(1, 'Juan Pérez', 1), 
(2, 'John Doe', 2), 
(3, 'Jane Smith', 3), 
(4, 'Carlos García', 1), 
(5, 'Ana Torres', 2), 
(6, 'Luis Rodríguez', 3);

-- Rutas --
INSERT INTO rutas (sucursal_id, descripcion) VALUES 
(1, 'Ruta 1 Bogotá'), 
(2, 'Ruta 2 New York'), 
(3, 'Ruta 3 Ciudad de México'), 
(4, 'Ruta 4 Buenos Aires'), 
(5, 'Ruta 5 Rio de Janeiro'), 
(6, 'Ruta 6 Santiago');

-- RutasConductor --
INSERT INTO rutasconductor (conductor_id, ruta_id, vehiculo_id, sucursal_id) VALUES 
(1, 1, 'ABC123', 1), 
(2, 2, 'DEF456', 2), 
(3, 3, 'GHI789', 3), 
(4, 4, 'JKL012', 4), 
(5, 5, 'MNO345', 5), 
(6, 6, 'PQR678', 6);

-- Estados --
INSERT INTO estados (nombre) VALUES 
('En tránsito'), 
('Entregado'), 
('Pendiente'), 
('Devuelto'), 
('Cancelado'), 
('Reprogramado');

-- Tiposervicios --
INSERT INTO tiposervicios (nombre) VALUES 
('Express'), 
('Estandar'), 
('Económico'), 
('Premium'), 
('Overnight'), 
('Same Day');

-- Paquetes --
INSERT INTO paquetes (id_seguimiento, peso, dimensiones, contenido, valor_declarado, id_tiposervicio, id_estado) VALUES 
(1, 5.00, '10x10x10', 'Libros', 50.00, 1, 1), 
(2, 2.50, '5x5x5', 'Ropa', 25.00, 2, 2), 
(3, 3.75, '15x10x5', 'Electrónica', 200.00, 3, 3), 
(4, 7.00, '20x20x20', 'Juguetes', 75.00, 4, 4), 
(5, 1.25, '8x8x8', 'Cosméticos', 35.00, 5, 5), 
(6, 4.50, '12x12x12', 'Accesorios', 100.00, 6, 6);

-- Seguimientos --
INSERT INTO seguimientos (id_paquete, ubicacion, fechahora) VALUES 
(1, 'Bodega Bogotá', '2023-01-01 10:00:00'), 
(2, 'Centro de Distribución New York', '2023-01-02 12:00:00'), 
(3, 'Almacén Ciudad de México', '2023-01-03 14:00:00'), 
(4, 'Depósito Buenos Aires', '2023-01-04 16:00:00'), 
(5, 'Estación Rio de Janeiro', '2023-01-05 18:00:00'), 
(6, 'Hub Santiago', '2023-01-06 20:00:00');

-- Clientes --
INSERT INTO clientes (id_cliente, nombre, correo, direccion, id_tipodoc) VALUES 
(1, 'Carlos Muñoz', 'carlos@example.com', 'Calle Falsa 123', 1), 
(2, 'Maria López', 'maria@example.com', 'Avenida Siempre Viva 456', 2), 
(3, 'Pedro Fernández', 'pedro@example.com', 'Boulevard de los Sueños Rotos 789', 3), 
(4, 'Lucía Gómez', 'lucia@example.com', 'Carrera 7 #123-45', 1), 
(5, 'Miguel Ruiz', 'miguel@example.com', 'Calle 8 #12-34', 2), 
(6, 'Sandra Torres', 'sandra@example.com', 'Avenida 1 #1-1', 3);

-- Auxiliares --
INSERT INTO auxiliares (id_auxiliar, nombre, telefono, id_tipodoc) VALUES 
(1, 'Jorge Ramírez', 1234567890, 1), 
(2, 'Ana María', 2345678901, 2), 
(3, 'Felipe Martínez', 3456789012, 3), 
(4, 'Elena Sánchez', 4567890123, 1), 
(5, 'Raúl Pérez', 5678901234, 2), 
(6, 'Claudia Moreno', 6789012345, 3);

-- Envios --
INSERT INTO envios (id_cliente, id_paquete, id_sucursal, fecha_envio, id_rutas, destino) VALUES 
(1, 1, 1, '2023-01-01 08:00:00', 1, 'Calle 123, Bogotá'), 
(2, 2, 2, '2023-01-02 09:00:00', 2, 'Avenida 456, New York'), 
(3, 3, 3, '2023-01-03 10:00:00', 3, 'Boulevard 789, Ciudad de México'), 
(4, 4, 4, '2023-01-04 11:00:00', 4, 'Calle 1, Buenos Aires'), 
(5, 5, 5, '2023-01-05 12:00:00', 5, 'Rua 2, Rio de Janeiro'), 
(6, 6, 6, '2023-01-06 13:00:00', 6, 'Avenida 3, Santiago');

-- RutasAuxiliares --
INSERT INTO rutasauxiliares (ruta_id, id_auxiliar) VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5), 
(6, 6);

-- TelConductores --
INSERT INTO telconductores (id_conductor, telefono) VALUES 
(1, '3111234567'), 
(2, '3222345678'), 
(3, '3333456789'), 
(4, '3444567890'), 
(5, '3555678901'), 
(6, '3666789012');

-- TelClientes --
INSERT INTO telclientes (id_cliente, telefono) VALUES 
(1, '3011234567'), 
(2, '3122345678'), 
(3, '3233456789'), 
(4, '3344567890'), 
(5, '3455678901'), 
(6, '3566789012');