 <h2>CONSULTAS</h2>
<h4>1.Un administrador desea agregar un nuevo país a la base de datos.</h4>

   INSERT INTO paises (id_pais, nombre) VALUES ('CAN', 'Canada'); 

<h4>2.Un administrador desea agregar una nueva ciudad asociada a un país existente.</h4>

   INSERT INTO ciudades (id_ciudades, nombre,id_pais) VALUES ('VAN', 'Vancouver','CAN');

<h4>3.Un administrador desea agregar una nueva sucursal asociada a una ciudad
existente.</h4>

   INSERT INTO sucursales (direccion, id_ciudad) VALUES ('Calle 123', 'VAN'); 

<h4>4.Un administrador desea registrar un nuevo cliente en la base de datos.</h4>

   INSERT INTO clientes (id_cliente, nombre, correo, direccion, id_tipodoc) VALUES (7, 'Karol Ramirez', 'karol@example.com', 'Calle Falsa 132', 1); 

<h4>5.Un administrador desea agregar un número de teléfono para un cliente existente.</h4>

   INSERT INTO telclientes (id_cliente, telefono) VALUES (7, '3005035096');

<h4>6.Un administrador desea registrar un nuevo paquete en la base de datos.</h4>

   INSERT INTO paquetes (id_seguimiento, peso, dimensiones, contenido, valor_declarado, id_tiposervicio, id_estado) VALUES (7, 5.00, '10x10x10', 'peluches', 50.00, 1, 1); 

<h4>7.Un administrador desea registrar un nuevo envío, asociando un cliente, paquete,
ruta y sucursal.</h4>

   INSERT INTO envios (id_cliente, id_paquete, id_sucursal, fecha_envio, id_rutas, destino) VALUES (7, 7, 7, '2023-01-01 08:00:00', 1, 'Calle 132, Bogotá'); 

<h4>8.Un administrador desea agregar un nuevo vehículo a la base de datos.</h4>

   INSERT INTO camiones (placa, capacidad_carga, modelo_id, sucursal_id) VALUES 
   ('HHO123', 1000.00, 1, 7);

<h4>9.Un administrador desea agregar un nuevo conductor a la base de datos.</h4>

   INSERT INTO conductores (id_conductor, nombre, id_tipdoc) VALUES (7, 'Mauricio Diaz', 1);

<h4>10.Un administrador desea agregar un número de teléfono para un conductor
existente.</h4>

   INSERT INTO telconductores (id_conductor, telefono) VALUES (7, '3143807720');

<h4>11.Un administrador desea asignar un conductor a una ruta específica utilizando un
vehículo.</h4>
   INSERT INTO rutas (sucursal_id, descripcion) VALUES (7, 'Ruta 7 Vancouver'); 
   INSERT INTO rutasconductor (conductor_id, ruta_id, vehiculo_id, sucursal_id) VALUES 
   (7, 7, 'HHO123', 7); 

<h4>12.Un administrador desea agregar un nuevo auxiliar de reparto a la base de datos.</h4>

   INSERT INTO auxiliares (id_auxiliar, nombre, telefono, id_tipodoc) VALUES (7, 'Laura Torres', 3159874652, 1); 

<h4>13.Un administrador desea asignar un auxiliar de reparto a una ruta específica.</h4>

   INSERT INTO rutasauxiliares (ruta_id, id_auxiliar) VALUES (7, 7);

<h4>14.Un administrador desea registrar un evento de seguimiento para un paquete.</h4>

   INSERT INTO seguimientos (id_paquete, ubicacion, fechahora) VALUES (7, 'Bodega Vancouver', '2023-01-01 10:00:00'); 

<h4>15.Un administrador desea generar un reporte de todos los envíos realizados por un
cliente específico.</h4>

   SELECT id_envio,
    id_cliente,
    id_paquete,
    id_sucursal,
    fecha_envio,
    id_rutas,  
    destino
   FROM envios
   WHERE id_cliente = 5;

<h4>16.Un administrador desea actualizar el estado de un paquete específico.</h4>

    UPDATE paquetes
    SET id_estado = '1'
    WHERE id_paquete = 7;
    

