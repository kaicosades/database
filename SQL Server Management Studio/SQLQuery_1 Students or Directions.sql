--USE PD_212;
--GO

SELECT 
	Students.last_name AS '�������', 
	Students.first_name AS '���', 
	Students.middle_name AS '��������',
	
--	DATEDIFF(yyyy, Students.birth_date , GETDATE()) AS '�������',
--(GETDATE() - CANVERT(datatime, Students.birth_date) AS '�������',
	DATEDIFF(hour, Students.birth_date, GETDATE())/8766 AS '�������',
	
	Groups.group_name AS '������'
--	Directions.direction_name AS '�����������'
FROM 
	Students, Groups, Directions
WHERE 
	Students.[group] = Groups.group_id 
AND Groups.group_name = 'PD_212'
AND Groups.direction = Directions.direction_id
--AND Directions.direction_name= 'Java development'
AND Directions.direction_name = '���������� ������������ �����������'
ORDER BY
	--Students.last_name DESC;
	DATEDIFF(hour, Students.birth_date, GETDATE())/8766 ;
	-- ASC - Ascending � ������� �����������
	-- DESC - Descending � ������� ��������