CREATE DATABASE logistica;
USE logistica;

CREATE TABLE paises (
    id_pais VARCHAR(9),
    nombre VARCHAR(25),
    CONSTRAINT pk_id_pais PRIMARY KEY (id_pais)
);

CREATE TABLE ciudades (
    id_ciudades VARCHAR(5),
    nombre VARCHAR(30),
    id_pais VARCHAR(9),
    CONSTRAINT pk_id_ciudades PRIMARY KEY (id_ciudades),
    CONSTRAINT fk_pais_ciudad FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
);

CREATE TABLE sucursales (
    id_sucursal INT AUTO_INCREMENT,
    direccion VARCHAR(30),  
    id_ciudad VARCHAR(5),
    CONSTRAINT pk_id_sucursal PRIMARY KEY (id_sucursal),
    CONSTRAINT fk_ciudad_sucursal FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudades)
);

CREATE TABLE marcas (
    id_marca INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    CONSTRAINT pk_id_marca PRIMARY KEY (id_marca)
);

CREATE TABLE modelos (
    id_modelo INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    id_marca INT,
    CONSTRAINT pk_id_modelo PRIMARY KEY (id_modelo),  
    CONSTRAINT fk_marca_modelos FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);

CREATE TABLE vehiculos (
    placa VARCHAR(7) NOT NULL UNIQUE,
    capacidad_carga DECIMAL(10, 2),  
    modelo_id INT,
    sucursal_id INT,
    CONSTRAINT pk_id_vehiculo PRIMARY KEY (placa),
    CONSTRAINT fk_sucursal_vehiculo FOREIGN KEY (sucursal_id) REFERENCES sucursales(id_sucursal),  
    CONSTRAINT fk_modelo_vehiculo FOREIGN KEY (modelo_id) REFERENCES modelos(id_modelo)  
);

CREATE TABLE tipodocumentos (
    id_tipodoc INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    CONSTRAINT pk_id_tipodoc PRIMARY KEY (id_tipodoc)
);

CREATE TABLE conductores (
    id_conductor INT,
    nombre VARCHAR(30),
    id_tipdoc INT,  
    CONSTRAINT pk_id_conductores PRIMARY KEY (id_conductor),
    CONSTRAINT fk_tipodoc_conductores FOREIGN KEY (id_tipdoc) REFERENCES tipodocumentos(id_tipodoc) 
);

CREATE TABLE rutas (
    id_rutas INT AUTO_INCREMENT,
    sucursal_id INT,
    descripcion VARCHAR(100),
    CONSTRAINT pk_id_rutas PRIMARY KEY (id_rutas),
    CONSTRAINT fk_sucursal_rutas FOREIGN KEY (sucursal_id) REFERENCES sucursales(id_sucursal) 
);

CREATE TABLE rutasconductor (
    conductor_id INT,
    ruta_id INT,
    vehiculo_id VARCHAR(8),
    sucursal_id INT,
    CONSTRAINT pk_id_rutasconductor PRIMARY KEY (conductor_id, ruta_id),  
    CONSTRAINT fk_conductor_rutasconductor FOREIGN KEY (conductor_id) REFERENCES conductores(id_conductor), 
    CONSTRAINT fk_ruta_rutasconductor FOREIGN KEY (ruta_id) REFERENCES rutas(id_rutas),
    CONSTRAINT fk_vehiculos_rutasconductor FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(placa),  
    CONSTRAINT fk_sucursal_rutasconductor FOREIGN KEY (sucursal_id) REFERENCES sucursales(id_sucursal)  
);

CREATE TABLE estados (
    id_estados INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    CONSTRAINT pk_id_estados PRIMARY KEY (id_estados)
);

CREATE TABLE tiposervicios (
    id_servicios INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    CONSTRAINT pk_id_tiposervicios PRIMARY KEY (id_servicios)
);

CREATE TABLE paquetes (
    id_paquete INT AUTO_INCREMENT,
    id_seguimiento INT,
    peso DECIMAL(10, 2),
    dimensiones VARCHAR(50), 
    contenido TEXT,
    valor_declarado DOUBLE,
    id_tiposervicio INT,
    id_estado INT,
    CONSTRAINT pk_id_paquetes PRIMARY KEY (id_paquete), 
    CONSTRAINT fk_tiposervicios_paquetes FOREIGN KEY (id_tiposervicio) REFERENCES tiposervicios(id_servicios),
    CONSTRAINT fk_estado_paquetes FOREIGN KEY (id_estado) REFERENCES estados(id_estados)  
);

CREATE TABLE seguimientos (
    id_seguimiento INT AUTO_INCREMENT,
    id_paquete INT,
    ubicacion VARCHAR(200),
    fechahora TIMESTAMP,
    CONSTRAINT pk_id_seguimientos PRIMARY KEY (id_seguimiento),    
    CONSTRAINT fk_paquete_seguimientos FOREIGN KEY (id_paquete) REFERENCES paquetes(id_paquete)
);

CREATE TABLE clientes (
    id_cliente INT,
    nombre VARCHAR(30),
    correo VARCHAR(50),
    direccion VARCHAR(50),
    id_tipodoc INT, 
    CONSTRAINT pk_id_clientes PRIMARY KEY (id_cliente),
    CONSTRAINT fk_tipodoc_clientes FOREIGN KEY (id_tipodoc) REFERENCES tipodocumentos(id_tipodoc)
);

CREATE TABLE auxiliares (
    id_auxiliar INT,  
    nombre VARCHAR (30),
    telefono INT,
    id_tipodoc INT, 
    CONSTRAINT pk_id_auxiliares PRIMARY KEY (id_auxiliar),
    CONSTRAINT fk_tipodoc_auxiliares FOREIGN KEY (id_tipodoc) REFERENCES tipodocumentos(id_tipodoc)
);

CREATE TABLE envios (
    id_envio INT AUTO_INCREMENT,
    id_cliente INT,
    id_paquete INT,
    id_sucursal INT,
    fecha_envio TIMESTAMP,  
    destino VARCHAR(100),
    CONSTRAINT pk_id_envios PRIMARY KEY (id_envio),
    CONSTRAINT fk_envios_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_envios_paquete FOREIGN KEY (id_paquete) REFERENCES paquetes(id_paquete),
    CONSTRAINT fk_envios_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

CREATE TABLE rutasauxiliares (
    ruta_id INT,
    id_auxiliar INT,  
    CONSTRAINT pk_rutasauxiliares PRIMARY KEY (ruta_id, id_auxiliar),  
    CONSTRAINT fk_ruta_rutasauxiliares FOREIGN KEY (ruta_id) REFERENCES rutas(id_rutas),
    CONSTRAINT fk_auxiliar_rutasauxiliares FOREIGN KEY (id_auxiliar) REFERENCES auxiliares(id_auxiliar)
);

CREATE TABLE telconductores (
    id_conductor INT,
    telefono VARCHAR(15),
    CONSTRAINT pk_telconductores PRIMARY KEY (id_conductor, telefono),
    CONSTRAINT fk_conductor_telconductores FOREIGN KEY (id_conductor) REFERENCES conductores(id_conductor)
);

CREATE TABLE telclientes (
    id_cliente INT,
    telefono VARCHAR(15),
    CONSTRAINT pk_telclientes PRIMARY KEY (id_cliente, telefono),
    CONSTRAINT fk_cliente_telclientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE historial (
    id_historial INT AUTO_INCREMENT,
    descripcion TEXT,
    fecha TIMESTAMP,
    CONSTRAINT pk_historial PRIMARY KEY (id_historial)
);
