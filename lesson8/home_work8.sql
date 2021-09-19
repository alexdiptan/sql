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

-- Task 2.
/* Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.*/
SELECT p.user_id	
	,pr.birthday AS birthday 
	,TIMESTAMPDIFF(YEAR, pr.birthday, NOW()) AS age
	,COUNT(p.post_id) AS post_likes_count
FROM posts_likes p
JOIN profiles pr ON pr.user_id = p.user_id 
WHERE TIMESTAMPDIFF(YEAR, pr.birthday, NOW()) < 10
GROUP BY p.user_id 
ORDER BY post_likes_count DESC
;



-- Task 3.
-- Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT IF ((
	SELECT 
		COUNT(pl.post_id) 
	FROM posts_likes pl
	JOIN profiles p on p.user_id = pl.user_id 
	WHERE p.gender = 'm'	 
	) 
	> 
	(
	SELECT 
		COUNT(pl.post_id) 
	FROM posts_likes pl
	JOIN profiles p on p.user_id = pl.user_id 
	WHERE p.gender = 'f'	
	)
	, 'm', 'f') AS posts_count_compare
;

