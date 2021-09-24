/*
 * Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу 
 * logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.
*/
USE shop;
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	inserted_at DATETIME NOT NULL,
	table_name VARCHAR(30) NOT NULL,
	archived_id BIGINT(10) UNSIGNED NOT NULL,
	name_value VARCHAR(45) NOT NULL 
) ENGINE=InnoDB;

-- TRIGGER ON users
DROP TRIGGER IF EXISTS log_users;
delimiter //
CREATE TRIGGER log_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (inserted_at, table_name, archived_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;


-- TRIGGER ON catalogs 
DROP TRIGGER IF EXISTS log_catalogs;
delimiter //
CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (inserted_at, table_name, archived_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;


-- TRIGGER ON products 
DROP TRIGGER IF EXISTS log_products;
delimiter //
CREATE TRIGGER log_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (inserted_at, table_name, archived_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;

-- TST DATA
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE users;
SET FOREIGN_KEY_CHECKS=1;
INSERT INTO `users` VALUES 
(1,'Геннадий','1990-10-05','2021-09-07 08:13:58','2021-09-07 08:13:58')
,(2,'Наталья','1984-11-12','2021-09-07 08:13:58','2021-09-07 08:13:58')
,(3,'Александр','1985-05-20','2021-09-07 08:13:58','2021-09-07 08:13:58')
,(4,'Сергей','1988-02-14','2021-09-07 08:13:58','2021-09-07 08:13:58')
,(5,'Иван','1998-01-12','2021-09-07 08:13:58','2021-09-07 08:13:58')
,(6,'Мария','1992-08-29','2021-09-07 08:13:58','2021-09-07 08:13:58');

SET FOREIGN_KEY_CHECKS=0;
TRUNCATE catalogs;
SET FOREIGN_KEY_CHECKS=1;
INSERT INTO `catalogs` VALUES 
(1,'Процессоры')
,(2,'Материнские платы')
,(3,'Видеокарты')
,(4,'Жесткие диски')
,(5,'Оперативная память');

SET FOREIGN_KEY_CHECKS=0;
TRUNCATE products;
SET FOREIGN_KEY_CHECKS=1;
INSERT INTO `products` VALUES (1,'Intel Core i3-8100','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',7890.00,1,'2021-09-09 08:06:13','2021-09-09 08:06:13')
,(2,'Intel Core i5-7400','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',12700.00,1,'2021-09-09 08:06:13','2021-09-09 08:06:13')
,(3,'AMD FX-8320E','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',4780.00,1,'2021-09-09 08:06:13','2021-09-09 08:06:13')
,(4,'AMD FX-8320','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',7120.00,1,'2021-09-09 08:06:13','2021-09-09 08:06:13')
,(5,'ASUS ROG MAXIMUS X HERO','Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX',19310.00,2,'2021-09-09 08:06:13','2021-09-09 08:06:13')
,(6,'Gigabyte H310M S2H','Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX',4790.00,2,'2021-09-09 08:06:13','2021-09-09 08:06:13')
,(7,'MSI B250M GAMING PRO','Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX',5060.00,2,'2021-09-09 08:06:13','2021-09-09 08:06:13');
