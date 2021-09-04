-- используем функцию TIMESTAMPDIFF для вычисления возраста из дня рожения.
SELECT TIMESTAMPDIFF(YEAR, pf.birthday, NOW()) FROM profiles pf
