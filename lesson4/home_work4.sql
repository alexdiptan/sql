-- Задание 1.
INSERT INTO users (email,password_hash,first_name,last_name,phone) VALUES 
('qwe@asdf.qw','fdkjgsdflskdjfgsdfg142356214','Сергей','Сергеев','12312312311')
,('ejaslem1@typepad.com','c2ca3c61fe024e49a9c758a109611c65aac31a15','Вера','Клюквина','80492639771')
,('cattack2@unc.edu','5f91ea663688cc873be65a6cc107f07da84664ae','Ирина','Кийко','21395272471')
,('scasotti3@usgs.gov','f93c320ee2275544eb1b42d8278133c343fa5030','Виктория','Водопьянова','41870115261')
,('segginton4@cam.ac.uk','e6ab5f555555fb26c7c60ddd23c8118307804330','Дмитрий','Тимашов','45133590331')
,('aswaddle5@altervista.org','b25e49362b83833eece7d225717f2e285213bf25','Владислав','Авраменко','18744623391')
,('fleahey6@ftc.gov','07521436ef4b4ad464ed04cdceb99f422bbbd9c5','Алексей','Величко','29517982521')
,('rcasley7@exblog.jp','5aac7b105729d4ad431db6a4e73604ecec132fa8','Артем','Филипцов','32373222651')
,('rlantry8@pen.io','ba6c51c3064c20f9de84d4ed69733d9dd408e504','Елена','Колдаева','37311446571')
,('egoatcher9@behance.net','16f4e6ac1aedd2d9707b56d767f452f3246e67f7','Андрей','Антипов','87748586081')
,('dcolquita@ucla.edu','1487c1cf7c24df739fc97460a2c791a2432df062','Евгений','Грачев','97449066511')
,('rthomazinb@ox.ac.uk','32afa0b02c8399d1960509c3fbd4cc75ab4dcce2','Дарья','Попова','81515571641')
,('gambridgec@sakura.ne.jp','afd3e457d3b9f6f880623163ea8f72889777a58b','Ирина','Гончарова','29072664531')
,('mantosikd@tinypic.com','9154186410a62369bdf4fd2bd632ca3511b270a7','Марина','Закусилова','59490918631')
,('rtabere@admin.ch','9bc443a6e52541784d52b69acc39343526886b11','Елена','Нагина','69664715791')
,('ckendellf@bloglines.com','229aedb0a417bccab3ee0cbd89a4b1afaa080c51','Валерия','Платошкина','10789026821')
,('amckeandg@behance.net','584b9241b06cfe87131bfdba7b53e877ec3bd940','Станислав','Светляков','96429229631')
,('csantryh@mit.edu','129797dcb95127ce0541faa8d91d8f1969da0f45','Ирина','Черникова','31184737911');

INSERT INTO media (id, user_id, media_types_id, file_name, file_size, created_at) VALUES
(DEFAULT, 1, 1, 'img1.jpg', '34', DEFAULT )
,(DEFAULT, 2, 1, 'img3.jpg', '8854', DEFAULT )
,(DEFAULT, 3, 1, 'img4.jpg', '87', DEFAULT )
,(DEFAULT, 4, 1, 'img54.jpg', '23', DEFAULT )
,(DEFAULT, 5, 1, 'img5.jpg', '4867', DEFAULT )
,(DEFAULT, 6, 1, 'img6.jpg', '988', DEFAULT )
,(DEFAULT, 7, 1, 'img37.jpg', '54', DEFAULT )
,(DEFAULT, 8, 1, 'img8.jpg', '267', DEFAULT )
,(DEFAULT, 9, 1, 'img9.jpg', '51', DEFAULT )
,(DEFAULT, 10, 1, 'img33.jpg', '1022', DEFAULT )
;

