USE manager;

-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước
DROP TRIGGER IF EXISTS trigger_Q1 

DELIMITER $$
CREATE TRIGGER trigger_Q1
BEFORE INSERT ON groupaccount
FOR EACH ROW
BEGIN
	DECLARE V_CREATEDATE DATE;
			SELECT 
		CreateDate
	INTO V_CREATEDATE FROM
		groupp
	WHERE
		GroupID = NEW.GroupID;
    
	IF DATE_SUB(SYSDATE(),interval 1 year) > V_CREATEDATE THEN
    signal sqlstate '45000'
    SET MESSAGE_TEXT = 'Group này đã quá hạn để join';
    END IF;
END$$
DELIMITER ;

INSERT INTO groupaccount
VALUES (7,2,sysdate());


/*Question 2: 
	Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
 department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
 "Sale" cannot add more user"
*/

DROP TRIGGER IF EXISTS trigger_Q2

DELIMITER $$
CREATE TRIGGER trigger_Q2
BEFORE INSERT ON account
FOR EACH ROW 
BEGIN 
	DECLARE V_DepartmentID int;
    
	SELECT 
		DepartmentID
	INTO V_DepartmentID FROM
		Department
	WHERE
		DepartmentName = 'Sale'; 
        
	IF NEW.DepartmentID = V_DepartmentID THEN 
    signal sqlstate '45000'
    SET MESSAGE_TEXT = 'Department "Sale" cannot add more user';
    END IF;
END $$
DELIMITER ;

INSERT INTO `manager`.`account` (`AccountID`, `Email`, `Username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) 
VALUES ('12', 'minhphuong@gmail.com', 'minhphuong', 'Trịnh Minh Phương', '2', '3', '2020-10-10');

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS trigger_Q3_1;

DELIMITER $$
CREATE TRIGGER trigger_Q3_1
BEFORE INSERT ON groupaccount 
FOR EACH ROW 
BEGIN 
	DECLARE V_count int;
	SELECT 
		COUNT(*)
	INTO V_count FROM
		groupaccount
    WHERE groupID = NEW.GroupID
	GROUP BY GroupID;
    
    IF V_count > 5 THEN
    signal sqlstate '45000'
    SET MESSAGE_TEXT = 'Group này đã đủ user';
    END IF;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_Q3_2;

DELIMITER $$
CREATE TRIGGER trigger_Q3_2
BEFORE UPDATE ON groupaccount 
FOR EACH ROW 
BEGIN 
	DECLARE V_count int;
	SELECT 
		COUNT(*) INTO V_count
	FROM
		groupaccount
	WHERE groupID = NEW.GroupID
	GROUP BY GroupID;
    
    IF V_count > 5 THEN
    signal sqlstate '45000'
    SET MESSAGE_TEXT = 'Group này đã đủ user';
    END IF;
END $$
DELIMITER ;

INSERT INTO groupaccount
VALUES (8,8,sysdate()),
(8,9,sysdate());

INSERT INTO groupaccount
VALUES (7,8,sysdate()),
(7,1,sysdate()),
(7,2,sysdate()),
(7,3,sysdate()),
(7,4,sysdate()),
(7,5,sysdate());
UPDATE groupaccount 
SET 
    groupID = 7
WHERE
    AccountID = 8;

SELECT 
		COUNT(*)
	FROM
		groupaccount
	WHERE groupID = 7
	GROUP BY GroupID;

-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS trigger_Q3;

DELIMITER $$
CREATE TRIGGER trigger_Q3_1
BEFORE INSERT ON examquestion
FOR EACH ROW 
BEGIN 
	-- NHư bài 3
END $$
DELIMITER ;

/*Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
 admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
 còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông
 tin liên quan tới user đó
*/

DROP TRIGGER trigger_Q5 

DELIMITER $$
CREATE TRIGGER trigger_Q5
BEFORE DELETE ON account 
FOR EACH ROW
BEGIN
	IF OLD.Email = 'tuan@gmail.com'
    THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'đây là tài khoản chủ tịch';
    END IF;
END$$
DELIMITER ;

DELETE FROM account 
WHERE
    AccountID = 7;
    
/*Question 6: 
	Không sử dụng cấu hình default cho field DepartmentID của table
 Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
 vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
*/

DROP TRIGGER IF EXISTS trigger_Q6;

DELIMITER $$
CREATE TRIGGER trigger_Q6
BEFORE INSERT ON account 
FOR EACH ROW
BEGIN
	IF NEW.DepartmentID IS NULL
    THEN SET NEW.DepartmentID = (SELECT DepartmentID FROM department WHERE DepartmentName = 'Phòng chờ');
    END IF;
END$$
DELIMITER ;

-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi question, trong đó có tối đa 2 đáp án đúng.
DROP TRIGGER IF EXISTS trigger_Q7;

DELIMITER $$
CREATE TRIGGER trigger_Q7
BEFORE INSERT ON answer 
FOR EACH ROW
BEGIN
	DECLARE V_1,V_2 int;
	SELECT 
		COUNT(*)
	INTO V_1 FROM
		answer
	WHERE
		QuestionID = NEW.QuestionID;
	IF V_1 >= 4 THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'chỉ 4 answers cho mỗi question';
    END IF;
    
	SELECT 
		COUNT(*) INTO V_2
	FROM
		answer
	WHERE
		QuestionID = NEW.QuestionID
			AND isCorrect = TRUE;
    IF V_2 >= 2
    AND NEW.isCorrect = TRUE THEN 
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'chỉ 2 đáp án đúng';
    END IF; 
END$$
DELIMITER ;

/*Question 8:
	Viết trigger sửa lại dữ liệu cho đúng:
 Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định
 Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database
*/
-- account không có cột gender

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
DROP TRIGGER IF EXISTS trigger_Q9;
DELIMITER $$
CREATE TRIGGER trigger_Q9
BEFORE DELETE ON exam 
FOR EACH ROW
BEGIN
	IF OLD.CreateDate > date_sub(SYSDATE(), INTERVAL 2 DAY) THEN 
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'Không được phép xóa';		
    END IF;
END$$
DELIMITER ;