UPDATE Teachers
SET last_name = TRIM(last_name), -- TRIM - удаляет пробелы
first_name = TRIM(first_name),
middle_name=TRIM(middle_name)