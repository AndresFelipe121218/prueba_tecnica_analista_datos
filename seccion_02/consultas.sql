------------------------------------------------------ Sección 2: Prueba práctica SQL (55 puntos) ------------------------------------------------------------------
-- Dada la siguiente tabla empleados:
/*
id nombre departamento salario fecha_contratacion
1 Ana Ventas 5000 2020-01-15
2 Luis IT 6000 2019-08-21
3 María Ventas 5500 2021-05-10
4 Juan IT 7000 2018-11-03
*/
--Consulta 1: Escriba una consulta SQL para obtener el promedio de salario por departamento, excluyendo empleados contratados después del 1 de enero de 2020. (5 puntos).

SELECT departamento, AVG(salario) AS promedio_salario
FROM empleados
WHERE fecha_contratacion <= '2020-01-01'
GROUP BY departamento;

/*Tienes las siguientes tablas en una base de datos:

clientes
id (INT, PRIMARY KEY)
nombre (VARCHAR)
apellido (VARCHAR)

ventas
id (INT, PRIMARY KEY)
cliente_id (INT, FOREIGN KEY a clientes.id)
producto (VARCHAR)
fecha (DATE)
monto (DECIMAL) */


--Consulta 2: Escribe una consulta para obtener los 5 clientes con mayor monto total de ventas en los últimos 6 meses. (5 puntos)

SELECT TOP 5 c.nombre, c.apellido, SUM(v.monto) AS total_ventas
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
WHERE v.fecha >= DATEADD(MONTH, -6, GETDATE())
GROUP BY c.nombre, c.apellido, c.id
ORDER BY total_ventas DESC;

--Consulta 3: Escribe una consulta para calcular el promedio de ventas por cliente en el último año.(5 puntos)

SELECT c.nombre, c.apellido, AVG(v.monto) AS promedio_ventas
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
WHERE v.fecha >= DATEADD(YEAR, -1, GETDATE())
GROUP BY c.nombre, c.apellido, c.id;

--Consulta 4: Escribe una consulta para obtener el nombre completo de los clientes y su monto total de ventas. (10 puntos)

SELECT c.id, CONCAT(c.nombre, ' ', c.apellido) AS nombre_completo_cliente, SUM(v.monto) AS total_ventas
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.id, CONCAT(c.nombre, ' ', c.apellido);

--Consulta 5: Escribe una consulta para obtener el ingreso promedio de ventas por mes. (10 puntos)

SELECT 
    YEAR(v.fecha) AS año, 
    MONTH(v.fecha) AS mes, 
    AVG(v.monto) AS ingreso_promedio
FROM ventas v
GROUP BY YEAR(v.fecha), MONTH(v.fecha)
ORDER BY año DESC, mes DESC;	

--Consulta 6: Escribe una consulta para calcular el ranking de clientes por ventas en el último año. (10 puntos)

SELECT c.nombre, c.apellido, 
    SUM(v.monto) AS total_ventas,
    RANK() OVER (ORDER BY SUM(v.monto) DESC) AS ranking
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
WHERE v.fecha >= DATEADD(YEAR, -1, GETDATE())
GROUP BY c.nombre, c.apellido, c.id
ORDER BY ranking;

--Consulta 7: Escribe una consulta para calcular el total de ventas por cliente y luego selecciona solo los clientes cuyo total de ventas es superior al promedio general. (10 puntos)

WITH total_ventas_cliente AS (
    SELECT c.id, CONCAT(c.nombre, ' ', c.apellido) AS nombre_completo, 
           SUM(v.monto) AS total_ventas
    FROM clientes c
    JOIN ventas v ON c.id = v.cliente_id
    GROUP BY c.id, CONCAT(c.nombre, ' ', c.apellido)
)
SELECT * 
FROM total_ventas_cliente
WHERE total_ventas > (SELECT AVG(total_ventas) FROM total_ventas_cliente);
