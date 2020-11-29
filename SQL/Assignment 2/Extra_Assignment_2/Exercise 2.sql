use trainee;

-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
CREATE TABLE IF NOT EXISTS Department (
    Department_Number 	INT AUTO_INCREMENT,
    Department_Name 	VARCHAR(100),
    PRIMARY KEY (Department_Number)
);

CREATE TABLE IF NOT EXISTS Employee_Table (
    Employee_Number 	INT AUTO_INCREMENT,
    Employee_Name 		VARCHAR(100),
    Department_Number 	INT,
    PRIMARY KEY (Employee_Number),
    FOREIGN KEY (Department_Number) REFERENCES Department (Department_Number) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Employee_Skill_Table (
    Employee_Number 	INT AUTO_INCREMENT,
    Skill_Code 			VARCHAR(10),
    Date_Registered 	DATE,
    FOREIGN KEY (Employee_Number) REFERENCES Employee_Table (Employee_Number) ON DELETE CASCADE
);

-- Question 2: Thêm ít nhất 10 bản ghi vào table
INSERT INTO Department
VALUES (1,'SAMSUNG'),
(2,'SONY'),
(3,'LG'),
(4,'CANON');

INSERT INTO Employee_Table
VALUES (1,'Soobin Hoàng Sơn',2),
(2,'Trấn Thành MC',3),
(3,'Trường Giang MC',1),
(4,'Quân AP',4),
(5,'Mỹ Tâm',1),
(6,'Đàm Vĩnh Hưng',3),
(7,'Binz',2),
(8,'Suboi',1),
(9,'Big Daddy',2),
(10,'Erik',3),
(11,'Đức Phúc',4),
(12,'Hari Won',2);

INSERT INTO Employee_Skill_Table
VALUES (1,'Java','2020-01-10'),
(2,'Python','2020-02-11'),
(3,'HTML','2020-03-20'),
(3,'CSS','1999-11-10'),
(5,'Java','2000-10-10'),
(6,'C#','2009-09-04'),
(7,'SQL','2020-02-10'),
(8,'Photoshop','2010-12-10'),
(9,'Java','2020-01-15'),
(10,'Java','2020-04-10'),
(11,'HTML','2020-04-10'),
(12,'C#','2020-04-10');



-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
SELECT 
    et.Employee_Name, ek.Skill_Code
FROM
    Employee_Table et
        JOIN
    Employee_Skill_Table ek ON ek.Employee_Number = et.Employee_Number
WHERE
    ek.Skill_Code = 'Java';
    
-- Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT 
    COUNT(*) AS ban,d.Department_Name
FROM
    Employee_Table e
        JOIN
    Department d ON d.Department_Number = e.Department_Number
GROUP BY d.Department_Name
HAVING ban > 3;

-- Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
SELECT 
    e.Employee_Name, d.Department_Name
FROM
    Employee_Table e
        JOIN
    Department d ON d.Department_Number = e.Department_Number
ORDER BY d.Department_Name;

-- Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
SELECT 
    et.Employee_Name, COUNT(ek.Skill_Code) AS skill
FROM
    Employee_Table et
        JOIN
    Employee_Skill_Table ek ON ek.Employee_Number = et.Employee_Number
GROUP BY et.Employee_Name
HAVING skill > 1;