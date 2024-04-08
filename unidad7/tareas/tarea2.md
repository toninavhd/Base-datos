# TAREA 2

#### Elimine la tabla "cliente" si existe.

```sql
DROP TABLE IF EXISTS cliente;
```

####``` Cree la tabla sin clave primaria e incluye a posteriori esta.

- Creación de la tabla sin clave primaria.

```sql
    CREATE TABLE clientes (
    documento CHAR(8) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    telefono VARCHAR(11),    
    domicilio VARCHAR(30),
    ciudad VARCHAR(20),
    provincia VARCHAR(20)
);
```

- Insertar clave primaria.
```sql
ALTER TABLE clientes MODIFY documento CHAR NOT NULL, ADD PRIMARY KEY(documento);
```

### Define los siguientes indices:

#### Un índice único por el campo "documento" y un índice común por ciudad y provincia.

```sql
CREATE UNIQUE INDEX idx_documento ON clientes (documento);

CREATE INDEX x_ciudad_provincia ON clientes (ciudad, provincia);

```

#### Vea los índices de la tabla.

```sql
SHOW INDEX FROM clientes;

+----------+------------+--------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name           | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+--------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| clientes |          0 | idx_documento      |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| clientes |          1 | x_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| clientes |          1 | x_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+----------+------------+--------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

```

#### Agregue un índice único por el campo "telefono".
```sql
CREATE UNIQUE INDEX idx_telefono ON clientes (telefono);
+----------+------------+--------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name           | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+--------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| clientes |          0 | idx_documento      |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| clientes |          0 | idx_telefono       |            1 | telefono    | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| clientes |          1 | x_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| clientes |          1 | x_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+----------+------------+--------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+


```

#### Elimina los índices.

```sql
DROP INDEX idx_documento ON clientes;
DROP INDEX x_ciudad_provincia ON clientes;
DROP INDEX idx_telefono ON clientes;

SHOW INDEX FROM clientes;
Empty set (0,00 sec)

```