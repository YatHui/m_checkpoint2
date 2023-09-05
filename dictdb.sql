-- MASTERY CHECKPOINT 2
-- TASK 3 PYTHON & SQL

-- Database: dictdb
DROP DATABASE IF EXISTS dictdb;

CREATE DATABASE dictdb
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United Kingdom.1252'
    LC_CTYPE = 'English_United Kingdom.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
-- 3.1 CREATE A TABLE THAT STORES AN ENGLISH WORD AND ITS SWEDISH TRANSLATION

CREATE TABLE dictionary (
	id SERIAL PRIMARY KEY,
	word VARCHAR (50) NOT NULL UNIQUE,
	translation VARCHAR (50));
	
	
INSERT INTO dictionary (word, translation) VALUES
	('hello', 'hej'),
	('goodbye', 'hejdå');
