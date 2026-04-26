DROP DATABASE IF EXISTS smart_placement;
CREATE DATABASE smart_placement;

USE smart_placement;


-- TABLES

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    branch VARCHAR(50),
    cgpa DECIMAL(3,2) CHECK (cgpa BETWEEN 0 AND 10)
);



CREATE TABLE skills (
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    skill_name VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);

CREATE TABLE certifications (
    cert_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    cert_name VARCHAR(150),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);

CREATE TABLE internships (
    internship_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    company_name VARCHAR(100),
    duration_months INT CHECK (duration_months >= 0),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);

CREATE TABLE companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100),
    min_cgpa DECIMAL(3,2),
    package_lpa DECIMAL(6,2)
);

CREATE TABLE jobs (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT,
    required_skill VARCHAR(100),
    FOREIGN KEY (company_id) REFERENCES companies(company_id) ON DELETE CASCADE
);



-- 100 STUDENTS

INSERT INTO students (name, email, branch, cgpa) VALUES
('Rahul Sharma','rahul1@gmail.com','CSE',8.50),
('Anita Verma','anita1@gmail.com','CSE',9.10),
('Vikas Singh','vikas1@gmail.com','IT',7.80),
('Priya Mehta','priya1@gmail.com','CSE',8.90),
('Arjun Patel','arjun1@gmail.com','CSE',9.30),
('Sneha Kapoor','sneha1@gmail.com','IT',8.70),
('Rohit Yadav','rohit1@gmail.com','CSE',7.90),
('Kavya Sharma','kavya1@gmail.com','ECE',8.20),
('Manish Gupta','manish1@gmail.com','IT',6.90),
('Neha Singh','neha1@gmail.com','CSE',9.50),

('Amit Verma','amit1@gmail.com','ECE',8.40),
('Simran Kaur','simran1@gmail.com','IT',8.80),
('Aditya Rao','aditya1@gmail.com','CSE',7.50),
('Pooja Nair','pooja1@gmail.com','CSE',9.00),
('Riya Das','riya1@gmail.com','IT',8.60),
('Deepak Mishra','deepak1@gmail.com','CSE',8.10),
('Nitin Saxena','nitin1@gmail.com','IT',7.40),
('Sakshi Jain','sakshi1@gmail.com','ECE',9.20),
('Harsh Agrawal','harsh1@gmail.com','CSE',8.60),
('Tanya Bansal','tanya1@gmail.com','IT',8.30),

('Gaurav Tiwari','gaurav1@gmail.com','CSE',7.70),
('Mehul Shah','mehul1@gmail.com','ECE',8.00),
('Ishita Roy','ishita1@gmail.com','CSE',9.40),
('Varun Khanna','varun1@gmail.com','IT',7.20),
('Nikhil Arora','nikhil1@gmail.com','CSE',8.80),
('Ayesha Khan','ayesha1@gmail.com','IT',9.10),
('Rajat Malhotra','rajat1@gmail.com','ECE',8.50),
('Kunal Jain','kunal1@gmail.com','CSE',7.90),
('Divya Iyer','divya1@gmail.com','IT',9.30),
('Saurabh Pandey','saurabh1@gmail.com','CSE',8.20),

('Komal Gupta','komal1@gmail.com','ECE',8.70),
('Yash Thakur','yash1@gmail.com','IT',7.60),
('Rakesh Nair','rakesh1@gmail.com','CSE',8.40),
('Bhavya Choudhary','bhavya1@gmail.com','ECE',9.00),
('Alok Srivastava','alok1@gmail.com','IT',7.80),
('Pankaj Yadav','pankaj1@gmail.com','CSE',8.30),
('Ritu Sharma','ritu1@gmail.com','IT',9.20),
('Tarun Kapoor','tarun1@gmail.com','ECE',7.50),
('Neeraj Singh','neeraj1@gmail.com','CSE',8.60),
('Sonali Deshmukh','sonali1@gmail.com','IT',8.90),

