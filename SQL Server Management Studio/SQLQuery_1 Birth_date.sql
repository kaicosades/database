SELECT 
	Students.last_name AS '�������', 
	Students.first_name AS '���', 
	Students.middle_name AS '��������',
	DATEDIFF(hour, Students.birth_date, GETDATE())/8766 AS '�������',
	Groups.group_name AS '������'

FROM 
	Students, Groups
WHERE 
	Students.[group] = Groups.group_id 
ORDER BY

	DATEDIFF(hour, Students.birth_date, GETDATE())/8766 ;
