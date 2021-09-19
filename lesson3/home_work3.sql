-- создаю справочник городов 
CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	name VARCHAR (150) NOT NULL UNIQUE
);
-- создаю справочник стран
CREATE TABLE countries (
	id SERIAL PRIMARY KEY,
	name VARCHAR (150) NOT NULL UNIQUE 
);
-- создаю таблицу где будет храниться связь страны и города. 
CREATE TABLE cities_countries (
	id SERIAL PRIMARY KEY,
	cities_id BIGINT UNSIGNED NOT NULL,
	countries_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (cities_id) REFERENCES cities(id),
	FOREIGN KEY (countries_id) REFERENCES countries(id)
);

-- добавляю две страны и два города
INSERT INTO countries VALUES (DEFAULT, 'RUSSIA');
INSERT INTO countries VALUES (DEFAULT, 'France');
INSERT INTO cities VALUES (DEFAULT, 'Moscow');
INSERT INTO cities VALUES (DEFAULT, 'Lille');
-- добавляю связку страны и города
INSERT INTO cities_countries VALUES (DEFAULT, 1, 1);
INSERT INTO cities_countries VALUES (DEFAULT, 2, 2);


-- придется переписать таблицу profiles. 
CREATE TABLE profiles(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	gender ENUM('f', 'm', 'x') NOT NULL,
	birthday DATE NOT NULL,
	photo_id BIGINT UNSIGNED,
	cities_countries_id BIGINT UNSIGNED NOT NULL, -- вместо столбцов city и country будет использоваться столбец, который ссылается на ид в таблице cities_countries в которой однозначно определены город и страна.
	FOREIGN KEY(user_id) REFERENCES users(id), 
	FOREIGN KEY(cities_countries_id) REFERENCES cities_countries(id) -- создаю внешний ключ для таблицы cities_countries на поле id 
);