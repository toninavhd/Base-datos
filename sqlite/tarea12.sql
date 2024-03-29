/**
################
### TAREA 12 ###
################
**/
/**
##############
### Tablas ###
##############
**/

-- Clientes
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ ID │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │
│ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │
│ 3  │ Adolfo    │ Rubio     │ Flores    │ Sevilla │           │
│ 4  │ Adrián    │ Suárez    │           │ Jaén    │ 300       │
│ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │
│ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 7  │ Pilar     │ Ruiz      │           │ Sevilla │ 300       │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
-- Comercial
┌────┬─────────┬───────────┬───────────┬───────────┐
│ ID │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
│ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘

-- Pedido
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ ID │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
└────┴─────────┴────────────┴────────────┴──────────────┘
/**
#############################
### Consultas a una tabla ###
#############################
**/

-- Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.

select * from pedido order by fecha desc;
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ ID │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
└────┴─────────┴────────────┴────────────┴──────────────┘

-- Devuelve todos los datos de los dos pedidos de mayor valor.

select * from pedido where total>= 3000;
-- total desc
┌────┬────────┬────────────┬────────────┬──────────────┐
│ ID │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘


-- Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT DISTINCT cliente_id FROM pedido;

-- Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.

select * from pedido where strftime('2017', fecha) and total >= 500;
-- regexp('^2017')
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ ID │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
└────┴─────────┴────────────┴────────────┴──────────────┘

-- Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
  
SELECT nombre, apellido1 FROM comercial WHERE categoria BETWEEN 0.05 AND 0.11;

┌─────────┬───────────┐
│ nombre  │ apellido1 │
├─────────┼───────────┤
│ Diego   │ Flores    │
│ Antonio │ Vega      │
│ Alfredo │ Ruiz      │
└─────────┴───────────┘

-- Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
-- SELECT FROM comercial MAX
-- Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
SELECT id, nombre, apellido1 FROM cliente WHERE apellido2 IS NOT NULL ORDER BY apellido1, nombre;
┌────┬───────────┬───────────┐
│ ID │  nombre   │ apellido1 │
├────┼───────────┼───────────┤
│ 5  │ Marcos    │ Loyola    │
│ 9  │ Guillermo │ López     │
│ 1  │ Aarón     │ Rivero    │
│ 3  │ Adolfo    │ Rubio     │
│ 8  │ Pepe      │ Ruiz      │
│ 2  │ Adela     │ Salas     │
│ 10 │ Daniel    │ Santana   │
│ 6  │ María     │ Santana   │
└────┴───────────┴───────────┘

-- Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM cliente WHERE nombre regexp '^[Aa]|^[Pp]' and nombre regexp 'n$' order by nombre;

┌────────┐
│ nombre │
├────────┤
│ Aarón  │
│ Adrián │
│ Pepe   │
│ Pilar  │
└────────┘

-- Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM cliente WHERE nombre NOT regexp '[Aa]' ORDER BY nombre;

┌───────────┐
│  nombre   │
├───────────┤
│ Daniel    │
│ Guillermo │
│ Marcos    │
│ María     │
│ Pepe      │
│ Pilar     │
└───────────┘

-- Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
SELECT DISTINCT nombre FROM comercial WHERE nombre regexp 'o$';

┌─────────┐
│ nombre  │
├─────────┤
│ Diego   │
│ Antonio │
│ Alfredo │
└─────────┘

/**
############################
### Consultas multitabla ###
############################
**/

-- Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

