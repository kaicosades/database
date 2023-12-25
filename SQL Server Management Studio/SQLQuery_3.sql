
--SELECT COUNT(*) -- проверка количества записей
--FROM
--	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
--	WHERE
--	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
--AND dbo.Schedule.[group] = dbo.Groups.group_id
--AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
--AND dbo.Schedule.discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')
--AND dbo.Schedule.[date] = '2023-12-01'
--AND dbo.Schedule.[time] = '14:30'



SELECT 
	dbo.Disciplines.discipline_name AS 'Дисциплина',
	dbo.Groups.group_name AS 'Группа',
	dbo.Schedule.[date] AS 'Дата',
	DATENAME(dw, dbo.Schedule.[date]) AS 'День недели', --dw - день недели
	dbo.Schedule.[time] AS 'Время',
	dbo.Teachers.last_name +' ' 
	+ dbo.Teachers.first_name + ' '
	+ dbo.Teachers.middle_name AS 'Преподаватель',
	dbo.Schedule.spentNOTbit AS 'Статус',

	-- SET @interval = IFF(DATEPART(dw, date)=5, 3, 2) 
	-- dw - это сортирует по дням в типе файлов date
	-- DATEPART - если день недели пятница, то интервал 3

	[Статус] = IIF(Schedule.spent = 1, 'Проведено', 'Запланировано')

FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
--AND dbo.Schedule.discipline = (SELECT discipline_id FROM dbo.Disciplines WHERE discipline_name LIKE '%MS SQL%')
--AND dbo.Schedule.discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')
--AND dbo.Schedule.[date] = '2023-12-01'
--AND dbo.Schedule.[time] = '14:30'