<h4>17.Un administrador desea rastrear la ubicación actual de un paquete específico.</h4>

   SELECT ubicacion FROM seguimientos WHERE id_paquete = 7;

   <h2>Casos Multitabla</h2>

<h4>1.Un administrador desea obtener la información completa de todos los envíos,
incluyendo detalles del cliente, paquete, ruta, conductor, y sucursal.</h4>

   SELECT 
      c.nombre AS Cliente,
      e.id_paquete,
      r.descripcion AS Ruta,
      co.nombre AS Conductor,
      s.direccion
   FROM 
      envios e
   JOIN clientes c ON e.id_cliente = c.id_cliente
   JOIN rutas r ON e.id_rutas = r.id_rutas
   JOIN rutasconductor ru ON e.id_rutas = ru.ruta_id
   JOIN conductores co ON ru.conductor_id = co.id_conductor
   JOIN sucursales s ON e.id_sucursal = s.id_sucursal;

<h4>2.Un administrador desea obtener el historial completo de envíos de un cliente
específico, incluyendo detalles de los paquetes y los eventos de seguimiento.</h4>

   SELECT
      c.id_cliente,
      c.nombre AS cliente_nombre,
      e.id_envio,
      e.fecha_envio,
      e.destino,
      p.id_paquete,
      p.peso,
      p.dimensiones,
      p.contenido,
      p.valor_declarado,
      ts.nombre AS tipo_servicio,
      es.nombre AS estado_paquete,
      s.id_seguimiento,
      s.ubicacion,
      s.fechahora AS fecha_seguimiento
   FROM
      clientes c
   JOIN
      envios e ON c.id_cliente = e.id_cliente
   JOIN
      paquetes p ON e.id_paquete = p.id_paquete
   JOIN
      tiposervicios ts ON p.id_tiposervicio = ts.id_servicios
   JOIN
      estados es ON p.id_estado = es.id_estados
   LEFT JOIN
      seguimientos s ON p.id_paquete = s.id_paquete
   WHERE
      c.id_cliente = id_cliente
   ORDER BY
      e.fecha_envio DESC,
      s.fechahora DESC;

<h4>3.Un administrador desea obtener una lista de todos los conductores y las rutas a las
que están asignados, incluyendo detalles del vehículo utilizado y la sucursal correspondiente.</h4>



<h4>4.Un administrador desea obtener detalles de todas las rutas, incluyendo los
auxiliares asignados a cada ruta.</h4>



<h4>5.Un administrador desea generar un reporte de todos los paquetes agrupados por
sucursal y estado.</h4>



<h4>6.Un administrador desea obtener la información completa de un paquete específico
y su historial de seguimiento.</h4>



   <h2>Casos de uso  Not In</h2>

<h4>1.Un administrador desea obtener todos los paquetes que fueron enviados dentro de
un rango de fechas específico.</h4>

<h4>2.Un administrador desea obtener todos los paquetes que tienen ciertos estados
específicos (por ejemplo, 'en tránsito' o 'entregado').</h4>

<h4>3.Un administrador desea obtener todos los paquetes excluyendo aquellos que tienen
ciertos estados específicos (por ejemplo, 'recibido' o 'retenido en aduana').</h4>

<h4>4.Un administrador desea obtener todos los clientes que realizaron envíos dentro de
un rango de fechas específico.</h4>

<h4>5.Un administrador desea obtener todos los conductores que no están asignados a
ciertas rutas específicas.</h4>

<h4>6.Un administrador desea obtener todos los paquetes cuyo valor declarado está
dentro de un rango específico.</h4>

<h4>7.Un administrador desea obtener todos los auxiliares de reparto que están
asignados a ciertas rutas específicas.</h4>

<h4>8.Un administrador desea obtener todos los envíos cuyos destinos no están en ciertas
ciudades específicas.</h4>

<h4>9.Un administrador desea obtener todos los eventos</h4>

<h4>10.Un administrador desea obtener todos los clientes que tienen paquetes de ciertos
tipos específicos (por ejemplo, 'nacional' o 'internacional').</h4>


