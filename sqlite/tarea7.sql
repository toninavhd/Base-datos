-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
    -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?

SELECT coches.modelo, COCHES.precio, (SELECT nombre FROM clientes WHERE id_cliente = ventas.id_cliente)             
FROM ventas, coches
WHERE ventas.id_cliente = coches.id_coche;
┌────────────────┬─────────┬─────────────────┐
│     modelo     │ precio  │ nombre          │
├────────────────┼─────────┼─────────────────┤
│ Sedán 2022     │ 25000.0 │ Juan Pérez      │
│ Hatchback 2021 │ 22000.0 │ María Gómez     │
│ SUV 2023       │ 30000.0 │ Carlos López    │
│ Coupé 2022     │ 28000.0 │ Ana Martínez    │
│ Camioneta 2023 │ 32000.0 │ Pedro Rodríguez │
│ Compacto 2021  │ 20000.0 │ Laura Sánchez   │
│ Híbrido 2022   │ 27000.0 │ Miguel González │
│ Deportivo 2023 │ 35000.0 │ Isabel Díaz     │
│ Eléctrico 2021 │ 40000.0 │ Elena Torres    │
└────────────────┴─────────┴─────────────────┘

-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
    -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)

SELECT nombre
FROM clientes
WHERE id IN (SELECT id_cliente FROM ventas WHERE precio > (SELECT AVG(precio) FROM ventas));
┌─────────────────┬───────────────────────────┐
│     nombre      │ cantidad_coches_comprados │
├─────────────────┼───────────────────────────┤
│ Juan Pérez      │ 9                         │
│ María Gómez     │ 9                         │
│ Carlos López    │ 9                         │
│ Ana Martínez    │ 9                         │
│ Pedro Rodríguez │ 9                         │
│ Laura Sánchez   │ 9                         │
│ Miguel González │ 9                         │
│ Isabel Díaz     │ 9                         │
│ Elena Torres    │ 9                         │
└─────────────────┴───────────────────────────┘

-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:
    -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas

SELECT coches.modelo, coches.precio
FROM coches
WHERE coches.id_coche NOT IN (SELECT id_coche FROM ventas);
┌─────────────┬─────────┐
│   modelo    │ precio  │
├─────────────┼─────────┤
│ Pickup 2022 │ 31000.0 │
└─────────────┴─────────┘

-- Calcular el total gastado por todos los clientes en coches:
    -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

SELECT SUM(precio) AS total_gastado
FROM coches;
┌───────────────┐
│ total_gastado │
├───────────────┤
│ 290000.0      │
└───────────────┘

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
    -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?

