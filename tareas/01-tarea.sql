-- 1. Ver todos los registros
select *
from users;

-- 2. Ver el registro cuyo id sea igual a 10
select *
from users
where id = 10;

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)
SELECT *
FROM users
WHERE name LIKE 'Jim %';

-- 4. Todos los registros cuyo segundo nombre es Alexander
select *
from users
where name like '% Alexander';

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
update users
set name = 'Elmer Jacobo'
where id = 1;

-- 6. Borrar el último registro de la tabla
select max(id)
from users; -- conocer el último registro
delete
from users
where id = 3980; -- si conozco el id
DELETE
FROM users
WHERE id = (SELECT MAX(id) FROM users);
-- si no lo conozco

-- Escribe una consulta para seleccionar todos los registros con IDs menores a 20.
select *
from users
where id < 20;

-- Escribe una consulta para seleccionar todos los registros donde el nombre tenga más de 5 caracteres.
SELECT *
FROM users
WHERE LENGTH(name) > 5;


-- Escribe una consulta para seleccionar todos los registros donde el nombre comience con una vocal.
SELECT *
FROM users
WHERE name ~* '^[aeiou]';

-- Escribe una consulta para actualizar todos los nombres añadiéndoles un prefijo "Sr." o "Sra." al comienzo.
UPDATE users
SET name = CASE
               WHEN name LIKE '%a' THEN 'Sra. ' || name
               ELSE 'Sr. ' || name
    END;

-- Escribe una consulta para eliminar todos los registros con IDs pares.
DELETE
FROM users
WHERE id % 2 = 0;

-- Escribe una consulta para seleccionar todos los registros cuyo nombre termine en "a".
SELECT *
FROM users
WHERE name LIKE '%a';

-- Escribe una consulta que cuente todos los registros donde el nombre tenga menos de 4 caracteres.
SELECT COUNT(*)
FROM users
WHERE LENGTH(name) < 4;

-- Escribe una consulta para actualizar el primer registro (suponiendo que su ID es 1) para que su ID sea 0.
UPDATE users
SET id = 0
WHERE id = 1;

-- Si el nombre es "John Doe", conviértelo a "Doe John".
UPDATE users
SET name = split_part(name, ' ', 2) || ' ' || split_part(name, ' ', 1);

-- Escribe una consulta para seleccionar todos los registros, excluyendo el primero y el último.
SELECT *
FROM users
WHERE id > (SELECT MIN(id) FROM users)
  AND id < (SELECT MAX(id) FROM users);

-- 11. Seleccionar todos los registros donde el id sea impar
-- Escribe una consulta para seleccionar todos los registros con IDs impares.
SELECT *
FROM users
WHERE id % 2 != 0;


-- 12. Seleccionar registros donde el nombre contenga la letra "e"
-- Escribe una consulta para seleccionar todos los registros donde el nombre contenga la letra "e".
SELECT *
FROM users
WHERE name LIKE '%e%';


-- 13. Actualizar todos los nombres para hacerlos mayúsculas
-- Escribe una consulta para actualizar todos los nombres en mayúsculas.
UPDATE users
SET name = UPPER(name);

-- 14. Eliminar registros donde el nombre tenga exactamente 3 letras
-- Escribe una consulta para eliminar registros donde el nombre tenga exactamente 3 letras.
DELETE
FROM users
WHERE LENGTH(name) = 3;

-- 15. Seleccionar los primeros 5 registros ordenados por nombre
-- Escribe una consulta para seleccionar los primeros 5 registros de la tabla ordenados por nombre.
SELECT *
FROM users
ORDER BY name
LIMIT 5;

-- 16. Seleccionar registros donde el id sea mayor que la media de todos los ids
-- Escribe una consulta para seleccionar registros donde el id sea mayor que la media de todos los ids.
SELECT *
FROM users
WHERE id > (SELECT AVG(id) FROM users);

-- 17. Contar registros donde el nombre no contenga la letra "a"
-- Escribe una consulta para contar los registros donde el nombre no contenga la letra "a".
SELECT COUNT(*)
FROM users
WHERE name NOT LIKE '%a%';

-- 18. Cambiar los nombres para añadirles un sufijo "-user" al final
-- Escribe una consulta para actualizar todos los nombres añadiéndoles un sufijo "-user" al final.
UPDATE users
SET name = name || '-user';

-- 19. Seleccionar registros donde el nombre tenga más de una palabra
-- Escribe una consulta para seleccionar registros donde el nombre contenga más de una palabra.
SELECT *
FROM users
WHERE name LIKE '% %';

-- 20. Eliminar todos los registros con nombres duplicados, manteniendo solo una ocurrencia
-- Escribe una consulta para eliminar todos los registros con nombres duplicados, manteniendo solo una ocurrencia de cada nombre.
DELETE
FROM users
WHERE id NOT IN (SELECT MIN(id)
                 FROM users
                 GROUP BY name);