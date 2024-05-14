Trabajo con procedimientos de generación de información

Dado el procedimiento base:
```sql
DELIMITER //

CREATE PROCEDURE my_loop(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

-- Llama al procedimiento 
CALL my_loop(5);
```

Y las funciones descritas en aleatoriedad, realiza los siguientes procedimientos, que realicen las siguietes operaciones:

- Inserta cinco filas en la tabla empleados con nombres aleatorios generados usando la función CONCAT() junto con RAND().
```sql
      INSERT INTO empleados (nombre, salario)
      VALUES (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
            (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
            (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
            (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
            (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);

            --Resultado:
            select * from empleados;
+----+-----------------------------+---------+
| id | nombre                      | salario |
+----+-----------------------------+---------+
|  1 | Juan                        | 3300.00 |
|  2 | María                       | 3850.00 |
|  3 | Pedro                       | 3200.00 |
|  4 | Empleado0.29772894391578525 | 5977.00 |
|  5 | Empleado0.5923246718871636  | 5763.00 |
|  6 | Empleado0.5746085472168481  | 5697.00 |
|  7 | Empleado0.5866406267384445  | 6375.00 |
|  8 | Empleado0.974695259681619   | 3861.00 |
+----+-----------------------------+---------+
```
Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función UUID().
```sql
INSERT INTO empleados (nombre, salario)
VALUES (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
      (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
      (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);

      -- Resultado:
      select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3300.00 |
|  2 | María                                | 3850.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.29772894391578525          | 5977.00 |
|  5 | Empleado0.5923246718871636           | 5763.00 |
|  6 | Empleado0.5746085472168481           | 5697.00 |
|  7 | Empleado0.5866406267384445           | 6375.00 |
|  8 | Empleado0.974695259681619            | 3861.00 |
|  9 | 9aa0ca07-1200-11ef-8d0a-080027bd7b7f | 3915.00 |
| 10 | 9aa0d5fe-1200-11ef-8d0a-080027bd7b7f | 5993.00 |
| 11 | 9aa0d7c4-1200-11ef-8d0a-080027bd7b7f | 8218.00 |
+----+--------------------------------------+---------+
```
Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND().
```sql
INSERT INTO empleados (nombre, salario)
SELECT CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000
FROM (SELECT 1 UNION SELECT 2) AS sub
ORDER BY RAND()
LIMIT 2;

mysql> select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3300.00 |
|  2 | María                                | 3850.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.29772894391578525          | 5977.00 |
|  5 | Empleado0.5923246718871636           | 5763.00 |
|  6 | Empleado0.5746085472168481           | 5697.00 |
|  7 | Empleado0.5866406267384445           | 6375.00 |
|  8 | Empleado0.974695259681619            | 3861.00 |
|  9 | 9aa0ca07-1200-11ef-8d0a-080027bd7b7f | 3915.00 |
| 10 | 9aa0d5fe-1200-11ef-8d0a-080027bd7b7f | 5993.00 |
| 11 | 9aa0d7c4-1200-11ef-8d0a-080027bd7b7f | 8218.00 |
| 12 | Empleado0.6116047339621975           | 9137.00 |
| 13 | Empleado0.4525537029398174           | 5083.00 |
+----+--------------------------------------+---------+

```
Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1).
```sql
INSERT INTO empleados (nombre, salario)
VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
      (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
      (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
      (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);

+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3300.00 |
|  2 | María                                | 3850.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.29772894391578525          | 5977.00 |
|  5 | Empleado0.5923246718871636           | 5763.00 |
|  6 | Empleado0.5746085472168481           | 5697.00 |
|  7 | Empleado0.5866406267384445           | 6375.00 |
|  8 | Empleado0.974695259681619            | 3861.00 |
|  9 | 9aa0ca07-1200-11ef-8d0a-080027bd7b7f | 3915.00 |
| 10 | 9aa0d5fe-1200-11ef-8d0a-080027bd7b7f | 5993.00 |
| 11 | 9aa0d7c4-1200-11ef-8d0a-080027bd7b7f | 8218.00 |
| 12 | Empleado0.6116047339621975           | 9137.00 |
| 13 | Empleado0.4525537029398174           | 5083.00 |
| 15 | 080027bd7b7f                         | 6556.00 |
| 16 | 080027bd7b7f                         | 7528.00 |
| 17 | 080027bd7b7f                         | 7972.00 |
| 18 | 080027bd7b7f                         | 7277.00 |
+----+--------------------------------------+---------+
```

Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.
```sql
INSERT INTO empleados (nombre, salario)
VALUES (CONCAT('Empleado', RAND(1)), FLOOR(RAND(1) * (10000 - 2000 + 1)) + 2000),
      (CONCAT('Empleado', RAND(2)), FLOOR(RAND(2) * (10000 - 2000 + 1)) + 2000),
      (CONCAT('Empleado', RAND(3)), FLOOR(RAND(3) * (10000 - 2000 + 1)) + 2000),
      (CONCAT('Empleado', RAND(4)), FLOOR(RAND(4) * (10000 - 2000 + 1)) + 2000),
      (CONCAT('Empleado', RAND(5)), FLOOR(RAND(5) * (10000 - 2000 + 1)) + 2000),
      (CONCAT('Empleado', RAND(6)), FLOOR(RAND(6) * (10000 - 2000 + 1)) + 2000);

      --Resultado

      select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3300.00 |
|  2 | María                                | 3850.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.29772894391578525          | 5977.00 |
|  5 | Empleado0.5923246718871636           | 5763.00 |
|  6 | Empleado0.5746085472168481           | 5697.00 |
|  7 | Empleado0.5866406267384445           | 6375.00 |
|  8 | Empleado0.974695259681619            | 3861.00 |
|  9 | 9aa0ca07-1200-11ef-8d0a-080027bd7b7f | 3915.00 |
| 10 | 9aa0d5fe-1200-11ef-8d0a-080027bd7b7f | 5993.00 |
| 11 | 9aa0d7c4-1200-11ef-8d0a-080027bd7b7f | 8218.00 |
| 12 | Empleado0.6116047339621975           | 9137.00 |
| 13 | Empleado0.4525537029398174           | 5083.00 |
| 15 | 080027bd7b7f                         | 6556.00 |
| 16 | 080027bd7b7f                         | 7528.00 |
| 17 | 080027bd7b7f                         | 7972.00 |
| 18 | 080027bd7b7f                         | 7277.00 |
| 19 | Empleado0.40540353712197724          | 5243.00 |
| 20 | Empleado0.6555866465490187           | 7245.00 |
| 21 | Empleado0.9057697559760601           | 9247.00 |
| 22 | Empleado0.15595286540310166          | 3247.00 |
| 23 | Empleado0.40613597483014313          | 5249.00 |
| 24 | Empleado0.6563190842571847           | 7251.00 |
+----+--------------------------------------+---------+
```
Crea cada uno de los procedimientos, maximixando el número de parámetros de entrada necesarios, por ejemplo: _nombre, salario, e id.

Crea el procedimiento, la invocación, y el estado de la tabla después de la invocación de este.