('Ankur Sinha','ankur1@gmail.com','ECE',7.30),
('Rohini Pillai','rohini1@gmail.com','CSE',9.10),
('Mohit Chauhan','mohit1@gmail.com','IT',8.00),
('Snehal Patil','snehal1@gmail.com','ECE',8.80),
('Akash Dubey','akash1@gmail.com','CSE',7.90),
('Kriti Arora','kriti1@gmail.com','IT',9.40),
('Devansh Mehta','devansh1@gmail.com','ECE',8.20),
('Pratik Joshi','pratik1@gmail.com','CSE',8.70),
('Shubham Verma','shubham1@gmail.com','IT',7.60),
('Ananya Sen','ananya1@gmail.com','CSE',9.30),

('Rohan Malviya','rohan2@gmail.com','CSE',8.10),
('Nisha Kapoor','nisha2@gmail.com','IT',8.90),
('Tushar Jain','tushar2@gmail.com','ECE',7.80),
('Lavanya Iyer','lavanya2@gmail.com','CSE',9.00),
('Kartik Rana','kartik2@gmail.com','IT',8.20),
('Isha Arora','isha2@gmail.com','CSE',8.70),
('Hemant Joshi','hemant2@gmail.com','ECE',7.40),
('Mitali Sinha','mitali2@gmail.com','IT',9.10),
('Abhishek Roy','abhishek2@gmail.com','CSE',8.50),
('Shruti Menon','shruti2@gmail.com','ECE',8.60),

('Naveen Pillai','naveen2@gmail.com','IT',7.90),
('Tanvi Bhatia','tanvi2@gmail.com','CSE',9.20),
('Lokesh Kumar','lokesh2@gmail.com','ECE',8.00),
('Garima Saxena','garima2@gmail.com','IT',8.40),
('Madhav Soni','madhav2@gmail.com','CSE',7.70),
('Khushi Arora','khushi2@gmail.com','CSE',9.30),
('Uday Pratap','uday2@gmail.com','IT',8.10),
('Palak Jain','palak2@gmail.com','ECE',8.80),
('Chetan Rao','chetan2@gmail.com','CSE',7.60),
('Muskan Ali','muskan2@gmail.com','IT',9.00),

('Shivam Tiwari','shivam2@gmail.com','CSE',8.30),
('Aarushi Shah','aarushi2@gmail.com','ECE',8.50),
('Dhruv Goyal','dhruv2@gmail.com','IT',7.50),
('Megha Nair','megha2@gmail.com','CSE',9.40),
('Parth Chandra','parth2@gmail.com','ECE',8.10),
('Saloni Gupta','saloni2@gmail.com','IT',8.70),
('Keshav Bansal','keshav2@gmail.com','CSE',7.80),
('Ira Mishra','ira2@gmail.com','CSE',9.10),
('Vivek Shetty','vivek2@gmail.com','ECE',8.30),
('Payal Yadav','payal2@gmail.com','IT',8.60),

('Aman Choudhary','aman2@gmail.com','CSE',7.90),
('Rhea Kapoor','rhea2@gmail.com','IT',9.20),
('Siddharth Bose','siddharth2@gmail.com','ECE',8.40),
('Nandini Roy','nandini2@gmail.com','CSE',8.80),
('Manav Kulkarni','manav2@gmail.com','IT',7.70),
('Pallavi Reddy','pallavi2@gmail.com','CSE',9.00),
('Jatin Arora','jatin2@gmail.com','ECE',8.20),
('Zoya Sheikh','zoya2@gmail.com','IT',8.90),
('Rishabh Das','rishabh2@gmail.com','CSE',8.10),
('Sanya Mehta','sanya2@gmail.com','ECE',9.30),

('Nakul Sharma','nakul2@gmail.com','IT',7.80),
('Aditi Khanna','aditi2@gmail.com','CSE',9.10),
('Pranav Singh','pranav2@gmail.com','ECE',8.50),
('Diya Kapoor','diya2@gmail.com','IT',8.40),
('Yuvraj Sethi','yuvraj2@gmail.com','CSE',7.60),
('Mahima Paul','mahima2@gmail.com','CSE',9.20),
('Ritesh Jain','ritesh2@gmail.com','IT',8.00),
('Sara Thomas','sara2@gmail.com','ECE',8.70),
('Omkar Desai','omkar2@gmail.com','CSE',8.30),
('Vidhi Chauhan','vidhi2@gmail.com','IT',9.00);

-- 100 SKILLS

