-- Questions 1 :
-- create db
DROP DATABASE IF EXISTS baithi;

CREATE DATABASE baithi;

USE baithi;

-- create table Country
DROP TABLE IF EXISTS Country;

CREATE TABLE IF NOT EXISTS Country (
    Country_id 		INT AUTO_INCREMENT PRIMARY KEY,
    Country_name 	VARCHAR(255)
);

-- create table Location
DROP TABLE IF EXISTS Location;

CREATE TABLE IF NOT EXISTS Location (
    Location_id 		INT AUTO_INCREMENT PRIMARY KEY,
    street_address 		VARCHAR(255),
    postal_code 		INT,
    country_id 			INT,
    FOREIGN KEY (country_id) REFERENCES Country (country_id)
);

-- create table Employees
DROP TABLE IF EXISTS Employees;

CREATE TABLE IF NOT EXISTS Employees (
    employees_id 		INT AUTO_INCREMENT PRIMARY KEY,
    full_name 			VARCHAR(255),
    email 				VARCHAR(255),
    Location_id 		INT,
    FOREIGN KEY (Location_id) REFERENCES Location (Location_id)
);

-- insert table Country
INSERT INTO `baithi`.`Country` (`Country_id`, `Country_name`) VALUES ('1', 'Việt Nam');
INSERT INTO `baithi`.`Country` (`Country_id`, `Country_name`) VALUES ('2', 'Lào');
INSERT INTO `baithi`.`Country` (`Country_id`, `Country_name`) VALUES ('3', 'Trung Quốc');
INSERT INTO `baithi`.`Country` (`Country_id`, `Country_name`) VALUES ('4', 'Mỹ');
INSERT INTO `baithi`.`Country` (`Country_id`, `Country_name`) VALUES ('5', 'Đức');

-- insert table location
INSERT INTO `baithi`.`location` (`Location_id`, `street_address`, `postal_code`, `country_id`) VALUES ('1', 'Hà Nội', '0345', '2');
INSERT INTO `baithi`.`location` (`Location_id`, `street_address`, `postal_code`, `country_id`) VALUES ('2', 'Hà Nội', '0123', '3');
INSERT INTO `baithi`.`location` (`Location_id`, `street_address`, `postal_code`, `country_id`) VALUES ('3', 'Hà Nội', '3621', '1');
INSERT INTO `baithi`.`location` (`Location_id`, `street_address`, `postal_code`, `country_id`) VALUES ('4', 'Hà Nội', '2346', '5');
INSERT INTO `baithi`.`location` (`Location_id`, `street_address`, `postal_code`, `country_id`) VALUES ('5', 'Hà Nội', '4563', '4');

-- insert table employees
INSERT INTO `baithi`.`employees` (`employees_id`, `full_name`, `email`, `Location_id`) VALUES ('1', 'Đình Tuấn', 'dinhtuanpk@gmail.com', '1');
INSERT INTO `baithi`.`employees` (`employees_id`, `full_name`, `email`, `Location_id`) VALUES ('2', 'Đức Vượng', 'ducvuong@gmail.com', '1');
INSERT INTO `baithi`.`employees` (`employees_id`, `full_name`, `email`, `Location_id`) VALUES ('3', 'Bảo Anh', 'baoanh@gmail.com', '1');
INSERT INTO `baithi`.`employees` (`employees_id`, `full_name`, `email`, `Location_id`) VALUES ('4', 'Đình Tú', 'dinhtu@gmail.com', '1');
INSERT INTO `baithi`.`employees` (`employees_id`, `full_name`, `email`, `Location_id`) VALUES ('5', 'Anh Thái', 'nn03@gmail.com', '1');
INSERT INTO `baithi`.`employees` (`employees_id`, `full_name`, `email`, `Location_id`) VALUES ('6', 'Trà My', 'tramy@gmail.com', '1');
INSERT INTO `baithi`.`employees` (`employees_id`, `full_name`, `email`, `Location_id`) VALUES ('7', 'Quyết Vũ', 'quyetvu@gmail.com', '1');
INSERT INTO `baithi`.`employees` (`employees_id`, `full_name`, `email`, `Location_id`) VALUES ('8', 'Quỳnh Anh', 'quynhanh@gmail.com', '1');
INSERT INTO `baithi`.`employees` (`employees_id`, `full_name`, `email`, `Location_id`) VALUES ('9', 'Văn Tráng', 'vantrang@gmail.com', '1');
INSERT INTO `baithi`.`employees` (`employees_id`, `full_name`, `email`, `Location_id`) VALUES ('10', 'Nguyễn Nguyên', 'nguyennguyen@gmai.com', '3');



-- Questions 2
-- a) Lấy tất cả các nhân viên thuộc Việt nam
SELECT 
    e.full_name
FROM
    employees e
        LEFT JOIN
    location l ON l.Location_id = e.Location_id
        JOIN
    country c ON l.country_id = c.country_id
WHERE
    c.Country_name = 'Việt Nam';
    
-- b) Lấy ra tên quốc gia của employee có email là "nn03@gmail.com"
SELECT 
    c.Country_name
FROM
    country c
        LEFT JOIN
    location l ON l.country_id = c.country_id
        JOIN
    employees e ON l.Location_id = e.Location_id
WHERE
    e.email = 'nn03@gmail.com';
    
-- c) Thống kê mỗi country, mỗi location có bao nhiêu employee đang làm việc.
SELECT 
    c.Country_id,l.Location_id,count(e.Location_id) as so_luong_employees
FROM
    country c
        LEFT JOIN
    location l ON l.country_id = c.country_id
        LEFT JOIN
    employees e ON l.Location_id = e.Location_id
GROUP BY c.Country_id,l.Location_id;

-- 3. Tạo trigger cho table Employee chỉ cho phép insert mỗi quốc gia có tối đa 10 employee
DROP TRIGGER IF EXISTS trigger_Q3;

DELIMITER $$
CREATE TRIGGER trigger_Q3
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	DECLARE V_1 int;
		SELECT 
		COUNT(e.Location_id)
	INTO V_1 FROM
		country c
			LEFT JOIN
		location l ON l.country_id = c.country_id
			JOIN
		employees e ON l.Location_id = e.Location_id
	WHERE
		NEW.Location_id = l.Location_id
	GROUP BY c.country_id;

	IF  V_1 >= 10 THEN
    signal sqlstate '45000'
    SET MESSAGE_TEXT = 'Quoc gia nay da du 10 nguoi';
    END IF;
END$$
DELIMITER ;

-- 4. Hãy cấu hình table sao cho khi xóa 1 location nào đó thì tất cả employee ở location đó sẽ có location_id = null
-- create trigger
DROP TRIGGER IF EXISTS trigger_Q4;

DELIMITER $$
CREATE TRIGGER trigger_Q4
BEFORE DELETE ON location
FOR EACH ROW
BEGIN
	UPDATE employees
    SET location_id = null
    WHERE location_id = OLD.Location_id;
END$$
DELIMITER ;


