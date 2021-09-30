USE car_repair;

-- все машины пользователя.
SELECT u.first_name, u.last_name, c.auto_maker, c.car_model, uc.car_made_year, cp.file_name AS photo
FROM users u
JOIN users_cars uc ON uc.user_id = u.id 
JOIN car_photo cp ON cp.id = uc.car_photo_id 
JOIN cars c ON c.id = uc.id 
;

-- Список выполненных работ по каждой машине.
SELECT c.auto_maker, c.car_model, uc.car_made_year, uc.car_vin_number
,crp.repair_place_name AS "Ремонтная мастерская", rr.description AS "Причина ремонта"
,tr.name "Тип ремонтных работ", rp.part_name AS "Запчасть", spl.service_name AS "Наименование услуги"
,CONCAT(cpl.price, ' ', IF(ct.currency_code = 'RUR', 'руб.', ct.currency_code)) AS "Цена услуги"
FROM cars c 
JOIN users_cars uc ON uc.car_id = c.id 
JOIN car_repair_order cro ON cro.users_cars_id = uc.id 
JOIN users u ON u.id = uc.user_id 
JOIN crp_price_list cpl ON cpl.id = cro.crp_price_list_id 
JOIN currency_types ct ON ct.id = cpl.curr_id 
JOIN repair_reasons rr ON rr.id = cro.repair_reasons_id
JOIN type_reasons tr ON tr.id = cro.type_reasons_id
JOIN repair_parts rp ON rp.id = cro.part_name_id
JOIN car_repair_place crp ON crp.id = cpl.car_repair_place_id 
JOIN service_price_list spl ON spl.id = cpl.service_price_list_id 
;

-- Кол-во выполненных работ и выручка каждой мастерской
SELECT crp.repair_place_name, COUNT(cro.id) AS "Кол-во выполненных работ", SUM(cpl.price) AS Итого
FROM car_repair_place crp 
JOIN crp_price_list cpl ON cpl.car_repair_place_id = crp.id 
JOIN car_repair_order cro ON cro.crp_price_list_id = cpl.id 
GROUP BY crp.repair_place_name
;

-- выбираем данные из вью
SELECT * from total_work_price;

-- Дополняем данные из вью кодом валюты для каждой запчасти с помощью функции CONCAT. Для этого делаем JOIN полей вью и реальных таблиц
SELECT t.Марка ,t.Модель ,t.VIN ,t.Пробег ,t.Номер_заказа ,t.Колличество_запчастей 
,CONCAT(t.Итого, ' ', IF(ct.currency_code = 'RUR', 'руб.', ct.currency_code)) AS Total
FROM total_parts_price t
JOIN car_repair_order cro ON cro.order_name = t.Номер_заказа 
JOIN repair_parts rp ON rp.id = cro.part_name_id 
JOIN currency_types ct ON ct.id = rp.curr_id
GROUP BY t.Марка, t.Модель, t.VIN, t.Пробег ,t.Номер_заказа ,t.Колличество_запчастей, Total
;


