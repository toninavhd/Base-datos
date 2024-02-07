-- Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.

a.nombre, c.nombre from alumnos a, clases c join inscripciones i on i.id_alumno=a.id and i.id_clase=c.id;

┌────────┬────────────────────────┐
│ nombre │         nombre         │
├────────┼────────────────────────┤
│ Juan   │ Matemáticas 101        │
│ Juan   │ Historia Antigua       │
│ María  │ Literatura Moderna     │
│ María  │ Biología Avanzada      │
│ Pedro  │ Química Orgánica       │
│ Pedro  │ Física Cuántica        │
│ Laura  │ Arte Contemporáneo     │
│ Laura  │ Inglés Avanzado        │
│ Carlos │ Economía Internacional │
│ Ana    │ Derecho Penal          │
└────────┴────────────────────────┘

-- Obtener el nombre del alumno y la materia de las clases en las que está inscrito.

select a.nombre, c.materia from alumnos a, clases c join inscripciones i on i.id_alumno=a.id and i.id_clase=c.id;

┌────────┬─────────────┐
│ nombre │   materia   │
├────────┼─────────────┤
│ Juan   │ Matemáticas │
│ Juan   │ Historia    │
│ María  │ Literatura  │
│ María  │ Biología    │
│ Pedro  │ Química     │
│ Pedro  │ Física      │
│ Laura  │ Arte        │
│ Laura  │ Idiomas     │
│ Carlos │ Economía    │
│ Ana    │ Derecho     │
└────────┴─────────────┘

-- Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.

select a.nombre, a.edad, c.profesor from alumnos a, clases c join inscripciones i on i.id_alumno=a.id and i.id_clase=c.id;
┌────────┬──────┬────────────┐
│ nombre │ edad │  profesor  │
├────────┼──────┼────────────┤
│ Juan   │ 20   │ Profesor X │
│ Juan   │ 20   │ Profesor Y │
│ María  │ 21   │ Profesor Z │
│ María  │ 21   │ Profesor W │
│ Pedro  │ 19   │ Profesor V │
│ Pedro  │ 19   │ Profesor U │
│ Laura  │ 22   │ Profesor T │
│ Laura  │ 22   │ Profesor S │
│ Carlos │ 20   │ Profesor R │
│ Ana    │ 19   │ Profesor Q │
└────────┴──────┴────────────┘

-- Obtener el nombre del alumno y la dirección de las clases en las que está inscrito.

select a.nombre, a.direccion from alumnos a, clases c join inscripciones i on i.id_alumno=a.id and i.id_clase=c.id;
┌────────┬───────────┐
│ nombre │ direccion │
├────────┼───────────┤
│ Juan   │ Calle A   │
│ Juan   │ Calle A   │
│ María  │ Calle B   │
│ María  │ Calle B   │
│ Pedro  │ Calle C   │
│ Pedro  │ Calle C   │
│ Laura  │ Calle D   │
│ Laura  │ Calle D   │
│ Carlos │ Calle E   │
│ Ana    │ Calle F   │
└────────┴───────────┘

-- Obtener el nombre del alumno y el nombre de la clase junto con el profesor.

select a.nombre, c.nombre, c.profesor from alumnos a, clases c join inscripciones i on i.id_alumno=a.id and i.id_clase=c.id;
┌────────┬────────────────────────┬────────────┐
│ nombre │         nombre         │  profesor  │
├────────┼────────────────────────┼────────────┤
│ Juan   │ Matemáticas 101        │ Profesor X │
│ Juan   │ Historia Antigua       │ Profesor Y │
│ María  │ Literatura Moderna     │ Profesor Z │
│ María  │ Biología Avanzada      │ Profesor W │
│ Pedro  │ Química Orgánica       │ Profesor V │
│ Pedro  │ Física Cuántica        │ Profesor U │
│ Laura  │ Arte Contemporáneo     │ Profesor T │
│ Laura  │ Inglés Avanzado        │ Profesor S │
│ Carlos │ Economía Internacional │ Profesor R │
│ Ana    │ Derecho Penal          │ Profesor Q │
└────────┴────────────────────────┴────────────┘

-- Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.