SELECT coches.modelo, ventas.fecha_venta, (SELECT nombre FROM clientes WHERE id_cliente = ventas.id_cliente)
FROM ventas, coches
WHERE ventas.id_coche = coches.id_coche
ORDER BY ventas.fecha_venta DESC;
┌────────────────┬─────────────┬──────────────────────────────────────────────────────────────┐
│     modelo     │ fecha_venta │ (SELECT nombre FROM clientes WHERE id_cliente = ventas.id_cl │
├────────────────┼─────────────┼──────────────────────────────────────────────────────────────┤
│ Eléctrico 2021 │ 2023-10-05  │ Elena Torres                                                 │
│ Deportivo 2023 │ 2023-08-25  │ Isabel Díaz                                                  │
│ Híbrido 2022   │ 2023-07-20  │ Miguel González                                              │
│ Compacto 2021  │ 2023-06-15  │ Laura Sánchez                                                │
│ Camioneta 2023 │ 2023-05-05  │ Pedro Rodríguez                                              │
│ Coupé 2022     │ 2023-04-10  │ Ana Martínez                                                 │
│ SUV 2023       │ 2023-03-25  │ Carlos López                                                 │
│ Hatchback 2021 │ 2023-02-20  │ María Gómez                                                  │
│ Sedán 2022     │ 2023-01-15  │ Juan Pérez                                                   │
└────────────────┴─────────────┴──────────────────────────────────────────────────────────────┘


-- Encontrar el modelo de coche más caro que ha sido reparado al menos una vez.
    -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX

SELECT modelo
FROM coches
WHERE precio = (SELECT MAX(precio) FROM coches);

┌────────────────┐
│     modelo     │
├────────────────┤
│ Eléctrico 2021 │
└────────────────┘

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
    -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT

SELECT nombre, (SELECT COUNT(*) FROM ventas WHERE id_cliente = id_cliente) AS cantidad_coches_comprados
FROM clientes
WHERE id_cliente IN (SELECT DISTINCT id_cliente FROM ventas);

┌─────────────────┬───────────────────────────┐
│     nombre      │ cantidad_coches_comprados │
├─────────────────┼───────────────────────────┤
│ Juan Pérez      │ 9                         │
│ María Gómez     │ 9                         │
│ Carlos López    │ 9                         │
│ Ana Martínez    │ 9                         │
│ Pedro Rodríguez │ 9                         │
│ Laura Sánchez   │ 9                         │
│ Miguel González │ 9                         │
│ Isabel Díaz     │ 9                         │
│ Elena Torres    │ 9                         │
└─────────────────┴───────────────────────────┘

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
    -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.

SELECT nombre
FROM clientes
WHERE id_cliente IN (SELECT id_cliente FROM ventas WHERE id_coche IN (SELECT id_coche FROM coches WHERE marca = 'Toyota'));

┌────────────┐
│   nombre   │
├────────────┤
│ Juan Pérez │
└────────────┘

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
    -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 

SELECT AVG(edad) AS promedio_edad
FROM clientes
WHERE id_cliente IN (SELECT id_cliente FROM coches WHERE precio > 25000);
┌───────────────┐
│ promedio_edad │
├───────────────┤
│ 31.7          │
└───────────────┘

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
    -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

sELECT coches.modelo, ventas.id_coche
FROM coches, ventas
WHERE coches.id_coche = ventas.id_coche AND ventas.id_cliente IN (SELECT id_cliente FROM clientes WHERE edad > 30);
┌────────────────┬──────────┐
│     modelo     │ id_coche │
├────────────────┼──────────┤
│ SUV 2023       │ 3        │
│ Camioneta 2023 │ 5        │
│ Compacto 2021  │ 6        │
│ Deportivo 2023 │ 8        │
└────────────────┴──────────┘

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
    -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

SELECT coches.modelo, COUNT(*) AS cantidad_ventas
FROM coches, ventas
WHERE coches.id_coche = ventas.id_coche AND strftime('%Y', ventas.fecha_venta) = '2022'
GROUP BY coches.id_coche;

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG

 SELECT modelo
FROM coches
WHERE precio > (SELECT AVG(ventas.id_coche)
FROM ventas WHERE id_cliente IN (SELECT id_cliente FROM clientes WHERE edad < 30));
┌────────────────┐
│     modelo     │
├────────────────┤
│ Sedán 2022     │
│ Hatchback 2021 │
│ SUV 2023       │
│ Coupé 2022     │
│ Camioneta 2023 │
│ Compacto 2021  │
│ Híbrido 2022   │
│ Deportivo 2023 │
│ Pickup 2022    │
│ Eléctrico 2021 │
└────────────────┘

-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
    -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio

SELECT coches.marca, COUNT(*) AS total_ventas
FROM coches, ventas
WHERE coches.id_coche = ventas.id_coche
GROUP BY coches.marca
ORDER BY total_ventas DESC;
┌────────────┬──────────────┐
│   marca    │ total_ventas │
├────────────┼──────────────┤
│ Volkswagen │ 1            │
│ Toyota     │ 1            │
│ Tesla      │ 1            │
│ Nissan     │ 1            │
│ Mazda      │ 1            │
│ Hyundai    │ 1            │
│ Honda      │ 1            │
│ Ford       │ 1            │
│ Chevrolet  │ 1            │
└────────────┴──────────────┘
