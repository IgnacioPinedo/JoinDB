IF OBJECT_ID ( 'dbo.tb_UserEvent', 'U' ) IS NOT NULL   
    DROP TABLE dbo.tb_UserEvent;  
	
IF OBJECT_ID ( 'dbo.tb_Event', 'U' ) IS NOT NULL   
    DROP TABLE dbo.tb_Event;  

IF OBJECT_ID ( 'dbo.tb_EventType', 'U' ) IS NOT NULL   
    DROP TABLE dbo.tb_EventType;  
	
IF OBJECT_ID ( 'dbo.tb_UserSession', 'U' ) IS NOT NULL   
    DROP TABLE dbo.tb_UserSession;  
	
IF OBJECT_ID ( 'dbo.tb_User', 'U' ) IS NOT NULL   
    DROP TABLE dbo.tb_User;  
	
IF OBJECT_ID ( 'dbo.tb_Location', 'U' ) IS NOT NULL   
    DROP TABLE dbo.tb_Location;  


CREATE TABLE dbo.tb_Location (
	Id INT PRIMARY KEY IDENTITY(1, 1),
    IsHome BIT,
    IsWork BIT,
	Latitude FLOAT,
	Longitude FLOAT
)

CREATE TABLE dbo.tb_User (
	Id INT PRIMARY KEY IDENTITY(1, 1),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    [Password] VARCHAR(255),
    Salt VARCHAR(255),
	HomeId INT,
	WorkId INT,
    FOREIGN KEY (HomeId) REFERENCES dbo.tb_Location(Id),
    FOREIGN KEY (WorkId) REFERENCES dbo.tb_Location(Id)
)

CREATE TABLE dbo.tb_UserSession (
	Id INT PRIMARY KEY IDENTITY(1, 1),
    UserId INT,
    SessionToken VARCHAR(255),
    [ExpireDate] DATETIME,
    FOREIGN KEY (UserId) REFERENCES dbo.tb_User(Id)
)

CREATE TABLE dbo.tb_EventType (
  Id INT PRIMARY KEY IDENTITY(1, 1),
  [Type] VARCHAR(255)
)

CREATE TABLE dbo.tb_Event (
  Id INT PRIMARY KEY IDENTITY(1, 1),
  TypeId INT,
  AdministratorId INT,
  [Name] VARCHAR(255),
  [Description] VARCHAR(255),
  [Date] DATETIME,
  Latitude FLOAT,
  Longitude FLOAT,
  FOREIGN KEY (TypeId) REFERENCES dbo.tb_EventType(Id)
  FOREIGN KEY (AdministratorId) REFERENCES dbo.tb_User(Id)
)

CREATE TABLE tb_UserEvent (
  Id int PRIMARY KEY IDENTITY(1, 1),
  UserId INT,
  EventId INT,
  FOREIGN KEY (UserId) REFERENCES dbo.tb_User(Id),
  FOREIGN KEY (EventId) REFERENCES dbo.tb_Event(Id)
)