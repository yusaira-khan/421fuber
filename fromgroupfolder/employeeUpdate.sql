-- Update Employee salaries for Christmas bonus
UPDATE Employee
SET salary = salary + salary*5/100
	WHERE LOCATE('station', responsibilities) > 0;
