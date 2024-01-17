--DELETE FROM Attendance

SELECT
	Students.stud_id AS 'ID',
	FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name) AS 'Студент',
	group_name AS 'Группа'
FROM Students LEFT JOIN Groups ON [group] = group_id -- LEFT или RIGHT дает приоритет столбцу для вывода
WHERE group_name = 'PD_212'
