-- drop database if exists Project_Manager;

-- create database Project_Manager;

use Project_Manager;

-- a) Tạo table với các ràng buộc và kiểu dữ liệu và thêm ít nhất 3 bản ghi vào mỗi table trên
CREATE TABLE employee (
    EmployeeID 				INT AUTO_INCREMENT,
    EmployeeLastName 		VARCHAR(255),
    EmployeeFirstName 		VARCHAR(255),
    EmployeeHireDate 		VARCHAR(255),
    EmployeeStatus 			VARCHAR(255),
    SupervisorID 			INT DEFAULT NULL,
    SocialSecurityNumber 	INT,
	PRIMARY KEY(EmployeeID),
    FOREIGN KEY(SupervisorID) references employee(EmployeeID) on delete cascade
);

CREATE TABLE IF NOT EXISTS Projects (
    ProjectID 			INT AUTO_INCREMENT,
    managerID 			INT UNIQUE NOT NULL,
    ProjectName 		VARCHAR(255),
    ProjectStartDate 	DATE,
    ProjectDescription 	VARCHAR(255),
    ProjectDetail 		VARCHAR(255),
    ProjectCompletedOne DATE,
	PRIMARY KEY(ProjectID),
    FOREIGN KEY(managerID) references employee(EmployeeID) on delete cascade 
);

CREATE TABLE IF NOT EXISTS Project_Modules (
    ModuleID 					INT AUTO_INCREMENT,
    ProjectID 					INT,
    EmployeeID 				INT UNIQUE NOT NULL,
    ProjectModulesDate 			DATE,
    ProjectModulesComepledOn 	DATETIME,
    ProjecttModulesDescription 	VARCHAR(255),
	PRIMARY KEY(ModuleID),
    FOREIGN KEY(ProjectID) references Projects(ProjectID) on delete cascade,
    FOREIGN KEY(EmployeeID) references Employee(EmployeeID) on delete cascade
);

CREATE TABLE IF NOT EXISTS WorkDone (
    WorkDoneID 			INT AUTO_INCREMENT,
    EmployeeID 			INT,
    ModuleID 			INT,
    WorkDoneDate 		DATE DEFAULT NULL,
    WorkDoneDescription VARCHAR(255),
    WorkDoneStatus 		ENUM('Unfinished work','Work done'),
	PRIMARY KEY(WorkDoneID),
    FOREIGN KEY(ModuleID) references Project_Modules(ModuleID) on delete cascade,
    FOREIGN KEY(EmployeeID) references employee(EmployeeID) on delete cascade
);

INSERT INTO employee 
VALUES (1,'Tuấn','Đình','1999-07-23','Hoàn hảo',null,2307),
(2,'Tú','Đình','2002-01-22','Đẹp Troai',null,2201),
(3,'My','Trà','1999-03-05','Hơi Lùn',null,0503),
(4,'Anh','Quỳnh','1999-12-10','Xinh Gái',null,1012),
(5,'Ngọc','Phan','1977-06-01','Ghê Gớm',null,0106),
(6,'Dũng','Đình','1976-07-19','Hoàn hảo',null,1907),
(7,'Anh','Bảo','1999-10-05','Đẹp Troai',null,0510),
(8,'Dương','Thùy','1999-12-03','Xinh Gái',null,0312),
(9,'Công','Đắc','1999-01-01','Cao',null,0101),
(10,'Tráng','Văn','1999-09-09','Ngố Tàu',null,0909);

UPDATE employee SET SupervisorID = '4' WHERE (EmployeeID = '1');
UPDATE employee SET SupervisorID = '1' WHERE (EmployeeID = '2');
UPDATE employee SET SupervisorID = '4' WHERE (EmployeeID = '3');
UPDATE employee SET SupervisorID = '5' WHERE (EmployeeID = '4');
UPDATE employee SET SupervisorID = '8' WHERE (EmployeeID = '7');
UPDATE employee SET SupervisorID = '5' WHERE (EmployeeID = '9');
UPDATE employee SET SupervisorID = '5' WHERE (EmployeeID = '10');

INSERT INTO Projects
VALUES (1,4,'Điện Máy Xanh','2019-01-01','WEB Bán đồ công nghệ','Công Nghệ','2020-01-01'),
(2,10,'Chợ tốt','2019-02-02','WEB Bán đồ linh tinh','Bán đồ bỏ đi','2020-12-02'),
(3,5,'Trường Học','2019-03-03','WEB quản lý sinh viên','Sinh Viên','2020-10-01'),
(4,7,'Thợ sửa điều hòa may mắn','2019-04-04','WEB sửa điều hòa','Sửa chữa','2020-03-20'),
(5,2,'Quán cắt tóc','2019-01-01','WEB quản lý cửa hàng cắt tóc','Thời trang','2020-11-01');

INSERT INTO Project_Modules
VALUES (1,1,4,'2019-10-10','2019-10-09','Khách hàng'),
(2,1,1,'2019-10-10','2019-10-09','Giỏ đồ'),
(3,2,10,'2019-05-05','2019-05-06','Khách hàng'),
(4,2,9,'2019-05-05','2019-05-04','Giỏ đồ'),
(5,3,5,'2019-10-10','2019-10-09','Sinh viên'),
(6,3,6,'2019-10-10','2019-10-09','Bài Thi'),
(7,4,7,'2019-10-10','2019-10-09','Khách hàng'),
(8,5,8,'2019-10-10','2019-10-09','giá cả'),
(9,4,3,'2019-10-10','2019-10-09','Khách hàng'),
(10,5,2,'2019-10-10','2019-10-09','Menu kiểu tóc');

INSERT INTO WorkDone
VALUES (1,4,1,'2020-12-30','lol','Work done'),
(2,1,2,'2020-12-24','lol','Work done'),
(3,10,3,null,'lol','Unfinished work'),
(4,9,4,null,'lol','Unfinished work'),
(5,5,5,'2020-12-06','lol','Work done'),
(6,6,6,'2020-12-01','lol','Work done'),
(7,7,7,'2020-12-02','lol','Work done'),
(8,8,8,'2020-12-25','lol','Work done'),
(9,3,9,'2020-12-23','lol','Work done'),
(10,2,10,'2020-12-29','lol','Work done');




    