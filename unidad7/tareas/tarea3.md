
### Crea una base de datos que tendrá por nombre Base_Indices:

```sql
CREATE DATABASE Base_indices;
```
### En la BD crea una tabla de nombre MOVIMIENTO con la siguiente estructura:

```sql
CREATE TABLE MOVIMIENTO (
    Identificador INT NOT NULL AUTO_INCREMENT,
    Articulo VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Cantidad INT NOT NULL,
    PRIMARY KEY(Identificador)
);

```
### Aplica la sentencia adecuada para visualizar los índices que hay en la tabla.

```sql
SHOW INDEX FROM MOVIMIENTO;

+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO |          0 | PRIMARY  |            1 | Identificador | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

```
### Ejecuta la siguiente sentencia sql para generar datos de prueba:

```sql

select count(identificador) as total from MOVIMIENTO;
+-------+
| total |
+-------+
|  3589 |
+-------+

```
### Crea con la sentencia CREATE TABLE…SELECT… un duplicado de la tabla MOVIMIENTO a la que llamaremos MOVIMIENTO_BIS.

```sql
create table MOVIMIENTO_BIS select * from MOVIMIENTO;

Query OK, 3589 rows affected (0,07 sec)
Records: 3589  Duplicates: 0  Warnings: 0

```

### Con la cláusula DESCRIBE observa cuál es la situación de la tabla clonada, ¿Qué le pasa al índice y a la propiedad AUTO_INCREMENT?

```sql
describe MOVIMIENTO_BIS;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Identificador | int         | NO   |     | 0       |       |
| Articulo      | varchar(50) | NO   |     | NULL    |       |
| Fecha         | date        | NO   |     | NULL    |       |
| Cantidad      | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+

```

### Utilizando EXPLAIN observa el plan de ejecución de la consulta que devuelve toda la información de los movimientos con identificador=3. Tanto en la tabla MOVIMIENTOS como en la tabla MOVIMIENTOS_bis. Escribe tus conclusiones al respecto.

```sql
EXPLAIN select * from MOVIMIENTO where IDENTIFICADOR = '3';

+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+

EXPLAIN select * from MOVIMIENTO_BIS where IDENTIFICADOR = '3';
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3589 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+

```
### Supongamos que las consultas de rango que se van a hacer en nuestra tabla son frecuentes y además no por el identificador, sino por la fecha. Este es motivo suficiente para que sea la fecha un índice de tabla y así mejorar el tiempo de respuesta de nuestras consultas. En la tabla MOVIMIENTO_BIS creamos un índice para la fecha (IX_FECHA_BIS) y otro índice para el identificador (IX_IDENTIFICADOR).

```sql
CREATE INDEX IX_FECHA_BIS on MOVIMIENTO_BIS (fecha);
CREATE INDEX IX_IDENTIFICADOR on MOVIMIENTO_BIS (identificador);

```

### Analiza el plan de ejecución de las siguientes consultas y observa la diferencia: Consulta1

```sql


```

### Analiza el plan de ejecución de las siguientes consultas y observa la diferencia: 
- Consulta1

```sql


```

- consulta 2.

```sql


```

#### Fijate que en la consulta 2 pedimos todos los campos. ¿A través de que índice busca? ¿Por qué crees que lo hace así? En la consulta 1 solo pedimos la fecha. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.

- Vamos a crear un índice por fecha (IX_FECHA) en la tabla MOVIMIENTO, puesto que no lo tenía, en este caso la tabla ya tenía un indice, la clave primaria.

```sql

```
- Visualiza los indices de las tablas MOVIMIENTO y MOVIMIENTO_BIS.

```sql

```

### Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:
- Consulta 1

```sql

```
- Consulta 2

```sql

```

- Consulta 3

```sql

```

- Consulta 4

```sql

```
