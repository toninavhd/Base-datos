/**
###################################
### Consultas Multitabla (JOIN) ###
###################################
**/
--  Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT primer_apellido, segundo_apellido, nombre
FROM persona where tipo='alumno'
ORDER BY primer_apellido ASC, segundo_apellido ASC, nombre ASC;

--  Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT nombre, primer_apellido, segundo_apellido
FROM persona WHERE tipo= 'alumno'
WHERE telefono IS NULL;


--  Devuelve el listado de los alumnos que nacieron en 1999.

select * from persona where tipo='alumno' and fecha_nacimiento regexp('1999');
┌────┬───────────┬─────────┬───────────┬───────────┬─────────┬─────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre  │ apellido1 │ apellido2 │ ciudad  │    direccion    │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼─────────┼───────────┼───────────┼─────────┼─────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 7  │ 97258166K │ Ismael  │ Strosin   │ Turcotte  │ Almería │ C/ Neptuno      │           │ 1999/05/24       │ H    │ alumno │
│ 22 │ 41491230N │ Antonio │ Domínguez │ Guerrero  │ Almería │ C/ Cabo de Gata │ 626652498 │ 1999/02/11       │ H    │ alumno │
└────┴───────────┴─────────┴───────────┴───────────┴─────────┴─────────────────┴───────────┴──────────────────┴──────┴────────┘

--  Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.

--  Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT *
FROM asignaturas
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

--  Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
SELECT *
FROM persona where tipo='persona'
WHERE id_grado IN (
    SELECT id
    FROM grados
    WHERE nombre = 'Ingeniería Informática' AND plan = 2015
);

--  Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
SELECT *
FROM asignaturas
WHERE id_grado IN (
    SELECT id
    FROM grados
    WHERE nombre = 'Ingeniería Informática' AND plan = 2015
);

--  Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
SELECT p.primer_apellido, p.segundo_apellido, p.nombre, d.nombre AS nombre_departamento
FROM profesores p
JOIN departamentos d ON p.id_departamento = d.id
ORDER BY p.primer_apellido ASC, p.segundo_apellido ASC, p.nombre ASC;

--  Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
SELECT a.nombre, c.ano_inicio, c.ano_fin
FROM asignaturas a
JOIN cursos c ON a.id_curso = c.id
JOIN matriculas m ON a.id = m.id_asignatura
JOIN alumnos al ON m.id_alumno = al.id
WHERE al.nif = '26902806M';

--  Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
SELECT DISTINCT d.nombre
FROM departamentos d
JOIN profesores p ON d.id = p.id_departamento
JOIN asignaturas a ON p.id = a.id_profesor
JOIN grados g ON a.id_grado = g.id
WHERE g.nombre = 'Ingeniería Informática' AND g.plan = 2015;

--  Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT al.*
FROM alumnos al
JOIN matriculas m ON al.id = m.id_alumno
JOIN cursos c ON m.id_curso = c.id
WHERE c.ano_inicio = 2018 AND c.ano_fin = 2019;

/**
####################################
### Consultas Multitabla (WHERE) ###
####################################
**/
--  Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
SELECT d.nombre AS nombre_departamento, p.primer_apellido, p.segundo_apellido, p.nombre
FROM persona where tipo='profesor'
LEFT JOIN departamentos d ON p.id_departamento = d.id
ORDER BY d.nombre ASC, p.primer_apellido ASC, p.segundo_apellido ASC, p.nombre ASC;

--  Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT p.nombre, p.primer_apellido, p.segundo_apellido
FROM profesores p
WHERE p.id_departamento IS NULL;


--  Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT d.nombre
FROM departamentos d
LEFT JOIN profesores p ON d.id = p.id_departamento
GROUP BY d.nombre
HAVING COUNT(p.id) = 0;


-- Devuelve un listado con los profesores que no imparten ninguna asignatura.
SELECT p.nombre, p.primer_apellido, p.segundo_apellido
FROM profesores p
LEFT JOIN asignaturas a ON p.id = a.id_profesor
GROUP BY p.nombre, p.primer_apellido, p.segundo_apellido
HAVING COUNT(a.id) = 0;