INSERT INTO skills (student_id, skill_name) VALUES
(1,'Java'),(2,'Python'),(3,'SQL'),(4,'Machine Learning'),
(5,'C++'),(6,'Python'),(7,'Java'),(8,'VLSI'),
(9,'SQL'),(10,'Deep Learning'),
(11,'Embedded Systems'),(12,'Data Analytics'),
(13,'Cyber Security'),(14,'Cloud Computing'),
(15,'React'),(16,'NodeJS'),
(17,'Java'),(18,'VLSI'),
(19,'Python'),(20,'SQL'),
(21,'C++'),(22,'Machine Learning'),
(23,'AI'),(24,'JavaScript'),
(25,'Cloud Computing'),(26,'Data Science'),
(27,'Java'),(28,'Python'),
(29,'SQL'),(30,'AI'),
(31,'Machine Learning'),(32,'Cyber Security'),
(33,'JavaScript'),(34,'React'),
(35,'NodeJS'),(36,'Python'),
(37,'SQL'),(38,'AI'),
(39,'Cloud Computing'),(40,'Data Analytics'),
(41,'C++'),(42,'Machine Learning'),
(43,'AI'),(44,'Java'),
(45,'Python'),(46,'SQL'),
(47,'Cloud'),(48,'Cyber Security'),
(49,'Data Science'),(50,'DevOps'),

(51,'Java'),(52,'Python'),(53,'Embedded Systems'),(54,'Machine Learning'),
(55,'SQL'),(56,'React'),(57,'VLSI'),(58,'Data Science'),
(59,'Cloud Computing'),(60,'Embedded Systems'),
(61,'JavaScript'),(62,'AI'),(63,'VLSI'),(64,'SQL'),
(65,'C++'),(66,'Deep Learning'),(67,'Python'),(68,'VLSI'),
(69,'Java'),(70,'Cloud'),
(71,'Data Analytics'),(72,'Embedded Systems'),(73,'Cyber Security'),
(74,'Machine Learning'),(75,'VLSI'),(76,'Python'),
(77,'Java'),(78,'AI'),(79,'Embedded Systems'),(80,'SQL'),
(81,'Cloud Computing'),(82,'Data Science'),(83,'VLSI'),
(84,'Machine Learning'),(85,'JavaScript'),(86,'AI'),
(87,'Embedded Systems'),(88,'Python'),(89,'Java'),(90,'VLSI'),
(91,'SQL'),(92,'Machine Learning'),(93,'Cloud Computing'),
(94,'Data Science'),(95,'Java'),(96,'AI'),
(97,'SQL'),(98,'Embedded Systems'),(99,'DevOps'),(100,'Python');

-- 100 CERTIFICATIONS

INSERT INTO certifications (student_id, cert_name) VALUES
(1,'AWS'),(2,'Data Science'),(3,'Cyber Security'),(4,'AI'),
(5,'Oracle SQL'),(6,'AWS Architect'),(7,'Java Cert'),(8,'Embedded'),
(9,'DB Admin'),(10,'ML Expert'),
(11,'IoT'),(12,'Analytics Pro'),
(13,'Ethical Hacking'),(14,'Cloud Architect'),
(15,'Full Stack'),
(16,'AWS'),(17,'Java'),(18,'VLSI'),
(19,'Full Stack'),(20,'SQL'),
(21,'C++'),(22,'ML'),
(23,'AI'),(24,'Frontend'),
(25,'Cloud'),(26,'Data Science'),
(27,'Java'),(28,'Python'),
(29,'SQL'),(30,'AI'),
(31,'ML'),(32,'Security'),
(33,'JS'),(34,'React'),
(35,'Node'),(36,'Python'),
(37,'SQL'),(38,'AI'),
(39,'Cloud'),(40,'Analytics'),
(41,'C++'),(42,'ML'),
(43,'AI'),(44,'Java'),
(45,'Python'),(46,'SQL'),
(47,'Cloud'),(48,'Security'),
(49,'Data Science'),(50,'DevOps'),

