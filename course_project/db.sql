/* Составить общее текстовое описание БД и решаемых ею задач;
 * Название БД: Учёт ремонта автомобиля.
 * В БД будут храниться данные о пользователях, принадлежащих им автомобилях, ремонтых работах
 * проведенных для каждого автомобиля, запчастях используемых в ремонте.
 * БД может использоваться в приложении для учета ремонта авто. 
 */

-- В таблице храним пользователей.
CREATE TABLE IF NOT EXISTS users (
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
CREATE TABLE IF NOT EXISTS cars (
	id SERIAL PRIMARY KEY,
	auto_maker VARCHAR(150) NOT NULL UNIQUE, -- Марка автомобиля
	car_model VARCHAR(150) NOT NULL UNIQUE, -- Модель автомобиля
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Фото автомобиля.
CREATE TABLE IF NOT EXISTS car_foto (
	id SERIAL PRIMARY KEY,
	file_name VARCHAR(50) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX car_foto_file_name_idx (file_name)	 
);

-- Таблица связывает пользователей и автомобили, которые им принадлежат.
CREATE TABLE IF NOT EXISTS users_cars (
	id, SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED, NOT NULL,
	car_id BIGINT UNSIGNED, NOT NULL,
	car_foto_id BIGINT UNSIGNED, NOT NULL,
	car_made_year VARCHAR(150) NOT NULL,	
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX users_cars_created_at_idx (created_at),
	INDEX users_cars_updated_at_idx (updated_at),	
	CONSTRAINT fk_users_cars_car_id FOREIGN KEY (car_id) REFERENCES cars(id),
	CONSTRAINT fk_users_cars_user_id FOREIGN KEY (user_id) REFERENCES users(id),
	CONSTRAINT fk_users_cars_car_foto_id FOREIGN KEY (car_foto_id) REFERENCES car_foto(id)
);

-- Мастерская где были выполнены работы (справочник).
CREATE TABLE IF NOT EXISTS car_repair_place (
	id SERIAL PRIMARY KEY,
	repair_place_name VARCHAR(50) NOT NULL UNIQUE,
	repair_place_address VARCHAR(100) NOT NULL UNIQUE,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX car_repair_place_repair_place_name_idx (repair_place_name)
	INDEX car_repair_place_repair_place_address_idx (repair_place_address)
);

-- Запасные части (справочник).
CREATE TABLE IF NOT EXISTS repair_parts (
	id SERIAL PRIMARY KEY,
	part_name VARCHAR(100) NOT NULL,
	part_price VARCHAR(20) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX repair_parts_part_name_idx (part_name)	 
);

-- Ремонтные работы по автомобилю.
CREATE TABLE IF NOT EXISTS car_repair_order (
	id SERIAL PRIMARY KEY,
	users_cars_id BIGINT UNSIGNED NOT NULL,
	car_repair_place_id BIGINT UNSIGNED NOT NULL,
	part_name_id BIGINT UNSIGNED NOT NULL,	
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT fk_car_repair_order_users_cars_id FOREIGN KEY (users_cars_id) REFERENCES users_cars(id),
	CONSTRAINT fk_car_repair_order_car_repair_place_id FOREIGN KEY (car_repair_place_id) REFERENCES car_repair_place(id),
	CONSTRAINT fk_car_repair_order_part_name_id FOREIGN KEY (part_name_id) REFERENCES repair_parts(id)
);




