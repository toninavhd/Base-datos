/**
###################################
### Consultas Multitabla (JOIN) ###
###################################
**/
--  Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT apellido1, apellido2, nombre
FROM persona where tipo='alumno'
ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

┌───────────┬───────────┬──────────┐
│ apellido1 │ apellido2 │  nombre  │
├───────────┼───────────┼──────────┤
│ Domínguez │ Guerrero  │ Antonio  │
│ Gea       │ Ruiz      │ Sonia    │
│ Gutiérrez │ López     │ Juan     │
│ Heller    │ Pagac     │ Pedro    │
│ Herman    │ Pacocha   │ Daniel   │
│ Hernández │ Martínez  │ Irene    │
│ Herzog    │ Tremblay  │ Ramón    │
│ Koss      │ Bayer     │ José     │
│ Lakin     │ Yundt     │ Inma     │
│ Saez      │ Vega      │ Juan     │
│ Strosin   │ Turcotte  │ Ismael   │
│ Sánchez   │ Pérez     │ Salvador │
└───────────┴───────────┴──────────┘


--  Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT nombre, apellido1, apellido2
FROM persona
WHERE telefono IS NULL;
┌───────────┬────────────┬───────────┐
│  nombre   │ apellido1  │ apellido2 │
├───────────┼────────────┼───────────┤
│ Pedro     │ Heller     │ Pagac     │
│ Ismael    │ Strosin    │ Turcotte  │
│ Esther    │ Spencer    │ Lakin     │
│ Carmen    │ Streich    │ Hirthe    │
│ Antonio   │ Fahey      │ Considine │
│ Guillermo │ Ruecker    │ Upton     │
│ Francesca │ Schowalter │ Muller    │
└───────────┴────────────┴───────────┘

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
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
┌────┬───────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                  nombre                   │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼───────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 72 │ Bases moleculares del desarrollo vegetal  │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 73 │ Fisiología animal                         │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 74 │ Metabolismo y biosíntesis de biomoléculas │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 75 │ Operaciones de separación                 │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 76 │ Patología molecular de plantas            │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 77 │ Técnicas instrumentales básicas           │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
└────┴───────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘

--  Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
SELECT *
FROM persona
WHERE id_grado IN (
    SELECT id
    FROM grado
    WHERE nombre = 'Ingeniería Informática' AND plan = 2015
);

--  Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
SELECT *
FROM asignaturas
WHERE id_grado IN (
    SELECT id
    FROM grado
    WHERE nombre = 'Ingeniería Informática' AND plan = 2015
);

--  Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS nombre_departamento
FROM persona WHERE tipo='profesor'
JOIN departamentos d ON p.id_departamento = d.id
ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

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
WHERE c.anyo_inicio = 2018 AND c.anyo_fin = 2019;

/**
####################################
### Consultas Multitabla (WHERE) ###
####################################
**/
--  Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
SELECT d.nombre AS nombre_departamento, p.apellido1, p.apellido2, p.nombre
FROM persona where tipo='profesor'
LEFT JOIN departamentos d ON p.id_departamento = d.id
ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

--  Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT p.nombre, p.apellido1, p.apellido2
FROM profesores p
WHERE p.id_departamento IS NULL;


--  Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT d.nombre
FROM departamentos d
LEFT JOIN profesores p ON d.id = p.id_departamento
GROUP BY d.nombre
HAVING COUNT(p.id) = 0;


-- Devuelve un listado con los profesores que no imparten ninguna asignatura.
SELECT p.nombre, p.apellido1, p.apellido2
FROM profesores p
LEFT JOIN asignaturas a ON p.id = a.id_profesor
GROUP BY p.nombre, p.apellido1, p.apellido2
HAVING COUNT(a.id) = 0;


-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT nombre
FROM asignatura
WHERE a.id_profesor IS NULL;

-- Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura queno se haya impartido nunca.
SELECT d.nombre AS nombre_departamento, a.nombre AS nombre_asignatura
FROM departamento d
JOIN asignatura a ON d.id = a.id_departamento
LEFT JOIN curso c ON a.id = c.id_asignatura
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
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
HAVING COUNT(a.id) > 40
ORDER BY COUNT(a.id) DESC;

┌─────────────────────────────────────────────┬───────────────────────┐
│                   nombre                    │ numero_de_asignaturas │
├─────────────────────────────────────────────┼───────────────────────┤
│ Grado en Ingeniería Informática (Plan 2015) │ 51                    │
└─────────────────────────────────────────────┴───────────────────────┘

