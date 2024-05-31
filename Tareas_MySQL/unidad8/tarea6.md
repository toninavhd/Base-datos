
# Tarea 6

## Crea una tabla llamada persona con los siguientes campos:

- Identificador. (Texto)(PK).
- Nombre (Texto).
- Salario_base. (Escoge el tipo de dato).
- Subsidio(Escoge el tipo de dato).
- Salud(Escoge el tipo de dato).
- Pensión(Escoge el tipo de dato).
- Bono(Escoge el tipo de dato).
- Integral(Escoge el tipo de dato).

```sql
CREATE DATABASE salario;

USE salario;

CREATE TABLE persona (
    Identificador VARCHAR(255) PRIMARY KEY,
    Nombre VARCHAR(255),
    Salario_base DECIMAL(10, 2),
    Subsidio DECIMAL(10, 2),
    Salud DECIMAL(10, 2),
    Pension DECIMAL(10, 2),
    Bono DECIMAL(10, 2),
    Integral DECIMAL(10, 2)
);
```

## Creación de un procedimiento de forma aleatoria con las siguientes características:

  - Parámetro de entrada el número de registros (Mínimo 10, y realiza la prueba varias veces).
  
```sql

DELIMITER $$

CREATE PROCEDURE InsertarRegistros(IN numRegistros INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE randomSalario DECIMAL(10, 2);

    WHILE i < numRegistros DO
        SET randomSalario = RAND() * 10;
        INSERT INTO persona (Identificador, Nombre, Salario_base, Subsidio, Salud, Pension, Bono, Integral)
        VALUES (UUID(), CONCAT('Persona ', i), randomSalario, 0, 0, 0, 0, 0);
        SET i = i + 1;
    END WHILE;

    DECLARE cur CURSOR FOR SELECT Identificador FROM persona;
    DECLARE @id VARCHAR(255);

    OPEN cur;

    FETCH NEXT FROM cur INTO @id;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        CALL subsidio_transporte(@id);
        CALL salud(@id);
        CALL pension(@id);
        CALL bono(@id);
        CALL integral(@id);

        FETCH NEXT FROM cur INTO @id;
    END;

    CLOSE cur;
END$$

DELIMITER ;


```

- Cree una función para cada punto teniendo en cuenta que:

```sql

-- Función subsidio_transporte: El subsidio de transporte equivale al 7% al salario básico. Actualiza el valor en la tabla.

DELIMITER $$

CREATE FUNCTION subsidio_transporte(id VARCHAR(255))
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE salario_base DECIMAL(10, 2);
    SELECT Salario_base INTO salario_base FROM persona WHERE Identificador = id;
    UPDATE persona SET Subsidio = salario_base * 0.07 WHERE Identificador = id;
    RETURN salario_base * 0.07;
END$$

-- Función salud: La salud que corresponde al 4% al salario básico. Actualiza el valor en la tabla.

CREATE FUNCTION salud(id VARCHAR(255))
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE salario_base DECIMAL(10, 2);
    SELECT Salario_base INTO salario_base FROM persona WHERE Identificador = id;
    UPDATE persona SET Salud = salario_base * 0.04 WHERE Identificador = id;
    RETURN salario_base * 0.04;
END$$

-- Función pension: La pensión que corresponde al 4% al salario básico. Actualiza el valor en la tabla.

CREATE FUNCTION pension(id VARCHAR(255))
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE salario_base DECIMAL(10, 2);
    SELECT Salario_base INTO salario_base FROM persona WHERE Identificador = id;
    UPDATE persona SET Pension = salario_base * 0.04 WHERE Identificador = id;
    RETURN salario_base * 0.04;
END$$

-- Función bono: Un bono que corresponde al 8% al salario básico. Actualiza el valor en la tabla.

CREATE FUNCTION bono(id VARCHAR(255))
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE salario_base DECIMAL(10, 2);
    SELECT Salario_base INTO salario_base FROM persona WHERE Identificador = id;
    UPDATE persona SET Bono = salario_base * 0.08 WHERE Identificador = id;
    RETURN salario_base * 0.08;
END$$

-- Función integral: El salario integral es la suma del salario básico - salud - pension + bono + sub de transporte. Actualiza el valor en la tabla.

CREATE FUNCTION integral(id VARCHAR(255))
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE salario_base, subsidio, salud, pension, bono DECIMAL(10, 2);
    SELECT Salario_base, Subsidio, Salud, Pension, Bono INTO salario_base, subsidio, salud, pension, bono FROM persona WHERE Identificador = id;
    UPDATE persona SET Integral = salario_base - salud - pension + bono + subsidio WHERE Identificador = id;
    RETURN salario_base - salud - pension + bono + subsidio;
END$$

DELIMITER ;
```
