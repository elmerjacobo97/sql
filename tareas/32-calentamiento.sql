-- Nombre, apellido e IP, donde la última conexión se dió de 221.XXX.XXX.XXX
select first_name, last_name, last_connection
from users
where last_connection like '221.%';

-- Nombre, apellido y seguidores(followers) de todos a los que lo siguen más de 4600 personas
select first_name, last_name, followers
from users
where followers > 4600;

--Seleccionar todos los registros donde el last_name empiece con la letra "A".
select *
from users
where last_name like 'A%';

--Obtener todos los usuarios que tienen más de 1000 seguidores y más de 1000 seguidos (followers y following).
select *
from users
where followers > 1000
  and following > 1000;

--Cambiar el country a "Unknown" para todos los registros donde el country sea NULL.
update users
set country = 'Unknown'
where country IS NULL;


--Seleccionar todos los registros donde la last_connection sea NULL.
select *
from users
where last_connection is null;


--Seleccionar el username y el email de todos los usuarios que son de Macedonia.
select username, email
from users
where country = 'Macedonia';


--Contar el número de usuarios que tienen el mismo country.
SELECT country, COUNT(*)
FROM users
GROUP BY country;

--Actualizar el website a "N/A" para todos los registros donde el website sea NULL.
update users
set website = 'N/A'
where website IS NULL;


--Seleccionar todos los usuarios que tienen un email que termina en "gmail.com".
select *
from users
where email like '%gmail.com';


--Eliminar todos los registros donde tanto followers como following sean menores a 10.
delete
from users
where followers < 10
  and following < 10;


--Seleccionar el id, first_name y last_name de los 5 usuarios con más seguidores.
SELECT id, first_name, last_name
FROM users
ORDER BY followers DESC
LIMIT 5;


--Seleccionar todos los usuarios cuyo username contenga la palabra "admin".
select *
from users
where username like '%admin%';

--Actualizar el campo last_connection a '2023-10-01' para todos los usuarios de un país específico, digamos, Macedonia.
update users
set last_connection = '2023-10-01'
where country = 'Macedonia';

--Contar cuántos usuarios tienen un email de un dominio específico, como "yahoo.com".
SELECT COUNT(*)
FROM users
WHERE email LIKE '%yahoo.com';


--Seleccionar los primeros 3 usuarios que tengan el mayor número de following.
select *
from users
order by following desc
limit 3;

--Eliminar todos los registros de usuarios que tengan menos de 5 followers y su last_connection sea NULL.
delete
from users
where followers < 5
  and last_connection IS NULL;

--Seleccionar todos los usuarios que sean de Vietnam o de Iran.
select *
from users
where country = 'Vietnam'
   or country = 'Iran'; -- Forma larga
SELECT *
FROM users
WHERE country IN ('Vietnam', 'Iran');
--Forma optimizada

--Actualizar el username agregando "_user" al final para todos los registros donde el username no contenga ya "_user".
UPDATE users
SET username = username || '_user'
WHERE NOT username LIKE '%_user';

--Seleccionar el id y username de todos los usuarios cuyo last_name termine en "ez".
select id, username
from users
where last_name like '%ez';

--Contar el total de usuarios que tienen tanto followers como following mayores a 100.
select count(*)
from users
where followers > 100
  and following > 100;

--Seleccionar todos los usuarios cuya last_connection sea más reciente que '2022-01-01'.
SELECT *
FROM users
WHERE last_connection > '2022-01-01';
