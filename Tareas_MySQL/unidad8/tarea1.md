### Crea la BBDD. 

- Utilizaremos comandos SQL para crear una base de datos llamada "SimpleDB" que contendrá dos tablas: "Users" para almacenar información de usuarios y "Products" para almacenar información de productos.

- Realiza la inserción de algunos datos de prueba.

- INSERTA 3 DATOS
```sql
INSERT INTO Products (ProductName, Price) VALUES ('Producto 4', 80.75);
Query OK, 1 row affected (0,01 sec)

INSERT INTO Products (ProductName, Price) VALUES ('Producto 5', 90.00);
Query OK, 1 row affected (0,00 sec)

INSERT INTO Products (ProductName, Price) VALUES ('Producto 6', 1.00);
Query OK, 1 row affected (0,00 sec)

```

### Crea procedimientos almacenados para realizar operaciones como insertar un nuevo usuario, actualizar el nombre de un usuario, etc.

- Procedimiento para insertar un nuevo usuario.
```sql

DROP procedure if exist add_user;
DELIMITER //
CREATE procedure add_user(in user_name VARCHAR(50), in e_mail VARCHAR(50))
BEGIN
INSERT INTO Users (UserName, Email) VALUES (user_name, e_mail);
END //
DELIMITER ;

call add_user('toni','sabrosin@gmail.com');

+--------+----------+--------------------+
| UserID | UserName | Email              |
+--------+----------+--------------------+
|      1 | Juan     | juan@example.com   |
|      2 | María    | maria@example.com  |
|      3 | Pedro    | pedro@example.com  |
|      4 | toni     | sabrosin@gmail.com |
+--------+----------+--------------------+

```

- Procedimiento rocedimiento para actualizar el nombre de un usuario.
```sql

DROP procedure if exist update_user;
DELIMITER //
CREATE procedure update_user(in new_name VARCHAR(50), in user_name VARCHAR(50))
BEGIN
UPDATE Users set UserName = user_name where UserName = new_name;
END //
DELIMITER ;

 select * from Users;
+--------+----------+--------------------+
| UserID | UserName | Email              |
+--------+----------+--------------------+
|      1 | Juan     | juan@example.com   |
|      2 | María    | maria@example.com  |
|      3 | Pedro    | pedro@example.com  |
|      4 | Agustin  | sabrosin@gmail.com |
+--------+----------+--------------------+

```

### Implementa funciones para realizar cálculos o consultas:

- Función para calcular el precio total de un conjunto de productos.
```sql
DELIMITER //
Create function price_counter() returns real deterministic
BEGIN
declare result real;
Select sum(Price) from Products into result;
return result;
END //
DELIMITER ;

select price_counter();
+-----------------+
| price_counter() |
+-----------------+
|          218.99 |
+-----------------+
1 row in set (0,00 sec)

```

- Función para contar el número de usuarios.

```sql
DELIMITER //
Create function user_counter() returns integer deterministic
BEGIN
declare result integer;
Select COUNT(UserID) from Users into result;
return result;
END //
DELIMITER ;

select user_counter();
+----------------+
| user_counter() |
+----------------+
|              4 |
+----------------+


```