select a.nombre, c.materia, c.profesor from alumnos a, clases c join inscripciones i on i.id_alumno=a.id and i.id_clase=c.id;
┌────────┬─────────────┬────────────┐
│ nombre │   materia   │  profesor  │
├────────┼─────────────┼────────────┤
│ Juan   │ Matemáticas │ Profesor X │
│ Juan   │ Historia    │ Profesor Y │
│ María  │ Literatura  │ Profesor Z │
│ María  │ Biología    │ Profesor W │
│ Pedro  │ Química     │ Profesor V │
│ Pedro  │ Física      │ Profesor U │
│ Laura  │ Arte        │ Profesor T │
│ Laura  │ Idiomas     │ Profesor S │
│ Carlos │ Economía    │ Profesor R │
│ Ana    │ Derecho     │ Profesor Q │
└────────┴─────────────┴────────────┘

-- Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.
┌────────┬──────┬─────────────┐
│ nombre │ edad │   materia   │
├────────┼──────┼─────────────┤
│ Juan   │ 20   │ Matemáticas │
│ Juan   │ 20   │ Historia    │
│ María  │ 21   │ Literatura  │
│ María  │ 21   │ Biología    │
│ Pedro  │ 19   │ Química     │
│ Pedro  │ 19   │ Física      │
│ Laura  │ 22   │ Arte        │
│ Laura  │ 22   │ Idiomas     │
│ Carlos │ 20   │ Economía    │
│ Ana    │ 19   │ Derecho     │
└────────┴──────┴─────────────┘

-- Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.

select a.nombre, a.direccion, c.profesor from alumnos a, clases c join inscripciones i on i.id_alumno=a.id and i.id_clase=c.id;
┌────────┬───────────┬────────────┐
│ nombre │ direccion │  profesor  │
├────────┼───────────┼────────────┤
│ Juan   │ Calle A   │ Profesor X │
│ Juan   │ Calle A   │ Profesor Y │
│ María  │ Calle B   │ Profesor Z │
│ María  │ Calle B   │ Profesor W │
│ Pedro  │ Calle C   │ Profesor V │
│ Pedro  │ Calle C   │ Profesor U │
│ Laura  │ Calle D   │ Profesor T │
│ Laura  │ Calle D   │ Profesor S │
│ Carlos │ Calle E   │ Profesor R │
│ Ana    │ Calle F   │ Profesor Q │
└────────┴───────────┴────────────┘

-- Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.

-- Contar cuántos alumnos están inscritos en cada clase.

select * from alumnos a, clases c join inscripciones i on i.id_alumno=a.id and i.id_clase=c.id;
┌────┬────────┬──────┬───────────┬────┬────────────────────────┬─────────────┬────────────┬────┬───────────┬──────────┐
│ id │ nombre │ edad │ direccion │ id │         nombre         │   materia   │  profesor  │ id │ id_alumno │ id_clase │
├────┼────────┼──────┼───────────┼────┼────────────────────────┼─────────────┼────────────┼────┼───────────┼──────────┤
│ 1  │ Juan   │ 20   │ Calle A   │ 1  │ Matemáticas 101        │ Matemáticas │ Profesor X │ 1  │ 1         │ 1        │
│ 1  │ Juan   │ 20   │ Calle A   │ 2  │ Historia Antigua       │ Historia    │ Profesor Y │ 2  │ 1         │ 2        │
│ 2  │ María  │ 21   │ Calle B   │ 3  │ Literatura Moderna     │ Literatura  │ Profesor Z │ 3  │ 2         │ 3        │
│ 2  │ María  │ 21   │ Calle B   │ 4  │ Biología Avanzada      │ Biología    │ Profesor W │ 4  │ 2         │ 4        │
│ 3  │ Pedro  │ 19   │ Calle C   │ 5  │ Química Orgánica       │ Química     │ Profesor V │ 5  │ 3         │ 5        │
│ 3  │ Pedro  │ 19   │ Calle C   │ 6  │ Física Cuántica        │ Física      │ Profesor U │ 6  │ 3         │ 6        │
│ 4  │ Laura  │ 22   │ Calle D   │ 7  │ Arte Contemporáneo     │ Arte        │ Profesor T │ 7  │ 4         │ 7        │
│ 4  │ Laura  │ 22   │ Calle D   │ 8  │ Inglés Avanzado        │ Idiomas     │ Profesor S │ 8  │ 4         │ 8        │
│ 5  │ Carlos │ 20   │ Calle E   │ 9  │ Economía Internacional │ Economía    │ Profesor R │ 9  │ 5         │ 9        │
│ 6  │ Ana    │ 19   │ Calle F   │ 10 │ Derecho Penal          │ Derecho     │ Profesor Q │ 10 │ 6         │ 10       │
└────┴────────┴──────┴───────────┴────┴────────────────────────┴─────────────┴────────────┴────┴───────────┴──────────┘
