-- Task 3.
-- Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT IF ((
	SELECT 
		COUNT(pl.post_id) 
	FROM posts_likes pl
	WHERE (SELECT p.gender from profiles p WHERE p.user_id = pl.user_id) = 'm'	 
	) 
	> 
	(
	SELECT 
		COUNT(pl.post_id) 
	FROM posts_likes pl
	WHERE (SELECT p.gender from profiles p WHERE p.user_id = pl.user_id) = 'f'	
	)
	, 'm', 'f') AS posts_count_compare
;

-- Task 2.
/* Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.*/
SELECT p.user_id	
	,(SELECT pf.birthday FROM profiles pf WHERE pf.user_id = p.user_id) AS birthday 
	,(SELECT TIMESTAMPDIFF(YEAR, pf.birthday, NOW()) FROM profiles pf WHERE pf.user_id = p.user_id) AS age
	,COUNT(p.post_id) AS post_likes_count
FROM posts_likes p
WHERE (SELECT TIMESTAMPDIFF(YEAR, pf.birthday, NOW()) FROM profiles pf WHERE pf.user_id = p.user_id) < 10
GROUP BY p.user_id 
ORDER BY post_likes_count DESC
;

-- Task 1.
/*
 Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите 
 человека, который больше всех общался с выбранным пользователем (написал ему сообщений). 
 */
SELECT m.from_user_id
	,COUNT(m.id) AS message_count
FROM messages m 
WHERE m.to_user_id = 11
GROUP BY m.from_user_id
ORDER BY message_count DESC
LIMIT 1
;
