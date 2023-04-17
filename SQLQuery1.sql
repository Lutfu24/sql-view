CREATE DATABASE Cinema

USE Cinema

CREATE TABLE Halls(
	Id int primary key identity,
	Name nvarchar(50) not null unique
)

CREATE TABLE Wiewers(
	Id int primary key identity,
	Name nvarchar(100) not null,
	Surname nvarchar(150) default 'xxxxxx',
	TicketNo int not null,
	HallId int foreign key references Halls(Id)
)

CREATE VIEW select_all_wiewers_info
AS
SELECT ws.Name, ws.Surname, ws.TicketNo 'bilet nomresi', hs.Name 'zal nomresi' FROM Wiewers ws
join Halls hs
ON ws.HallId = hs.Id

SELECT * from select_all_wiewers_info