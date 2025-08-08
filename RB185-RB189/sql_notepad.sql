# like reviews has one book, jan_22 has one month

CREATE TABLE jun_23 (
  month_id integer DEFAULT 6,
  date int,
  FOREIGN KEY (month_id)
    REFERENCES months_2023(id)
);

# like books has many reviews, months has many days
CREATE TABLE months_2022 (
  id integer,
  month varchar(10),
  PRIMARY KEY(id)
);

ALTER TABLE months_2023
      ADD COLUMN id int;

# INSERT MONTHS INTO A YEAR
INSERT INTO months_2022 (id, month) VALUES (1, 'January'), (2, 'February'), (3, 'March'), (4, 'April'), (5, 'May'), (6, 'June'), (7, 'July'), (9, 'September'), (10, 'October'), (11, 'November'), (12, 'December');
INSERT INTO FOod_data (base_description, calories, fat, protein, carbs) VALUES('cherry_tomatoes', 0.186000, 0.002000, 0.009000, 0.040000 );
# INSERT DAYS INTO A MONTH TABLE
INSERT INTO jun_23 (date) VALUES (01), (02), (03), (08), (09), (10), (11), (12), (13), (14), (15), (16), (17), (18), (19);

ALTER TABLE months_2023
      ADD PRIMARY KEY (id);

ALTER TABLE day_01_01_22
ADD CONSTRAINT fk_jan_22_date
FOREIGN KEY (date)
REFERENCES jan_22(date);

DELETE FROM months_2023
WHERE id IS NULL;


CREATE TABLE all_consumed (
  time timestamp NOT NULL,
  food_name varchar(100) NOT NULL,
  source varchar(50)
);

SELECT * FROM all_consumed WHERE DATE(time) = '2023-02-01';
SELECT * FROM all_consumed WHERE food_name ILIKE '%cadburys_daim%';
SELECT * FROM food_measurements WHERE food ILIKE '%chutney%';
SELECT * FROM food_measurements WHERE food ILIKE '%EGG%';
SELECT * FROM food_data WHERE base_description ILIKE '%choco%';

CREATE TABLE meals (
  cooked_at timestamp NOT NULL,
  food_name varchar(100) NOT NULL,
  weight_description varchar(100),
  weight_int decimal(8,4)
);

DELETE weight_int FROM all_consumed
WHERE DATE(time) = '2023-06-09 22:00:00';

UPDATE all_consumed
SET weight_int = NULL
WHERE DATE(time) = '2023-06-09 22:00:00' AND food_name = 'stella_beer';

UPDATE all_consumed
SET weight_int = NULL WHERE DATE(time) = '2023-06-09 22:00:00' AND food_name = 'stella_beer';

ALTER TABLE meals
      RENAME TO recipes;

      SELECT * FROM meals WHERE cooked_at = '2023-06-15 00:00:00';

DELETE FROM all_consumed WHERE food_name LIKE 'ric';



UPDATE all_consumed
SET weight_description = 'broccoli'
WHERE food_name = 'brocolli';

UPDATE all_consumed SET weight_description = 'OATCAKE_ASDA * 8' WHERE DATE(time) = '2023-04-25' AND weight_description = 'OATCAKE_ASDA * (10 - 6)';


UPDATE all_consumed SET food_name ='oatcakes_asda' WHERE food_name LIKE ' oatcakes_asda' AND DATE(time) = '2023-03-30';
SELECT * FROM food_measurements WHERE food LIKE '%CADBURYS_BLOCK_SM%';
INSERT INTO food_measurements (food, grams) VALUES ('KIDNEY_BEANS_WITH_CHILLI', 390);

INSERT INTO food_data (base_description, calories, fat, protein, carbs, fibre) VALUES ('mushrooms', 0.280000, 0.000000, 0.020000, 0.050000, 0.00500);
'KIDNEY_BEANS_WITH_CHILLI'

DELETE FROM meals WHERE cooked_at = '2023-05-08' AND food_name LIKE 'chia_seeds';
DELETE FROM all_consumed WHERE DATE(time) = '2023-03-13';

UPDATE all_consumed  SET  weight_description = 'PINT * 3' 
WHERE DATE(time) = '2023-02-17' AND  food_name = 'beer_lagunitas';

UPDATE all_consumed SET weight_description = 'MANGO_MEDIUM * 2' WHERE weight_description = 'MEDIUM_MANGO'; 