(51,'Java Advanced'),(52,'Python Pro'),(53,'Embedded Systems'),
(54,'ML Engineer'),(55,'SQL Expert'),(56,'React Developer'),
(57,'VLSI Design'),(58,'Data Science'),(59,'AWS Cloud'),
(60,'IoT'),(61,'Frontend Pro'),(62,'AI Expert'),
(63,'Embedded Design'),(64,'Database Admin'),(65,'C++ Advanced'),
(66,'Deep Learning'),(67,'Python'),(68,'VLSI'),
(69,'Java'),(70,'Cloud Fundamentals'),
(71,'Analytics Pro'),(72,'Microcontrollers'),
(73,'Cyber Security'),(74,'Machine Learning'),
(75,'Chip Design'),(76,'Python Advanced'),
(77,'Core Java'),(78,'AI Specialist'),
(79,'Embedded C'),(80,'SQL Advanced'),
(81,'Cloud Architect'),(82,'Data Science Pro'),
(83,'VLSI Basics'),(84,'ML with Python'),
(85,'JavaScript Expert'),(86,'AI with TensorFlow'),
(87,'Embedded Linux'),(88,'Python for DS'),
(89,'Java SE'),(90,'VLSI Pro'),
(91,'SQL Server'),(92,'ML Advanced'),
(93,'AWS Solutions Architect'),(94,'Data Analytics'),
(95,'Java Programming'),(96,'AI Fundamentals'),
(97,'MySQL DBA'),(98,'IoT Systems'),
(99,'DevOps Engineer'),(100,'Python Full Stack');

-- 100 INTERNSHIPS

INSERT INTO internships (student_id, company_name, duration_months) VALUES
(1,'TCS',6),(2,'Infosys',4),(3,'Wipro',3),(4,'Google',6),
(5,'Amazon',5),(6,'Microsoft',6),(7,'Accenture',4),(8,'Intel',3),
(9,'HCL',4),(10,'Google',6),
(11,'Bosch',3),(12,'Deloitte',4),(13,'KPMG',2),(14,'IBM',5),
(15,'Flipkart',4),
(16,'TCS',3),(17,'Infosys',4),(18,'Intel',6),(19,'Flipkart',5),
(20,'Wipro',3),(21,'Capgemini',4),(22,'Google',6),(23,'HCL',3),
(24,'Amazon',6),(25,'Microsoft',5),
(26,'Bosch',4),(27,'Accenture',3),(28,'Deloitte',5),(29,'KPMG',4),
(30,'IBM',6),
(31,'Cisco',3),(32,'Zoho',4),(33,'Google',5),(34,'Amazon',6),
(35,'Infosys',3),(36,'TCS',4),(37,'Wipro',5),(38,'Capgemini',3),
(39,'Microsoft',6),(40,'Flipkart',4),
(41,'Google',5),(42,'Cisco',3),(43,'IBM',4),(44,'Amazon',6),
(45,'Accenture',3),(46,'Deloitte',5),(47,'Zoho',4),(48,'Intel',6),
(49,'Bosch',3),(50,'KPMG',4),

(51,'Tata Elxsi',4),(52,'Adobe',5),(53,'Samsung',3),(54,'Google',6),
(55,'Oracle',4),(56,'Flipkart',5),(57,'Intel',4),(58,'Fractal',6),
(59,'Microsoft',5),(60,'Bosch',4),
(61,'Infosys',3),(62,'Nvidia',6),(63,'Qualcomm',4),(64,'Deloitte',5),
(65,'Capgemini',3),(66,'Amazon',6),(67,'Wipro',4),(68,'Intel',5),
(69,'TCS',3),(70,'IBM',4),
(71,'Mu Sigma',5),(72,'Samsung',3),(73,'Cisco',4),(74,'Google',6),
(75,'Intel',5),(76,'Zoho',4),(77,'Accenture',3),(78,'Nvidia',6),
(79,'Bosch',4),(80,'KPMG',3),
(81,'Oracle',5),(82,'Fractal',4),(83,'Qualcomm',3),(84,'Microsoft',6),
(85,'Adobe',4),(86,'Google',5),(87,'Samsung',3),(88,'Amazon',6),
(89,'TCS',4),(90,'Intel',5),
(91,'Deloitte',4),(92,'Nvidia',6),(93,'IBM',5),(94,'Fractal',4),
(95,'Accenture',3),(96,'Google',6),(97,'KPMG',4),(98,'Bosch',3),
(99,'Zoho',5),(100,'Microsoft',6);

