use project_manager;

/*b) 
	Viết stored procedure (không có parameter) để Remove tất cả thông tin
project đã hoàn thành sau 3 tháng kể từ ngày hiện. In số lượng record đã
remove từ các table liên quan trong khi removing (dùng lệnh print)
*/

DELIMITER $$
create procedure delete_project_comple_after_three_month(out so_record_da_xoa int)
begin 
SELECT 
    COUNT(ProjectID)  
INTO so_record_da_xoa FROM
    projects
WHERE
    DATEDIFF(SYSDATE(),ProjectCompletedOne) > 90;
DELETE FROM projects 
WHERE
    DATEDIFF(SYSDATE(), ProjectCompletedOne) > 90;  
end$$
DELIMITER ;
  
-- c) Viết stored procedure (có parameter) để in ra các module đang được thực hiện
DELIMITER $$
create procedure select_module_co_out_p(IN p_ModuleID int,out out_p_moduleID int,out out_p_ProjecttModulesDescription varchar(100))
begin 
IF p_ModuleID NOT IN ( SELECT 
	ModuleID
FROM
    project_modules) THEN
SELECT  CONCAT('NO have module ', p_ModuleID ) AS 'No module';
ELSEIF p_ModuleID IN (SELECT 
    ModuleID
FROM
    project_modules
WHERE
    ProjectModulesComepledOn IS NULL
        AND p_ModuleID = ModuleID) THEN
SELECT 
    ProjecttModulesDescription, ProjectID
FROM
    project_modules
WHERE
    ProjectModulesComepledOn IS NULL
        AND p_ModuleID = ModuleID;
ELSE
SELECT  CONCAT('Module ', p_ModuleID ,' has done !!!') AS 'DONE';
END IF;
end$$
DELIMITER ;

-- c+) Viết stored procedure (có parameter) để in ra các thông tin module của project đang được thực hiện

DELIMITER $$
create procedure select_module_ko_out_p(IN p_ProjectID int)
begin 
IF p_ProjectID IN ( SELECT 
		pr.ProjectID
FROM
    project_modules p
		RIGHT JOIN
    projects pr ON pr.ProjectID = p.ProjectID
WHERE
    p.ProjectID IS NULL
        AND p_ProjectID = pr.ProjectID) THEN
SELECT  CONCAT('ProJeCT ', p_ProjectID ,' DONT HAVE A MODULE !!!') AS 'NO';
ELSEIF p_ProjectID IN ( SELECT 
    pr.ProjectID
FROM
    project_modules p
        RIGHT JOIN
    projects pr ON pr.ProjectID = p.ProjectID
WHERE
    p.ProjectModulesComepledOn IS NULL
        AND p_ProjectID = pr.ProjectID) THEN
SELECT 
    p.ProjecttModulesDescription, p.ModuleID
FROM
    project_modules p
        RIGHT JOIN
    projects pr ON pr.ProjectID = p.ProjectID
WHERE
    p.ProjectModulesComepledOn IS NULL
        AND p_ProjectID = pr.ProjectID;
ELSEIF p_ProjectID IN ( SELECT 
		pr.ProjectID
FROM
    project_modules p
		RIGHT JOIN
    projects pr ON pr.ProjectID = p.ProjectID
WHERE
    p.ProjectModulesComepledOn IS NOT NULL
        AND p_ProjectID = pr.ProjectID) THEN
SELECT  CONCAT('Module of the project ', p_ProjectID ,' has done !!!') AS 'DONE';
ELSE	
SELECT  CONCAT('NO PROJECT ', p_ProjectID ) AS 'ERROR';	
END IF;
end$$
DELIMITER ;


-- d) Viết hàm (có parameter) trả về thông tin 1 nhân viên đã tham gia làm mặc dù không ai giao việc cho nhân viên đó (trong bảng Works)
DELIMITER $$
create Function select_employee_join_work(p_EmployeeID int) returns varchar(255) DETERMINISTIC
begin 
DECLARE p_EmployeeLastName varchar(255);
SELECT 
    e.EmployeeLastName
INTO p_EmployeeLastName FROM
    employee e
        LEFT JOIN
    workdone w ON e.EmployeeID = w.EmployeeID
WHERE
    SupervisorID IS NULL
        AND e.EmployeeID = p_EmployeeID;
return p_EmployeeLastName;
end $$
DELIMITER ;

select select_employee_join_work(11111);

