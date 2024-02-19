--CREATE DATABASE ACADEMY

use ACADEMY

-----------------------------------------------------------------
-----------------------------------------------------------------

create table Teachers
(
	Id int PRIMARY KEY identity,
	EmploymentDate date not null,
	check (EmploymentDate > '01.01.1990'),
	Name nvarchar(max) not null check(Name <> ''),
	Surname nvarchar(max) not null check(Surname <> ''),
	Premium money not null check (Premium >= 0) default(0),
	Salary money not null check(Salary > 0)
)
insert into Teachers (EmploymentDate, Name, Surname, Premium, Salary)
values
('2005-08-12', 'John', 'Smith', 500.00, 3000.00),
('2010-03-25', 'Emily', 'Johnson', 200.00, 2800.00),
('2000-12-05', 'Michael', 'Brown', 0.00, 3200.00);

select * from Teachers

-----------------------------------------------------------------
-----------------------------------------------------------------

create table Groups
(
	Id int PRIMARY KEY identity,
	Name nvarchar(10) not null check(Name <> '') unique,
	Rating int not null check(Rating between 0 and 5),
	[Year] int not null check([Year] between 1 and 5),
)

insert into Groups (Name, Rating, [Year])
values
('Group A', 4, 2),
('Group B', 3, 3),
('Group C', 5, 1);

select * from Groups

-----------------------------------------------------------------
-----------------------------------------------------------------

create table Faculties
(
	Id int PRIMARY KEY identity,
	Name nvarchar(10) not null check(Name <> '') unique,
)

insert into Faculties
values
('Faculty A'),
('Faculty B');

select * from Faculties

-----------------------------------------------------------------
-----------------------------------------------------------------

create table Departments
(
	Id int PRIMARY KEY identity,
	Financing money not null check(Financing >= 0) default(0),
	Name nvarchar(100) not null check(Name <> '') unique,
)

insert into Departments
values
(50000.00, 'Department of Mathematics'),
(75000.00, 'Department of Physics');

select * from Departments

-----------------------------------------------------------------
-----------------------------------------------------------------