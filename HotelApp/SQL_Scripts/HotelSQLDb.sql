use HotelApp

drop table if exists Menager
drop table if exists Worker
drop table if exists UserHotel
drop table if exists RoleUser
drop table if exists QualificationLevel
drop table if exists Engagement
drop table if exists Gender

create table RoleUser (
   RoleId       int            identity (1,1) primary key,   
   Name         nvarchar(100)  not null,
)

create table QualificationLevel (
   QualificationLevelId         int           identity (1,1) primary key,   
   Name							nvarchar(3)   not null,
)

create table Engagement (
   EngagementId       int           identity (1,1) primary key,   
   Name               nvarchar(100)  not null,
)

create table Gender (
   GenderId           int           identity (1,1) primary key,   
   Name               nvarchar(100)  not null,
)

create table UserHotel(
   UserId           int            identity (1,1) primary key,   
   FullName         nvarchar(100)  not null,
   DateOfBirt       DateTime       not null,
   Email            nvarchar(100)  not null,
   UserName         nvarchar(100)  not null,
   UserPassword     nvarchar(max)  not null,
   RoleId           int            not null,
   FOREIGN KEY (RoleId) REFERENCES RoleUser(RoleId)
)

create table Menager(
   MenagerId		int            identity (1,1) primary key,  
   UserId			int			   not null,
   FOREIGN KEY (UserId) REFERENCES UserHotel(UserId),
   HotelFloor       int            not null,   
   Experience       int            not null,
   QualificationLevelId int        not null,
   FOREIGN KEY (QualificationLevelId) REFERENCES QualificationLevel(QualificationLevelId),
)

create table Worker(
   WorkerId		int            identity (1,1) primary key,  
   UserId		int			   not null,
   FOREIGN KEY (UserId) REFERENCES UserHotel(UserId),
   HotelFloor   int            not null,   
   GenderId 	int			   not null,
   FOREIGN KEY (GenderId) REFERENCES Gender(GenderId),
   Citizenship  nvarchar(100)  not null,
   EngagementId int            not null,
   FOREIGN KEY (EngagementId) REFERENCES Engagement(EngagementId),
   Salary		money          
)


