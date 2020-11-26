CREATE DATABASE Trainee;

USE trainee;

DROP TABLE IF EXISTS trainee;

CREATE TABLE trainee (
    TraineeID 			INT 					AUTO_INCREMENT,
    Full_Name			VARCHAR(255),
    Birth_Date 			DATE,
    Gender 				ENUM('Male','Female','unknown'),
    ET_IQ 				TINYINT 				UNSIGNED,
    ET_Gmath			TINYINT 				UNSIGNED,
    ET_English 			TINYINT 				UNSIGNED,
    Training_Class		VARCHAR(255),
    Evaluation_Notes 	VARCHAR(8000),
    PRIMARY KEY (TraineeID)
);

ALTER TABLE trainee 
ADD COLUMN VTI_Account VARCHAR(255) UNIQUE NOT NULL;

ALTER TABLE trainee 
DROP COLUMN VTI_Account;