-- 100 COMPANIES

INSERT INTO companies (company_name, min_cgpa, package_lpa) VALUES
('Google',8.00,25.00),('Microsoft',8.50,22.00),('Amazon',8.00,20.00),
('TCS',7.00,6.00),('Infosys',7.50,8.00),('Wipro',7.00,5.50),
('Capgemini',7.00,7.00),('Deloitte',7.50,10.00),('KPMG',7.20,9.00),
('IBM',7.00,8.50),('Cisco',8.00,18.00),('Oracle',8.00,16.00),
('Adobe',8.50,28.00),('Goldman Sachs',9.00,30.00),('Morgan Stanley',9.00,32.00),
('Zoho',7.50,12.00),('Paytm',7.00,10.00),('PhonePe',7.50,14.00),
('Swiggy',7.00,11.00),('Zomato',7.00,10.00),
('Tech Mahindra',7.00,6.50),('L&T Infotech',7.20,7.80),
('Mindtree',7.50,8.20),('Mphasis',7.00,6.80),
('Hexaware',7.00,6.50),('Persistent',7.50,9.00),
('Cognizant',7.00,7.20),('SAP',8.00,18.00),
('Salesforce',8.50,25.00),('VMware',8.50,24.00),
('ServiceNow',8.50,23.00),('Atlassian',8.50,27.00),
('Freshworks',7.50,12.00),('Mu Sigma',7.00,8.00),
('Fractal',7.50,10.00),('Tata Elxsi',7.20,9.50),
('KPIT',7.00,8.00),('Birlasoft',7.00,7.00),
('Zensar',7.00,6.50),('Harman',8.00,19.00),
('Intel',8.50,28.00),('AMD',8.50,27.00),
('Dell',7.50,14.00),('HP',7.50,13.50),
('Uber',8.00,22.00),('Ola',7.00,12.00),
('Byjus',7.50,9.50),('Nvidia',9.00,35.00),
('Qualcomm',8.50,26.00),('Samsung',8.00,20.00),

('Bosch',7.50,11.00),('Flipkart',8.00,18.00),('Accenture',7.00,7.50),
('HCL',7.00,6.80),('NetApp',8.00,17.00),('Red Hat',8.20,19.00),
('Infosys BPM',6.80,5.00),('Tata Technologies',7.20,8.00),
('Mahindra Comviva',7.50,10.50),('Siemens',8.00,16.50),
('Nutanix',8.50,26.00),('Paypal',8.50,24.00),
('Juspay',8.00,21.00),('CRED',8.00,22.50),
('Razorpay',8.00,20.50),('InMobi',8.20,23.00),
('Urban Company',7.20,11.00),('BrowserStack',8.50,25.50),
('Postman',8.50,24.50),('ShareChat',7.80,16.00),
('Media.net',8.00,18.50),('Sprinklr',8.50,27.50),
('Airtel',7.20,9.50),('Jio',7.00,9.00),
('Reliance Retail',7.00,8.00),('Optum',7.50,12.50),
('American Express',8.20,19.50),('Barclays',8.00,17.50),
('HSBC',8.00,16.80),('DBS Bank',8.20,18.20),
('EY',7.20,8.50),('PwC',7.20,8.20),
('Bajaj Finserv',7.00,9.00),('Amdocs',7.00,8.00),
('NoBroker',7.20,10.00),('Meesho',7.50,14.50),
('Myntra',7.80,15.50),('CureFit',7.00,11.50),
('Upstox',8.00,18.00),('Groww',8.00,19.00),
('CoinDCX',7.80,17.00),('Vedantu',7.20,9.20),
('Unacademy',7.20,9.80),('Cars24',7.00,10.50),
('Oyo',7.00,9.00),('Licious',7.00,10.00),
('Nykaa',7.50,12.80),('Pepperfry',7.00,8.80),
('BookMyShow',7.50,11.20),('MakeMyTrip',7.80,14.20);

-- 100 JOBS


-- VIEW

CREATE VIEW high_cgpa_students AS
SELECT name, branch, cgpa
FROM students
WHERE cgpa >= 8;

-- PROCEDURE

DELIMITER //
CREATE PROCEDURE GetTopStudents()
BEGIN
    SELECT * FROM students ORDER BY cgpa DESC LIMIT 5;
