-- Exercise 2: Data Types
CREATE TABLE Student (
    id_student 		INT AUTO_INCREMENT,
    Name_student 	VARCHAR(50),
    Code 			CHAR(5),
    Study_time 		DATE,
    PRIMARY KEY (id_student)
);

-- Exercise 3: Data Types (2)
CREATE TABLE Staff (
    id 				INT AUTO_INCREMENT,
    name_st 		VARCHAR(50),
    Birth_date 		DATE,
    Gender 			Boolean,
    IsDeletedFlag 	Boolean
);
