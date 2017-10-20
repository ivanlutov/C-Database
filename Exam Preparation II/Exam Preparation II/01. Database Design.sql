CREATE TABLE Users(
Id INT PRIMARY KEY IDENTITY,
Nickname VARCHAR(25),
Gender CHAR(1),
Age INT,
LocationId INT,
CredentialId INT UNIQUE)  
 
CREATE TABLE Credentials(
Id INT PRIMARY KEY identity,
Email VARCHAR(30),
Password VARCHAR(20))
 
CREATE TABLE Locations(
Id INT PRIMARY KEY identity,
Latitude FLOAT,
Longitude FLOAT)
 
CREATE TABLE Chats(
Id INT PRIMARY KEY identity,
Title VARCHAR (32),
StartDate DATE,
IsActive BIT,)
 
CREATE TABLE UsersChats(
UserId int,
ChatId int,
CONSTRAINT Pk_USERSCHATS PRIMARY KEY(ChatId, UserId))
 
CREATE TABLE Messages(
Id INT PRIMARY KEY identity,
Content VARCHAR(200),
SentOn DATE,
ChatId INT,
UserId INT)
 
ALTER TABLE Users
ADD CONSTRAINT Fk_Users_Credential_id FOREIGN KEY (CredentialId) REFERENCES Credentials (Id),
    CONSTRAINT Fk_Users_Locations     FOREIGN KEY (LocationId)   REFERENCES Locations(Id)
 
ALTER TABLE UsersChats
ADD
    CONSTRAINT FK_UsersChats_Chats FOREIGN KEY (ChatId) REFERENCES Chats (Id),
    CONSTRAINT FK_UsersChats_Users FOREIGN KEY (UserId) REFERENCES USERS (Id)
 
ALTER TABLE Messages
ADD CONSTRAINT FK_Messages_User FOREIGN KEY (UserId) REFERENCES Users(Id),
    CONSTRAINT FK_Messages_Chats FOREIGN KEY (ChatId) REFERENCES Chats(Id)