INSERT INTO profiles (user_id, gender, birthday, photo_id, city, country) VALUES 
(4, 'f', '1967-01-09', 1, 'Ust-Labinsk', 'Russia')
,(5, 'm', '1981-07-01', 2, 'Magnitogorsk', 'Russia')
,(6, 'm', '1985-03-05', 3, 'Voronezh', 'Russia')
,(7, 'm', '1993-07-23', 4, 'Yaltal', 'Russia')
,(8, 'm', '1973-12-06', 5, 'Krasnodar', 'Russia')
,(9, 'f', '1989-08-20', 6, 'Izhevsk', 'Russia')
,(10, 'm', '2007-05-11', 7, 'Perm', 'Russia')
,(11, 'm', '2000-09-08', 8, 'Irkutsk', 'Russia')
,(12, 'f', '1999-08-28', 9, 'Yaroslavl', 'Russia')
,(13, 'f', '1978-03-06', 10, 'Kazan', 'Russia')
;

INSERT INTO messages (from_user_id, to_user_id, txt) VALUES
(1, 5, 'Say Hi to averyone!')
,(10, 3, 'Hi!')
,(4, 7, 'Hi!')
,(3, 9, 'Hi!')
,(2, 6, 'Hi!')
,(9, 12, 'Hi!')
,(5, 7, 'Hi!')
,(12, 6, 'Hi!')
,(4, 3, 'Hi!')
,(8, 4, 'Hi!')
;

INSERT INTO communities (id, name, description, admin_id) VALUES 
(DEFAULT, 'Шаманы глубокого нечерноземья', 'Шаманим чернозем и не только.', 12)
,(DEFAULT, 'Linux', 'Enjoy Linux', 2)
,(DEFAULT, 'Любители шпрот Нижневартовск', 'Любим шпроты, живя в Нижневартовске', 4)
,(DEFAULT, 'Шансон Чукотки', 'Исполнители шансона Чукотки', 2)
,(DEFAULT, 'Рыцари соляных шахт Махачкалы', 'Своеобразные ребята', 6)
,(DEFAULT, 'Java', 'Enjoy Java', 8)
,(DEFAULT, 'Python', 'Eat cheese while coding Python', 10)
,(DEFAULT, 'Sql lovers', 'Insert, Update, Select and so on', 7)
,(DEFAULT, 'English lerners', 'Why not, have not, nothing not, so what?', 6)
,(DEFAULT, 'Prokopjevsk for everyone.', 'How not die while wolking in the evening on the streets of Prokopjevsk city.', 2)
;

INSERT INTO communities_users (community_id, user_id, created_at) VALUES
(4, 4, DEFAULT)
,(4, 3, DEFAULT)
,(3, 4, DEFAULT)
,(5, 6, DEFAULT)
,(3, 12, DEFAULT)
,(3, 5, DEFAULT)
,(9, 1, DEFAULT)
,(4, 6, DEFAULT)
,(7, 10, DEFAULT)
,(8, 1, DEFAULT)
; 

INSERT INTO friend_requests (from_user_id, to_user_id, accepted) VALUES
(12, 3, 1)
,(4, 3, 0)
,(5, 2, 0)
,(6, 8, 1)
,(1, 9, 0)
,(2, 4, 1)
,(1, 5, 0)
,(8, 6, 1)
,(10, 4, 1)
,(4, 7, 1)
;

INSERT INTO media_types (id, name) VALUES
(DEFAULT, 'file')
,(DEFAULT, 'pdf_document')
,(DEFAULT, 'python_file')
,(DEFAULT, 'sql_file')
,(DEFAULT, 'video_file')
,(DEFAULT, 'txt_file')
,(DEFAULT, 'picture')
;

-- Задание 2.
SELECT DISTINCT(u.first_name) FROM users u 
ORDER BY u.first_name ;

-- Задание 3.
ALTER TABLE profiles ADD COLUMN is_active tinyint(1) NOT NULL DEFAULT 1;

UPDATE profiles p SET p.is_active = 0 
WHERE (DATEDIFF(CURRENT_DATE(), p.birthday)/365 - 18) <= 0;

-- Задание 4.
DELETE FROM messages m 
WHERE m.created_at > NOW();