select distinct(cl.id, cl.nombre, cl.apellido1, cl.apellido2 from cliente as cl join pedido as p on cl.id=p.id_cliente order by cl.nombre;

-- Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

SELECT cliente.*, pedido.* FROM clientes JOIN pedido ON clientes.id = pedido.id_cliente
ORDER BY clientes.nombre, clientes.apellido1;

-- Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.

SELECT comercial.*, pedidos.* FROM comercial JOIN pedidos ON comercial.id = pedidos.comercial_id
ORDER BY comercial.nombre;


-- Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.

SELECT clientes.*, pedido.*, comercial.*
FROM clientes
JOIN pedido ON clientes.id = pedido.cliente_id
JOIN comercial ON pedido.comercial_id = comercial.id;

-- Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.

SELECT clientes.*
FROM clientes
JOIN pedido ON clientes.id = pedido.cliente_id
WHERE pedido.fecha BETWEEN '2017-01-01' AND '2017-12-31'
AND pedido.cantidad BETWEEN 300 AND 1000;

-- Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
SELECT comercial.nombre, comercial.apellido
FROM comercial
JOIN pedido ON comercial.id = pedido.id_comercial
JOIN clientes ON pedido.cliente_id = clientes.id
WHERE clientes.nombre = 'María' AND clientes.apellido1 = 'Santana' AND clientes.apellido2 = 'Moreno';
-- from pedido as p join comercial as c on c.id=p.id_comercial join cliente as cli on c.id_cliente where... =cli.id


-- Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.

SELECT clientes.nombre
FROM clientes
JOIN pedido ON clientes.id = pedido.id_cliente
JOIN comercial ON pedido.id_comercial = comercial.id
WHERE comercial.nombre = 'Daniel' AND comercial.apellido = 'Sáez Vega';

/**
#########################
### Consultas resumen ###
#########################
**/

-- Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT MAX(total) as maximo FROM pedido;

-- Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(total) as media FROM pedido;

-- Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
SELECT COUNT(DISTINCT id_comercial) FROM pedido;

-- Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT COUNT(*) FROM cliente;

-- Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT MAX(total) FROM pedido;

-- Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT MIN(total) FROM pedido;

-- Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
SELECT ciudad, MAX(categoria) FROM cliente GROUP BY ciudad;

-- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
SELECT id_cliente, nombre, apellidos, fecha, MAX(total) 
FROM pedido 
GROUP BY id_cliente, fecha;

-- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
SELECT id_cliente, nombre, apellidos, fecha, MAX(total) 
FROM pedido 
WHERE total > 2000 
GROUP BY id_cliente, fecha;

-- Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.


-- Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.


-- Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
SELECT c.id, c.nombre, c.apellido1, COUNT(p.id) AS total_pedidos
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
WHERE strftime('2017', p.fecha)
GROUP BY c.id;

┌────┬────────┬───────────┬───────────────┐
│ ID │ nombre │ apellido1 │ total_pedidos │
├────┼────────┼───────────┼───────────────┤
│ 2  │ Adela  │ Salas     │ 2             │
│ 4  │ Adrián │ Suárez    │ 1             │
│ 5  │ Marcos │ Loyola    │ 2             │
│ 6  │ María  │ Santana   │ 1             │
└────┴────────┴───────────┴───────────────┘

-- Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.
-- select c.id,c.nombre, c.apellido1, c.apellido2,

-- Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.

SELECT strftime('%Y', fecha) AS año, MAX(total) AS max_cantidad
FROM pedido
GROUP BY año;
┌──────┬──────────────┐
│ año  │ max_cantidad │
├──────┼──────────────┤
│ 2015 │ 5760.0       │
│ 2016 │ 2480.4       │
│ 2017 │ 3045.6       │
│ 2019 │ 2389.23      │
└──────┴──────────────┘


-- Devuelve el número total de pedidos que se han realizado cada año.

SELECT strftime('%Y', fecha) AS año, COUNT(ID) AS total_pedidos
FROM pedido
GROUP BY año;

┌──────┬───────────────┐
│ año  │ total_pedidos │
├──────┼───────────────┤
│ 2015 │ 2             │
│ 2016 │ 5             │
│ 2017 │ 6             │
│ 2019 │ 3             │
└──────┴───────────────┘


/**
####################
### Subconsultas ###
####################
**/
/**
###########################################
## Con operadores básicos de comparación ##
###########################################
**/
-- Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
FROM pedido 
WHERE id_cliente = (SELECT ID FROM cliente WHERE nombre = 'Adela' AND apellido1 = 'Salas' AND apellido2= 'Díaz');
┌────┬────────┬────────────┬────────────┬──────────────┐
│ ID │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1            │
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘

-- Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)

SELECT COUNT(*) 
FROM pedido 
WHERE id_comercial = (SELECT id_comercial FROM comercial WHERE nombre = 'Daniel' AND apellido1 = 'Sáez' AND apellido2 = 'Vega');
┌──────────┐
│ COUNT(*) │
├──────────┤
│ 16       │
└──────────┘

-- Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)

SELECT * 
FROM cliente 
WHERE ID = (SELECT id_cliente FROM pedido WHERE total = (SELECT MAX(total) FROM pedido WHERE strftime('%Y', fecha) = '2019'));
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ ID │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘

-- Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT fecha, MIN(total) 
FROM pedido 
WHERE id_cliente = (SELECT id_cliente FROM cliente WHERE nombre = 'Pepe' AND apellido1 = 'Ruiz' AND apellido2= 'Santana');
┌────────────┬────────────┐
│   fecha    │ MIN(total) │
├────────────┼────────────┤
│ 2017-10-05 │ 65.26      │
└────────────┴────────────┘



-- Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
SELECT c.*, p.* 
FROM cliente c, pedido p 
WHERE c.ID = p.id_cliente AND strftime('%Y', p.fecha) = '2017' AND p.total >= (SELECT AVG(total) FROM pedido WHERE strftime('%Y', fecha) = '2017');
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ ID │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ ID │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘


/**
###########################################
##      Subsconsultas con IN y NOT       ##
###########################################
**/
-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).

SELECT * 
FROM cliente 
WHERE ID NOT IN (SELECT DISTINCT id_cliente FROM pedido);

┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ ID │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT * 
FROM comercial 
WHERE ID NOT IN (SELECT DISTINCT id_comercial FROM pedido);
┌────┬─────────┬───────────┬───────────┬───────────┐
│ ID │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘

/**
###########################################
##    Subconsultas con EXIST y NOT IN    ##
###########################################
**/

-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT * 
FROM cliente c
WHERE NOT EXISTS (SELECT 1 FROM pedido p WHERE c.id_cliente = p.id_cliente);

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT * 
FROM comercial com
WHERE NOT EXISTS (SELECT 1 FROM pedido p WHERE com.id_comercial = p.id_comercial);
