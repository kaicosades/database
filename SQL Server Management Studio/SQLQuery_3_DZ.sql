SELECT [Количество проведенны[ занятий MS SQL] =
(
SELECT COUNT(*)
FROM Schedule
WHERE discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%' ) AND dbo.Schedule.spent = 1
)

SELECT [Количество запланированных занятий MS SQL] =
(
SELECT COUNT(*)
FROM Schedule
WHERE discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%' ) AND dbo.Schedule.spent = 0
)

SELECT
	dbo.Teachers.last_name +' ' 
	+ dbo.Teachers.first_name + ' '
	+ dbo.Teachers.middle_name AS 'Преподаватель',
	dbo.Teachers.rate AS 'Оплата за занятие',

	[Количество проведенных занятий в декабре]  = (SELECT COUNT(*)
FROM Schedule
WHERE [date] < '2024-01-01' AND [date] > '2023-11-30' AND dbo.Schedule.spent = 1 
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id),

	[Количество запланированных занятий в декабре]  = (SELECT COUNT(*)
FROM Schedule
WHERE [date] < '2024-01-01' AND [date] > '2023-11-30' AND dbo.Schedule.spent = 0 
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id),

	[Среднее количество занятий в месяц] =  (SELECT COUNT(*)/12
FROM Schedule
WHERE [date] < '2024-01-01' AND [date] > '2023-01-01' AND dbo.Schedule.spent = 1 
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id),

	[Оплата преподавателей за декабрь] = (SELECT COUNT(*)*dbo.Teachers.rate
FROM Schedule
WHERE [date] < '2024-01-01' AND [date] > '2023-11-30' AND dbo.Schedule.spent = 1 
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id)
	FROM 
	dbo.Teachers

 


	-- SET @interval = IFF(DATEPART(dw, date)=5, 3, 2) 
	-- dw - это сортирует по дням в типе файлов date
	-- DATEPART - если день недели пятница, то интервал 3

	--[Статус] = IIF(Schedule.spent = 1, 'Проведено', 'Запланировано')






