
### Elimine la tabla "alumno" si existe.

```sql
DROP TABLE IF EXISTS alumno;
```

### Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción).

- Crear database

```sql
CREATE DATABASE alumnodb;

USE DATABASE alumnodb;
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
```

- Ingrese varios alumnos de la misma ciudad y provincia.

```sql
  INSERT INTO alumno (anio, numero, nombre, documento, domicilio, ciudad, provincia)
VALUES
    (2022, 3, 'Carlos Rodríguez', '87654321', 'Calle Principal 789', 'Ciudad A', 'Provincia X'),
    (2022, 4, 'Ana García', '23456789', 'Av. Secundaria 567', 'Ciudad A', 'Provincia X');
```

- Elimina los indices creados, y muestra que ya no se encuentran.

```sql
-- Eliminar el índice único
ALTER TABLE alumno DROP INDEX idx_documento;

-- Eliminar el índice común
ALTER TABLE alumno DROP INDEX idx_ciudad_provincia;

```
