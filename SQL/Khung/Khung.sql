-- create db
DROP DATABASE IF EXISTS DB_name;

CREATE DATABASE DB_Name;

USE DB_NAME;

-- create table
DROP TABLE IF EXISTS table_name;

CREATE TABLE IF NOT EXISTS table_name
(
);

-- create procedure
DROP PROCEDURE IF EXISTS procedure_name;

DELIMITER $$
CREATE PROCEDURE procedure_name()
BEGIN 
END$$
DELIMITER ;

-- create function
DROP FUNCTION IF EXISTS function_name;

DELIMITER $$
CREATE FUNCTION procedure_name() RETURNS INT DETERMINISTIC
BEGIN 
DECLARE v_output int;
RETURN v_output;
END$$
DELIMITER ;

-- create trigger
DROP TRIGGER IF EXISTS trigger_NAME;

DELIMITER $$
CREATE TRIGGER trigger_NAME
BEFORE INSERT ON table_name
FOR EACH ROW
BEGIN
END$$
DELIMITER ;


