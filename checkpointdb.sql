-- Creating a database of contacts linking four tables together

DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS contact_types;
DROP TABLE IF EXISTS contact_categories;
DROP TABLE IF EXISTS items;


-- TABLE CONTACTS

CREATE TABLE contacts (
id SERIAL PRIMARY KEY,
first_name VARCHAR (30) NOT NULL,
last_name VARCHAR (30) NOT NULL,
title VARCHAR (20),
organisation VARCHAR (30)
);

INSERT INTO contacts (
first_name, last_name, title, organisation)
VALUES 
	('Erik', 'Eriksson', 'Teacher', 'Utbildning AB'),
	('Anna', 'Sundh', ' ' , ' '),
	('Goran', 'Bregovic', 'Coach', 'Dalens IK'),
	('Ann-Marie', 'Bergqvist', 'Cousin', ' '),
	('Herman', 'Appelkvist', ' ', ' ')
;


-- TABLE CONTACT_TYPES

CREATE TABLE contact_types (
	id SERIAL PRIMARY KEY,
	contact_type VARCHAR (15)
	);
	
INSERT INTO contact_types (contact_type) 
VALUES ('Email'), ('Phone'), ('Skype'), ('Instagram');



-- TABLE CONTACT_CATEGORIES

CREATE TABLE contact_categories (
	id SERIAL PRIMARY KEY,
	contact_category VARCHAR (10)
	);
	
INSERT INTO contact_categories (contact_category) 
VALUES ('Home'), ('Work'), ('Fax');


-- CREATE RELATIONAL TABLE ITEMS	
	
CREATE TABLE items (
	contact VARCHAR (100),
	contact_id INT,
	contact_type_id INT,
	contact_category_id INT,
	FOREIGN KEY (contact_id) REFERENCES contacts(id),
	FOREIGN KEY (contact_type_id) REFERENCES contact_types(id),
	FOREIGN KEY (contact_category_id) REFERENCES contact_categories(id)
	);

INSERT INTO items VALUES
	('011-12 33 45', 3, 2,1),
	('goran@infoab.se', 3,1,2),
	('010-88 55 44', 4,2,2),
	('erik57@hotmail.com', 1,1,1),
	('@annapanna99', 2,4,1),
	('077-563578', 2,2,1),
	('070-156 22 78', 3, 2, 2);
	

-- 5. Inserting 2 more rows into contacts table

INSERT INTO contacts (
first_name, last_name, title, organisation)
VALUES 
	('Yatwan', 'Hui', 'Data Analyst', 'AW Academy'),
	('Hans', 'Rosling', 'Author' , 'Rosling Foundation');


-- 6. Create a query that lists if there are unused contact_types

SELECT * FROM contact_types
JOIN items ON contact_type_id = id
WHERE contact_category_id NOT IN ('1','2','3','4');


-- 7. Create a VIEW view_contacts that lists the columns first_name, last_name, contact, contact_type, contact_cateogry

CREATE VIEW view_contacts AS
	SELECT contacts.first_name, contacts.last_name, items.contact, contact_types.contact_type, contact_categories.contact_category FROM items
	JOIN contacts ON contact_id = contacts.id
	JOIN contact_types ON items.contact_id = contact_types.id
	JOIN contact_categories ON items.contact_category_id = contact_categories.id;
	
	
-- 8. Create a query that lists all informatino from the database into 1 big resulting table
-- id columns should be visible in the result


SELECT contacts.id AS contact_id, first_name, last_name, title, organisation, 
contact, contact_types.id AS contact_type_id, 
contact_type, contact_categories.id AS contact_category_id, contact_category FROM items
JOIN contacts ON contact_id = contacts.id
JOIN contact_types ON contact_type_id = contact_types.id
JOIN contact_categories ON contact_category_id = contact_categories.id;