END //
DELIMITER ;

-- TRIGGER

DELIMITER //
CREATE TRIGGER validate_cgpa
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    IF NEW.cgpa > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'CGPA cannot exceed 10';
    END IF;
END //
DELIMITER ;

-- INDEXES

CREATE INDEX idx_students_cgpa ON students(cgpa);
CREATE INDEX idx_skill_name ON skills(skill_name);

-- TEST

SELECT * FROM students;
SELECT name FROM students;
SELECT name, cgpa FROM students;
SELECT * FROM students WHERE cgpa > 8;
SELECT * FROM students WHERE cgpa < 8;
SELECT * FROM students WHERE cgpa BETWEEN 7 AND 9;
SELECT * FROM students WHERE branch='CSE';
SELECT * FROM students WHERE branch='IT';
SELECT * FROM students WHERE branch='ECE';
SELECT * FROM students ORDER BY cgpa;
SELECT * FROM students ORDER BY cgpa DESC;
SELECT * FROM students LIMIT 5;
SELECT * FROM students LIMIT 10;
SELECT COUNT(*) FROM students;
SELECT AVG(cgpa) FROM students;
SELECT MAX(cgpa) FROM students;
SELECT MIN(cgpa) FROM students;
SELECT branch, COUNT(*) FROM students GROUP BY branch;
SELECT branch, AVG(cgpa) FROM students GROUP BY branch;
SELECT * FROM students WHERE name LIKE 'A%';

SELECT * FROM skills;
SELECT DISTINCT skill_name FROM skills;
SELECT COUNT(*) FROM skills;
SELECT skill_name, COUNT(*) FROM skills GROUP BY skill_name;
SELECT * FROM skills WHERE skill_name='Python';
SELECT * FROM skills WHERE skill_name='Java';
SELECT * FROM skills WHERE skill_name='SQL';
SELECT * FROM skills WHERE skill_name LIKE '%AI%';
SELECT student_id FROM skills WHERE skill_name='Python';
SELECT student_id FROM skills WHERE skill_name='Java';

SELECT * FROM certifications;
SELECT DISTINCT cert_name FROM certifications;
SELECT COUNT(*) FROM certifications;
SELECT * FROM certifications WHERE cert_name LIKE '%AWS%';
SELECT * FROM certifications WHERE cert_name LIKE '%AI%';
SELECT student_id FROM certifications WHERE cert_name='AWS';
SELECT student_id FROM certifications WHERE cert_name='Java';
SELECT cert_name, COUNT(*) FROM certifications GROUP BY cert_name;
SELECT * FROM certifications ORDER BY cert_name;
SELECT * FROM certifications LIMIT 10;

SELECT * FROM internships;
SELECT * FROM internships WHERE duration_months > 4;
SELECT * FROM internships WHERE duration_months < 4;
SELECT * FROM internships WHERE company_name='Google';
SELECT * FROM internships WHERE company_name='Amazon';
SELECT COUNT(*) FROM internships;
SELECT AVG(duration_months) FROM internships;
SELECT MAX(duration_months) FROM internships;
SELECT MIN(duration_months) FROM internships;
SELECT company_name, COUNT(*) FROM internships GROUP BY company_name;

SELECT * FROM companies;
SELECT * FROM companies WHERE package_lpa > 20;
SELECT * FROM companies WHERE package_lpa < 10;
SELECT * FROM companies WHERE min_cgpa >= 8;
SELECT * FROM companies WHERE min_cgpa <= 7;
SELECT * FROM companies ORDER BY package_lpa DESC;
SELECT * FROM companies ORDER BY package_lpa ASC;
SELECT COUNT(*) FROM companies;
SELECT AVG(package_lpa) FROM companies;
SELECT MAX(package_lpa) FROM companies;

SELECT * FROM jobs;
SELECT * FROM jobs WHERE required_skill='Python';
SELECT * FROM jobs WHERE required_skill='AI';
SELECT * FROM jobs WHERE required_skill='SQL';
SELECT COUNT(*) FROM jobs;
SELECT DISTINCT required_skill FROM jobs;
SELECT required_skill, COUNT(*) FROM jobs GROUP BY required_skill;
SELECT * FROM jobs ORDER BY job_id DESC;
SELECT * FROM jobs LIMIT 10;
SELECT company_id FROM jobs WHERE required_skill='Python';

