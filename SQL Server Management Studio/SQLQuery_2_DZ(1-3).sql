-- ����� ������ ������� ��� ����� �������

DECLARE @discipline  SMALLINT = 12
DECLARE @teacher  INT = 1
DECLARE @group INT = 3
DECLARE @start_date DATE = '2023 -12-01'
DECLARE @date DATE = @start_date
DECLARE @interval INT = 3
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
	IF(@interval =3) SET @interval=2
	IF((@counter)% 6=0 AND @counter-2>0) SET @interval=3
END

UPDATE Teachers SET last_name = '������ ',
first_name = '���� ',
middle_name = '����������� ' 
WHERE teacher_id=1;

UPDATE Teachers SET last_name = '����������� ',
first_name = '������ ',
middle_name = '����������� ' 
WHERE teacher_id=3;

UPDATE Schedule SET spentNOTbit = '���������'
WHERE spent = 1;
UPDATE Schedule SET spentNOTbit = '�������������'
WHERE spent = 0;



SELECT 
	dbo.Disciplines.discipline_name AS '����������',
	dbo.Groups.group_name AS '������',
	dbo.Schedule.[date] AS '����',
	dbo.Schedule.[time] AS '�����',
	dbo.Teachers.last_name + dbo.Teachers.first_name + dbo.Teachers.middle_name AS '�������������',
	dbo.Schedule.spentNOTbit AS '������'


FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id

