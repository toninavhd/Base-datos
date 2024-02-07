-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.
select cliente.nombre, cliente.Edad from clientes as cliente, ventas as v, coches as c where cliente.id_cliente=v.id_cliente and c.marca='Toyota' and c.id_coche=v.id_coche;

┌────────────┬──────┐
│   nombre   │ edad │
├────────────┼──────┤
│ Juan Pérez │ 30   │
└────────────┴──────┘

-- Consulta para calcular el precio promedio de los coches vendidos.

select ROUND(AVG(precio), 2) as "Promedio" from coches as c, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and c.id_coche=v.id_coche;

┌──────────┐
│ Promedio │
├──────────┤
│ 28777.78 │
└──────────┘
-- Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.

select c.modelo, c.marca from coches as c, ventas as v, clientes as cliente where cliente.edad<30 and cliente.id_cliente=v.id_cliente and c.id_coche=v.id_coche;

┌────────────────┬───────────┐
│     modelo     │   marca   │
├────────────────┼───────────┤
│ Hatchback 2021 │ Honda     │
│ Coupé 2022     │ Chevrolet │
│ Híbrido 2022   │ Hyundai   │
│ Eléctrico 2021 │ Tesla     │
└────────────────┴───────────┘

-- Consulta para contar el número de coches vendidos de cada marca.

select c.marca, COUNT(v.id_coche) as "Ventas" from ventas as v, coches as c where v.id_coche=c.id_coche group by v.id_coche;

┌────────────┬────────┐
│   marca    │ Ventas │
├────────────┼────────┤
│ Toyota     │ 1      │
│ Honda      │ 1      │
│ Ford       │ 1      │
│ Chevrolet  │ 1      │
│ Nissan     │ 1      │
│ Volkswagen │ 1      │
│ Hyundai    │ 1      │
│ Mazda      │ 1      │
│ Tesla      │ 1      │
└────────────┴────────┘

-- Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.

select cliente.nombre, cliente.direccion from clientes as cliente, reparación as rep where cliente.id_cliente=rep.id_cliente and r.fecha_reparación regexp '2024';

┌─────────────────┬────────────────┐
│     nombre      │   direccion    │
├─────────────────┼────────────────┤
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
│ Juan Pérez      │ Calle A #123   │
│ María Gómez     │ Avenida B #456 │
│ Carlos López    │ Calle C #789   │
│ Ana Martínez    │ Avenida D #101 │
│ Pedro Rodríguez │ Calle E #234   │
│ Laura Sánchez   │ Avenida F #567 │
│ Miguel González │ Calle G #890   │
│ Isabel Díaz     │ Avenida H #111 │
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
└─────────────────┴────────────────┘

-- Consulta para calcular el total gastado en reparaciones por cada cliente.


-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.

select cliente.nombre, clienye.edad from clientes as cliente, ventas as v, coches as c where cliente.id_cliente=v.id_cliente and c.precio>30000 and c.id_coche=v.id_coche;

┌─────────────────┬──────┐
│     nombre      │ edad │
├─────────────────┼──────┤
│ Pedro Rodríguez │ 40   │
│ Isabel Díaz     │ 38   │
│ Elena Torres    │ 29   │
└─────────────────┴──────┘
-- Consulta para calcular el precio medio de los coches vendidos en 2023.

select ROUND(AVG(precio), 2) as "Precio Promedio 2023" from coches as c, clientes as cliente, ventas as v where cliente.id_cliente=v.id_cliente and c.id_coche=v.id_coche and v.fecha_venta regexp '2023';

┌──────────────────────┐
│ Precio Promedio 2023 │
├──────────────────────┤
│ 28777.78             │
└──────────────────────┘

-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.

select cliente.nombre, cliente.direccion from clientes as cliente, ventas as v, coches as c where cliente.id_cliente=v.id_cliente and c.marca='Ford' and c.id_coche=v.id_coche;

┌──────────────┬──────────────┐
│    nombre    │  direccion   │
├──────────────┼──────────────┤
│ Carlos López │ Calle C #789 │
└──────────────┴──────────────┘

-- Consulta para contar el número de coches vendidos por año.

select strftime('%Y', fecha_venta) as año, COUNT(id_coche) as "Ventas por año" from ventas group by año order by año ASC;

┌──────┬────────────────┐
│ año  │ Ventas por año │
├──────┼────────────────┤
│ 2023 │ 9              │
└──────┴────────────────┘

-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.

select cliente.nombre, cliente.edad from clientes as cliente, ventas as v, coches as c, reparación as r where cliente.id_cliente=v.id_cliente and c.precio>30000 and c.id_coche=v.id_coche and cliente.id_cliente=r.id_cliente;

┌─────────────────┬──────┐
│     nombre      │ edad │
├─────────────────┼──────┤
│ Pedro Rodríguez │ 40   │
│ Isabel Díaz     │ 38   │
│ Elena Torres    │ 29   │
│ Pedro Rodríguez │ 40   │
│ Isabel Díaz     │ 38   │
│ Elena Torres    │ 29   │
└─────────────────┴──────┘

-- Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.
select sum(c.precio) as "Total" from coches as c, ventas as v, clientes as cl where cl.edad<30 and cliente.id_cliente=v.id_cliente and c.id_coche=v.id_coche;

┌───────────────┐
│ SUM(c.precio) │
├───────────────┤
│ 117000.0      │
└───────────────┘

-- Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.

select c.modelo, c.marca from coches as c, ventas as v, reparación as r where c.id_coche=v.id_coche and c.id_coche=r.id_coche and v.fecha_venta regexp '2023';

┌────────────────┬────────────┐
│     modelo     │   marca    │
├────────────────┼────────────┤
│ Sedán 2022     │ Toyota     │
│ SUV 2023       │ Ford       │
│ Camioneta 2023 │ Nissan     │
│ Hatchback 2021 │ Honda      │
│ Coupé 2022     │ Chevrolet  │
│ Híbrido 2022   │ Hyundai    │
│ Compacto 2021  │ Volkswagen │
│ Deportivo 2023 │ Mazda      │
│ Eléctrico 2021 │ Tesla      │
│ SUV 2023       │ Ford       │
│ Hatchback 2021 │ Honda      │
│ Coupé 2022     │ Chevrolet  │
│ Camioneta 2023 │ Nissan     │
│ Compacto 2021  │ Volkswagen │
│ Deportivo 2023 │ Mazda      │
│ Eléctrico 2021 │ Tesla      │
│ Sedán 2022     │ Toyota     │
│ SUV 2023       │ Ford       │
│ Coupé 2022     │ Chevrolet  │
└────────────────┴────────────┘

-- Consulta para contar el número de coches vendidos por cliente.

select v.id_cliente, COUNT(*) as "ventas de coche" from coches as c, ventas as v where c.id_coche=v.id_coche group by v.id_cliente;

┌────────────┬─────────────────┐
│ id_cliente │ ventas de coche │
├────────────┼─────────────────┤
│ 1          │ 1               │
│ 2          │ 1               │
│ 3          │ 1               │
│ 4          │ 1               │
│ 5          │ 1               │
│ 6          │ 1               │
│ 7          │ 1               │
│ 8          │ 1               │
│ 10         │ 1               │
└────────────┴─────────────────┘

-- Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.

SELECT coches.modelo, ventas.id_coche
FROM coches, ventas
WHERE coches.id_coche = ventas.id_coche AND ventas.id_cliente IN (SELECT id_cliente FROM clientes WHERE edad < 35);

-- Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).


-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.


-- Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.


-- Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".


-- Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.

