use manager;

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE OR REPLACE VIEW view_sale AS
    SELECT 
        a.fullname, d.DepartmentName
    FROM
        account a
            JOIN
        department d ON d.departmentID = a.departmentID
    WHERE
        d.DepartmentName = 'Sale';
        
SELECT 
    *
FROM
    view_sale;
    
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE OR REPLACE VIEW view_account AS
    SELECT 
        a.fullname, COUNT(gr.GroupID) AS so_group_tham_gia
    FROM
        groupp g
            JOIN
        groupaccount gr ON g.GroupID = gr.GroupID
            RIGHT JOIN
        account a ON a.AccountID = gr.AccountID
    GROUP BY a.fullname
    ORDER BY so_group_tham_gia DESC
    LIMIT 1; 
    
    -- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
    CREATE OR REPLACE VIEW view_content_dai AS
    SELECT 
        QuestionID, Content
    FROM
        question
    WHERE
        CHAR_LENGTH(content) > 300;
        
drop view view_content_dai;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE OR REPLACE VIEW view_dep_nhieu_acc AS
    SELECT 
        d.DepartmentName, COUNT(a.departmentID) AS so_acc
    FROM
        department d
            LEFT JOIN
        account a ON d.departmentID = a.departmentID
    GROUP BY DepartmentName
    ORDER BY so_acc DESC
    LIMIT 1;
    