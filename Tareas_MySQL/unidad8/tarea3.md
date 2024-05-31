```sql
-- Crear la base de datos

CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- Crear la tabla empleados

CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

-- Insertar algunos datos de ejemplo

INSERT INTO empleados (nombre, salario) VALUES
('Juan', 3000.00),
('María', 3500.00),
('Pedro', 3200.00);
```
- Escribe un procedimiento almacenado que aumente los salarios de todos los empleados en un 5%, pero excluya a aquellos cuyo salario sea superior a 3200. El procedimiento debe tener parámetros de entrada.

```sql
  DELIMITER //
  CREATE PROCEDURE aumentar_salario(IN porcentaje DECIMAL(5,2))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          UPDATE empleados SET salario = salario * (1 + 0.05 / 100) WHERE id = emp_id AND salario > 3200;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;
```

- Calcular el salario anual de cada empleado (asumiendo que trabajan todo el año) y lo imprima:

```sql
DROP PROCEDURE IF EXISTS salario_anual;

  DELIMITER //
  CREATE PROCEDURE salario_anual(IN id_empleado INT)
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          SELECT id, nombre, salario * 12 as salario_anual from empleados WHERE id = id_empleado;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;

call salario_anual(2);

+----+--------+---------------+
| id | nombre | salario_anual |
+----+--------+---------------+
|  2 | María  |      42063.00 |
+----+--------+---------------+
1 row in set (0,00 sec)

```

- Contar y mostrar el número de empleados en cada rango de salario (por ejemplo, menos de 3000, entre 3000 y 5000, más de 5000):

```sql
DROP PROCEDURE IF EXISTS rango_salario;

  DELIMITER //
  CREATE PROCEDURE rango_salario(IN min_limit INT, max_limit INT)
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          SELECT id, nombre, salario from empleados WHERE salario BETWEEN min_limit AND max_limit;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;

call rango_salario(3200, 3600);

+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  2 | María  | 3505.25 |
|  3 | Pedro  | 3365.04 |
+----+--------+---------+
2 rows in set (0,00 sec)



```