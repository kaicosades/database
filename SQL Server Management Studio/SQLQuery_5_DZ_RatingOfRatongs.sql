CREATE PROCEDURE mysp_ratingOfRatings
AS
BEGIN
	SELECT
		[Студент] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
		[Группа] = Groups.group_name,
		[Средний балл] = 100 *
		(
			(
				SELECT SUM(grade_1)
				FROM Grades
				WHERE dbo.Grades.student = dbo.Students.stud_id
			)
		+
			(
				SELECT SUM(grade_2)
				FROM Grades
				WHERE dbo.Grades.student = dbo.Students.stud_id
			)
		)
		/
		(
			SELECT COUNT(*)
			FROM Grades
			WHERE  dbo.Grades.grade_1 != NULL
			OR dbo.Grades.grade_2 != NULL
		)
	FROM
		Attendance, Schedule, Students, Groups, Disciplines, Grades
	WHERE
		Attendance.student = Students.stud_id
	AND	Attendance.lesson = Schedule.lesson_id
	AND Schedule.discipline = Disciplines.discipline_id
	AND Schedule.[group] = Groups.group_id
	GROUP BY last_name, first_name, middle_name, group_name, stud_id
	ORDER BY [Средний балл] DESC
END