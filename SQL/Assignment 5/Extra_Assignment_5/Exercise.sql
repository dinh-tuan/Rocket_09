use project_manager;


DROP TRIGGER IF EXISTS trigger_batloithongtinkhonghople;
DELIMITER $$
CREATE TRIGGER trigger_batloithongtinkhonghople 
BEFORE INSERT ON project_modules
FOR EACH ROW 
BEGIN 
	DECLARE V_ProjectStartDate, V_ProjectCompletedOne DATE;
	SELECT 
		ProjectStartDate, ProjectCompletedOne
	INTO V_ProjectStartDate , V_ProjectCompletedOne FROM
		Projects
	WHERE
		ProjectID = NEW.ProjectID;

	IF NEW.ProjectModulesDate < V_ProjectStartDate
		OR NEW.ProjectModulesComepledOn > V_ProjectCompletedOne THEN 
		signal sqlstate '45000'
		SET MESSAGE_TEXT = 'không thể insert vì Date không hợp lệ';
	END IF;
END $$
DELIMITER ;

INSERT INTO project_modules
VALUES (12,5,'2020-05-05','2020-09-01','auto');