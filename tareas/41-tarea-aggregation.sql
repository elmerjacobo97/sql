-- 1. Cuantos usuarios tenemos con cuentas @google.com
-- Tip: count, like
select count(*) as total
from users
where email like '%@google.com';


-- 2. De qué países son los usuarios con cuentas de @google.com
-- Tip: distinct
select distinct country
from users
where email like '%@google.com';

-- 3. Cuantos usuarios hay por país (country)
-- Tip: Group by
select country, count(*) as total
from users
group by country;

-- 4. Listado de direcciones IP de todos los usuarios de Iceland
-- Campos requeridos first_name, last_name, country, last_connection
select first_name, last_name, country, last_connection
from users
where country = 'Iceland';


-- 5. Cuantos de esos usuarios (query anterior) tiene dirección IP
-- que incia en 112.XXX.XXX.XXX
SELECT COUNT(*)
FROM users
WHERE country = 'Iceland'
  AND last_connection LIKE '112.%';


-- 6. Listado de usuarios de Iceland, tienen dirección IP
-- que inicia en 112 ó 28 ó 188
-- Tip: Agrupar condiciones entre paréntesis
SELECT first_name, last_name, country, last_connection
FROM users
WHERE country = 'Iceland'
  AND (
            last_connection LIKE '112.%'
        OR last_connection LIKE '28.%'
        OR last_connection LIKE '188.%'
    );


-- 7. Ordene el resultado anterior, por apellido (last_name) ascendente
-- y luego el first_name ascendentemente también
SELECT first_name, last_name, country, last_connection
FROM users
WHERE country = 'Iceland'
  AND (
            last_connection LIKE '112.%'
        OR last_connection LIKE '28.%'
        OR last_connection LIKE '188.%'
    )
ORDER BY last_name ASC, first_name ASC;



-- 8. Listado de personas cuyo país está en este listado
-- ('Mexico', 'Honduras', 'Costa Rica')
-- Ordenar los resultados de por País asc, Primer nombre asc, apellido asc
-- Tip: Investigar IN
-- Tip2: Ver Operadores de Comparación en la hoja de atajos (primera página)

SELECT first_name, last_name, country
FROM users
WHERE country IN ('Mexico', 'Honduras', 'Costa Rica')
ORDER BY country ASC, first_name ASC, last_name ASC;


-- 9. Del query anterior, cuente cuántas personas hay por país
-- Ordene los resultados por País asc
SELECT country, COUNT(*) as num_persons
FROM users
WHERE country IN ('Mexico', 'Honduras', 'Costa Rica')
GROUP BY country
ORDER BY country ASC;


-- Más tareas:
-- 1. Cuántos usuarios tenemos con cuentas @google.com
-- Tip: COUNT, LIKE
select count(*)
from users
where email like '%@google.com';

-- 2. De qué países son los usuarios con cuentas @google.com
-- Tip: DISTINCT
select distinct country
from users
where email like '%@google.com';

-- 3. Cuántos usuarios hay por país
-- Tip: GROUP BY
select country, count(*)
from users
group by country;

-- 4. Listado de direcciones IP de todos los usuarios de Monaco
-- Tip: Campos requeridos: first_name, last_name, country, last_connection
select first_name, last_name, country, last_connection
from users
where country = 'Monaco';

-- 5. Cuántos de esos usuarios (query anterior) tienen dirección IP que inicia en 112.XXX.XXX.XXX
-- Tip: COUNT
select count(*)
from users
where last_connection like '112.%';

-- 6. Listado de usuarios de Monaco con dirección IP que inicia en 112 o 28 o 188
-- Tip: Agrupar condiciones entre paréntesis
select *
from users
where country = 'Monaco'
  and (last_connection like '112.%' or last_connection like '28.%' or last_connection like '188.%');

