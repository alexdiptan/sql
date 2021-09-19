USE shop;
-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”
-- Задание 1. 
UPDATE shop.users u set u.created_at = NOW(), u.updated_at = NOW();

-- Задание 2.
UPDATE users set created_at = str_to_date(created_at, '%d.%m.%Y %h:%i')
, updated_at = str_to_date(updated_at, '%d.%m.%Y %h:%i');

-- Задание 3.
-- Заполняю данными таблицы storehouses и storehouses_products
INSERT INTO storehouses (id, name, created_at, updated_at) 
VALUES (DEFAULT, 'test', NOW(), NOW());

INSERT INTO storehouses_products (id, storehouse_id, product_id, value, created_at, updated_at) 
VALUES
(DEFAULT, 1, 1, 30, NOW(), NOW())
, (DEFAULT, 1, 2, 500, NOW(), NOW())
, (DEFAULT, 1, 3, 2500, NOW(), NOW())
, (DEFAULT, 1, 4, 0, NOW(), NOW())
, (DEFAULT, 1, 5, 0, NOW(), NOW())
, (DEFAULT, 1, 6, 75, NOW(), NOW())
, (DEFAULT, 1, 7, 2, NOW(), NOW())
;

SELECT sp.value FROM storehouses_products sp 
ORDER BY CASE WHEN value = 0 THEN 222222222 ELSE value END;

-- Практическое задание теме “Агрегация данных”
-- Задание 1. 
SELECT AVG((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25) AS age from users ;

-- Задание 2.
SELECT
	DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
	COUNT(*) AS total
FROM
	users
GROUP BY
	day
ORDER BY
	total DESC;
