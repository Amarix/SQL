CREATE DATABASE STUDENT_DATABASE;

USE STUDENT_DATABASE;

CREATE TABLE student
(student_num INT Primary Key,
 student_name CHAR(30),
 adv_num INT );
 
 CREATE TABLE advisor
 (adv_num INT Primary Key,
 adv_name CHAR(30) );
 
 CREATE TABLE classes
 (crse_num CHAR(9) Primary Key,
 crse_desc CHAR(100),
 num_cred INT );
 
 CREATE TABLE student_transcript
 (student_num INT,
 crse_num CHAR(9),
 grade CHAR(1) );
 
 INSERT INTO student
 VALUES
 (800342124, 'Joe Beck', 800076565),
 (800217341, 'Ann Alda', 800025414),
 (800666154, 'Sue Dane', 800001136),
 (800134666, 'Bob Wall', 800025414),
 (800189871, 'Ava Best', 800001136),
 (800314321, 'Will Sneed', 800001136);

INSERT INTO advisor
VALUES
(800076565, 'Roy Cone'),
(800025414, 'Ian Jones'),
(800001136, 'Eva Thick');

INSERT INTO classes
VALUES
('ITCS3160', 'Database', 3),
('ITCS3166', 'Networks', 3),
('ITCS4102', 'Languages', 3),
('ITCS1213', 'Java', 4),
('ITCS1213L', 'Java Lab', 0),
('MATH1241', 'Calculus 1', 3),
('LBST1104', 'Films', 3),
('ITCS2215', 'Algorithms', 3),
('MATH1242', 'Calculus 2', 3),
('PSYC1101', 'Psychology', 3),
('PSYC1101L', 'Psych Lab', 1);

INSERT INTO student_transcript
VALUES
(800342124, 'ITCS3160', 'B'),
(800342124, 'ITCS3166', 'A'),
(800342124, 'ITCS4102', 'B'),
(800217341, 'ITCS1213', 'A'),
(800217341, 'ITCS12139', 'A'),
(800217341, 'MATH1241', 'C'),
(800217341, 'LBST1104', 'A'),
(800666154, 'ITCS2215', 'B'),
(800666154, 'MATH1242', 'D'),
(800666154, 'ITCS3160', 'A'),
(800134666, 'MATH1242', 'D'),
(800134666, 'ITCS3166', 'B'),
(800134666, 'ITCS4102', 'C'),
(800134666, 'ITCS3160', 'B'),
(800189871, 'ITCS1213', 'A'),
(800189871, 'ITCS1213L', 'A'),
(800189871, 'PSYC1101', 'C'),
(800189871, 'PSYC1101L', 'C'),
(800189871, 'LBST1104', 'B'),
(800314321, 'MATH1242', 'A'),
(800314321, 'ITCS3166', 'A'),
(800314321, 'ITCS4102', 'A'),
(800314321, 'ITCS3160', 'A');

