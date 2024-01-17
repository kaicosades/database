CREATE PROCEDURE mysp_ratingOutput
AS
BEGIN
	SELECT
		[Студент] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
		[Группа] = Groups.group_name,
		[% Посещаемости] = 100 *
		(SELECT COUNT(*)
		FROM Attendance
		WHERE  dbo.Attendance.present = 1
		AND dbo.Attendance.student = dbo.Students.stud_id
		)/
		(SELECT COUNT(*)
		FROM Schedule
		WHERE  dbo.Schedule.spent = 1
		AND dbo.Schedule.[group] = dbo.Groups.group_id ) 
	FROM
		Attendance, Schedule, Students, Groups, Disciplines
	WHERE
		Attendance.student = Students.stud_id
	AND	Attendance.lesson = Schedule.lesson_id
	AND Schedule.discipline = Disciplines.discipline_id
	AND Schedule.[group] = Groups.group_id
	GROUP BY last_name, first_name, middle_name, group_name, stud_id, group_id
	ORDER BY [% Посещаемости] DESC
END