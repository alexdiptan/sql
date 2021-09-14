/* Составить общее текстовое описание БД и решаемых ею задач;
 * Название БД: Учёт ремонта автомобиля.
 * В БД будут храниться данные о пользователях, принадлежащих им автомобилях, ремонтых работах
 * проведенных для каждого автомобиля, запчастях используемых в ремонте.
 */

-- В таблице храним пользователей.
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(150) NOT NULL,
	last_name VARCHAR(150) NOT NULL,
	email VARCHAR(150), NOT NULL UNIQUE,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMPб
	INDEX users_first_name_idx (first_name),
	INDEX users_last_name_idx (last_name),
	INDEX users_email_idx (email)
	
);

-- Справочник моделей автомобилей. https://github.com/blanzh/carsBase
CREATE TABLE cars (
	id SERIAL PRIMARY KEY,
	auto_maker VARCHAR(150) NOT NULL UNIQUE, -- Марка автомобиля
	car_model VARCHAR(150) NOT NULL UNIQUE, -- Модель автомобиля
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Таблица связывает пользователей и автомобили, которые им принадлежат.
CREATE TABLE users_cars (
	id, SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED, NOT NULL,
	car_id BIGINT UNSIGNED, NOT NULL,
	car_made_year VARCHAR(150) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT fk_users_cars_car_id FOREIGN KEY (car_id) REFERENCES cars(id),
	CONSTRAINT fk_users_cars_user_id FOREIGN KEY (user_id) REFERENCES users(id),
);

-- Мастерская где были выполнены работы (справочник).
-- Запасные части (справочник).
-- Ремонтные работы по автомобилю.
CREATE TABLE car_repair_order (
	id SERIAL PRIMARY KEY,
);

 
-- Связь ремонтных работ и запасных частей.




