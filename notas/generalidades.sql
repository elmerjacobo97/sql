select id,                                                -- Muestra el ID
       upper(name)                     as upper_name,     -- Nombre en mayúsculas
       lower(name)                     as lower_name,     -- Nombre en minúsculas
       length(name)                    as length_name,    -- Longitud del nombre
       (20 * 2)                        as constante,      -- Calcula una constante (40 en este caso)
       '*' || id || '-' || name || '*' as barcode,        -- Crea un "código de barras" con el ID y el nombre
       concat(id, '-', name)           as concat_id_name, -- Concatena el ID y el nombre con un guion
       name                                               -- Muestra el nombre tal cual
from users;


select name,                                                          -- Muestra el nombre completo
       substring(name, 0, 5),                                         -- Primeros 4 caracteres del nombre
       position(' ' in name),                                         -- Posición del primer espacio en el nombre
       substring(name, 0, position(' ' in name))    as first_name,    -- Primer nombre
       substring(name, position(' ' in name) + 1)   as last_name,     -- Apellido
       trim(substring(name, position(' ' in name))) as last_name_trim -- Apellido sin espacios extra
from users; -- Fuente de los datos

update users -- Actualiza la tabla 'users'
set first_name = substring(name, 0, position(' ' in name)), -- Establece 'first_name' usando el texto antes del primer espacio en 'name'
    last_name  = trim(substring(name, position(' ' in name))); -- Establece 'last_name' usando el texto después del primer espacio en 'name' y elimina espacios adicionales

-- Operador in
select first_name, last_name, followers
from users
where followers >= 4600
  and followers <= 4700
order by followers desc;

-- Operador between
select first_name, last_name, followers
from users
where followers between 4600 and 4700
order by followers desc;

-- count, min, avg o promedio, round, sum
-- group by
select count(*)                  as total_users,
       min(followers)            as min_followers,
       max(followers)            as max_followers,
       avg(followers)            as max_followers,
       round(avg(followers))     as max_followers, -- promedio de followers y redondeo,
       sum(followers) / count(*) as avg_followers_manual
from users;

select first_name, last_name, followers
from users
where followers = 4
   or followers = 4999;

select count(*), followers
from users
where followers = 4
   or followers = 4999
group by followers;

select count(*), followers
from users
where followers between 4550 and 4999
group by followers
order by followers desc;

-- HEAVING
select count(*), country
from users
group by country
having count(*) > 5
order by count(*) desc;

-- distinct
select distinct country from users;

-- Utilizando la función split_part para extraer y contar los dominios de correo
-- La función divide el email usando '@' como delimitador y selecciona la segunda parte (dominio)
-- Luego agrupa los resultados por dominio y los cuenta
SELECT split_part(email, '@', 2) as domain, COUNT(*) as total_domains
FROM users
GROUP BY domain
ORDER BY COUNT(*) DESC;

-- Utilizando las funciones substring y position para extraer individualmente el dominio del correo
-- Primero, se encuentra la posición del carácter '@' en el email
-- Luego, se extrae el substring a partir de esa posición + 1 para obtener sólo el dominio
SELECT email, substring(email FROM position('@' in email) + 1) as domain
FROM users;

