USE car_repair;
-- все машины пользователя.
SELECT u.first_name, u.last_name, c.auto_maker, c.car_model, uc.car_made_year, cp.file_name AS photo
FROM users u
JOIN users_cars uc ON uc.user_id = u.id 
JOIN car_photo cp ON cp.id = uc.car_photo_id 
JOIN cars c ON c.id = uc.id 
;

-- машины и выполненные ремонтные работы по каждой машине.
SELECT c.auto_maker, c.car_model, uc.car_made_year, uc.car_vin_number,
crp.repair_place_name AS "Ремонтная мастерская", rr.description AS "Причина ремонта", 
tr.name "Тип ремонтных работ", rp.part_name AS "Запчасть", spl.service_name AS "Наименование услуги", cpl.price "Цена услуги"
FROM cars c 
JOIN users_cars uc ON uc.car_id = c.id 
JOIN car_repair_order cro ON cro.users_cars_id = uc.id 
JOIN users u ON u.id = uc.user_id 
JOIN crp_price_list cpl ON cpl.id = cro.crp_price_list_id 
JOIN repair_reasons rr ON rr.id = cro.repair_reasons_id
JOIN type_reasons tr ON tr.id = cro.type_reasons_id
JOIN repair_parts rp ON rp.id = cro.part_name_id
JOIN car_repair_place crp ON crp.id = cpl.car_repair_place_id 
JOIN service_price_list spl ON spl.id = cpl.service_price_list_id 
;

-- TRIGGER ON car_repair_order
DROP TRIGGER IF EXISTS trg_log_car_repair_order;
delimiter //
CREATE TRIGGER trg_log_car_repair_order AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO log_car_repair_order (table_name, inserted_id, inserted_at)
	VALUES ('car_repair_order', NEW.id, NOW());
END //
delimiter ;