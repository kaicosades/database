SELECT
	group_name AS 'Группа',
	COUNT([group]) AS 'Количество занятий'
FROM Schedule JOIN Groups ON [group] = group_id
GROUP BY group_name