USE manager;

-- Question 1: lấy ra tất cả các phòng ban
SELECT 
    *
FROM
    department;
    
-- Question 2: lấy ra id của phòng ban có tên là "Sale"
SELECT 
    *
FROM
    department
WHERE
    DepartmentName = 'Sale';
    
-- Question 3: lấy ra thông tin account có full name dài nhất
SELECT 
    Fullname,CHAR_LENGTH(fullname) as so_luong_ky_tu
FROM
    account
ORDER BY CHAR_LENGTH(fullname) DESC
LIMIT 1;

-- Question 4: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT 
    GroupName,CreateDate
FROM
    groupp
WHERE
    CreateDate < '2019-12-20';
    
-- Question 5: Lấy ra ID của question có >= 4 câu trả lời
SELECT 
    q.QuestionID,count(a.answerID) as so_cau_tra_loi
FROM
    question q
        JOIN
    answer a ON q.QuestionID = a.QuestionID
GROUP BY q.QuestionID
HAVING so_cau_tra_loi >= 4
;

-- Question 6: Lấy ra 5 group được tạo gần đây nhất
SELECT 
    *
FROM
    groupp
ORDER BY CreateDate DESC
LIMIT 5;

-- Question 8: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM exam 
WHERE
    CreateDate < '2019-12-20';
    
-- Question 9: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE account 
SET 
    Fullname = 'Nguyễn Bá Lộc',
    Email = 'loc.nguyenba@vti.com.vn'
WHERE
    AccountID = 5;
    
-- Question 10: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT 
    a.FullName, d.DepartmentName
FROM
    account a
        JOIN
    department d ON d.DepartmentID = a.DepartmentID;
    
-- Question 11: Viết lệnh để lấy ra tất cả các developer
SELECT 
    a.FullName, p.PositionName
FROM
    account a
        JOIN
    positionn p ON p.PositionID = a.PositionID
WHERE
    p.PositionName = 'Dev';
    
-- Question 12: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT 
    count(*) as so_nhan_vien, d.DepartmentName
FROM
    account a
        JOIN
    department d ON d.DepartmentID = a.DepartmentID
GROUP BY d.DepartmentName
HAVING so_nhan_vien > 3;

-- Question 13: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT 
    COUNT(*) AS so_lan_su_dung, q.Content
FROM
    question q
        JOIN
    examquestion e ON e.QuestionID = q.QuestionID
        JOIN
    exam ON exam.ExamID = e.ExamID
GROUP BY q.Content
ORDER BY so_lan_su_dung DESC
LIMIT 1;

-- Question 14: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT 
    COUNT(q.CategoryID) AS lan_su_dung, c.CategoryName
FROM
    question q
        RIGHT JOIN
    categoryquestion c ON c.CategoryID = q.CategoryID
GROUP BY c.CategoryName
ORDER BY lan_su_dung;

-- Question 15: Lấy ra Question có nhiều câu trả lời nhất
SELECT 
    COUNT(*) so_luong_cau_tra_loi, q.Content
FROM
    question q
        JOIN
    answer a ON a.QuestionID = q.QuestionID
GROUP BY q.QuestionID
ORDER BY so_luong_cau_tra_loi DESC
LIMIT 1;

-- Question 16: Tìm chức vụ có ít người nhất 
SELECT 
    COUNT(*) AS so_luong_nguoi, p.PositionName
FROM
    account a
        JOIN
    positionn p ON p.PositionID = a.PositionID
GROUP BY a.PositionID
ORDER BY so_luong_nguoi
LIMIT 1;

-- Question 17: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT 
    p.PositionName, COUNT(a.PositionID) AS so_luong
FROM
    department d
        JOIN
    account a ON d.DepartmentID = a.DepartmentID
        RIGHT JOIN
    positionn p ON p.PositionID = a.PositionID
GROUP BY p.PositionName;

-- Question 18: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT 
    q.QuestionID,
    q.Content,
    t.TypeName,
    q.CreatorID,
    IFNULL(a.Content, 'No answer') AS answer
FROM
    TypeQuestion t
        JOIN
    question q ON t.TypeID = q.TypeID
        LEFT JOIN
    answer a ON a.QuestionID = q.QuestionID;
    
-- Question 19: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT 
    COUNT(q.TypeID) AS so_luong, t.typename
FROM
    TypeQuestion t
        LEFT JOIN
    question q ON t.TypeID = q.TypeID
GROUP BY t.typename;
