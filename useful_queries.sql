-- используем функцию TIMESTAMPDIFF для вычисления возраста из дня рожения.
SELECT TIMESTAMPDIFF(YEAR, pf.birthday, NOW()) FROM profiles pf
-- раскрыть группу можно при помощи функции GROUP_CONCAT или ARRAY_CONCAT
