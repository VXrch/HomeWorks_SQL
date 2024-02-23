
use ACADEMY

------------------------------------

--select * from Faculties

--alter table Faculties
--add Dean nvarchar(max) not null check(Dean <> '') Default('DeanName')

--select * from Teachers

--alter table Teachers
--add IsAssistant bit not null default(0), 
--isProfessor bit not null default(0),
--Position nvarchar(max) not null check(Position <> '') default('Professor')

------------------------------------

select * from Departments

select Id, Name, Financing
from Departments

-----

select Name as 'Group Name', Rating as 'Group Rating' from Groups

-----

select * from Teachers

--UPDATE Teachers
--SET Premium = 1
--WHERE Premium = 0

-- ROUND(..., 2) = 1,17335345346 --> 1,17

select 
	Surname as 'Teacher Surname',
	CONCAT(ROUND((Premium / (Salary + Premium)) * 100, 2), '%') AS 'Percentage of the rate in relation to the allowance',
    CONCAT(ROUND((Salary / (Salary + Premium)) * 100, 2), '%') AS 'Percentage of the rate in relation to to the salary'
from Teachers

-----

select * from Faculties

select CONCAT('The dean of faculty ', Name, ' is ', Dean, '.') as 'Faculty info' from Faculties

-----

select CONCAT(Surname, ' ---> ', Salary) as 'Profesors' from Teachers
WHERE isProfessor = 1 AND Salary > 1050

--INSERT INTO Departments (Financing, Name) 
--VALUES 
--(5000, 'Department of Unusual Studies'),
--(7500, 'Department of Curiosity'),
--(6000, 'Department of Quirkiness'),
--(8000, 'Department of Eccentricity'),
--(9000, 'Department of Peculiarities');
--(12000, 'Department of Quantum Mechanics'),
--(13000, 'Department of Astrobiology'),
--(15000, 'Department of Cryptography'),
--(14000, 'Department of Artificial Intelligence'),
--(20000, 'Department of Cybernetic Anthropology');

select * from Departments

select CONCAT(Name, ' ---> ',  Financing) from Departments
WHERE Financing < 11000 OR Financing > 25000

select Name from Departments
WHERE Name <> 'Department of Computer Science'

-----

select * from Teachers

select CONCAT(Surname, ', position [', Position, ']') from Teachers
WHERE isProfessor = 0

select CONCAT(Surname, ', ' ,Position, ', ', Salary, ', ', Premium) as 'Assistants' from Teachers
WHERE isAssistant = 1 AND Premium between 160 and 550

select CONCAT(Surname, ', ', Salary) as 'Assistants' from Teachers
WHERE isAssistant = 1

select CONCAT(Surname, ', ', Position, '(Employment Year = ', YEAR(EmploymentDate), ')') as 'Teachers' from Teachers
WHERE EmploymentDate < '01.01.2000'

-----

select * from Departments

select Name as 'Name of Department' from Departments
WHERE Name < 'Software Development'
ORDER BY Name

-----

select * from Teachers

--insert into Teachers 
--values('2001-02-09', 'Sophia', 'Johnson', 100, 1000, 1, 0, 'Assistant')

select Surname from Teachers
WHERE IsAssistant = 1 AND (Salary + Premium) <= 1200

-----

select * from Groups

select Name from Groups
WHERE [Year] = 5 AND Rating between 2 and 4

-----

select * from Teachers

select Surname from Teachers
WHERE IsAssistant = 1 AND Salary < 550 OR Premium < 200