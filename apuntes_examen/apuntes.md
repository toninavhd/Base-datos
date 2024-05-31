# Apuntes examen

## Aspectos básicos:

### Creación de base de datos:

```sql
DROP DATABASE IF EXISTS database_nombre;
CREATE DATABASE database_nombre;

USE database_nombre;
```

### Creación de tablas:

```sql
DROP TABLE IF EXISTS table_name;
CREATE TABLE table_name (
    id INT PRIMARY KEY AUTO_INCREMENT,
    texto VARCHAR(100),
    numero_entero INT,
    fecha DATE,
);
```

- Para valores de dominio (restringidos) usar:

```sql
CREATE TABLE tu_tabla (
    tu_columna INT,
    CONSTRAINT check_tu_columna CHECK (tu_columna IN (1, 2, 3))
     -- Solo permite los valores 1, 2 y 3
);
```

### Declaración de variables:

```sql
DECLARE @nombre_de_variable tipo_de_dato;
SET @nombre_de_variable = valor;
```

Ejemplo:

```sql
    DECLARE counter INT DEFAULT 0;
    DECLARE auxiliar INT;
    DECLARE p_id VARCHAR(100);
    DECLARE p_peso INT;
    DECLARE p_admitido VARCHAR(10);
    DECLARE p_sexo VARCHAR(10);
    WHILE counter < num_registros DO
        SET p_id = SUBSTRING_INDEX(UUID(), '-', 1);
        SET p_peso = RAND() * (peso_max - peso_min) + peso_min;
        SET auxiliar = (RAND() * 100) + 1;
        . . .
```

### Asignar variables:

```sql
SELECT campo1, campo2, . . . INTO variable1, variable2, . . . 
FROM nombre_tabla WHERE . . .
```

Puedes tambien declarar valores por defecto de la siguiente manera:

```sql
DECLARE nombre_variable tipo_variable [DEFAULT valor];
```



## Procedimientos:

La estructura para crear un procedimiento serìa la siguiente:

```sql
DELIMITER //
CREATE PROCEDURE procedure_name([IN|OUT|INOUT] param_name param_type...)
BEGIN
    -- Instrucciones SQL
END //
DELIMITER ;

```

ejemplo de procedimiento:

```sql
--Realiza un procedimiento que permita actualizar el la fecha de última donación, teniendo como parámetro de entrada el identificador de la persona, y una fecha.

DROP PROCEDURE IF EXISTS actualizar_fecha;
DELIMITER //

CREATE PROCEDURE actualizar_fecha(IN input_id VARCHAR(100), input_fecha DATE)
BEGIN

    UPDATE persona SET fecha = input_fecha WHERE identificador = input_id;

END //
DELIMITER ;

--llamar al procedimiento:

CALL actualizar_fecha('82dc7194', '2024-02-04');
SELECT * FROM persona WHERE identificador = '82dc7194';

```
