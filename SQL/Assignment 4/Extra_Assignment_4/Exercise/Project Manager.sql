drop database if exists Project_Manager;

create database Project_Manager;

use Project_Manager;

-- a) Tạo table với các ràng buộc và kiểu dữ liệu và thêm ít nhất 3 bản ghi vào mỗi table trên
CREATE TABLE employee (
    EmployeeID 				INT(11) AUTO_INCREMENT,
    EmployeeLastName 		VARCHAR(50),
    EmployeeFirstName 		VARCHAR(50),
    EmployeeHireDate 		DATETIME,
    EmployeeStatus 			TINYINT(1),
    SupervisorID 			INT(11),
    SocialSecurityNumber 	INT(11),
	PRIMARY KEY(EmployeeID),
    FOREIGN KEY(SupervisorID) references employee(EmployeeID) on delete cascade
);

CREATE TABLE IF NOT EXISTS Projects (
    ProjectID 			INT(11) AUTO_INCREMENT,
    managerID 			INT UNIQUE NOT NULL,
    ProjectName 		VARCHAR(100),
    ProjectStartDate 	DATETIME,
    ProjectDescription 	VARCHAR(255),
    ProjectDetail 		VARCHAR(255),
    ProjectCompletedOne DATETIME,
	PRIMARY KEY(ProjectID),
    FOREIGN KEY(managerID) references employee(EmployeeID) on delete cascade 
);

CREATE TABLE IF NOT EXISTS Project_Modules (
    ModuleID 					INT(11) AUTO_INCREMENT,
    ProjectID 					INT(11),
    ProjectModulesDate 			DATETIME,
    ProjectModulesComepledOn 	DATETIME,
    ProjecttModulesDescription 	VARCHAR(255),
	PRIMARY KEY(ModuleID),
    FOREIGN KEY(ProjectID) references Projects(ProjectID) on delete cascade
);

CREATE TABLE IF NOT EXISTS WorkDone (
    WorkDoneID 			INT(11) AUTO_INCREMENT,
    EmployeeID 			INT(11),
    ModuleID 			INT(11),
    WorkDoneDate 		DATETIME DEFAULT NULL,
    WorkDoneDescription VARCHAR(255),
    WorkDoneStatus 		TINYINT(1),
	PRIMARY KEY(WorkDoneID),
    FOREIGN KEY(ModuleID) references Project_Modules(ModuleID) on delete cascade,
    FOREIGN KEY(EmployeeID) references employee(EmployeeID) on delete cascade
);

INSERT INTO employee 
VALUES (1,'Thành','Nguyễn Huy','2019-01-03',1,null,214294),
(2,'Đông','Công Phương','2019-01-03',1,null,215462),
(3,'Trang','Đặng Nguyễn Phương Trang','2019-01-03',1,null,null),
(4,'Thủy','Thạch Thanh','2019-01-05',1,null,236454),
(5,'Hiệp','Hoàng Mạnh','2019-01-06',1,null,null),
(6,'Hằng','Hồ Thị','2019-02-01',1,null,356446),
(7,'Anh','Nguyễn Tú','2019-03-05',1,null,null),
(8,'Giang','Trần Thị Thu','2019-03-06',1,null,332546),
(9,'Dũng','Bùi Ngọc','2019-04-03',1,null,123654),
(10,'Đạt','Giang Tiến','2019-03-08',1,null,null),
(11,'Kiên','Lại Trung','2019-04-09',1,null,512983),
(12,'Anh','Vũ Tuấn','2019-05-01',1,null,null),
(13,'Thảo','Ngọc Nguyễn','2019-05-01',1,null,412123),
(14,'An','Lê Ngọc','2019-06-09',1,null,135123),
(15,'Việt','Nguyễn Việt','2019-04-09',1,null,123141),
(16,'Hiếu','Đỗ Huy','2019-04-08',1,null,1231445);

UPDATE employee SET SupervisorID = '1' WHERE (EmployeeID = '2');
UPDATE employee SET SupervisorID = '1' WHERE (EmployeeID = '3');
UPDATE employee SET SupervisorID = '1' WHERE (EmployeeID = '5');
UPDATE employee SET SupervisorID = '4' WHERE (EmployeeID = '6');
UPDATE employee SET SupervisorID = '4' WHERE (EmployeeID = '7');
UPDATE employee SET SupervisorID = '4' WHERE (EmployeeID = '8');
UPDATE employee SET SupervisorID = '10' WHERE (EmployeeID = '9');
UPDATE employee SET SupervisorID = '2' WHERE (EmployeeID = '16');
UPDATE employee SET SupervisorID = '2' WHERE (EmployeeID = '15');
UPDATE employee SET SupervisorID = '12' WHERE (EmployeeID = '14');
UPDATE employee SET SupervisorID = '12' WHERE (EmployeeID = '13');


INSERT INTO Projects
VALUES (1,2,'Web_MyGo','2020-03-01','WEB for customer','Just a web','2020-07-15'),
(2,3,'Android_MyGo','2020-03-05','Android App for customer','Just a app','2020-08-29'),
(3,1,'IOS_MyGo','2020-03-05','IOS App for customer','Just a app',null),
(4,5,'BACKend_MyGo','2020-03-01','BE for MyGo application','Big BE',null),
(5,4,'TEST_MyGo','2020-04-01','Test','Automation','2020-11-01');

INSERT INTO Project_Modules
VALUES (1,1,'2020-03-01','2020-05-01','web customer'),
(2,1,'2020-03-01','2020-05-29','web profile'),
(3,1,'2020-03-01','2020-08-29','web report'),
(4,2,'2020-03-05','2020-09-15','app driver'),
(5,2,'2020-03-05','2020-10-14','app cutomer'),
(6,3,'2020-03-05',null,'app driver'),
(7,3,'2020-03-10',null,'app cutomer'),
(8,4,'2020-03-01',null,'backend web'),
(9,4,'2020-03-01','2020-09-09','backend database'),
(10,5,'2020-04-01','2020-09-01','manual'),
(11,5,'2020-04-01','2020-11-14','automation');

INSERT INTO WorkDone
VALUES (1,5,1,'2020-05-01','design',1),
(2,5,1,'2020-05-01','core js',1),
(3,5,2,'2020-05-29','html, css',1),
(4,11,2,'2020-05-29','javascrip and vue',1),
(5,14,3,'2020-08-29','make data',1),
(6,13,3,'2020-08-29','vue design',1),
(7,12,4,'2020-09-15','app driver - design',1),
(8,15,4,'2020-09-15','app driver - api done',1),
(9,16,5,'2020-10-14','app design',1),
(10,2,5,'2020-10-14','app design - api work',1),
(11,9,6,null,'ios design',1),
(12,10,7,null,'ios design - api work',1),
(13,11,8,null,'backend core',1),
(14,12,8,null,'backend system',1),
(15,4,8,null,'backend api',1),
(16,1,9,'2020-09-09','backend data config',1),
(17,3,9,'2020-09-09','backend data create',1),
(18,6,10,'2020-09-01','write test case',1),
(19,8,10,'2020-09-01','sumary test case',1),
(20,7,11,'2020-11-14','write code done',1);




    