SELECT * FROM all_consumed WHERE DATE(time) = '2023-02-01';

CREATE TABLE menu_items (
  item varchar(50),
  prep_time integer,
  ingredient_cost decimal(3,2),
  sales integer,
  menu_price decimal(4,2)
);


UPDATE films SET director = 'John McTiernan', duration = 132 WHERE title = 'Die Hard';
UPDATE films SET director = 'Michael Curtiz', duration = 102 WHERE title = 'Casablanca';
UPDATE films SET director = 'Francis Ford Coppola', duration = 113 WHERE title = 'The Conversation';


INSERT INTO films(title, year, genre, director, duration) VALUES 
('1984', 1956,	'scifi',	'Michael Anderson',	90),
('Tinker Tailor Soldier Spy',	2011,	'espionage',	'Tomas Alfredson',	127),
('The Birdcage',	1996,	'comedy',	'Mike Nichols',	118);


SELECT * FROM people WHERE occupation IS NULL;
SELECT * FROM people WHERE age < 27;
SELECT name, family FROM birds WHERE extinct = false ORDER BY length DESC;
SELECT avg(wingspan), min(wingspan), max(wingspan) FROM birds;
SELECT min(wingspan) FROM birds;
SELECT max(wingspan) FROM birds;

SELECT item FROM menu_items IF max(ingredient_cost * sales);

SELECT item, menu_price - ingredient_cost, (13.00/60 * prep_time) AS profit FROM menu_items ORDER BY profit DESC LIMIT 1;

SELECT prep_time AS production_cost, menu_price - ingredient_cost AS how_profitable FROM menu_items ORDER BY how_profitable DESC LIMIT 1;


- $13/60 * prep_time = cost of making item
cost of making item - how profitable



SELECT item, menu_price, ingredient_cost, 
round((13.00/60 * prep_time),2) AS labor, 
round((menu_price - ingredient_cost) - (13.00/60 * prep_time), 2) AS profit
FROM menu_items ORDER BY profit DESC;

SELECT * FROM films WHERE length(title) > 12;

ALTER TABLE films ADD COLUMN director varchar(255);
ALTER TABLE films ADD COLUMN id serial PRIMARY KEY;
ALTER TABLE films ADD COLUMN duration integer;

ALTER TABLE all_users
      ADD COLUMN last_login timestamp
                 NOT NULL
                 DEFAULT NOW();

SELECT title, 2023 - year AS age FROM films ORDER BY age ASC;
SELECT title, duration FROM films WHERE duration > 120 ORDER BY duration DESC;
SELECT title FROM films ORDER BY duration DESC LIMIT 1;

psql -d residents < residents_with_data.sql


SELECT item, menu_price, ingredient_cost, 
round((13.00/60 * prep_time),2) AS labor, 
round((menu_price - ingredient_cost) - (13.00/60 * prep_time), 2) AS profit
FROM menu_items ORDER BY profit DESC;



SELECT state, count(state) FROM people GROUP BY state LIMIT 10;
SELECT state, COUNT(id) FROM people GROUP BY state ORDER BY count DESC LIMIT 10;



SELECT substr(email, 0, strpos(email, '@')) FROM people;

SELECT  FROM people;
strpos('high', 'ig') → 2

SELECT  substring(email, 0, position('@' in email)),  COUNT BY (substring(email,position('@' in email)+1)) FROM people;


DELETE FROM people WHERE state = 'CA';
SELECT * FROM people WHERE state = 'CA';

SELECT given_name, email FROM people WHERE (substring(email,position('@' in email)+1)) LIKE 'teleworm.us' LIMIT 10;

SELECT given_name, email FROM people WHERE (substring(email,position('@' in email)+1)) LIKE 'teleworm.us' LIMIT 10;

lower('InPut')


UPDATE people SET given_name = upper(given_name) WHERE substring(email,position('@' in email)+1) LIKE 'teleworm.us';

DELETE FROM people;

SELECT id * 0 FROM people;
INSERT INTO people(zipcode) VALUES 
(90), (30), (10);

ALTER TABLE employees ALTER COLUMN department SET DEFAULT 'unassigned';
UPDATE employees SET department = 'unassigned' WHERE department IS NULL;
ALTER TABLE employees ALTER COLUMN department SET NOT NULL;

