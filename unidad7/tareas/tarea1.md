
### Elimine la tabla "alumno" si existe.

```sql
DROP TABLE IF EXISTS alumno;
```

### Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción).

- Crear database

```sql
CREATE DATABASE alumnodb;

USE alumnodb;
```

- Crear tabla

```sql
CREATE TABLE alumno (
    inscripcion INT NOT NULL,
    numero INT NOT NULL,
    nombre VARCHAR(50),
    documento CHAR(8) NOT NULL,
    domicilio VARCHAR(100),
    ciudad VARCHAR(50),
    provincia VARCHAR(50),
    PRIMARY KEY (inscripcion, numero)
);
```

### Define los siguientes indices:

```sql
CREATE UNIQUE INDEX idx_documento ON alumno (documento);
```

- Un índice único por el campo "documento" y un índice común por ciudad y provincia.
  
```sql

CREATE INDEX idx_ciudad_provincia ON alumno (ciudad, provincia);

```

- Vea los índices de la tabla.

```sql

SHOW INDEX FROM alumno;

+--------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name             | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY              |            1 | inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY              |            2 | numero      | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | idx_documento        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

```

- Intente ingresar un alumno con clave primaria repetida.

```sql
INSERT INTO alumno (inscripcion, numero, nombre, documento, domicilio, ciudad, provincia)
VALUES (2022, 1, 'Juan Pérez', '12345678', 'Av. Principal 123', 'Ciudad A', 'Provincia X');
```

- Intente ingresar un alumno con documento repetido.

```sql
INSERT INTO alumno (inscripcion, numero, nombre, documento, domicilio, ciudad, provincia)
VALUES (2022, 2, 'María López', '12345678', 'Calle Secundaria 456', 'Ciudad B', 'Provincia Y');

/*salida*/
ERROR 1062 (23000): Duplicate entry '12345678' for key 'alumno.idx_documento'

```

- Ingrese varios alumnos de la misma ciudad y provincia.

```sql
INSERT INTO alumno (inscripcion, numero, nombre, documento, domicilio, ciudad, provincia)
VALUES (2022, 3, 'Carlos Rodríguez', '87654321', 'Calle Principal 789', 'Ciudad A', 'Provincia X'),(2022, 4, 'Ana García', '23456789', 'Av. Secundaria 567', 'Ciudad A', 'Provincia X');

/*salida*/
Query OK, 2 rows affected (0,01 sec)
Records: 2  Duplicates: 0  Warnings: 0

```

- Elimina los indices creados.

