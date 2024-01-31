-- Selección de libros cuyo título comienza con "H".

select * from libro where titulo regexp '^H';

-- Libros escritos por autores cuyos nombres terminan con "ing".

select * from autor where nombre regexp 'ing$';

┌────┬──────────────┐
│ id │    nombre    │
├────┼──────────────┤
│ 1  │ J.K. Rowling │
│ 2  │ Stephen King │
└────┴──────────────┘

-- Libros con títulos que contienen la palabra "and" en cualquier posición.
select * from libro where titulo regexp 'and';
┌────────┬──────────────────────────────────┬──────────┬─────────────────────────┬────────┐
│ codigo │              titulo              │ autor_id │        editorial        │ precio │
├────────┼──────────────────────────────────┼──────────┼─────────────────────────┼────────┤
│ 15     │ The Old Man and the Sea          │ 17       │ Charles Scribner's Sons │ 18.95  │
│ 20     │ Alice's Adventures in Wonderland │ 22       │ Macmillan               │ 11.5   │
│ 28     │ War and Peace                    │ 26       │ The Russian Messenger   │ 33.25  │
│ 29     │ Crime and Punishment             │ 30       │ The Russian Messenger   │ 19.99  │
└────────┴──────────────────────────────────┴──────────┴─────────────────────────┴────────┘

-- Libros cuyo título comienza con una vocal.

-- Libros cuyo autor tiene al menos una vocal repetida.

-- Libros con precios que tienen dos dígitos decimales exactos.

-- Libros cuyos títulos tienen al menos tres palabras.

-- Obtener todos los autores cuyo nombre empieza con la letra "A":

-- Seleccionar los libros cuyo título contiene la palabra "SQL":

-- Obtener todos los autores cuyo nombre termina con "ez":

-- Obtener todos los autores cuyo nombre tiene al menos 5 caracteres:

-- Seleccionar los libros cuya editorial es diferente de "EditorialX":

-- Obtener todos los autores cuyo nombre contiene al menos una vocal:

-- Seleccionar los libros cuyo título comienza con una letra mayúscula:

-- Obtener todos los autores cuyo nombre no contiene la letra "r":

-- Seleccionar los libros cuya editorial empieza con la letra "P":

-- Obtener todos los autores cuyo nombre tiene exactamente 6 caracteres:

-- Seleccionar los libros cuyo título contiene al menos un número:

-- Obtener todos los autores cuyo nombre inicia con una vocal:

-- Obtener todos los autores cuyo nombre no contiene espacios en blanco:

-- Seleccionar los libros cuyo título termina con una vocal:

-- Obtener todos los autores cuyo nombre contiene la secuencia "er":

-- Seleccionar los libros cuyo título empieza con la palabra "The":

-- Obtener todos los autores cuyo nombre tiene al menos una letra mayúscula:

-- Seleccionar los libros cuyo precio es un número decimal con exactamente dos decimales:

-- Obtener todos los autores cuyo nombre no contiene números:

-- Seleccionar los libros cuyo título contiene al menos tres vocales:

-- Obtener todos los autores cuyo nombre inicia con una consonante:

-- Seleccionar los libros cuyo título no contiene la palabra "Science":

-- Obtener todos los autores cuyo nombre tiene al menos una letra repetida consecutivamente:

-- Obtener todos los autores cuyo nombre empieza con "M" o termina con "n":

-- Obtener todos los autores cuyo nombre no contiene caracteres especiales: