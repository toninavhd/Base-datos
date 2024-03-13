# Trabajando con Joins.

- Mostrar todos los clientes.

```
select * from clientes;

+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+

```

- Mostrar todas las órdenes.

```
select * from ordenes;

+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
|        2 |          2 | 2024-03-02  |
|        3 |          3 | 2024-03-03  |
+----------+------------+-------------+

```

- Mostrar todos los productos.

```
select * from productos;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           1 | Producto A      |           50.00 |
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+

```

- Mostrar todos los detalles de las órdenes.

```

select * from detalles_ordenes;

+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          1 |        1 |           1 |        2 |
|          2 |        2 |           2 |        1 |
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+

```

- Mostrar los primeros 5 clientes ordenados por nombre.

```

select * from clientes order by nombre_cliente limit 5;

+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+

```

- Mostrar los productos con un precio mayor a 50.

```

select * from productos where precio_producto > 50;

+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+

```

- Mostrar todas las órdenes realizadas por el cliente con ID 1.

```

select * from ordenes where id_cliente = 1;

+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
+----------+------------+-------------+

```

- Mostrar los clientes cuyos nombres comienzan con la letra "A".

```

```

- Mostrar las órdenes que contienen más de 2 productos.

```

```

- Mostrar los productos ordenados por precio de forma descendente.

```

```

- Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes.

```

```

- Seleccionar todas las órdenes junto con los productos correspondientes.

```

```

- Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50.

```

```

- Obtener el nombre de los productos que no se han ordenado aún.

```

```

- Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes.

```

```

- Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos.

```

```

- Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes.
Obtener el nombre de los clientes junto con el número total de órdenes que han realizado.

```

```

- Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto.
Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.

```

```

- Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados.

```

```

- Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos.

```

```

- Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.

```

```

- Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.

```

```

- Realizar un inner join entre clientes y órdenes.

```

```

- Realizar un left join entre órdenes y detalles de órdenes.

```

```

- Realizar un right join entre productos y detalles de órdenes.

```

```

- Realizar un full join entre clientes y órdenes.

```

```

- Realizar un full join entre órdenes y detalles de órdenes.

```

```

- Realizar un full join entre productos y detalles de órdenes.

```

```