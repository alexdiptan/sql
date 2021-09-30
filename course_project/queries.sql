USE car_repair;

-- ��� ������ ������������.
SELECT u.first_name, u.last_name, c.auto_maker, c.car_model, uc.car_made_year, cp.file_name AS photo
FROM users u
JOIN users_cars uc ON uc.user_id = u.id 
JOIN car_photo cp ON cp.id = uc.car_photo_id 
JOIN cars c ON c.id = uc.id 
;

-- ������ ����������� ����� �� ������ ������.
SELECT c.auto_maker, c.car_model, uc.car_made_year, uc.car_vin_number
,crp.repair_place_name AS "��������� ����������", rr.description AS "������� �������"
,tr.name "��� ��������� �����", rp.part_name AS "��������", spl.service_name AS "������������ ������"
,CONCAT(cpl.price, ' ', IF(ct.currency_code = 'RUR', '���.', ct.currency_code)) AS "���� ������"
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

-- ���-�� ����������� ����� � ������� ������ ����������
SELECT crp.repair_place_name, COUNT(cro.id) AS "���-�� ����������� �����", SUM(cpl.price) AS �����
FROM car_repair_place crp 
JOIN crp_price_list cpl ON cpl.car_repair_place_id = crp.id 
JOIN car_repair_order cro ON cro.crp_price_list_id = cpl.id 
GROUP BY crp.repair_place_name
;

-- �������� ������ �� ���
SELECT * from total_work_price;

-- ��������� ������ �� ��� ����� ������ ��� ������ �������� � ������� ������� CONCAT. ��� ����� ������ JOIN ����� ��� � �������� ������
SELECT t.����� ,t.������ ,t.VIN ,t.������ ,t.�����_������ ,t.�����������_��������� 
,CONCAT(t.�����, ' ', IF(ct.currency_code = 'RUR', '���.', ct.currency_code)) AS Total
FROM total_parts_price t
JOIN car_repair_order cro ON cro.order_name = t.�����_������ 
JOIN repair_parts rp ON rp.id = cro.part_name_id 
JOIN currency_types ct ON ct.id = rp.curr_id
GROUP BY t.�����, t.������, t.VIN, t.������ ,t.�����_������ ,t.�����������_���������, Total
;


