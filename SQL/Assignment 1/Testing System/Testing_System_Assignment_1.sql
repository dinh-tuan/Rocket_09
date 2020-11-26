CREATE DATABASE Manager;

USE Manager;

-- table 1
CREATE TABLE Department (
    DepartmentID 	INT AUTO_INCREMENT,
    DepartmentName 	VARCHAR(50),
    PRIMARY KEY (DepartmentID)
);

-- table 2
CREATE TABLE Positionn (
    PositionID 		INT AUTO_INCREMENT,
    PositionName 	VARCHAR(50),
    PRIMARY KEY (PositionID)
);

-- table 3
CREATE TABLE Account (
    AccountID 		INT AUTO_INCREMENT,
    Email 			VARCHAR(50),
    Username 		VARCHAR(50),
    Fullname 		VARCHAR(50),
    DepartmentID 	INT,
    PositionID 		INT,
    CreateDate 		DATE,
    PRIMARY KEY (AccountID),
    FOREIGN KEY(PositionID) REFERENCES Positionn(PositionID) ON DELETE CASCADE,
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE
);

-- table 4
CREATE TABLE Groupp (
    GroupID 	INT AUTO_INCREMENT,
    GroupName 	VARCHAR(50),
    CreatorID 	INT,
    CreateDate 	DATE,
    PRIMARY KEY (GroupID)
);

-- table 5
CREATE TABLE GroupAccount (
    GroupID 	INT,
    AccountID 	INT,
    JoinDate 	DATE,
    FOREIGN KEY(GroupID) REFERENCES Groupp(GroupID) ON DELETE CASCADE
);

ALTER TABLE GroupAccount
ADD FOREIGN KEY(AccountID) REFERENCES Account(AccountID) ON DELETE CASCADE;

-- table 6
CREATE TABLE TypeQuestion (
    TypeID 		INT AUTO_INCREMENT,
    TypeName 	ENUM('Essay','Multiple-Choice'),
    primary key(TypeID)
);

-- table 7
CREATE TABLE CategoryQuestion (
    CategoryID 		INT AUTO_INCREMENT,
    CategoryName 	VARCHAR(50),
    PRIMARY KEY (CategoryID)
);

-- table 8
CREATE TABLE Question (
    QuestionID 	INT AUTO_INCREMENT,
    Content 	VARCHAR(255),
    CategoryID 	INT,
    TypeID 		INT,
    CreatorID 	INT,
    CreateDate 	DATE,
    PRIMARY KEY (QuestionID),
    FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID) ON DELETE CASCADE,
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE
);

-- table 9
CREATE TABLE Answer (
    AnswerID 	INT AUTO_INCREMENT,
    Content 	VARCHAR(255),
    QuestionID 	INT,
    isCorrect 	ENUM('True', 'False'),
    PRIMARY KEY (AnswerID),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE
);

-- table 10 
CREATE TABLE Exam (
    ExamID 		INT AUTO_INCREMENT,
    Code 		INT,
    Title 		VARCHAR(255),
    CategoryID 	INT,
    Duration 	DATE,
    CreatorID 	INT,
    CreateDate 	DATE,
    PRIMARY KEY (ExamID),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE
);

ALTER TABLE Exam
CHANGE COLUMN code code char(4);

-- table 11
CREATE TABLE ExamQuestion (
    ExamID 		INT,
    QuestionID 	INT,
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE
);

INSERT INTO department
VALUES (1,'Sale'),
(2,'Manager'),
(3,'Marketing'),
(4,'Engineer'),
(5,'Accounting');

INSERT INTO Positionn
VALUES (1,'Dev'),
(2,'Test'),
(3,'Scrum Master'),
(4,'PM'),
(5,'Web Master');

INSERT INTO Account
VALUES (1,'tuan@gmail.com','Tuấn','Đình Văn Tuấn',5,1,'2020-07-23'),
(2,'baoanh@gmail.com','Bảo Anh','Trần Bảo Anh',4,2,'2010-10-05'),
(3,'quynhanh@gmail.com','Quỳnh Anh','Phạm Quỳnh Anh',2,3,'2020-12-10'),
(4,'tu@gmail.com','Tú','Đình Văn Tú',4,1,'2020-01-22'),
(5,'my@gmail.com','My','Nguyễn Trà My',1,5,'2020-03-05');

INSERT INTO Groupp 
VALUES (1,'1 con vịt',1,'1999-01-02'),
(2,'2 con rồng',2,'1998-10-20'),
(3,'3 con sâu',3,'2000-11-02'),
(4,'4 con mèo',4,'2002-08-20'),
(5,'5 con heo',5,'2003-01-10');

INSERT INTO GroupAccount
VALUES (1,3,'2020-12-11'),
(2,4,'2020-01-23'),
(3,1,'2020-01-25'),
(4,5,'2020-12-22'),
(5,2,'2020-12-10');

INSERT INTO TypeQuestion
VALUES (1,'Essay'),
(2,'Multiple Choice'),
(3,'Essay'),
(4,'Essay'),
(5,'Multiple Choice');

INSERT INTO CategoryQuestion
VALUES (1,'Java'),
(2,'.NET'),
(3,'SQL'),
(4,'Postman'),
(5,'Ruby');

INSERT INTO Question
VALUES (1,'How much ?',1,4,1,'2012-02-10'),
(2,'Do you love me ?',3,5,2,'2012-01-10'),
(3,'???',5,3,3,'2012-10-10'),
(4,'Trick or treat ?',2,2,4,'2013-09-13'),
(5,'How old you ?',4,1,5,'2015-08-30');

INSERT INTO Answer
VALUES (1,'19000vnđ',1,'true'),
(2,'No',2,'false'),
(3,'^ ^',3,'true'),
(4,'Trick',4,'true'),
(5,'20 year old',5,'true');

INSERT INTO Exam
VALUES (1,'A001','Check',2,'2015-10-10',1,'2015-10-01'),
(2,'A002','Check',5,'2016-10-10',2,'2016-10-01'),
(3,'A003','Check',1,'2017-10-10',3,'2017-10-01'),
(4,'A004','Check',4,'2018-10-10',4,'2018-10-01'),
(5,'A005','Check',3,'2019-10-10',5,'2019-10-01');

INSERT INTO ExamQuestion
VALUES (1,2),
(2,5),
(3,4),
(4,3),
(5,1);

    


    