CREATE TABLE temperatures(
  date timestamp NOT NULL,
  low integer NOT NULL,
  high integer NOT NULL); 

INSERT INTO temperatures(date, low, high) VALUES
('2016-03-01', 34, 43),
('2016-03-02', 32, 44),
('2016-03-03', 31, 47),
('2016-03-04', 33, 42),
('2016-03-05', 39, 46),
('2016-03-06', 32, 43),
('2016-03-07', 29, 32),
('2016-03-08', 23, 31),
('2016-03-09', 17, 28);

SELECT date, round((low + high)/2, 1) AS average FROM temperatures WHERE date > '2016-03-01' AND date < '2016-03-09';

ALTER TABLE temperatures ADD COLUMN rainfall integer DEFAULT 0;

INSERT INTO temperatures(rainfall) VALUES (round((low + high)/2, 1) - 35);
UPDATE temperatures SET rainfall = (round((low + high)/2, 1) - 35) WHERE (round((low + high)/2, 1) - 35) > 0;

UPDATE temperatures SET rainfall = 0;


SELECT rainfall FROM temperatures;

25.4 mm in an inch
mm / 25.4
7 mm = 0.2755905511811024 inches

ALTER TABLE temperatures ALTER COLUMN rainfall TYPE decimal(6,4);
UPDATE temperatures SET rainfall = rainfall/25.4;

ALTER TABLE temperatures RENAME TO weather;
ALTER TABLE films SET NOT NULL;

ALTER TABLE films ALTER COLUMN title TYPE decimal(6,4);
ALTER TABLE films ALTER COLUMN title 'unique' SET UNIQUE;
ALTER TABLE films DROP CONSTRAINT title_unique;

ALTER TABLE films ADD CONSTRAINT title_unique UNIQUE (title);

ALTER TABLE films ADD CONSTRAINT title_more_that_one_char length(title) > 1;


INSERT INTO films VALUES ('', 1, 'ho', 'ho', 1);
DELETE FROM films WHERE length(title) = 1;
ALTER TABLE films ADD CONSTRAINT date_20th_century CHECK (year BETWEEN 1900 AND 2100);
ALTER TABLE films ADD CONSTRAINT director_length CHECK length(director) >= 3 AND substring(director ' ');

substring(email,position('@' in email)+1) LIKE 'teleworm.us';

UPDATE films SET director = 'Johnny' WHERE title = 'Die Hard';

# 16

ALTER TABLE films ALTER COLUMN title 'unique' SET UNIQUE;
ALTER TABLE films ALTER COLUMN year 'not_null' SET NOT NULL;
ALTER TABLE films ADD CONSTRAINT director_length CHECK length(director) >= 3 AND substring(director ' ')

ALTER TABLE films ALTER COLUMN director DEFAULT 'Bob';

INSERT INTO films(title, year, genre, director, duration) VALUES ('Godzilla', 1998, 'scifi', 'Roland Emmerich', 139);
INSERT INTO films(title, year, genre, director, duration) VALUES ('Godzilla', 2014, 'scifi', 'Gareth Edwards', 123);



