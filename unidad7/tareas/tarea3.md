
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