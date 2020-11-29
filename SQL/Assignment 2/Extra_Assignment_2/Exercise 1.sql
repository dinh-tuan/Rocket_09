USE trainee;

-- Question 1: Thêm ít nhất 10 bản ghi vào table
INSERT INTO trainee
VALUES (1, 'Đình Tuấn', '1999-07-23', 'Male', 20, 20, 50, 'A007', 'Perfect'),
(2, 'Bảo Anh', '1999-10-05', 'Male', 10, 10, 25, 'A007', 'Mischief'),
(3, 'Thùy Dương', '1999-12-03', 'Female', 14, 16, 45, 'A002', 'Docile'),
(4, 'Quỳnh Anh', '1999-12-10', 'Female', 10, 20, 15, 'A001', 'Docile'),
(5, 'Đình Tú', '2002-01-22', 'Male', 9, 10, 36, 'A004', 'Mischief'),
(6, 'Đậu Hiền', '1999-06-14', 'Female', 3, 10, 50, 'A002', 'Docile'),
(7, 'Đắc Công', '1999-01-01', 'Male', 10, 10, 16, 'A006', 'Mischief'),
(8, 'Trà My', '1999-03-05', 'Female', 12, 14, 35, 'A001', 'Docile'),
(9, 'Phan Ngọc', '1977-06-01', 'Female', 20, 20, 40, 'A003', 'Perfect'),
(10, 'Nguyễn Ngân', '1999-07-23', 'Female', 15, 12, 25, 'A005', 'Docile'),
(11, 'Nguyễn Thảo', '1999-11-19', 'Female', 1, 2, 25, 'A003', 'Mischief'),
(12, 'Phương Hoa', '1999-04-16', 'Female', 5, 2, 29, 'A004', 'Docile'),
(13, 'Đức Vượng', '1999-07-19', 'Male', 15, 12, 45, 'A005', 'Docile');

-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
SELECT 
    *
FROM
    trainee
ORDER BY MONTH(Birth_date);

-- Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
SELECT 
    *
FROM
    trainee
ORDER BY LENGTH(full_name) DESC
LIMIT 1;

/* Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
 ET_IQ + ET_Gmath>=20
 ET_IQ>=8
 ET_Gmath>=8
 ET_English>=18
*/ 

SELECT 
    *
FROM
    trainee
WHERE
    et_iq + et_gmath >= 20 AND et_iq >= 8
        AND et_gmath >= 8
        AND et_english >= 18;
        
-- Question 5: xóa thực tập sinh có TraineeID = 3
DELETE FROM trainee 
WHERE
    Trainee_id = 3;
    
-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database
UPDATE trainee 
SET 
    training_class = 'A002'
WHERE
    trainee_id = 5;