SELECT s.name, sk.skill_name FROM students s JOIN skills sk ON s.student_id=sk.student_id;
SELECT s.name, c.cert_name FROM students s JOIN certifications c ON s.student_id=c.student_id;
SELECT s.name, i.company_name FROM students s JOIN internships i ON s.student_id=i.student_id;
SELECT s.name, sk.skill_name FROM students s JOIN skills sk ON s.student_id=sk.student_id WHERE sk.skill_name='Python';
SELECT s.name, sk.skill_name FROM students s JOIN skills sk ON s.student_id=sk.student_id WHERE sk.skill_name='Java';
SELECT s.name, c.cert_name FROM students s JOIN certifications c ON s.student_id=c.student_id WHERE c.cert_name LIKE '%AI%';
SELECT s.name, i.company_name FROM students s JOIN internships i ON s.student_id=i.student_id WHERE i.company_name='Google';
SELECT s.name, i.company_name FROM students s JOIN internships i ON s.student_id=i.student_id WHERE i.company_name='Microsoft';
SELECT s.name, s.cgpa, sk.skill_name FROM students s JOIN skills sk ON s.student_id=sk.student_id;
SELECT s.name, s.cgpa FROM students s WHERE s.cgpa>8;

SELECT s.name, sk.skill_name, c.company_name FROM students s JOIN skills sk ON s.student_id=sk.student_id JOIN jobs j ON sk.skill_name=j.required_skill JOIN companies c ON j.company_id=c.company_id;
SELECT s.name, s.cgpa, c.company_name FROM students s JOIN companies c ON s.cgpa>=c.min_cgpa;
SELECT s.name, s.cgpa FROM students s WHERE s.cgpa >= (SELECT min_cgpa FROM companies WHERE company_name='Google');
SELECT s.name, s.cgpa FROM students s WHERE s.cgpa >= (SELECT min_cgpa FROM companies WHERE company_name='Amazon');
SELECT s.name, s.cgpa FROM students s WHERE s.cgpa >= (SELECT min_cgpa FROM companies WHERE company_name='Microsoft');
SELECT c.company_name, COUNT(*) FROM jobs j JOIN companies c ON j.company_id=c.company_id GROUP BY c.company_name;
SELECT c.company_name, j.required_skill FROM companies c JOIN jobs j ON c.company_id=j.company_id;
SELECT s.name, c.company_name FROM students s JOIN internships i ON s.student_id=i.student_id JOIN companies c ON i.company_name=c.company_name;
SELECT s.name, COUNT(sk.skill_name) FROM students s JOIN skills sk ON s.student_id=sk.student_id GROUP BY s.name;
SELECT s.name, COUNT(c.cert_name) FROM students s JOIN certifications c ON s.student_id=c.student_id GROUP BY s.name;

SELECT s.name, COUNT(i.internship_id) FROM students s JOIN internships i ON s.student_id=i.student_id GROUP BY s.name;
SELECT s.name, MAX(i.duration_months) FROM students s JOIN internships i ON s.student_id=i.student_id GROUP BY s.name;
SELECT s.name, MIN(i.duration_months) FROM students s JOIN internships i ON s.student_id=i.student_id GROUP BY s.name;
SELECT s.name, AVG(i.duration_months) FROM students s JOIN internships i ON s.student_id=i.student_id GROUP BY s.name;
SELECT s.name, sk.skill_name, c.cert_name FROM students s JOIN skills sk ON s.student_id=sk.student_id JOIN certifications c ON s.student_id=c.student_id;
SELECT s.name FROM students s WHERE EXISTS (SELECT 1 FROM skills sk WHERE sk.student_id=s.student_id);
SELECT s.name FROM students s WHERE NOT EXISTS (SELECT 1 FROM skills sk WHERE sk.student_id=s.student_id);
SELECT * FROM students WHERE cgpa=(SELECT MAX(cgpa) FROM students);
SELECT * FROM students WHERE cgpa=(SELECT MIN(cgpa) FROM students);
SELECT * FROM students WHERE cgpa>(SELECT AVG(cgpa) FROM students);


