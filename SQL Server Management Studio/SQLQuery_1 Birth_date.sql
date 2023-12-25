SELECT 
	Students.last_name AS 'Фамилия', 
	Students.first_name AS 'Имя', 
	Students.middle_name AS 'Отчество',
	DATEDIFF(hour, Students.birth_date, GETDATE())/8766 AS 'Возраст',
	Groups.group_name AS 'Группа'

FROM 
	Students, Groups
WHERE 
	Students.[group] = Groups.group_id 
ORDER BY

	DATEDIFF(hour, Students.birth_date, GETDATE())/8766 ;
