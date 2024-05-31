# Primeros pasos SQL

## Creamos una tabla
#### Primero creamos nuestra tabla usando los comandos adecuados:
```
create table Ejemplo (
	 texto text not null primary key autoincrement,
	 entero integer not null,
     decimal decimal not null,
     fecha text not null,
     booleano boolean not null,
);
```
Una vez creada la tabla comenzamos a insertar los datos.

Cada entrada debe ponerse de la siguiente forma:
```
insert into Ejemplo( texto, entero, decimal, fecha, booleano )
VALUES('Ejemplo', 12, 30.0, '2022-07-10', 0);
```
Así quedaría nuestra tabla tras insertar datos:

![tabla](img/bae.png)

## Consultas
### obten todas las entradas:
#### las entradas se obtinen con el siguiente comando.
```
select * from Ejemplo;
```
![consulta](img/bae2.png)
### Obten las entradas con el campo entero mayor que 50.
#### Para realizar esta consulta debemos poner el siguiente comando:
```
select entero from Ejemplo where entero > 50;
```

![consulta](img/bae3.png)

### Elimina las entradas donde booleano es igual a true.
```
delete from Ejemplo where booleano = 1;
```

### Modifica el campo texto donde el campo entero es menor que 30 y establece el texto como ''Modificado''.

```
Update Ejemplo set texto = 'Modificado' where entero < 30;
```

### Elimina entradas donde entero =50

```
delete from Ejemplo where entero = 50;
```
### Incrementa en 10 el valor del campo entero para los booleanos igual a false.

```
update Ejemplo Set entero = entero + 10 where booleano = 0;
```

### Elimina entradas donde el campo decimal sea menor que 50

```
delete from Ejemplo where decimal < 50;
```
### Actualiza campo fecha de todas las entradas a la fecha actual.
```
Update Ejemplo set fecha = '2023-12-15' where booleano = 0;
```