-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT g.nombre, COUNT(a.id) AS numero_de_asignaturas
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
HAVING COUNT(a.id) > 40
ORDER BY COUNT(a.id) DESC;
┌─────────────────────────────────────────────┬───────────────────────┐
│                   nombre                    │ numero_de_asignaturas │
├─────────────────────────────────────────────┼───────────────────────┤
│ Grado en Ingeniería Informática (Plan 2015) │ 51                    │
└─────────────────────────────────────────────┴───────────────────────┘

-- Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.
SELECT g.nombre, a.tipo, SUM(a.creditos) AS total_creditos
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre, a.tipo
ORDER BY SUM(a.creditos) DESC;
┌─────────────────────────────────────────────┬─────────────┬────────────────┐
│                   nombre                    │    tipo     │ total_creditos │
├─────────────────────────────────────────────┼─────────────┼────────────────┤
│ Grado en Ingeniería Informática (Plan 2015) │ optativa    │ 180.0          │
│ Grado en Biotecnología (Plan 2015)          │ obligatoria │ 120.0          │
│ Grado en Ingeniería Informática (Plan 2015) │ básica      │ 72.0           │
│ Grado en Biotecnología (Plan 2015)          │ básica      │ 60.0           │
│ Grado en Ingeniería Informática (Plan 2015) │ obligatoria │ 54.0           │
└─────────────────────────────────────────────┴─────────────┴────────────────┘


-- Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT c.anyo_inicio, COUNT(DISTINCT al.id) AS numero_de_alumnos
FROM curso_escolar c
JOIN alumno_se_matricula_asignatura m ON c.id = m.id_curso
JOIN persona al ON m.id_alumno = al.id
GROUP BY c.anyo_inicio;

-- Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS numero_de_asignaturas
FROM persona p
LEFT JOIN asignatura a ON p.id = a.id_profesor
GROUP BY p.id, p.nombre, p.apellido1, p.apellido2
ORDER BY COUNT(a.id) DESC;
┌────┬───────────┬────────────┬────────────┬───────────────────────┐
│ id │  nombre   │ apellido1  │ apellido2  │ numero_de_asignaturas │
├────┼───────────┼────────────┼────────────┼───────────────────────┤
│ 14 │ Manolo    │ Hamill     │ Kozey      │ 11                    │
│ 3  │ Zoe       │ Ramirez    │ Gea        │ 10                    │
│ 1  │ Salvador  │ Sánchez    │ Pérez      │ 0                     │
│ 2  │ Juan      │ Saez       │ Vega       │ 0                     │
│ 4  │ Pedro     │ Heller     │ Pagac      │ 0                     │
│ 5  │ David     │ Schmidt    │ Fisher     │ 0                     │
│ 6  │ José      │ Koss       │ Bayer      │ 0                     │
│ 7  │ Ismael    │ Strosin    │ Turcotte   │ 0                     │
│ 8  │ Cristina  │ Lemke      │ Rutherford │ 0                     │
│ 9  │ Ramón     │ Herzog     │ Tremblay   │ 0                     │
│ 10 │ Esther    │ Spencer    │ Lakin      │ 0                     │
│ 11 │ Daniel    │ Herman     │ Pacocha    │ 0                     │
│ 12 │ Carmen    │ Streich    │ Hirthe     │ 0                     │
│ 13 │ Alfredo   │ Stiedemann │ Morissette │ 0                     │
│ 15 │ Alejandro │ Kohler     │ Schoen     │ 0                     │
│ 16 │ Antonio   │ Fahey      │ Considine  │ 0                     │
│ 17 │ Guillermo │ Ruecker    │ Upton      │ 0                     │
│ 18 │ Micaela   │ Monahan    │ Murray     │ 0                     │
│ 19 │ Inma      │ Lakin      │ Yundt      │ 0                     │
│ 20 │ Francesca │ Schowalter │ Muller     │ 0                     │
│ 21 │ Juan      │ Gutiérrez  │ López      │ 0                     │
│ 22 │ Antonio   │ Domínguez  │ Guerrero   │ 0                     │
│ 23 │ Irene     │ Hernández  │ Martínez   │ 0                     │
│ 24 │ Sonia     │ Gea        │ Ruiz       │ 0                     │
└────┴───────────┴────────────┴────────────┴───────────────────────┘


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
