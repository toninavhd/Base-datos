# Tarea 9

### Modifica el ejercicio anterior y añade un nuevo trigger que las siguientes características: Trigger: trigger_guardar_email_after_update:

- Se ejecuta sobre la tabla alumnos.
```sql
USE alumnos;
```
- Se ejecuta después de una operación de actualización.
```sql
UPDATE AFTER alumnos;
```
- Cada vez que un alumno modifique su dirección de email se deberá insertar un nuevo registro en una tabla llamada log_cambios_email.
```sql
CREATE TRIGGER log_cambios_email BEFORE

```
- La tabla log_cambios_email contiene los siguientes campos:
  - id: clave primaria (entero autonumérico)
  - id_alumno: id del alumno (entero)
  - fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
  - old_email: valor anterior del email (cadena de caracteres)
  - new_email: nuevo valor con el que se ha actualizado
```sql
CREATE TABLE log_cambios_email(id INT AUTO_INCREMENT PRIMARY KEY,
id_alumno INTEGER,
fecha_hora DATE,
old_email VARCHAR(50),
new_email VARCHAR(50)
);
```
### Añade un nuevo trigger que tenga las siguientes características:

- Trigger: trigger_guardar_alumnos_eliminados:
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta después de una operación de borrado.
  - Cada vez que se elimine un alumno de la tabla alumnos se deberá insertar un nuevo registro en una tabla llamada log_alumnos_eliminados.
```sql
CREATE TRIGGER trigger_guardar_alumnos_eliminados
AFTER UPDATE ON alumnos
FOR EACH ROW
BEGIN
INSERT INTO log_cambios_email (id_alumno, old_email, new_email) values(OLD id INT AU)
```
  - La tabla log_alumnos_eliminados contiene los siguientes campos:
    - id: clave primaria (entero autonumérico)
    - id_alumno: id del alumno (entero)
    - fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
    - nombre: nombre del alumno eliminado (cadena de caracteres)
    - apellido1: primer apellido del alumno eliminado (cadena de caracteres)
    -  apellido2: segundo apellido del alumno eliminado (cadena de caracteres)
    - email: email del alumno eliminado (cadena de caracteres).
