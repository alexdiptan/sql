-- используем функцию TIMESTAMPDIFF для вычисления возраста из дня рожения.
SELECT TIMESTAMPDIFF(YEAR, pf.birthday, NOW()) FROM profiles pf
-- раскрыть группу можно при помощи функции GROUP_CONCAT или ARRAY_CONCAT. Методичка урока 4. Примеры:
select at2.TAG_ID, ARRAY_AGG(at2.APPLICANT_ID)
from applicant_tag at2 
where at2.tag_id in (71460,49865,36008,59226)
GROUP BY at2.TAG_ID
order by 2 desc
;
SELECT
  GROUP_CONCAT(name),
  SUBSTRING(birthday_at, 1, 3) AS decade
FROM
  users
GROUP BY
  decade;
SELECT
  GROUP_CONCAT(name SEPARATOR ' '),
  SUBSTRING(birthday_at, 1, 3) AS decade
FROM
  users
GROUP BY
  decade;
