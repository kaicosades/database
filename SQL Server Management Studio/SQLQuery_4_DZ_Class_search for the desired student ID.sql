--DELETE FROM Attendance

SELECT
	Students.stud_id AS 'ID',
	FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name) AS '�������',
	group_name AS '������'
FROM Students LEFT JOIN Groups ON [group] = group_id -- LEFT ��� RIGHT ���� ��������� ������� ��� ������
WHERE group_name = 'PD_212'
