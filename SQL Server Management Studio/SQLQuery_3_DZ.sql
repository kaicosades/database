SELECT [���������� ����������[ ������� MS SQL] =
(
SELECT COUNT(*)
FROM Schedule
WHERE discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%' ) AND dbo.Schedule.spent = 1
)

SELECT [���������� ��������������� ������� MS SQL] =
(
SELECT COUNT(*)
FROM Schedule
WHERE discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%' ) AND dbo.Schedule.spent = 0
)

SELECT
	dbo.Teachers.last_name +' ' 
	+ dbo.Teachers.first_name + ' '
	+ dbo.Teachers.middle_name AS '�������������',
	dbo.Teachers.rate AS '������ �� �������',

	[���������� ����������� ������� � �������]  = (SELECT COUNT(*)
FROM Schedule
WHERE [date] < '2024-01-01' AND [date] > '2023-11-30' AND dbo.Schedule.spent = 1 
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id),

	[���������� ��������������� ������� � �������]  = (SELECT COUNT(*)
FROM Schedule
WHERE [date] < '2024-01-01' AND [date] > '2023-11-30' AND dbo.Schedule.spent = 0 
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id),

	[������� ���������� ������� � �����] =  (SELECT COUNT(*)/12
FROM Schedule
WHERE [date] < '2024-01-01' AND [date] > '2023-01-01' AND dbo.Schedule.spent = 1 
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id),

	[������ �������������� �� �������] = (SELECT COUNT(*)*dbo.Teachers.rate
FROM Schedule
WHERE [date] < '2024-01-01' AND [date] > '2023-11-30' AND dbo.Schedule.spent = 1 
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id)
	FROM 
	dbo.Teachers

 


	-- SET @interval = IFF(DATEPART(dw, date)=5, 3, 2) 
	-- dw - ��� ��������� �� ���� � ���� ������ date
	-- DATEPART - ���� ���� ������ �������, �� �������� 3

	--[������] = IIF(Schedule.spent = 1, '���������', '�������������')






