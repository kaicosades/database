SELECT
	group_name AS '������',
	COUNT([group]) AS '���������� �������'
FROM Schedule JOIN Groups ON [group] = group_id
GROUP BY group_name