# Tarea consultas


## Realiza las siguientes consultas.
------------------------
### Muestra el nombre de todos los empleados en mayúsculas.
```sql
select nombre, upper(nombre) as nombre_Mayuscula from empleados;
┌───────────┬──────────────────┐
│  nombre   │ nombre_Mayuscula │
├───────────┼──────────────────┤
│ Juan      │ JUAN             │
│ María     │ MARíA            │
│ Carlos    │ CARLOS           │
│ Ana       │ ANA              │
│ Pedro     │ PEDRO            │
│ Laura     │ LAURA            │
│ Javier    │ JAVIER           │
│ Carmen    │ CARMEN           │
│ Miguel    │ MIGUEL           │
│ Elena     │ ELENA            │
│ Diego     │ DIEGO            │
│ Sofía     │ SOFíA            │
│ Andrés    │ ANDRéS           │
│ Isabel    │ ISABEL           │
│ Raúl      │ RAúL             │
│ Patricia  │ PATRICIA         │
│ Alejandro │ ALEJANDRO        │
│ Natalia   │ NATALIA          │
│ Roberto   │ ROBERTO          │
│ Beatriz   │ BEATRIZ          │
└───────────┴──────────────────┘


```
------------------


### Calcula el valor absoluto del salario de todos los empleados.


``` sql
sqlite> select abs(salario) as Salario_abs from empleados;




┌─────────────┐
│ Salario_abs │
├─────────────┤
│ 50000.0     │
│ 60000.0     │
│ 55000.0     │
│ 48000.0     │
│ 70000.0     │
│ 52000.0     │
│ 48000.0     │
│ 65000.0     │
│ 51000.0     │
│ 55000.0     │
│ 72000.0     │
│ 49000.0     │
│ 60000.0     │
│ 53000.0     │
│ 68000.0     │
│ 47000.0     │
│ 71000.0     │
│ 54000.0     │
│ 49000.0     │
│ 63000.0     │
└─────────────┘
```
-------------


### Muestra la fecha actual.


``` sql
select current_date;


┌──────────────┐
│ current_date │
├──────────────┤
│ 2024-01-17   │
└──────────────┘


```
-------------
### Calcula el promedio de salarios de todos los empleados.


``` sql
select avg(salario) from empleados;


┌──────────────┐
│ avg(salario) │
├──────────────┤
│ 57000.0      │
└──────────────┘


```
------------------
### Convierte la cadena '123' a un valor entero.


``` sql
select cast('123' as integer) as valor_entero


┌──────────────┐
│ valor_entero │
├──────────────┤
│ 123          │
└──────────────┘
```
---------------


### Concatena nombre y departamento


```sql
select nombre || '-' || departamento as nombre_departamento from empleados;


┌───────────────────────────┐
│    nombre_departamento    │
├───────────────────────────┤
│ Juan-Ventas               │
│ María-TI                  │
│ Carlos-Ventas             │
│ Ana-Recursos Humanos      │
│ Pedro-TI                  │
│ Laura-Ventas              │
│ Javier-Recursos Humanos   │
│ Carmen-TI                 │
│ Miguel-Ventas             │
│ Elena-Recursos Humanos    │
│ Diego-TI                  │
│ Sofía-Ventas              │
│ Andrés-Recursos Humanos   │
│ Isabel-TI                 │
│ Raúl-Ventas               │
│ Patricia-Recursos Humanos │
│ Alejandro-TI              │
│ Natalia-Ventas            │
│ Roberto-Recursos Humanos  │
│ Beatriz-TI                │
└───────────────────────────┘
```
### Categoriza a los empleados según sus salarios.


``` sql

SELECT nombre,CASE WHEN salario > 50000 THEN 'Salario_alto' ELSE 'Salario_Bajo' END AS rango_salario FROM empleados;





```
---------------
### Calcula la suma total de salarios de todos los empleados.


``` sql
select sum(salario) as salario_total from empleados;


┌───────────────┐
│ salario_total │
├───────────────┤
│ 1140000.0     │
└───────────────┘
```
--------------------
### Redondea el salario de todos los empleados a dos decimales.


```sql
select round(salario, 2) as salario_round from empleados;


┌───────────────┐
│ salario_round │
├───────────────┤
│ 50000.0       │
│ 60000.0       │
│ 55000.0       │
│ 48000.0       │
│ 70000.0       │
│ 52000.0       │
│ 48000.0       │
│ 65000.0       │
│ 51000.0       │
│ 55000.0       │
│ 72000.0       │
│ 49000.0       │
│ 60000.0       │
│ 53000.0       │
│ 68000.0       │
│ 47000.0       │
│ 71000.0       │
│ 54000.0       │
│ 49000.0       │
│ 63000.0       │
└───────────────┘
```