-- 7. Ordenar el resultado anterior por apellido (last_name) y luego por first_name
-- Tip: ORDER BY
select *
from users
where country = 'Monaco'
  and (last_connection like '112.%' or last_connection like '28.%' or last_connection like '188.%')
order by last_name, first_name;

-- 8. Listado de usuarios cuyo país está en ('Mexico', 'Honduras', 'Costa Rica')
-- Tip: IN
select *
from users
where country in ('Mexico', 'Honduras', 'Costa Rica');

-- 9. Cuántas personas hay por país (query anterior)
-- Tip: GROUP BY
select country, count(*)
from users
group by country;

-- 10. Cuántos usuarios tienen más de 1000 seguidores
-- Tip: WHERE
select count(*)
from users
where followers > 1000;

-- 11. Listado de usuarios de Qatar, ordenado por seguidores
-- Tip: ORDER BY
select *
from users
where country = 'Qatar'
order by followers;

-- 12. Cuántos usuarios tienen un sitio web
-- Tip: IS NOT NULL
select count(*)
from users
where website is not null;

-- 13. Listado de usuarios cuyo username contiene la palabra "dark"
-- Tip: LIKE
select *
from users
where username like '%dark%';

-- 14. Cuántos usuarios están siguiendo a más de 100 personas pero tienen menos de 20 seguidores
-- Tip: WHERE
select count(*)
from users
where followers > 100
  and followers < 20;

-- 15. Listado de los 10 usuarios con más seguidores
-- Tip: LIMIT, ORDER BY
select *
from users
order by followers desc
limit 10;

-- 16. Cuántos usuarios tienen el campo email vacío
-- Tip: IS NULL
select count(*)
from users
where email is null;

-- 17. Listado de usuarios con el mismo apellido (last_name)
-- Tip: GROUP BY, HAVING
select (last_name), count(*)
from users
group by last_name
having count(*) > 1;

-- 18. Cuál es el país con más usuarios
-- Tip: GROUP BY, ORDER BY
select country, count(*)
from users
group by country
order by count(*) desc
limit 1;

-- 19. Cuántos usuarios hay con la última conexión en una dirección IP que inicia con 192
-- Tip: LIKE
select count(*)
from users
where last_connection like '192.%';

-- 20. Cuántos usuarios son tanto de United States como de Canadá
-- Tip: IN
select count(*)
from users
where country in ('United States', 'Canada');

-- 21. Listado de usuarios cuyo país no está en ('Estados Unidos', 'Canadá')
-- Tip: NOT IN
select *
from users
where country not in ('United States', 'Canada');

-- 22. Cuántos usuarios tienen tanto más de 1000 seguidores como más de 1000 seguidos
-- Tip: WHERE, AND
select count(*)
from users
where followers > 1000
  and followers < 1000;

-- 23. Cuántos usuarios tienen un sitio web que contiene "blog" en la URL
-- Tip: LIKE
select count(*)
from users
where website like '%blog%';

-- 24. Listado de usuarios cuyo email es de un dominio diferente a gmail.com y yahoo.com
-- Tip: NOT LIKE
select *
from users
where email not like '%gmail.com'
  and email not like '%yahoo.com';

-- 25. Cuántos usuarios tienen el campo last_connection más reciente que una fecha dada
-- Tip: WHERE, fecha
select count(*)
from users
where last_connection > '2020-01-01';

-- 26. Listado de usuarios ordenados por fecha de última conexión, de más reciente a más antigua
-- Tip: ORDER BY
select *
from users
order by last_connection desc;

-- 27. Cuántos usuarios hay por cada cantidad de seguidores
-- Tip: GROUP BY
select followers, count(*)
from users
group by followers;

-- 28. Listado de usuarios que no están siguiendo a nadie
-- Tip: WHERE
select *
from users
where followers = 0;

-- 29. Cuántos usuarios tienen un apellido que empiece con la letra 'A'
-- Tip: LIKE
select count(*)
from users
where last_name like 'A%';