-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT a.nombre
FROM asignaturas a
WHERE a.id_profesor IS NULL;

-- Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura queno se haya impartido nunca.
SELECT d.nombre AS nombre_departamento, a.nombre AS nombre_asignatura
FROM departamentos d
JOIN asignaturas a ON d.id = a.id_departamento
LEFT JOIN cursos c ON a.id = c.id_asignatura
WHERE c.id_asignatura IS NULL;

/**
########################################
### Consultas Multitabla (FUNCIONES) ###
########################################
**/


-- Devuelve el número total de alumnas que hay.

select * from persona where sexo='M' and tipo='alumno';

┌────┬───────────┬────────┬───────────┬───────────┬─────────┬────────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion      │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼────────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴────────────────────┴───────────┴──────────────────┴──────┴────────┘

-- Calcula cuántos alumnos nacieron en 1999.

select * from persona where tipo='alumno' and fecha_nacimiento regexp('1999');
┌────┬───────────┬─────────┬───────────┬───────────┬─────────┬─────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre  │ apellido1 │ apellido2 │ ciudad  │    direccion    │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼─────────┼───────────┼───────────┼─────────┼─────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 7  │ 97258166K │ Ismael  │ Strosin   │ Turcotte  │ Almería │ C/ Neptuno      │           │ 1999/05/24       │ H    │ alumno │
│ 22 │ 41491230N │ Antonio │ Domínguez │ Guerrero  │ Almería │ C/ Cabo de Gata │ 626652498 │ 1999/02/11       │ H    │ alumno │
└────┴───────────┴─────────┴───────────┴───────────┴─────────┴─────────────────┴───────────┴──────────────────┴──────┴────────┘

-- Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
SELECT d.nombre, COUNT(p.id) AS numero_de_profesores
FROM departamentos d
JOIN profesores p ON d.id = p.id_departamento
GROUP BY d.nombre
HAVING COUNT(p.id) > 0
ORDER BY COUNT(p.id) DESC;

-- Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.
SELECT d.nombre, COUNT(p.id) AS numero_de_profesores
FROM departamentos d
LEFT JOIN profesores p ON d.id = p.id_departamento
GROUP BY d.nombre
ORDER BY COUNT(p.id) DESC;

-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT g.nombre, COUNT(a.id) AS numero_de_asignaturas
FROM grados g
JOIN asignaturas a ON g.id = a.id_grado
GROUP BY g.nombre
HAVING COUNT(a.id) > 40
ORDER BY COUNT(a.id) DESC;

-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT g.nombre, COUNT(a.id) AS numero_de_asignaturas
FROM grados g
JOIN asignaturas a ON g.id = a.id_grado
GROUP BY g.nombre
HAVING COUNT(a.id) > 40
ORDER BY COUNT(a.id) DESC;

-- Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.
SELECT g.nombre, a.tipo, SUM(a.creditos) AS total_creditos
FROM grados g
JOIN asignaturas a ON g.id = a.id_grado
GROUP BY g.nombre, a.tipo
ORDER BY SUM(a.creditos) DESC;

-- Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT c.ano_inicio, COUNT(DISTINCT al.id) AS numero_de_alumnos
FROM cursos c
JOIN matriculas m ON c.id = m.id_curso
JOIN alumnos al ON m.id_alumno = al.id
GROUP BY c.ano_inicio;

-- Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT p.id, p.nombre, p.primer_apellido, p.segundo_apellido, COUNT(a.id) AS numero_de_asignaturas
FROM profesores p
LEFT JOIN asignaturas a ON p.id = a.id_profesor
GROUP BY p.id, p.nombre, p.primer_apellido, p.segundo_apellido
ORDER BY COUNT(a.id) DESC;

/**
####################
### Subconsultas ###
####################
**/

-- Devuelve todos los datos del alumno más joven.

-- Devuelve un listado con los profesores que no están asociados a un departamento.

-- Devuelve un listado con los departamentos que no tienen profesores asociados.

-- Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.

-- Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