### Muestra la longitud de cada nombre de empleado.
 ```sql
 select length(nombre) as longitud_name from empleados;


┌───────────────┐
│ longitud_name │
├───────────────┤
│ 4             │
│ 5             │
│ 6             │
│ 3             │
│ 5             │
│ 5             │
│ 6             │
│ 6             │
│ 6             │
│ 5             │
│ 5             │
│ 5             │
│ 6             │
│ 6             │
│ 4             │
│ 8             │
│ 9             │
│ 7             │
│ 7             │
│ 7             │
└───────────────┘
 ```
### Cuenta el número total de empleados en cada departamento.
```sql

select departamento,count(*) from empleados group by departamento;



```


### Muestra la hora actual.


```sql
select current_time;


┌──────────────┐
│ current_time │
├──────────────┤
│ 19:47:46     │
└──────────────┘


```


### Convierte el salario en un valor de punto flotante.


```sql
select cast(salario as float) as salario_flotante from empleados;


┌──────────────────┐
│ salario_flotante │
├──────────────────┤
│ 50000.0          │
│ 60000.0          │
│ 55000.0          │
│ 48000.0          │
│ 70000.0          │
│ 52000.0          │
│ 48000.0          │
│ 65000.0          │
│ 51000.0          │
│ 55000.0          │
│ 72000.0          │
│ 49000.0          │
│ 60000.0          │
│ 53000.0          │
│ 68000.0          │
│ 47000.0          │
│ 71000.0          │
│ 54000.0          │
│ 49000.0          │
│ 63000.0          │
└──────────────────┘


```


### Muestra los tre primeros caracteres de cada empleado.


```sql
select substr(nombre, 1, 3) as tres_letras from empleados;


┌─────────────┐
│ tres_letras │
├─────────────┤
│ Jua         │
│ Mar         │
│ Car         │
│ Ana         │
│ Ped         │
│ Lau         │
│ Jav         │
│ Car         │
│ Mig         │
│ Ele         │
│ Die         │
│ Sof         │
│ And         │
│ Isa         │
│ Raú         │
│ Pat         │
│ Ale         │
│ Nat         │
│ Rob         │
│ Bea         │
└─────────────┘
```
------------------
## Order By and Like.
### Empleados en el departamento de 'Ventas' con salarios superiores a 52000.


```sql


select * from empleados where salario between 45000 and 55000;


┌────┬─────────┬─────────┬──────────────┐
│ id │ nombre  │ salario │ departamento │
├────┼─────────┼─────────┼──────────────┤
│ 3  │ Carlos  │ 55000.0 │ Ventas       │
│ 15 │ Raúl    │ 68000.0 │ Ventas       │
│ 18 │ Natalia │ 54000.0 │ Ventas       │
└────┴─────────┴─────────┴──────────────┘
```
### Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.


```sql

 select * from empleados where (nombre like '%a%') order by salario asc;



```
### Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.


```sql
select * from empleados where departamento like 'Recursos Humanos' and salario between 45000 and 55000;


┌────┬──────────┬─────────┬──────────────────┐
│ id │  nombre  │ salario │   departamento   │
├────┼──────────┼─────────┼──────────────────┤
│ 4  │ Ana      │ 48000.0 │ Recursos Humanos │
│ 7  │ Javier   │ 48000.0 │ Recursos Humanos │
│ 10 │ Elena    │ 55000.0 │ Recursos Humanos │
│ 16 │ Patricia │ 47000.0 │ Recursos Humanos │
│ 19 │ Roberto  │ 49000.0 │ Recursos Humanos │
└────┴──────────┴─────────┴──────────────────┘




```
### Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.


```sql


select nombre, salario from empleados order by salario desc limit 5;






```


### Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.


```sql
select * from empleados where nombre like 'M%' or nombre like 'N%' and salario>50000;


┌────┬─────────┬─────────┬──────────────┐
│ id │ nombre  │ salario │ departamento │
├────┼─────────┼─────────┼──────────────┤
│ 2  │ María   │ 60000.0 │ TI           │
│ 9  │ Miguel  │ 51000.0 │ Ventas       │
│ 18 │ Natalia │ 54000.0 │ Ventas       │
└────┴─────────┴─────────┴──────────────┘


```


### Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.
```sql

select * from empleados where (departamento like 'Ventas' or departamento like 'TI') order by nombre;


```


### Empleados con salarios únicos (eliminando duplicados) en orden ascendente
```sql

select distinct(salario) from empleados order by salario asc;



```
### Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.
```sql

select * from empleados where departamento like 'Ventas' and (nombre like '%o' or nombre like '%a');


```
### Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.
```sql
select * from empleados where salario not between 55000 and 70000 order by departamento;


```


### Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.
```sql
select * from empleados where departamento like 'Recursos Humanos’ and nombre not like '%e%';




```



