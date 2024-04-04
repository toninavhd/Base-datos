# TAREA 2

#### Elimine la tabla "cliente" si existe.

```sql
DROP TABLE IF EXISTS cliente;
```

#### Cree la tabla sin clave primaria e incluye a posteriori esta.

- Creación de la tabla sin clave primaria.

```sql
    CREATE TABLE clientes (
    documento CHAR(8) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    telefono VARCHAR(11),    
    domicilio VARCHAR(30),
    ciudad VARCHAR(20),
    provincia VARCHAR(20),
);
```

- Insertar clave primaria.

### Define los siguientes indices:

#### Un índice único por el campo "documento" y un índice común por ciudad y provincia.

- Nota:Muestra el comando y la salida. Justifica el tipo de indice en un comentario.

#### Vea los índices de la tabla.

- Nota:Muestra el comando y la salida "show index".

#### Agregue un índice único por el campo "telefono".

- Nota:Muestra el comando y la salida.

#### Elimina los índices.

- Nota:Muestra el comando y la salida.