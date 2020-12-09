Drop Database if exists Testing_Exam;

create database Testing_Exam;

use Testing_Exam;

CREATE TABLE IF NOT EXISTS Customer (
    CustomerID 		INT AUTO_INCREMENT PRIMARY KEY,
    Name 			VARCHAR(255),
    Phone 			INT,
    Email			VARCHAR(255),
    Address 		VARCHAR(255),
    Note 			VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Car (
    CarID 		INT AUTO_INCREMENT PRIMARY KEY,
    Maker		ENUM('HONDA', 'TOYOTA', 'NISSAN'),
    Model 		VARCHAR(255),
    Color 		VARCHAR(255),
    Note 		VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS CAR_ORDER (
    OrderID 		INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID 		INT,
    CarID 			INT,
    Amount 			INT DEFAULT 0,
    SalePrice 		INT,
    OrderDate 		DATETIME,
    DeliveryDate 	DATETIME,
    DeliveryAddress VARCHAR(255),
    Status 			TINYINT(1) DEFAULT 0,
    Note 			VARCHAR(255),
    FOREIGN KEY (CarID) REFERENCES Car (CarID) ON DELETE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE
);

-- INSERT TABLE car
INSERT INTO `testing_exam`.`car` (`CarID`, `Maker`, `Model`, `Color`, `Note`) VALUES ('1', 'HONDA', 'xe ma', 'black', 'xe xịn');
INSERT INTO `testing_exam`.`car` (`CarID`, `Maker`, `Model`, `Color`, `Note`) VALUES ('2', 'TOYOTA', 'xe lo', 'blue', 'xe hịn');
INSERT INTO `testing_exam`.`car` (`CarID`, `Maker`, `Model`, `Color`, `Note`) VALUES ('3', 'HONDA', 'xe xích lô', 'green', 'xe đạp chân');
INSERT INTO `testing_exam`.`car` (`CarID`, `Maker`, `Model`, `Color`, `Note`) VALUES ('4', 'NISSAN', 'xe ba bánh', 'black', 'xe mui trần');
INSERT INTO `testing_exam`.`car` (`CarID`, `Maker`, `Model`, `Color`, `Note`) VALUES ('5', 'HONDA', 'xe tàu khựa', 'white', 'mèo');


SELECT
CASE
    WHEN Quantity > 30 THEN "The quantity is greater than 30"
    WHEN Quantity = 30 THEN "The quantity is 30"
    ELSE "The quantity is under 30"
END
FROM OrderDetails;
-- INSERT TABLE customer
INSERT INTO `testing_exam`.`customer` (`CustomerID`, `Name`, `Phone`, `Email`, `Address`, `Note`) VALUES ('1', 'Tuấn', '0812811358', 'dinhtuanpk@gmail.com', 'Phú diễn', 'đẹp trai');
INSERT INTO `testing_exam`.`customer` (`CustomerID`, `Name`, `Phone`, `Email`, `Address`, `Note`) VALUES ('2', 'Tú', '0215478788', 'dinhtu@gmail.com', 'Phú diễn', 'Đen');
INSERT INTO `testing_exam`.`customer` (`CustomerID`, `Name`, `Phone`, `Email`, `Address`, `Note`) VALUES ('3', 'Bảo Anh', '0236987457', 'baoanh@gmail.com', 'Cầu diễn', 'Hơi đụt');
INSERT INTO `testing_exam`.`customer` (`CustomerID`, `Name`, `Phone`, `Email`, `Address`, `Note`) VALUES ('4', 'Công', '0946587458', 'daccong@gmail.com', 'Phúc diễn', 'Cao');
INSERT INTO `testing_exam`.`customer` (`CustomerID`, `Name`, `Phone`, `Email`, `Address`, `Note`) VALUES ('5', 'Mạnh', '0654871233', 'ducmanh@gmail.com', 'Kiều Mai', 'Béo');

-- INSERT TABLE CAR_ORDER
INSERT INTO `testing_exam`.`car_order` (`OrderID`, `CustomerID`, `CarID`, `Amount`, `SalePrice`, `OrderDate`, `DeliveryDate`, `DeliveryAddress`, `Status`, `Note`) VALUES ('1', '3', '1', '2', '80000', '2020-10-01', '2020-11-01', 'Phú diễn', '2', 'Bình thường');
INSERT INTO `testing_exam`.`car_order` (`OrderID`, `CustomerID`, `CarID`, `Amount`, `SalePrice`, `OrderDate`, `DeliveryDate`, `DeliveryAddress`, `Status`, `Note`) VALUES ('2', '1', '2', '3', '45000', '2010-10-09', '2010-11-09', 'Bắc Từ Liêm', '0', 'Bình thường');
INSERT INTO `testing_exam`.`car_order` (`OrderID`, `CustomerID`, `CarID`, `Amount`, `SalePrice`, `OrderDate`, `DeliveryDate`, `DeliveryAddress`, `Status`, `Note`) VALUES ('3', '2', '3', '1', '50000', '2010-01-01', '2010-02-01', 'Hà Nội', '1', 'Bình thường');
INSERT INTO `testing_exam`.`car_order` (`OrderID`, `CustomerID`, `CarID`, `Amount`, `SalePrice`, `OrderDate`, `DeliveryDate`, `DeliveryAddress`, `Status`, `Note`) VALUES ('4', '4', '4', '1', '30000', '2011-09-09', '2011-10-20', 'Hà Nội', '0', 'Bình thường');
INSERT INTO `testing_exam`.`car_order` (`OrderID`, `CustomerID`, `CarID`, `Amount`, `SalePrice`, `OrderDate`, `DeliveryDate`, `DeliveryAddress`, `Status`, `Note`) VALUES ('5', '5', '5', '2', '12000', '2014-08-09', '2014-08-22', 'Hà Nội', '0', 'Bình thường');

-- Questions 2
SELECT 
    cu.Name, ca.Amount
FROM
    customer cu
        JOIN
    car_order ca ON ca.CustomerID = cu.CustomerID
GROUP BY cu.Name
ORDER BY ca.Amount;

-- 3. Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều oto nhất trong năm nay.
DELIMITER $$
CREATE FUNCTION f_Q3 () RETURNS VARCHAR(255) DETERMINISTIC
BEGIN 
	DeCLARE v_Maker VARCHAR(255);
	SELECT 
    Maker
INTO v_Maker FROM
    car
WHERE
    CarID = (SELECT 
            CarID
        FROM
            car_order
        WHERE
            YEAR(OrderDate) = YEAR(SYSDATE())
        GROUP BY CarID
        HAVING SUM(Amount) = (SELECT 
                SUM(Amount) AS so_luong_ban_oto
            FROM
                car_order
            WHERE
                YEAR(OrderDate) = YEAR(SYSDATE())
            GROUP BY CarID
            ORDER BY so_luong_ban_oto DESC
            LIMIT 1));
RETURN v_Maker;
END $$
DELIMITER ;

-- 4. Viết 1 thủ tục (không có parameter) để xóa các đơn hàng đã bị hủy của những năm trước. In ra số lượng bản ghi đã bị xóa.
DELIMITER $$
CREATE PROCEDURE procedure_Ques4 (OUT p_soluongbixoa int)
begin
	SELECT COUNT(*) INTO p_soluongbixoa
    FROM car_order
	WHERE YEAR(sysdate() - interval 1 year) >= YEAR(OrderDate) AND Status = 2;

	DELETE FROM car_order
    WHERE YEAR(sysdate() - interval 1 year) >= YEAR(OrderDate) AND Status = 2;
end$$
DELIMITER ;

/*5. 
	Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn
hàng đã đặt hàng bao gồm: tên của khách hàng, mã đơn hàng, số lượng oto
và tên hãng sản xuất.
*/
DELIMITER $$
CREATE PROCEDURE pro_Q5(IN p_CustomerID INT)
BEGIN 
		SELECT 
		cu.Name, ca.OrderID, ca.Amount, c.Maker
	FROM
		customer cu
			JOIN
		car_order ca ON ca.CustomerID = cu.CustomerID
			LEFT JOIN
		car c ON c.carID = ca.carID
        WHERE p_CustomerID = ca.CustomerID;
END$$
DELIMITER ;

/*6. 
Viết trigger để tránh trường hợp người dụng nhập thông tin không hợp lệ
vào database (DeliveryDate < OrderDate + 15).
*/
DROP TRIGGER IF EXISTS trigger_Q6;

DELIMITER $$
CREATE TRIGGER trigger_Q6
BEFORE INSERT ON car_order
FOR EACH ROW 
BEGIN 
	IF DATE_SUB(NEW.DeliveryDate,interval 15 day) < NEW.OrderDate THEN
    signal sqlstate '45000'
    SET MESSAGE_TEXT = 'Thong tin khong hop le';
    END IF;
END $$
DELIMITER ;

INSERT INTO `testing_exam`.`car_order` (`OrderID`, `CustomerID`, `CarID`, `Amount`, `SalePrice`, `OrderDate`, `DeliveryDate`, `DeliveryAddress`, `Status`, `Note`) VALUES ('7', '5', '1', '2', '23000', '2020-01-20', '2020-02-22', 'Ha Noi', '0', 'Bigh thuong');





