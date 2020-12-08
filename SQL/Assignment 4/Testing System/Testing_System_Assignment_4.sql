use manager;

-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DELIMITER $$
CREATE PROCEDURE select_account(in p_DepartmentNAME int)
begin
SELECT 
    a.AccountID, a.Fullname
FROM
    account a
        RIGHT JOIN
    Department d ON d.DepartmentID = a.DepartmentID
WHERE
    d.DepartmentNAME = p_DepartmentNAME;
end $$
DELIMITER ;

-- 	Question 2: Tạo store để in ra số lượng account trong mỗi group
DELIMITER $$
CREATE PROCEDURE select_account_in_group()
begin
SELECT 
    g.GroupName,COUNT(gr.GroupID) AS so_luong_acc
FROM
    groupp g
        LEFT JOIN
    groupaccount gr ON g.GroupID = gr.GroupID
GROUP BY g.GroupID
ORDER BY so_luong_acc;
end $$
DELIMITER ;

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DELIMITER $$
CREATE PROCEDURE select_so_luong_typequestion_in_month_current()
begin
SELECT 
    t.TypeName, COUNT(q.QuestionID) AS so_luong_question
FROM
    question q
        RIGHT JOIN
    typequestion t ON q.TypeID = t.TypeID
WHERE
    MONTH(SYSDATE()) = MONTH(q.CreateDate)
        AND YEAR(SYSDATE()) = YEAR(q.CreateDate)
GROUP BY t.TypeID
ORDER BY so_luong_question;
end $$
DELIMITER ;

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DELIMITER $$
CREATE PROCEDURE select_id_cua_typequestion_co_nhieu_ques_nhat(out p_typeID int)
begin
SELECT 
	t.typeID INTO p_typeID
FROM
    question q
        RIGHT JOIN
    typequestion t ON q.TypeID = t.TypeID 
    GROUP BY t.typeID 
    HAVING count(q.typeID) = (SELECT 
	COUNT(q.typeID)
FROM
    question q
        RIGHT JOIN
    typequestion t ON q.TypeID = t.TypeID
GROUP BY t.TypeID
ORDER BY COUNT(q.typeID) DESC
LIMIT 1);
end $$
DELIMITER ;



-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
DELIMITER $$
CREATE PROCEDURE select_name_cua_typequestion_co_nhieu_ques_nhat(out p_typeNAME varchar(255))
begin
SELECT 
	t.typeNAME INTO p_typeNAME
FROM
    question q
        RIGHT JOIN
    typequestion t ON q.TypeID = t.TypeID 
    GROUP BY t.typeID 
    HAVING count(q.typeID) = (SELECT 
	COUNT(q.typeID)
FROM
    question q
        RIGHT JOIN
    typequestion t ON q.TypeID = t.TypeID
GROUP BY t.TypeID
ORDER BY COUNT(q.typeID) DESC
LIMIT 1);
end $$
DELIMITER ;

/*Question 6: 
	Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
 chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
 chuỗi của người dùng nhập vào
*/
DELIMITER $$
CREATE PROCEDURE select_chuoi (IN CHUOI VARCHAR(10))
	BEGIN
		SELECT Username
        FROM account
        WHERE Username LIKE concat('%', CHUOI, '%') UNION
        SELECT GroupName
        FROM groupp
        WHERE GroupName LIKE concat('%', CHUOI, '%');
	END$$
DELIMITER ;

-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán: username sẽ giống email nhưng bỏ phần @..mail đi positionID: sẽ có default là developer departmentID: sẽ được cho vào 1 phòng chờ Sau đó in ra kết quả tạo thành công
DELIMITER $$
CREATE PROCEDURE insert_info(in p_fullname varchar(255),in p_email varchar(255))
begin
INSERT INTO account (fullname,email)
VALUES (p_fullname,p_email);

UPDATE account 
SET 
    username = 	SUBSTRING_INDEX(p_email, "@", 1),
    PositionID = (SELECT 
    PositionID
FROM
    Positionn
WHERE
    PositionName = 'Dev')
