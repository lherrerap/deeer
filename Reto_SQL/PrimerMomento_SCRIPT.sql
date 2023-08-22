SELECT * FROM EmpresaVideojuegos.juegos ORDER BY nombre_juego  ASC;

SELECT * FROM EmpresaVideojuegos.clientes ORDER BY nombre_cliente ASC;

SELECT DISTINCT id_jefe FROM EmpresaVideojuegos.empleados;

SELECT * FROM EmpresaVideojuegos.juegos ORDER BY precio_unitario ASC LIMIT 3;

SELECT * FROM EmpresaVideojuegos.empleados e  ORDER BY salario  ASC LIMIT 5;

-- INSERCION DE CLIENTES --

SELECT * FROM EmpresaVideojuegos.clientes;

-- Inserción 1
INSERT INTO EmpresaVideojuegos.clientes (id_cliente ,nombre_cliente, celular)
VALUES (42,'Lucía Rodríguez', 3111234567);

-- Inserción 2
INSERT INTO EmpresaVideojuegos.cl (id_cliente , nombre_cliente, celular)
VALUES (43, 'Mateo González', 3159876543);

-- Inserción 3
INSERT INTO EmpresaVideojuegos.clientes  (id_cliente ,nombre_cliente, celular)
VALUES (44, 'Sofía Fernández', 3005551111);


SELECT * FROM EmpresaVideojuegos.juegos WHERE id_tipo = 5;

DELETE FROM EmpresaVideojuegos.clientes WHERE id_cliente = 44;

UPDATE EmpresaVideojuegos.clientes SET celular = 3178448504 WHERE id_cliente = 42;

SELECT * FROM EmpresaVideojuegos.empleados WHERE salario BETWEEN 1000000 AND 2500000;

SELECT * FROM EmpresaVideojuegos.juegos ORDER BY EXTRACT(MONTH FROM fecha_creacion);

--------- CONSULTAS MULTITABLAS -------------------------

SELECT * FROM EmpresaVideojuegos.ventas;

SELECT * FROM EmpresaVideojuegos.aliados;

SELECT * FROM EmpresaVideojuegos.medio_pagos;

SELECT * FROM EmpresaVideojuegos.ventas v 
INNER JOIN EmpresaVideojuegos.medio_pagos mp ON v.id_medio = mp.id_medio 
INNER JOIN EmpresaVideojuegos.aliados a ON v.id_aliado = a.id_aliado;


SELECT * FROM EmpresaVideojuegos.apoyos_tecnicos at2;

SELECT at2.fecha_apoyo, count(*) FROM EmpresaVideojuegos.apoyos_tecnicos at2 GROUP BY fecha_apoyo;

SELECT v.id_empleado, COUNT(*) AS cantidad_ventas, e.nombre_empleado
FROM EmpresaVideojuegos.ventas v
INNER JOIN EmpresaVideojuegos.empleados e ON v.id_empleado = e.id_empleado
GROUP BY v.id_empleado, e.nombre_empleado;


SELECT * FROM EmpresaVideojuegos.empleados e;

SELECT * FROM EmpresaVideojuegos.ciudades c;

SELECT * FROM EmpresaVideojuegos.sedes s;

SELECT v.id_venta, c.nombre_ciudad , e.nombre_empleado  FROM EmpresaVideojuegos.ventas v
INNER JOIN EmpresaVideojuegos.empleados e ON v.id_empleado = e.id_empleado
INNER JOIN EmpresaVideojuegos.ciudades c ON e.id_ciudad = c.id_ciudad 
WHERE c.id_ciudad = 6
ORDER BY id_venta;


SELECT s.id_sede, e.nombre_empleado FROM EmpresaVideojuegos.empleados e
INNER JOIN EmpresaVideojuegos.ciudades c ON c.id_ciudad = e.id_ciudad 
INNER JOIN EmpresaVideojuegos.sedes s ON s.id_sede = e.id_sede
WHERE c.nombre_ciudad = "Cali";


SELECT c.id_cliente, c.nombre_cliente , COUNT(*) as Cantidad_De_Soportes  FROM EmpresaVideojuegos.apoyos_tecnicos at2 
INNER JOIN EmpresaVideojuegos.clientes c ON c.id_cliente = at2.id_cliente
WHERE c.nombre_cliente LIKE 'Ju%'
GROUP BY c.id_cliente;

SELECT a.nombre_aliado, COUNT(*) AS cantidad_ventas
FROM EmpresaVideojuegos.ventas v
INNER JOIN EmpresaVideojuegos.aliados a ON a.id_aliado = v.id_aliado 
GROUP BY v.id_aliado ;


SELECT c.nombre_cliente,
       CASE 
           WHEN mp.nombre_medio = 'Letra de cambio' THEN 'Este medio ya no se usa' 
           ELSE mp.nombre_medio
       END AS metodo_pago_modificado
FROM EmpresaVideojuegos.ventas v
INNER JOIN EmpresaVideojuegos.clientes c ON v.id_cliente = c.id_cliente
INNER JOIN EmpresaVideojuegos.medio_pagos mp ON v.id_medio = mp.id_medio;


SELECT 
    YEAR(fecha_venta) AS ano,
    SUM(valor_total) AS Ventas_Por_Año
FROM EmpresaVideojuegos.ventas
GROUP BY YEAR(fecha_venta)
ORDER BY ano;

SELECT 
    YEAR(fecha_venta) AS ano,
    MONTH(fecha_venta) AS mes,
    SUM(valor_total) AS total_ventas_mensual
FROM EmpresaVideojuegos.ventas
GROUP BY YEAR(fecha_venta), MONTH(fecha_venta)
ORDER BY ano, mes ASC;



SELECT *  FROM EmpresaVideojuegos.ventas v 
INNER JOIN EmpresaVideojuegos.empleados e  ON v.id_empleado = e.id_empleado 
INNER JOIN EmpresaVideojuegos.ciudades c ON e.id_ciudad = c.id_ciudad 


SELECT c.id_cliente, c.nombre_cliente , COUNT(*) as Cantidad_De_Soportes  FROM EmpresaVideojuegos.apoyos_tecnicos at2 
INNER JOIN EmpresaVideojuegos.clientes c ON c.id_cliente = at2.id_cliente
GROUP BY c.id_cliente;


SELECT * FROM EmpresaVideojuegos.ventas v WHERE fecha_venta BETWEEN '2019-01-12' AND '2020-01-20';