INSERT INTO all_consumed (time, food_name, weight_int, weight_description) VALUES 
(#{}, #{}, #{}, #{})

ALTER TABLE all_consumed
      ADD COLUMN id serial;

DELETE FROM all_consumed WHERE id = #{id};
      
DELETE FROM meals WHERE DATE(cooked_at) = '2023-12-11 00:00:00';

ALTER TABLE films ADD PRIMARY KEY (year);
ALTER TABLE films DROP PRIMARY KEY (id);

INSERT INTO films(title, year, genre, director, duration)  VALUES
  ('Wayne''s World',	1992,	'comedy',	'Penelope Spheeris',	95),
('Bourne Identity',	2002,	'espionage',	'Doug Liman',	118);

SELECT DISTINCT genre FROM films;
SELECT genre FROM films GROUP BY genre;
SELECT genre, round(avg(duration)) FROM films;
SELECT round(year, -1) AS decade, round(avg(duration)) AS duration FROM films GROUP BY decade ORDER BY decade;
SELECT * FROM films WHERE director ILIKE 'john%';
SELECT genre, count(genre) AS count FROM films GROUP BY genre;

SELECT year / 10 * 10 AS decade, genre, string_agg(title, ', ') AS films
  FROM films GROUP BY decade, genre ORDER BY decade, genre;

  SELECT genre, sum(duration) AS total_duration FROM films GROUP BY genre;
  SELECT genre, sum(duration) AS total_duration FROM films GROUP BY genre ORDER BY total_duration;

SELECT round(count(DISTINCT customer_id)/count(DISTINCT tickets.event_id)::decimal, 2) AS percentage FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id;

SELECT round( COUNT(DISTINCT tickets.customer_id)
            // COUNT(DISTINCT customers.id)::decimal * 100,
            2)
       AS percent
  FROM customers
  LEFT OUTER JOIN tickets
    ON tickets.customer_id = customers.id;


5. Write a query that returns the name of each event and how many tickets were sold for it, in order from most popular to least popular.

name            | popularity
----------------------------+------------
  A-Bomb                     |        555
  Captain Deadshot Wolf      |        541
  Illustrious Firestorm      |        521
  Siren I                    |        457
  Kool-Aid Man               |        439
  Green Husk Strange         |        414
  Ultra Archangel IX         |        359
  Red Hope Summers the Fated |        307
  Magnificent Stardust       |        134
  Red Magus                  |         56
(10 rows)

SELECT round( COUNT(DISTINCT tickets.customer_id)
            / COUNT(DISTINCT customers.id)::decimal * 100,
            2)
       AS percent
  FROM films
  LEFT OUTER JOIN tickets
    ON tickets.customer_id = customers.id;

SELECT events.name, sum(DISTINCT tickets.id) FROM events
LEFT OUTER JOIN tickets
ON events.id = tickets.event_id
GROUP BY events.name
;

SELECT events.name, count(tickets.id) AS popularity FROM events
LEFT OUTER JOIN tickets
ON events.id = tickets.event_id
GROUP BY events.name ORDER BY popularity DESC
;

SELECT c.id, c.email, COUNT(t.customer_id) AS count FROM customers AS c
LEFT OUTER JOIN tickets AS t
ON c.id = t.customer_id
GROUP BY
c.id
HAVING
count(t.event_id) = 3;
;

UPDATE all_consumed
SET weight_int = NULL
WHERE DATE(time) = '2023-06-09 22:00:00' AND food_name = 'stella_beer';

UPDATE meals
SET weight_int = 40
WHERE cooked_at = '2023-11-16' AND weight_description = 'STOCK_CUBE * 4'
;

UPDATE films SET DIrector = 'Johnny' WHERE title = 'Die Hard';

SELECT user_name FROM users WHERE level_1 = 'complete';
/

SELECT * FROM all_consumed WHERE DATE(time) = '2023-11-25 19:00:00';

SELECT product_id, SUM(quantity_sold) AS total_quantity
FROM sales
GROUP BY product_id;


CREATE SEQUENCE aliens_id_seq;

CREATE TABLE furniture (
  id integer NOT NULL DEFAULT nextval('aliens_id_seq')
);

CREATE TABLE aliens (
  name text DEFAULT 'unknown'
);
CREATE SEQUENCE aliens_id_seq;
ALTER TABLE aliens ADD COLUMN id integer NOT NULL DEFAULT nextval('aliens_id_seq');
 
ALTER TABLE countries DROP CONSTRAINT countries_continent_id_fkey;

ALTER TABLE countries
ADD CONSTRAINT countries_continent_id_fkey
FOREIGN KEY (continent_id)
REFERENCES continents(id);

CREATE TABLE flights (
  id serial PRIMARY KEY,
  flight_code varchar(8) NOT NULL,
  departure_airport varchar(40),
  arrival_airport varchar(40),
  departure_date date,
  arrival_date date,
  departure_time time,
  arrival_time time,
  airline_id int REFERENCES airlines(id)
);

CREATE TABLE flights (
  id serial PRIMARY KEY,
  flight_code varchar(8) NOT NULL,
  departure_airport varchar(40),
  arrival_airport varchar(40),
  departure_date date,
  arrival_date date,
  departure_time time,
  arrival_time time,
  airline_id int,
  FOREIGN KEY (airline_id) REFERENCES airlines(id)
);

ALTER TABLE flights RENAME COLUMN flight_code TO not_flight_code;
ALTER TABLE flights ADD COLUMN test varchar(50);
ALTER TABLE flights ALTER COLUMN test TYPE char(50);

INSERT INTO all_consumed(time, food_name, weight_int) VALUES
('2023-11-27 20:00:00', 'biscuit_bourbon', 15);