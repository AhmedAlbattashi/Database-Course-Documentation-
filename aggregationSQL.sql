CREATE Database CourseTask;

USE CourseTask;

CREATE TABLE Instructors ( 
    InstructorID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 
CREATE TABLE Categories ( 
    CategoryID INT PRIMARY KEY, 
    CategoryName VARCHAR(50) 
); 
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    Title VARCHAR(100), 
    InstructorID INT, 
    CategoryID INT, 
    Price DECIMAL(6,2), 
    PublishDate DATE, 
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID), 
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) 
); 
CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 
CREATE TABLE Enrollments ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    EnrollDate DATE, 
    CompletionPercent INT, 
    Rating INT CHECK (Rating BETWEEN 1 AND 5), 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 
SELECT * FROM Enrollments;
INSERT INTO Instructors VALUES 
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'), 
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21'); 
-- Categories 
INSERT INTO Categories VALUES 
(1, 'Web Development'), 
(2, 'Data Science'), 
(3, 'Business'); 
-- Courses 
INSERT INTO Courses VALUES 
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'), 
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'), 
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'), 
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01'); 
-- Students 
INSERT INTO Students VALUES 
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'), 
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'), 
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10'); 
-- Enrollments 
INSERT INTO Enrollments VALUES 
(1, 201, 101, '2023-04-10', 100, 5), 
(2, 202, 102, '2023-04-15', 80, 4), 
(3, 203, 101, '2023-04-20', 90, 4), 
(4, 201, 102, '2023-04-22', 50, 3), 
(5, 202, 103, '2023-04-25', 70, 4), 
(6, 203, 104, '2023-04-28', 30, 2), 
(7, 201, 104, '2023-05-01', 60, 3); 
SELECT * FROM Enrollments;



--Count total number of students
SELECT COUNT(*) AS TotalStudents FROM Students;

--Count total number of enrollments
SELECT COUNT(*) AS TotalEnrollments FROM Enrollments;

--Find average rating of each course
  SELECT 
    CourseID, 
    AVG(Rating) AS AvgRating 
FROM Enrollments 
GROUP BY CourseID;


--Total number of courses per instructor
SELECT 
    InstructorID, 
    COUNT(*) AS TotalCourses 
FROM Courses 
GROUP BY InstructorID;

--Number of courses in each category
SELECT 
    CategoryID, 
    COUNT(*) AS CoursesInCategory 
FROM Courses 
GROUP BY CategoryID;

--Number of students enrolled in each course
SELECT 
    CourseID, 
    COUNT(StudentID) AS StudentCount 
FROM Enrollments 
GROUP BY CourseID;

--Average course price per category
SELECT 
    CategoryID, 
    AVG(Price) AS AvgPrice 
FROM Courses 
GROUP BY CategoryID;


--Maximum course price
SELECT 
    MAX(Price) AS MaxPrice 
FROM Courses;

--Min, Max, and Avg rating per course
SELECT 
    CourseID, 
    MIN(Rating) AS MinRating, 
    MAX(Rating) AS MaxRating, 
    AVG(Rating) AS AvgRating 
FROM Enrollments 
GROUP BY CourseID;

--Count how many students gave rating = 5
SELECT 
    COUNT(*) AS RatingFiveCount 
FROM Enrollments 
WHERE Rating = 5;

