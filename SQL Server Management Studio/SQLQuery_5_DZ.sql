USE PD_212
DECLARE @lesson INT = (SELECT MAX(lesson_id) FROM dbo.Schedule WHERE dbo.Schedule.spent = 1 )
DECLARE @counter INT = (SELECT MIN(lesson_id) FROM dbo.Schedule WHERE dbo.Schedule.spent = 1 )

WHILE(@counter <= @lesson)
BEGIN
	IF((SELECT dbo.Attendance.present  FROM dbo.Attendance WHERE dbo.Attendance.student = 1) = NULL) 
	INSERT INTO Attendance(student,lesson, present)
	VALUES (1, @counter, 1);
	ELSE
	UPDATE Attendance SET present = 1
	WHERE student = 1

	IF((SELECT dbo.Attendance.present  FROM dbo.Attendance WHERE dbo.Attendance.student = 2) = NULL) 
	INSERT INTO Attendance(student,lesson, present)
	VALUES (2, @counter, 1);
	ELSE
	UPDATE Attendance SET present = 1
	WHERE student = 2

	SET @counter = @counter+1;
END