# Tarea Pokemon.

```sql
-- Actualizar el nivel de Bulbasaur.

┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 1  │ Bulbasaur │ 3       │ 10    │
└────┴───────────┴─────────┴───────┘


update pokemon set nivel = 15 where nombre = 'Bulbasaur';


┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 1  │ Bulbasaur │ 3       │ 15    │
└────┴───────────┴─────────┴───────┘




-- Obtener todos los Pokémon.

select * from Pokemon;


┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 10    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘

-- Cambiar el tipo de Pikachu a Eléctrico/rojo

update tipo as t set nombre='Electrico/Rojo' from Pokemon as p where p.id_tipo=t.id and p.nombre='Pikachu';

┌─────────┬────────────────┐
│ nombre  │     nombre     │
├─────────┼────────────────┤
│ Pikachu │ Electrico/Rojo │
└─────────┴────────────────┘

-- Incrementar el nivel de los Pokemon de agua en 1

update Pokemon as p set nivel = nivel + 1 from tipo as t where t.nombre='Agua' and p.id_tipo=t.id;

┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 3  │ Squirtle  │ 1       │ 9     │
│ 6  │ Vaporeon  │ 1       │ 26    │
│ 11 │ Gyarados  │ 1       │ 31    │
│ 18 │ Blastoise │ 1       │ 56    │
└────┴───────────┴─────────┴───────┘

-- Elimina a Jinx

delete from Pokemon where nombre='Jynx';

-- Elimina el tipo Hielo de la lista "tipos".

delete from Pokemon where nombre='Jynx';

-- Obtener nombre y nivel de los Pokemon de tipo Fuego.

select p.nombre, p.nivel from Pokemon as p, tipo as t where t.nombre='Fuego' and t.id=p.id_tipo;

┌────────────┬───────┐
│   nombre   │ nivel │
├────────────┼───────┤
│ Charmander │ 12    │
│ Flareon    │ 27    │
│ Arcanine   │ 35    │
│ Charizard  │ 50    │
│ Dragonite  │ 60    │
│ Flareon    │ 65    │
└────────────┴───────┘

-- Nombre de los Pokémon que tienen un nivel superior a 30.

select nombre from Pokemon where nivel>30;

┌────────────┐
│   nombre   │
├────────────┤
│ Gyarados   │
│ Arcanine   │
│ Exeggutor  │
│ Raichu     │
│ Sandslash  │
│ Venusaur   │
│ Charizard  │
│ Blastoise  │
│ Electabuzz │
│ Rhydon     │
│ Dragonite  │
│ Flareon    │
│ Venusaur   │
│ Zapdos     │
│ Rhydon     │
└────────────┘

-- Obtener el nombre de los Pokémon ordenados por nivel de forma descendente.

select nombre from Pokemon order by nivel DESC;

┌────────────┐
│   nombre   │
├────────────┤
│ Rhydon     │
│ Zapdos     │
│ Venusaur   │
│ Flareon    │
│ Dragonite  │
│ Blastoise  │
│ Rhydon     │
│ Charizard  │
│ Electabuzz │
│ Venusaur   │
│ Exeggutor  │
│ Raichu     │
│ Arcanine   │
│ Sandslash  │
│ Gyarados   │
│ Bulbasaur  │
│ Flareon    │
│ Vaporeon   │
│ Jolteon    │
│ Ivysaur    │
│ Pikachu    │
│ Cubone     │
│ Charmander │
│ Geodude    │
│ Squirtle   │
└────────────┘

-- Obtener la cantidad de Pokemon por tipo

select t.nombre, count(id_tipo) as 'Total tipos' from Pokemon as p, tipo as t where t.id=p.id_tipo group by p.id_tipo;

┌────────────────┬─────────────┐
│     nombre     │ Total tipos │
├────────────────┼─────────────┤
│ Agua           │ 4           │
│ Fuego          │ 6           │
│ Planta         │ 5           │
│ Electrico/Rojo │ 5           │
│ Tierra         │ 5           │
└────────────────┴─────────────┘

-- Obtener la información completa de un Pokémon específico.

select * from Pokemon where id=14;

┌────┬──────────┬─────────┬───────┐
│ id │  nombre  │ id_tipo │ nivel │
├────┼──────────┼─────────┼───────┤
│ 14 │  Raichu  │ 4       │ 38    │
└────┴──────────┴─────────┴───────┘

-- Obtener el promedio de niveles de todos los Pokémon.

select AVG(nivel) as media_niveles from Pokemon;

┌───────────────┐
│ media_niveles │
├───────────────┤
│ 38.48         │
└───────────────┘

-- Obtener el nombre del Pokémon de mayor nivel.

select nombre from Pokemon order by nivel DESC LIMIT 1;

┌────────┐
│ nombre │
├────────┤
│ Rhydon │
└────────┘

-- Actualizar el nombre de Bulbasaur a "Bulbasaur Nv. 15"

update Pokemon set nombre='Bulbasaur Nv.15' where nombre='Bulbasaur';

┌────┬─────────────────┬─────────┬───────┐
│ id │     nombre      │ id_tipo │ nivel │
├────┼─────────────────┼─────────┼───────┤
│ 1  │ Bulbasaur Nv.15 │ 3       │ 30    │
└────┴─────────────────┴─────────┴───────┘

-- Obtener los Pokémon cuyo nivel es igual a 50.

select * from Pokemon where nivel=50;

-- Eliminar todos los Pokémon de nivel 40.

delete from Pokemon where nivel=40;

-- Obtener el tipo y nivel de Pikachu.

select t.nombre, p.nivel from Pokemon as p, tipo as t where p.nombre='Pikachu' and p.id_tipo=t.id;

┌────────────────┬───────┐
│     nombre     │ nivel │
├────────────────┼───────┤
│ Electrico/Rojo │ 15    │
└────────────────┴───────┘

-- Obtener los Pokémon de tipo Planta con nivel superior a 20:

select * from Pokemon as p, tipo as t where p.nivel>20 and t.nombre='Planta' and p.id_tipo=t.id;

┌────┬─────────────────┬─────────┬───────┬────┬────────┐
│ id │     nombre      │ id_tipo │ nivel │ id │ nombre │
├────┼─────────────────┼─────────┼───────┼────┼────────┤
│ 1  │ Bulbasaur Nv.15 │ 3       │ 30    │ 3  │ Planta │
│ 16 │ Venusaur        │ 3       │ 45    │ 3  │ Planta │
│ 23 │ Venusaur        │ 3       │ 70    │ 3  │ Planta │
└────┴─────────────────┴─────────┴───────┴────┴────────┘

-- Actualizar el tipo de Pikachu a "Eléctrico/Azul"

update tipo as t set nombre='Electrico/Azul' from Pokemon as p where p.id_tipo=t.id and p.nombre='Pikachu';


-- Eliminar todos los Pokémon de tipo Planta.

delete from Pokemon where id_tipo in (select id from tipo where nombre='Planta');

-- Obtener los Pokémon con nombre y tipo ordenados alfabéticamente.

select p.nombre, t.nombre from Pokemon as p, tipo as t where t.id=p.id_tipo order by p.nombre;

┌─────────────────┬────────────────┐
│     nombre      │     nombre     │
├─────────────────┼────────────────┤
│ Arcanine        │ Fuego          │
│ Blastoise       │ Agua           │
│ Bulbasaur Nv.15 │ Planta         │
│ Charizard       │ Fuego          │
│ Charmander      │ Fuego          │
│ Cubone          │ Tierra         │
│ Dragonite       │ Fuego          │
│ Electabuzz      │ Electrico/Azul │
│ Flareon         │ Fuego          │
│ Flareon         │ Fuego          │
│ Geodude         │ Tierra         │
│ Gyarados        │ Agua           │
│ Ivysaur         │ Planta         │
│ Jolteon         │ Electrico/Azul │
│ Pikachu         │ Electrico/Azul │
│ Raichu          │ Electrico/Azul │
│ Rhydon          │ Tierra         │
│ Rhydon          │ Tierra         │
│ Sandslash       │ Tierra         │
│ Squirtle        │ Agua           │
│ Vaporeon        │ Agua           │
│ Venusaur        │ Planta         │
│ Venusaur        │ Planta         │
│ Zapdos          │ Electrico/Azul │
└─────────────────┴────────────────┘

-- Obtén todos los Pokémon cuyos nombres contienen las letras 'sa'.

select * from Pokemon where nombre LIKE '%sa%';

┌────┬─────────────────┬─────────┬───────┐
│ id │     nombre      │ id_tipo │ nivel │
├────┼─────────────────┼─────────┼───────┤
│ 1  │ Bulbasaur Nv.15 │ 3       │ 30    │
│ 8  │ Ivysaur         │ 3       │ 18    │
│ 15 │ Sandslash       │ 5       │ 33    │
│ 16 │ Venusaur        │ 3       │ 45    │
│ 23 │ Venusaur        │ 3       │ 70    │
└────┴─────────────────┴─────────┴───────┘

-- Encuentra todos los Pokémon cuyo nivel es 40, 50 o 60.

select * from Pokemon where nivel in (40, 50, 60);

┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 17 │ Charizard │ 2       │ 50    │
│ 21 │ Dragonite │ 2       │ 60    │
└────┴───────────┴─────────┴───────┘

-- Obtén todos los Pokémon de tipo Fuego cuyos nombres comienzan con la letra 'C'.

select * from Pokemon as p, tipo as t where p.nombre LIKE 'C%' and t.nombre='Fuego' and p.id_tipo=t.id;

┌────┬────────────┬─────────┬───────┬────┬────────┐
│ id │   nombre   │ id_tipo │ nivel │ id │ nombre │
├────┼────────────┼─────────┼───────┼────┼────────┤
│ 2  │ Charmander │ 2       │ 12    │ 2  │ Fuego  │
│ 17 │ Charizard  │ 2       │ 50    │ 2  │ Fuego  │
└────┴────────────┴─────────┴───────┴────┴────────┘

-- Encuentra los nombres y tipos de los Pokémon cuyo nivel es mayor que el promedio de todos los Pokémon en la base de datos.

select p.nombre, t.nombre from Pokemon as p, tipo as t where p.nivel>(select AVG(nivel) from Pokemon) and t.id=p.id_tipo;

┌────────────┬────────────────┐
│   nombre   │     nombre     │
├────────────┼────────────────┤
│ Venusaur   │ Planta         │
│ Charizard  │ Fuego          │
│ Blastoise  │ Agua           │
│ Electabuzz │ Electrico/Azul │
│ Rhydon     │ Tierra         │
│ Dragonite  │ Fuego          │
│ Flareon    │ Fuego          │
│ Venusaur   │ Planta         │
│ Zapdos     │ Electrico/Azul │
│ Rhydon     │ Tierra         │
└────────────┴────────────────┘

```

