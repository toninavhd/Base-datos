## Se pide realizar los procedimientos y funciones:

### Realice los siguientes procedimientos y funciones sobre la base de datos jardineria.

- Función calcular_precio_total_pedido

    ```sql


    ```

##### Parámetros de entrada: codigo_pedido (INT)
##### Parámetros de salida: El precio total del pedido (FLOAT)

-  Función calcular_suma_pedidos_cliente

    ```sql

    DELIMITER //
    Create function calcular_suma_pedidos_cliente() returns real deterministic
    BEGIN
    declare result real;
    Select sum(Price) from Products into result;
    return result;
    END //
    DELIMITER ;

    ```

##### Parámetros de entrada: codigo_cliente (INT)
##### Parámetros de salida: La suma total de todos los pedidos del cliente (FLOAT)

- Función calcular_suma_pagos_cliente

    ```sql


    ```
##### Parámetros de entrada: codigo_cliente (INT)
##### Parámetros de salida: La suma total de todos los pagos del cliente (FLOAT)

-  Procedimiento calcular_pagos_pendientes
  
  ```sql

  ```

##### Nota: Deberá calcular los pagos pendientes de todos los clientes. Para saber si un cliente tiene algún pago pendiente deberemos calcular cuál es la cantidad de todos los pedidos y los pagos que ha realizado. Si la cantidad de los pedidos es mayor que la de los pagos entonces ese cliente tiene pagos pendientes.

