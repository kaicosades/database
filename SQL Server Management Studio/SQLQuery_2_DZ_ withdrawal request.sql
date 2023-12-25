-- БАЗЗА ДАННЫХ СДЕЛАНА БЕЗ УЧЕТА КАНИКУЛ

UPDATE Teachers SET last_name = 'Ковтун ',
first_name = 'Олег ',
middle_name = 'Анатольевич ' 
WHERE teacher_id=1;

UPDATE Teachers SET last_name = 'Кобылинский ',
first_name = 'Андрей ',
middle_name = 'Анатольевич ' 
WHERE teacher_id=3;


UPDATE Schedule SET spentNOTbit = 'Проведено'
WHERE spent = 1;
UPDATE Schedule SET spentNOTbit = 'Запланировано'
WHERE spent = 0;

SELECT 
	dbo.Disciplines.discipline_name AS 'Дисциплина',
	dbo.Groups.group_name AS 'Группа',
	dbo.Schedule.[date] AS 'Дата',
	dbo.Schedule.[time] AS 'Время',
	dbo.Teachers.last_name + dbo.Teachers.first_name + dbo.Teachers.middle_name AS 'Преподаватель',
	dbo.Schedule.spentNOTbit AS 'Статус'


FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id