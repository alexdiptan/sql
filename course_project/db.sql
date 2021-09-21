/* Составить общее текстовое описание БД и решаемых ею задач;
 * Название БД: Учёт ремонта автомобиля.
 * В БД будут храниться данные о:
 * - пользователях,
 * - принадлежащих им автомобилях,
 * - ремонтных работах проведенных для каждого автомобиля,
 * - мастерских, где были выполнены работы,
 * - запчастях используемых в ремонте,
 * - услугах выполненных в мастерской.
 * БД может использоваться в приложении для учета ремонта авто. 
 */

DROP DATABASE IF EXISTS car_repair;
CREATE DATABASE IF NOT EXISTS car_repair;
USE car_repair;

-- В таблице храним пользователей.
CREATE TABLE IF NOT EXISTS users (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(150) NOT NULL,
	last_name VARCHAR(150) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	phone VARCHAR(15) NOT NULL UNIQUE,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX users_first_name_idx (first_name),
	INDEX users_last_name_idx (last_name),
	INDEX users_email_idx (email),
	INDEX users_phone_idx (phone)
);

INSERT INTO `users` VALUES
(DEFAULT,'Joanny','Bradtke','crice@example.net','273.140.0603x32','2008-08-17 23:42:58','1979-09-11 11:11:22'),
(DEFAULT,'Sabrina','Wehner','reilly.gustave@example.com','652.841.5812x25','1975-04-28 03:55:13','1994-06-10 13:05:45'),
(DEFAULT,'Floy','Williamson','garret65@example.net','897.108.7240','2007-01-19 14:56:28','1980-10-01 09:54:30'),
(DEFAULT,'Madeline','Farrell','daryl07@example.org','+44(0)532152829','2019-06-26 03:11:42','1984-10-09 13:11:48'),
(DEFAULT,'Alda','Batz','uvolkman@example.org','(902)124-9455x5','2001-09-02 04:32:05','1981-10-10 05:58:32'),
(DEFAULT,'Cordie','Glover','ebony58@example.com','07978680174','1970-02-28 23:35:59','1980-03-01 18:03:02'),
(DEFAULT,'Eleazar','Howell','mueller.braxton@example.com','437-268-2118x13','1973-03-29 12:56:35','1976-12-13 09:46:05'),
(DEFAULT,'Kaitlin','Reichert','olson.talia@example.com','1-301-671-0507','1976-11-02 23:44:49','2002-09-11 16:23:19'),
(DEFAULT,'Emily','Hilll','cvolkman@example.com','267-686-6090','2007-07-31 11:48:47','1989-10-12 15:46:23'),
(DEFAULT,'Price','Zemlak','harvey.chadd@example.org','1-136-482-3161x','1987-07-28 12:03:25','1988-02-14 20:51:38')
;

-- Справочник моделей автомобилей.
-- Как вариант, можно использовать полный справочник, например отсюда - https://github.com/blanzh/carsBase
CREATE TABLE IF NOT EXISTS cars (
	id SERIAL PRIMARY KEY,
	auto_maker VARCHAR(150) NOT NULL UNIQUE, -- Марка автомобиля
	car_model VARCHAR(150) NOT NULL UNIQUE, -- Модель автомобиля
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP	
);

INSERT INTO cars (id, auto_maker, car_model, created_at) VALUES
	(DEFAULT, 'Nissan', 'Quasqai', DEFAULT)
	,(DEFAULT, 'Toyota', 'Celica', DEFAULT)
	,(DEFAULT, 'BMW', 'X5', DEFAULT)
;

-- Фото автомобиля.
CREATE TABLE IF NOT EXISTS car_photo (
	id SERIAL PRIMARY KEY,
	file_name VARCHAR(50) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	INDEX car_photo_file_name_idx (file_name)
);

INSERT INTO car_photo (id, file_name, created_at) VALUES
     (DEFAULT, 'img1.jpg', DEFAULT )
    ,(DEFAULT, 'img3.jpg', DEFAULT )
    ,(DEFAULT, 'img4.jpg', DEFAULT )
    ,(DEFAULT, 'img54.jpg', DEFAULT )
    ,(DEFAULT, 'img5.jpg', DEFAULT )
    ,(DEFAULT, 'img6.jpg', DEFAULT )
    ,(DEFAULT, 'img37.jpg', DEFAULT )
    ,(DEFAULT, 'img8.jpg', DEFAULT )
    ,(DEFAULT, 'img9.jpg', DEFAULT )
    ,(DEFAULT, 'img33.jpg', DEFAULT )
;

-- Таблица связывает пользователей и автомобили, которые им принадлежат.
CREATE TABLE IF NOT EXISTS users_cars (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	car_id BIGINT UNSIGNED NOT NULL,
	car_photo_id BIGINT UNSIGNED NOT NULL,
	car_made_year VARCHAR(10) NOT NULL, -- год выпуска автомобиля
	car_mileage VARCHAR(150) NOT NULL, -- пробег автомобиля
	car_vin_number VARCHAR(15) NOT NULL UNIQUE, -- Уникальный VIN-номер автомобиля
	car_gos_number VARCHAR(10) NOT NULL UNIQUE, -- Гос номер автомобиля
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX users_car_vin_number_idx (car_vin_number),
	INDEX users_car_gos_number_idx (car_gos_number),
	INDEX users_cars_created_at_idx (created_at),
	INDEX users_cars_updated_at_idx (updated_at),	
	CONSTRAINT fk_users_cars_car_id FOREIGN KEY (car_id) REFERENCES cars(id),
	CONSTRAINT fk_users_cars_user_id FOREIGN KEY (user_id) REFERENCES users(id),
	CONSTRAINT fk_users_cars_car_photo_id FOREIGN KEY (car_photo_id) REFERENCES car_photo(id)
);

