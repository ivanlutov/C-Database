CREATE TABLE Teachers(
TeacherID INT PRIMARY KEY NOT NULL,
[Name] VARCHAR(50),
ManagerID INT,
CONSTRAINT FK_ManagerID_Teachers FOREIGN KEY (ManagerID) REFERENCES Teachers(TeacherID))

INSERT INTO Teachers
     VALUES
            (101, 'John', NULL),
            (102, 'Maya', 106),
            (103, 'Silvi', 106),
            (104, 'Ted', 105),
            (105, 'Mark', 101),
            (106, 'Greta', 101)
