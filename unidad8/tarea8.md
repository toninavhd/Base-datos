
```
sql

CREATE DATABASE test;
USE test;

CREATE TABLE alumnos (
    id INT UNSIGNED,
    nombre VARCHAR(255),
    apellido1 VARCHAR(255),
    apellido2 VARCHAR(255),
    email VARCHAR(255)
);

DELIMITER //
CREATE FUNCTION eliminar_acentos(cadena VARCHAR(255)) RETURNS VARCHAR(255)
BEGIN
    DECLARE cadena_sin_acentos VARCHAR(255);
    SET cadena_sin_acentos = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(cadena, 'á', 'a'), 'é', 'e'), 'í', 'i'), 'ó', 'o'), 'ú', 'u');
    RETURN cadena_sin_acentos;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION crear_email(nombre VARCHAR(255), apellido1 VARCHAR(255), apellido2 VARCHAR(255), dominio VARCHAR(255)) RETURNS VARCHAR(255)
BEGIN
    DECLARE email VARCHAR(255);
    SET nombre = LOWER(eliminar_acentos(nombre));
    SET apellido1 = LOWER(eliminar_acentos(apellido1));
    SET apellido2 = LOWER(eliminar_acentos(apellido2));
    SET email = CONCAT(SUBSTRING(nombre, 1, 1), SUBSTRING(apellido1, 1, 3), SUBSTRING(apellido2, 1, 3), '@', dominio);
    RETURN email;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trigger_crear_email_before_insert BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.email IS NULL THEN
        SET NEW.email = crear_email(NEW.nombre, NEW.apellido1, NEW.apellido2, 'dominio.com');
    END IF;
END //
DELIMITER ;
```