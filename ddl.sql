CREATE DATABASE logistica;
USE logistica;

CREATE TABLE paises(
    id_pais VARCHAR(9),
    nombre VARCHAR(25),
    CONSTRAINT pk_id_pais PRIMARY KEY (id_pais)
);
CREATE TABLE ciudades(
    id_ciudades VARCHAR(5),
    nombre VARCHAR(30),
    id_pais VARCHAR(9),
    CONSTRAINT pk_id_ciudades PRIMARY KEY (id_ciudades),
    CONSTRAINT fk_pais_ciudad FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
)
CREATE TABLE sucursales(
    id_sucursal INT AUTO_INCREMENT,
    direcion VARCHAR(30),
    id_ciudad VARCHAR(5),
    CONSTRAINT pk_id_sucursal PRIMARY KEY (id_sucursal),
    CONSTRAINT fk_ciudad_surcursal FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudades)
)
CREATE TABLE marcas(
    id_marca INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    CONSTRAINT pk_id_marca PRIMARY KEY (id_marca)
)
CREATE TABLE modelos(
    id_modelo INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    id_marca INT,
    CONSTRAINT pk_id_marca PRIMARY KEY (id_modelo),
    CONSTRAINT fk_marca_modelos FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
)
CREATE TABLE vehiculos(
    placa VARCHAR(7) NOT NULL UNIQUE,
    Capacidadcarga DECIMAL(10, 2),
    modeloid INT,
    sucursalid INT,
    CONSTRAINT pk_id_vehiculo PRIMARY KEY (placa),
    CONSTRAINT fk_sucursal_vehiculo FOREIGN KEY (sucursalid) REFERENCES sucursal(id),
    CONSTRAINT fk_modelo_vehiculo FOREIGN KEY (modeloid) REFERENCES modelo(id)
)
CREATE TABLE tipodocumentos(
    id_tipodoc INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    CONSTRAINT pk_id_tipodoc PRIMARY KEY (id_tipodoc)
)
CREATE TABLE conductores(
    id_conductor INT,
    nombre VARCHAR(30),
    id_tipdoc INT,
    CONSTRAINT pk_id_conductores PRIMARY KEY (id_conductor),
    CONSTRAINT fk_tipodoc_conductores FOREIGN KEY (id_tipdoc) REFERENCES tipodocumentos(id_tipodoc)  
)

CREATE TABLE rutas(
    idrutas INT AUTO_INCREMENT,
    sucursalid INT,
    descripcion VARCHAR(100),
    CONSTRAINT pk_id_rutas PRIMARY KEY (idrutas),
    CONSTRAINT fk_sucursal_rutas FOREIGN KEY (sucursalid) REFERENCES sucursal(id)
)
CREATE TABLE rutasconductor (
    conductorid INT,
    rutaid INT,
    vehiculoid VARCHAR(7),
    sucursalid INT,
    CONSTRAINT pk_id_vehiculo PRIMARY KEY (conductorid, rutaid),
    CONSTRAINT fk_conductor_rutasconductor FOREIGN KEY (conductorid) REFERENCES conductores(id),
    CONSTRAINT fk_ruta_rutasconductor FOREIGN KEY (rutaid) REFERENCES rutas(id),
    CONSTRAINT fk_vehiculos_rutasconductor FOREIGN KEY (vehiculoid) REFERENCES vehiculo(id),
    CONSTRAINT fk_sucursal_rutasconductor FOREIGN KEY (sucursalid) REFERENCES sucursal(id)
);
CREATE TABLE estados(
    idestados INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    CONSTRAINT pk_id_estados PRIMARY KEY (idestados)    
)
CREATE TABLE tiposervicios(
     idservicios INT AUTO_INCREMENT,
     nombre VARCHAR(30)
    CONSTRAINT pk_id_tiposervicios PRIMARY KEY (idservicios)    
)
CREATE TABLE paquetes (
    idpaquete INT AUTO_INCREMENT,
    idseguimiento INT,
    peso DECIMAL(10,2),
    dimenciones VARCHAR(50),
    contenido TEXT,
    valordeclarado DOUBLE,
    idtiposervicio INT,
    idestado INT,
    CONSTRAINT pk_id_paquetes PRIMARY KEY (idpaquetes),    
    CONSTRAINT fk_tiposervicios_paquetes FOREIGN KEY (idtiposervicio) REFERENCES tiposervicios(idservicios),
    CONSTRAINT fk_estado_paquetes FOREIGN KEY (idestado) REFERENCES estados(idestados)
)

CREATE TABLE seguimientos (
    idseguimiento INT AUTO_INCREMENT,
    idpaquete INT,
    ubicacion VARCHAR(200),
    fechahora TIMESTAMP,
    CONSTRAINT pk_id_seguimientos PRIMARY KEY (idseguimiento),    
    CONSTRAINT fk_paquete_seguimientos FOREIGN KEY (idpaquete) REFERENCES paquetes(idpaquete)
)
CREATE TABLE clientes(
    idcliente INTEGER,
    nombre VARCHAR(30),
    correo VARCHAR(50),
    direccion VARCHAR(50),
    idtipdoc INT,
    CONSTRAINT pk_id_clientes PRIMARY KEY (idcliente),
    CONSTRAINT fk_tipodoc_clientes FOREIGN KEY (idtipdoc) REFERENCES tipodocumentos(idtipodoc)
)

CREATE TABLE auxiliares(
    idauxiliares INT,
    nombre VARCHAR (30),
    telefono INT,
    idtipdoc INT,
    CONSTRAINT pk_id_auxiliares PRIMARY KEY (idauxiliares),
    CONSTRAINT fk_tipodoc_auxiliares FOREIGN KEY (idtipdoc) REFERENCES tipodocumentos(idtipodoc)

)
CREATE TABLE envios(
    idenvio INT AUTO_INCREMENT,
    idcliente INTEGER,
    idpaquete INTEGER,
    idsucursal INTEGER,
    fehaenvio TIMESTAMP,
    destino VARCHAR(100),
    CONSTRAINT pk_id_envios PRIMARY KEY (idenvio),
    CONSTRAINT fk_envios_clientes FOREIGN KEY (idcliente) REFERENCES clientes(idcliente),
    CONSTRAINT fk_envios_paquete FOREIGN KEY (idpaquete) REFERENCES paquetes(idpaquete),
    CONSTRAINT fk_envios_sucursal FOREIGN KEY (idsucursal) REFERENCES sucursales(idsucursal)
)
CREATE TABLE rutasauxiliares(
    
)
CREATE TABLE telconductores(
    
)
CREATE TABLE telclientes(
    
)