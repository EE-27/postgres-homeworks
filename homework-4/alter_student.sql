-- 1. Create a table student with student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student
(
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
)

-- 2. Add to table student column middle_name varchar

ALTER TABLE student ADD COLUMN middle_name varchar;

-- 3. Delete column middle_name
ALTER TABLE student DROP COLUMN middle_name;

-- 4. Rename column birthday в birth_date
ALTER TABLE student RENAME COLUMN birthday TO birth_day;

-- 5. Change the data type of the column phone на varchar(32)
ALTER TABLE students ALTER COLUMN phone SET DATA TYPE varchar(32);

-- 6. Insert any three records with autogenerated identifier
INSERT INTO student (first_name, last_name, birth_day, phone) VALUES
('Jan', 'Novák', '1.1.1991', '+420123456789'),
('Petr', 'Zmrdeček', '28.5.1995', '+421123456789'),
('Pepa', 'Zdepa', '15.12.1984', '+420147896325');

-- 7. Delete all data from the table and reset the identifier to the initial state
TRUNCATE TABLE student RESTART IDENTITY;