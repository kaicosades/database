-- БАЗЗА ДАННЫХ СДЕЛАНА БЕЗ УЧЕТА КАНИКУЛ

DECLARE @discipline  SMALLINT = 37
DECLARE @teacher  INT = 1
DECLARE @group INT = 3
DECLARE @start_date DATE = '2022 -11-21'
DECLARE @date DATE = @start_date
DECLARE @interval INT = 7
DECLARE @time TIME = '14:30'
DECLARE @number_of_lessons TINYINT = (SELECT number_of_lessons FROM dbo.Disciplines WHERE discipline_id = @discipline);

DECLARE @counter INT = 0

WHILE(@counter < @number_of_lessons)
BEGIN
	INSERT INTO Schedule(discipline,teacher, [date], [time], spent, [group])
	VALUES (@discipline, @teacher, @date, @time, IIF(@date<GETDATE(), 1, 0), @group);
	SET @counter = @counter+1;

	INSERT INTO Schedule(discipline,teacher, [date], [time], spent, [group])
	VALUES (@discipline, @teacher, @date, DATEADD(mi, 90, CONVERT(TIME,@time)), IIF(@date<GETDATE(), 1, 0), @group);
	SET @counter = @counter+1;

	SET @date =DATEADD(dd, @interval,  @date); 
	--SET @interval = IIF(@interval = 2, 5, 2)
	IF(@interval = 7) SET @interval =2;
	ELSE IF(@interval = 2) SET @interval=5;
	ELSE IF(@interval = 5) SET @interval=7;
END

SET	@discipline = 5;
SET @counter = 0;
SET @number_of_lessons = (SELECT number_of_lessons FROM dbo.Disciplines WHERE discipline_id = @discipline);
SET @date = '2022-11-23';
SET @interval = 2;

WHILE(@counter < @number_of_lessons)
BEGIN
	INSERT INTO Schedule(discipline,teacher, [date], [time], spent, [group])
	VALUES (@discipline, @teacher, @date, @time, IIF(@date<GETDATE(), 1, 0), @group);
	SET @counter = @counter+1;

	INSERT INTO Schedule(discipline,teacher, [date], [time], spent, [group])
	VALUES (@discipline, @teacher, @date, DATEADD(mi, 90, CONVERT(TIME,@time)), IIF(@date<GETDATE(), 1, 0), @group);
	SET @counter = @counter+1;

	SET @date =DATEADD(dd, @interval,  @date); 
	IF(@interval = 2) SET @interval=7;
	ELSE IF(@interval = 7) SET @interval =5;
	ELSE IF(@interval = 5) SET @interval=2;
END



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