INSERT INTO users_cars (id, user_id, car_id, car_photo_id, car_made_year, car_mileage, car_vin_number, car_gos_number,
created_at, updated_at) VALUES
    (DEFAULT, 1, 1, 4, '2017', '42400', 'VSS013B99001000', 'Е093КХ93', DEFAULT, DEFAULT)
    ,(DEFAULT, 2, 1, 4, '2006', '147192', 'VSS013B990010ZZ', 'М393КС193', DEFAULT, DEFAULT)
;

-- Мастерская где были выполнены работы (справочник).
CREATE TABLE IF NOT EXISTS car_repair_place (
	id SERIAL PRIMARY KEY,
	repair_place_name VARCHAR(50) NOT NULL UNIQUE,
	repair_place_address VARCHAR(100) NOT NULL UNIQUE,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	INDEX car_repair_place_repair_place_name_idx (repair_place_name),
	INDEX car_repair_place_repair_place_address_idx (repair_place_address)
);

INSERT INTO car_repair_place (id, repair_place_name, repair_place_address, created_at) VALUES 
     (DEFAULT, 'ООО "Автомеханик"', 'г. Краснодар, ул. Московская 96.', DEFAULT)
    ,(DEFAULT, 'Тюнинг ателье дядя Серёжа', 'г. Усть-Лабинск, ул. Промышленная, д. 21', DEFAULT)
;

-- Услуги автосервиса (справочник). У разных автосерисов цены на услуги разные.
-- Соединяем автосервис с наименованием работ и добавляем цену работ.
CREATE TABLE IF NOT EXISTS car_repair_place_service_price_list (
	id SERIAL PRIMARY KEY,
	car_repair_place_id BIGINT UNSIGNED NOT NULL,
	service_name VARCHAR(100) NOT NULL, -- наименование оказанной услуги
	price VARCHAR(20) NOT NULL, -- цена услуги
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX car_repair_place_service_price_list_name_idx (service_name),
	CONSTRAINT fk_car_repair_place_service_price_list_car_repair_place_id FOREIGN KEY (car_repair_place_id) REFERENCES car_repair_place(id)
);

INSERT INTO car_repair_place_service_price_list (id, car_repair_place_id, service_name, price, created_at, updated_at) VALUES
    (DEFAULT, 1, 'Замена топливного фильтра', '2000', DEFAULT, DEFAULT)
    ,(DEFAULT, 1, 'Замена маслянного фильтра', '300', DEFAULT, DEFAULT)
    ,(DEFAULT, 1, 'Замена моторного масла', '200', DEFAULT, DEFAULT)
;

-- Причины обращения в автосервис (например: стук возле правого колеса) (справочник).
CREATE TABLE IF NOT EXISTS repair_reasons (
	id SERIAL PRIMARY KEY,
	description VARCHAR(100) NOT NULL,	
	created_at DATETIME NOT NULL DEFAULT NOW(),
	INDEX repair_reasons_description_idx (description)
);

INSERT INTO repair_reasons (id, description, created_at) VALUES
    (DEFAULT, 'Пропадает тяга при нажатии педали газа.', DEFAULT)
;

-- Запасные части (справочник).
CREATE TABLE IF NOT EXISTS repair_parts (
	id SERIAL PRIMARY KEY,
	part_name VARCHAR(100) NOT NULL,
	part_price VARCHAR(20) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	INDEX repair_parts_part_name_idx (part_name)
);

INSERT INTO repair_parts (id, part_name, part_price, created_at) VALUES
     (DEFAULT, 'Топливный фильтр MATSUTO', '1758', DEFAULT)
    ,(DEFAULT, 'Маслянный фильтр DENSO', '300', DEFAULT)
    ,(DEFAULT, 'Масло моторное Nissan orginal 5w40, 5 литров', '2450', DEFAULT)
;

-- Справочник типов обращений в автосервис (плановый, внеплановый, ТО).
CREATE TABLE IF NOT EXISTS type_reasons (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,	
	INDEX type_reasons_name_idx (name)	
);

INSERT INTO type_reasons (id, name, created_at) VALUES 
	(DEFAULT, 'Плановый ремонт.', DEFAULT)
	,(DEFAULT, 'Внеплановый ремонт.', DEFAULT)
	,(DEFAULT, 'Очередное ТО.', DEFAULT)
;

-- Ремонтные работы по автомобилю.
CREATE TABLE IF NOT EXISTS car_repair_order (
	id SERIAL PRIMARY KEY,
	users_cars_id BIGINT UNSIGNED NOT NULL,
	car_repair_place_id BIGINT UNSIGNED NOT NULL,
	part_name_id BIGINT UNSIGNED NOT NULL,
	type_reasons_id
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT fk_car_repair_order_users_cars_id FOREIGN KEY (users_cars_id) REFERENCES users_cars(id),
	CONSTRAINT fk_car_repair_order_car_repair_place_id FOREIGN KEY (car_repair_place_id) REFERENCES car_repair_place(id),
	CONSTRAINT fk_car_repair_order_part_name_id FOREIGN KEY (part_name_id) REFERENCES repair_parts(id)
);

INSERT INTO car_repair_place (id, users_cars_id, car_repair_place_id, part_name_id, created_at, updated_at) VALUES
    (DEFAULT, 1, 2, 1)
;