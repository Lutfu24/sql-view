CREATE DATABASE Cinema

USE Cinema

CREATE TABLE Halls(
	Id int primary key identity,
	Name nvarchar(50) not null unique
)

CREATE TABLE Genres(
	Id int primary key identity,
	Name nvarchar(100) not null
)

CREATE TABLE Movies(
	Id int primary key identity,
	Name nvarchar(200) not null,
	GenreId int foreign key references Genres(Id)
)

CREATE TABLE Actors(
	Id int primary key identity,
	Name nvarchar(50) not null,
	Surname nvarchar(100) default 'xxxxxx',
	Age int not null,
	MovieId int foreign key references Movies(Id)
)

CREATE TABLE Sessions(
	Id int primary key identity,
	No nvarchar(50) not null,
	MovieId int foreign key references Movies(Id)
)

CREATE TABLE Customers(
	Id int primary key identity,
	Name nvarchar(50) not null,
	Surname nvarchar(100) default 'xxxxxx'
)

CREATE TABLE Tickets(
	Id int primary key identity,
	MovieName nvarchar(250) not null,
	No nvarchar(50) not null,
	CustomerId int foreign key references Customers(Id),
	MovieId int foreign key references Movies(Id),
	HallId int foreign key references Halls(Id)
)

CREATE VIEW select_all_ticket_info
AS
SELECT c.Name, c.Surname, t.No 'Bilet nomresi', t.HallId 'Zall nomresi', m.Name 'Film', g.Name 'Janr', s.No 'sessiya', a.Name 'Aktyorun adı', a.Surname 'Aktyorun soyadı', a.Age 'Aktyorun yaşı' FROM Customers c
join Tickets t
ON c.Id = t.CustomerId
join Movies m
ON m.Id = t.MovieId
join Genres g
ON g.Id = m.GenreId
join Sessions s
ON s.MovieId = m.Id
join Actors a
ON a.MovieId = m.Id

SELECT * FROM select_all_ticket_info