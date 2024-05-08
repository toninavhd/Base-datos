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
CREATE PROCEDURE salarioAnual
AS
BEGIN
    SELECT id_empleado, nombre, salario * 12 AS 'salario anual'
    FROM Empleados;
END;
```

- Contar y mostrar el número de empleados en cada rango de salario (por ejemplo, menos de 3000, entre 3000 y 5000, más de 5000):

```sql
CREATE PROCEDURE ContarEmpleadosPorRangoSalario
AS
BEGIN
    SELECT 
        SUM(CASE WHEN salario < 3000 THEN 1 ELSE 0 END) AS 'Menos de 3000',
        SUM(CASE WHEN salario BETWEEN 3000 AND 5000 THEN 1 ELSE 0 END) AS 'Entre 3000 y 5000',
        SUM(CASE WHEN salario > 5000 THEN 1 ELSE 0 END) AS 'Más de 5000'
    FROM Empleados;
END;

```