-- 30. Listado de usuarios cuyo nombre o apellido contienen una vocal acentuada (á, é, í, ó, ú)
-- Tip: LIKE
select *
from users
where last_name like '%á%'
   or last_name like '%é%'
   or last_name like '%í%'
   or last_name like '%ó%'
   or last_name like '%ú%';

-- 31. Cuántos usuarios hay de cada país, pero solo para países con más de 10 usuarios
-- Tip: GROUP BY, HAVING
select country, count(*)
from users
group by country
having count(*) > 10;

-- 32. Listado de usuarios con email pero sin sitio web
-- Tip: IS NOT NULL, IS NULL
select *
from users
where email is not null
  and website is null;

-- 33. Cuántos usuarios tienen más seguidores que seguidos
-- Tip: WHERE
select count(*)
from users
where followers > followers;

-- 34. Listado de usuarios que están siguiendo a más de 50 personas pero tienen menos de 5 seguidores
-- Tip: WHERE
select *
from users
where followers > 50
  and followers < 5;

-- 35. Cuál es el nombre más común entre los usuarios
-- Tip: GROUP BY, ORDER BY
select first_name, count(*)
from users
group by first_name
order by count(*) desc
limit 1;

-- 36. Cuál es el apellido más común entre los usuarios
-- Tip: GROUP BY, ORDER BY
select last_name, count(*)
from users
group by last_name
order by count(*) desc
limit 1;

-- 37. Listado de usuarios que tienen el mismo nombre y apellido
-- Tip: GROUP BY, HAVING
select first_name, last_name, count(*)
from users
group by first_name, last_name
having count(*) > 1;

-- 38. Cuál es el país con menos usuarios
-- Tip: GROUP BY, ORDER BY
select country, count(*)
from users
group by country
order by count(*) asc
limit 1;

-- 39. Cuántos usuarios tienen el campo last_connection igual a una fecha dada
-- Tip: WHERE, fecha
select count(*)
from users
where last_connection = '2020-01-01';

-- 40. Listado de los 10 usuarios con menos seguidores
-- Tip: LIMIT, ORDER BY
select *
from users
order by followers asc
limit 10;

-- 41. Cuántos usuarios son de un conjunto de países dado
-- Tip: IN
select count(*)
from users
where country in ('Spain', 'France', 'Germany');

-- 42. Cuántos usuarios tienen un apellido que contiene al menos una vocal
-- Tip: LIKE
select count(*)
from users
where last_name like '%a%'
   or last_name like '%e%'
   or last_name like '%i%'
   or last_name like '%o%'
   or last_name like '%u%';

-- 43. Listado de usuarios que no tienen ni seguidores ni seguidos
-- Tip: WHERE
select *
from users
where followers = 0
  and followers = 0;

-- 44. Cuántos usuarios tienen el campo email y last_connection llenos
-- Tip: IS NOT NULL
select count(*)
from users
where email is not null
  and website is not null;

-- 45. Listado de usuarios que son de un país pero tienen last_connection en una IP de otro país
-- Tip: WHERE, LIKE
select *
from users
where country = 'United States'
  and last_connection like '192.%';

-- 46. Cuántos usuarios hay con nombre y apellido de una sola letra
-- Tip: LENGTH
select count(*)
from users
where LENGTH(first_name) = 1
  and LENGTH(last_name) = 1;

-- 47. Cuál es el promedio de seguidores entre los usuarios
-- Tip: AVG
select avg(followers)
from users;

-- 48. Cuál es la cantidad máxima de seguidos entre los usuarios
-- Tip: MAX
select max(followers)
from users;

-- 49. Cuál es la cantidad mínima de seguidores entre los usuarios
-- Tip: MIN
select min(followers)
from users;

-- 50. Listado de usuarios cuyo número de seguidores es un número primo
-- Tip: UDF (User Defined Function), WHERE
select *
from users
where followers % 2 = 1;

