--CREATE DATABASE ACADEMY_2

--use ACADEMY_2

--create table Teachers
--(
--	Id int PRIMARY KEY identity,
--	Name nvarchar(max) not null check(Name <> ''),
--	Surname nvarchar(max) not null check(Surname <> ''),
--	Salary money not null check(Salary > 0),
--)

--create table Subjects
--(
--	Id int PRIMARY KEY identity,
--	Name  nvarchar(100) not null check(Name <> '') UNIQUE,
--)

--create table Faculties
--(
--	Id int PRIMARY KEY identity,
--	Name nvarchar(100) not null check(Name <> '') UNIQUE,
--	Financing money not null check(Financing >= 0) default(0),
--)

--create table Curators
--(
--	Id int PRIMARY KEY identity,
--	Name nvarchar(max) not null check(Name <> ''),
--	Surname nvarchar(max) not null check(Surname <> ''),
--)

--create table Departments
--(
--	Id int PRIMARY KEY identity,
--	Name nvarchar(100) not null check(Name <> '') UNIQUE,
--	Financing money not null check(Financing >= 0) default(0),

--	FacultyId int not null FOREIGN KEY (FacultyId) REFERENCES Faculties(Id),
--)

--insert into Departments
--values ('Department of Interstellar Linguistics', 15000000, 1)

--create table Groups
--(
--	Id int PRIMARY KEY identity,
--	Name nvarchar(10) not null check(Name <> '') UNIQUE,
--	[Year] int not null check([Year] between 1 and 5),

--	DepartmentId int not null FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
--)

--create table Lectures
--(
--	Id int PRIMARY KEY identity,
--	LectureRoom nvarchar(max) not null check(LectureRoom <> ''),

--	SubjectId int not null FOREIGN KEY (SubjectID) REFERENCES Subjects(Id),
--	TeacherId int not null FOREIGN KEY (TeacherId) REFERENCES Teachers(Id),
--)

--create table GroupsLectures
--(
--	Id int PRIMARY KEY identity,
	
--	GroupId int not null FOREIGN KEY (GroupId) REFERENCES Groups(Id),
--	LectureId int not null FOREIGN KEY (LectureId) REFERENCES Lectures(Id),
--)

--create table GroupsCurators
--(
--	Id int PRIMARY KEY identity,

--	GroupId int not null FOREIGN KEY (GroupId) REFERENCES Groups(Id),
--	CuratorId int not null FOREIGN KEY (CuratorId) REFERENCES Curators(Id),
--)

----- 1

select * from Teachers
select * from Groups

SELECT 
	t.Name AS TeacherName, 
	t.Surname AS TeacherSurname, 
	g.Name AS GroupName
FROM 
	Teachers AS t 
	CROSS JOIN 
	Groups AS g
ORDER BY 
	TeacherName, GroupName

----- 2

select * from Faculties
select * from Departments

select 
	F.Name AS 'Faculty name',
	F.Financing AS 'Faculty financing',
	D.Financing AS 'Department financing'
from 
	Faculties AS F
	JOIN
	Departments AS D ON D.FacultyId = F.Id
WHERE 
	D.Financing > F.Financing

----- 3

select * from Curators
select * from GroupsCurators

select
	C.Name AS 'Curator name',
	G.Name AS 'Group name'
from 
	GroupsCurators AS GC
	JOIN
	Curators AS C ON GC.CuratorId = C.Id
	JOIN
	Groups AS G ON GC.GroupId = G.Id

----- 4

select * from Teachers
select * from Lectures
select * from GroupsLectures
select * from Groups

select 
	G.Name AS 'Group name',
	CONCAT(T.Name, ' ', T.Surname) AS 'Teacher name'
from 
	GroupsLectures  AS GL
	JOIN
	Groups as G ON GL.GroupId = G.Id
	JOIN
	Lectures as L ON GL.Id = L.Id
	JOIN 
	Teachers as T ON L.TeacherId = T.Id
WHERE 
	G.Name = 'Group B'
ORDER BY 
	G.Name

----- 5

select * from Faculties
select * from Departments
select * from Groups
select * from GroupsLectures
select * from Lectures
select * from Teachers

select 
	CONCAT(T.Name, ' ', T.Surname) as 'Teacher name',
	G.Name as 'Faculty name'
from
	GroupsLectures AS GL
	JOIN Groups AS G ON GL.GroupId = G.Id
	JOIN Departments AS D ON G.DepartmentId = D.Id
	JOIN Faculties AS F ON D.FacultyId = F.Id
	JOIN Lectures AS L ON GL.LectureId = L.Id
	JOIN Teachers AS T ON L.TeacherId = T.Id
ORDER BY 
	G.Name

----- 6

select * from Departments
select * from Groups

select 
	D.Name AS 'Departmant name',
	G.Name AS 'Group name'
from
	Departments as D
	JOIN 
	Groups AS G ON G.DepartmentId = D.Id
ORDER BY 
	[Group name]

----- 7

select * from Lectures
select * from Subjects
select * from Teachers

select 
	CONCAT(T.Name, ' ', T.Surname) AS 'Teacher name',
	S.Name
from
	Lectures AS L
	JOIN Teachers AS T ON L.TeacherId = T.Id
	JOIN Subjects AS S ON L.SubjectId = S.Id
WHERE 
	T.Name = 'Alice Smith'
ORDER BY 
	[Teacher name]

----- 8

select * from Departments
select * from Groups
select * from GroupsLectures
select * from Lectures
select * from Subjects

select 
	D.Name AS 'Departmant name', 
	S.Name AS 'Subject name'
from 
	GroupsLectures AS GL
	JOIN Groups AS G ON GL.GroupId = G.Id
	JOIN Departments AS D ON G.DepartmentId = D.Id
	JOIN Lectures AS L ON GL.LectureId = L.Id
	JOIN Subjects AS S ON L.SubjectId = S.Id
WHERE 
	S.Name = 'Computer Science'
ORDER BY 
	[Departmant name]

----- 9

select * from Groups
select * from Departments
select * from Faculties

select 
	F.Name AS 'Faculty name',
	G.Name AS 'Group name'
from
	Groups AS G
	JOIN Departments AS D ON G.DepartmentId = D.Id
	JOIN Faculties AS F ON D.FacultyId = F.Id
WHERE 
	F.Name = 'Science Faculty'

----- 10

select * from Groups
select * from Departments
select * from Faculties

select 
	F.Name AS 'Faculty name',
	G.Year,
	G.Name AS 'Group name'
from
	Groups AS G
	JOIN Departments AS D ON G.DepartmentId = D.Id
	JOIN Faculties AS F ON D.FacultyId = F.Id
WHERE G.Year = 5

----- 11

select * from Teachers
select * from Subjects
select * from Lectures
select * from GroupsLectures
select * from Groups

select
	CONCAT(T.Name, ' ', T.Surname) AS 'Teacher name',
	S.Name AS 'Subject name',
	G.Name AS 'Group name',
	L.LectureRoom
from
	GroupsLectures AS GL
	JOIN Groups AS G ON GL.GroupId = G.Id
	JOIN Lectures AS L ON GL.LectureId = L.Id
	JOIN Subjects AS S ON L.SubjectId = S.Id
	JOIN Teachers AS T ON L.TeacherId = T.Id
WHERE 
	LectureRoom = 'Room 101'
ORDER BY
	[Teacher name]