WHERE
    Email = p_email
        AND fullname = p_fullname;
SELECT CONCAT('Đã thêm bạn ',p_fullname,' thành công vang dội') as 'Trạng Thái';
end $$
DELIMITER ;

-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
DELIMITER $$
CREATE PROCEDURE select_typename_co_content_dai_nhat(in p_typename ENUM('Essay','Multiple Choice'),out p_content varchar(255))
begin
SELECT 
    q.Content
INTO p_content FROM
    question q
        RIGHT JOIN
    typequestion t ON q.TypeID = t.TypeID
WHERE
    p_typename = t.typename
        AND CHAR_LENGTH(q.content) = (SELECT 
            CHAR_LENGTH(q.content)
        FROM
            question q
                RIGHT JOIN
            typequestion t ON q.TypeID = t.TypeID
        WHERE
            p_typename = t.typename
        ORDER BY CHAR_LENGTH(q.content) DESC
        LIMIT 1);
end $$
DELIMITER ;

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID

DELIMITER $$
CREATE PROCEDURE delete_exam_theo_id(in p_ExamID int)
begin
DELETE FROM exam 
WHERE
    p_ExamID = ExamID;
end $$
DELIMITER ;

/*Question 10: 
	Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
 dụng store ở câu 9 để xóa)
 Sau đó in số lượng record đã remove từ các table liên quan trong khi
 removing
*/

DELIMITER $$
CREATE PROCEDURE delete_exam(out so_record_da_xoa int)
begin
SELECT 
    COUNT(*) AS so_record_da_xoa
FROM
    examquestion eq
        JOIN
    exam e ON eq.ExamID = e.ExamID
WHERE
    DATE_SUB(SYSDATE(), interval 3 year) >= e.createDATE;
    
DELETE FROM exam 
WHERE 
    DATE_SUB(SYSDATE(), interval 3 year) >= e.createDATE;
end $$
DELIMITER ;

/*Question 11: 
	Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
 nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
 chuyển về phòng ban default là phòng ban chờ việc
*/
DELIMITER $$
CREATE PROCEDURE delete_department(in p_DepartmentName varchar(255))
begin
DELETE FROM
    department 
WHERE
    DepartmentName = p_DepartmentName;
end $$
DELIMITER ;

-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay
DELIMITER $$
CREATE PROCEDURE select_cau_hoi_moi_thang()
begin
SELECT 
    MONTH(CreateDate) as tháng,count(*) as so_cau_hoi_trong_nam_nay
FROM
    question
WHERE
	YEAR(SYSDATE()) = YEAR(CreateDate)
GROUP BY MONTH(CreateDate)
ORDER BY so_cau_hoi_trong_nam_nay;
end $$
DELIMITER ;

/*Question 13:
	Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
(Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")
*/
DELIMITER $$
CREATE PROCEDURE select_so_cau_hoi_trong_6_thang_gan_nhat()
begin
SELECT A.* FROM (SELECT 
    MONTH(CreateDate) as thang,COUNT(MONTH(CreateDate)) AS so_cau_hoi_trong_nam_nay
FROM
    question 
WHERE
    DATE_SUB(SYSDATE(), INTERVAL 5 MONTH) <= createDATE
GROUP BY MONTH(CreateDate)
ORDER BY so_cau_hoi_trong_nam_nay) AS A;

INSERT INTO A(thang)
VALUES (MONTH(SYSDATE()),
        MONTH(DATE_SUB(SYSDATE(), INTERVAL 1 MONTH)),
        MONTH(DATE_SUB(SYSDATE(), INTERVAL 2 MONTH)),
        MONTH(DATE_SUB(SYSDATE(), INTERVAL 3 MONTH)),
        MONTH(DATE_SUB(SYSDATE(), INTERVAL 4 MONTH)),
        MONTH(DATE_SUB(SYSDATE(), INTERVAL 5 MONTH)));
end $$
DELIMITER ;

SELECT DATE_SUB(SYSDATE(), INTERVAL 5 MONTH);