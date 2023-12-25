-- ����� ������ ������� ��� ����� �������

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