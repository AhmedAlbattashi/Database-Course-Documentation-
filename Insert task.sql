
CREATE DATABASE Task;
USE Task;


CREATE TABLE DEPARTMENT (
    DNUM INT PRIMARY KEY,
    DName NVARCHAR(60),
    SSN CHAR(9), -- Manager SSN
    MANGEMENT_HIRE_DATE DATE
);

CREATE TABLE EMPLOYEE (
    SSN CHAR(9) PRIMARY KEY,
    FNAME NVARCHAR(30),
    LNAME NVARCHAR(30),
    GENDER CHAR(1),
    BIRTHDATE DATE,
    SUPERVISOR CHAR(9),
    DNUM INT,
    FOREIGN KEY (SUPERVISOR) REFERENCES EMPLOYEE(SSN),
    FOREIGN KEY (DNUM) REFERENCES DEPARTMENT(DNUM)
);


ALTER TABLE DEPARTMENT
ADD CONSTRAINT FK_Manager FOREIGN KEY (SSN) REFERENCES EMPLOYEE(SSN);


CREATE TABLE DEPENDENT (
    Name NVARCHAR(60),
    SSN CHAR(9),
    GENDER CHAR(1),
    BIRTHDATE DATE,
    PRIMARY KEY (Name, SSN),
    FOREIGN KEY (SSN) REFERENCES EMPLOYEE(SSN)
);


CREATE TABLE PROJECT (
    PNUMBER INT PRIMARY KEY,
    PNAME NVARCHAR(50),
    LOCATION NVARCHAR(50),
    CITY NVARCHAR(50),
    DNUM INT,
    FOREIGN KEY (DNUM) REFERENCES DEPARTMENT(DNUM)
);


CREATE TABLE WORKON (
    SSN CHAR(9),
    PNUMBER INT,
    WORKINGHOUR INT,
    PRIMARY KEY (SSN, PNUMBER),
    FOREIGN KEY (SSN) REFERENCES EMPLOYEE(SSN),
    FOREIGN KEY (PNUMBER) REFERENCES PROJECT(PNUMBER)
);


CREATE TABLE DEPARTMENTLOC (
    LOCATION NVARCHAR(50),
    DNUM INT,
    PRIMARY KEY (LOCATION, DNUM),
    FOREIGN KEY (DNUM) REFERENCES DEPARTMENT(DNUM)
);


INSERT INTO DEPARTMENT VALUES (1, 'Human Resources', NULL, '2015-05-01');
INSERT INTO DEPARTMENT VALUES (2, 'Engineering', NULL, '2016-03-15');
INSERT INTO DEPARTMENT VALUES (3, 'Marketing', NULL, '2017-08-20');
INSERT INTO DEPARTMENT VALUES (4, 'Finance', NULL, '2014-01-01');
INSERT INTO DEPARTMENT VALUES (5, 'Sales', NULL, '2018-11-11');

SELECT * FROM DEPARTMENT

INSERT INTO EMPLOYEE VALUES ('111223333', 'John', 'Smith', 'M', '1980-04-12', NULL, 1);
INSERT INTO EMPLOYEE VALUES ('222334444', 'Jane', 'Doe', 'F', '1985-09-23', '111223333', 2);
INSERT INTO EMPLOYEE VALUES ('333445555', 'Mike', 'Brown', 'M', '1990-12-01', '111223333', 2);
INSERT INTO EMPLOYEE VALUES ('444556666', 'Emily', 'Davis', 'F', '1987-07-19', '222334444', 3);
INSERT INTO EMPLOYEE VALUES ('555667777', 'Chris', 'Wilson', 'M', '1992-03-30', '222334444', 4);

SELECT * FROM DEPARTMENT

UPDATE DEPARTMENT SET SSN = '111223333' WHERE DNUM = 1;
UPDATE DEPARTMENT SET SSN = '222334444' WHERE DNUM = 2;
UPDATE DEPARTMENT SET SSN = '444556666' WHERE DNUM = 3;
UPDATE DEPARTMENT SET SSN = '555667777' WHERE DNUM = 4;
UPDATE DEPARTMENT SET SSN = '333445555' WHERE DNUM = 5;


INSERT INTO dependent VALUES ('Anna', '111223333', 'F', '2010-01-15');
INSERT INTO dependent VALUES ('Bob', '222334444', 'M', '2012-06-25');
INSERT INTO dependent VALUES ('Charlie', '333445555', 'M', '2015-09-10');
INSERT INTO dependent VALUES ('Diana', '444556666', 'F', '2013-11-12');
INSERT INTO dependent VALUES ('Ella', '555667777', 'F', '2016-02-20');

SELECT * FROM dependent

INSERT INTO PROJECT VALUES (101, 'HR Onboarding', 'HQ', 'New York', 1);
INSERT INTO PROJECT VALUES (102, 'AI Research', 'Tech Center', 'San Francisco', 2);
INSERT INTO PROJECT VALUES (103, 'Ad Campaign', 'HQ', 'New York', 3);
INSERT INTO PROJECT VALUES (104, 'Financial Audit', 'Branch A', 'Chicago', 4);
INSERT INTO PROJECT VALUES (105, 'Sales Tracking', 'HQ', 'New York', 5);


INSERT INTO WORKON VALUES ('111223333', 101, 20);
INSERT INTO WORKON VALUES ('222334444', 102, 30);
INSERT INTO WORKON VALUES ('333445555', 102, 25);
INSERT INTO WORKON VALUES ('444556666', 103, 15);
INSERT INTO WORKON VALUES ('555667777', 105, 40);


INSERT INTO DEPARTMENTLOC VALUES ('HQ', 1);
INSERT INTO DEPARTMENTLOC VALUES ('Tech Center', 2);
INSERT INTO DEPARTMENTLOC VALUES ('Branch A', 4);
INSERT INTO DEPARTMENTLOC VALUES ('Branch B', 5);
INSERT INTO DEPARTMENTLOC VALUES ('Remote', 3);


SELECT * FROM EMPLOYEE;

SELECT FNAME, LNAME FROM EMPLOYEE
WHERE DNUM = (SELECT DNUM FROM DEPARTMENT WHERE DName = 'Engineering');


SELECT * FROM PROJECT WHERE CITY = 'New York';





UPDATE EMPLOYEE SET SUPERVISOR = '555667777' WHERE SSN = '333445555';

UPDATE PROJECT SET PNAME = 'Advanced AI Research' WHERE PNUMBER = 102;

DELETE FROM DEPENDENT WHERE Name = 'Charlie' AND SSN = '333445555';


DELETE FROM WORKON WHERE SSN = '333445555' AND PNUMBER = 102;

SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPENDENT;
SELECT * FROM PROJECT;
SELECT * FROM WORKON;
SELECT * FROM DEPARTMENTLOC;
