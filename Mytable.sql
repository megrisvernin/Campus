--Drop Database MyTables
--Create Database MyTables

USE MyTables
CREATE TABLE [Semester] (
  [SemesterID] Int,
  [Name] varchar(30),
  [StartDate] Date,
  [EndDate] Date,
  PRIMARY KEY ([SemesterID])
);

CREATE TABLE [Course] (
  [CourseID] Int Identity(1,1),
  [Name] varchar(30),
  [Credits] Int,
  PRIMARY KEY ([CourseID])
);

CREATE TABLE [Major] (
  [MajorID] Int Identity(1,1),
  [Name] varchar(30),
  [CreditsToGrad] Int,
  PRIMARY KEY ([MajorID])
);

CREATE TABLE [Student] (
  [StudentID] Int Identity(1,1),
  [MajorID] Int,
  [FirstName] varchar(30),
  [LastName] varchar(30),
  [Age] Int,
  [HasFinancialAid] Bit,
  [Email] varchar(30),
  PRIMARY KEY ([StudentID])
);

CREATE TABLE [Enrollment] (
  [ScheduledClassID] Int Identity(1,1),
  [StudentID] Int Not NULL,
  [CourseID] Int Not Null,
  [SemesteriD] Int Not NULL,
  [ClassLocationID] Int,
  [DateEnrolled] Datetime Default GetDate(),
  [GradePoint] Int,
  PRIMARY KEY ([ScheduledClassID])
);

CREATE TABLE [ClassLocation] (
  [ClassLocationID] Int Identity (1,1),
  [Address] varchar(100),
  [RoomNumber] Int,
  [DaysoftheWeek] varchar(7),
  [Startime] Time,
  [DurationTimes] Int,
  [StudentCapacity] Int ,
  PRIMARY KEY ([ClassLocationID])
);


ALTER TABLE Major
ALTER COLUMN Name Varchar(30) NOT NULL;

ALTER TABLE Major
ADD CONSTRAINT UniqueName Unique(Name)

ALTER TABLE Major
ADD CONSTRAINT Name_Default Default 1 for Name

ALTER TABLE Student 
ALTER COLUMN FirstName Varchar(30) NOT NULL

ALTER TABLE Student 
ALTER COLUMN LastName Varchar(30) NOT NULL

ALTER TABLE Student 
ALTER COLUMN HasFinancialAid Bit NOT NULL

ALTER TABLE Student 
ALTER COLUMN Email Varchar(30) NOT NULL

ALTER TABLE Student 
ADD CONSTRAINT DefaultnoAid Default 0 for HasFinancialAid

ALTER TABLE Student 
ADD CONSTRAINT ReasonableAge CHECK(Age>0 AND Age <= 130) 

ALTER TABLE Student 
ADD CONSTRAINT ValidEmail Check(Email LIKE '%_@%_.%_')

ALTER TABLE Student
ADD CONSTRAINT Unique_Email Unique(Email) 

ALTER TABLE Student 
ADD CONSTRAINT MajorIDFK FOREIGN KEY(MajorID) References Major(MajorId)

ALTER TABLE Enrollment
ADD CONSTRAINT GradeMustbeBetween0And100 CHECK(Gradepoint>=0 AND Gradepoint<=100)

ALTER TABLE ENROLLMENT
ADD CONSTRAINT StudentIDFK FOREIGN KEY(StudentID) References Student(StudentID)

ALTER TABLE ENROLLMENT
ADD CONSTRAINT CourseIDFK FOREIGN KEY(CourseID) References Course(CourseID)

ALTER TABLE ENROLLMENT
ADD CONSTRAINT SemesterIDFK FOREIGN KEY(SemesterID) References Semester(SemesterID)

ALTER TABLE ENROLLMENT
ADD CONSTRAINT ClassLocationIDFK FOREIGN KEY(ClassLocationID) References ClassLocation(ClassLocationID)

ALTER TABLE SEMESTER
ALTER COLUMN SemesterID Int NOT NULL

ALTER TABLE SEMESTER
ALTER COLUMN Name Varchar(30) NOT NULL

ALTER TABLE SEMESTER
ALTER COLUMN Startdate Date NOT NULL

ALTER TABLE SEMESTER
ALTER COLUMN EndDate Date NOT NULL

ALTER TABLE SEMESTER
ADD CONSTRAINT SemesterIDUnique Unique(SemesterID)

ALTER TABLE SEMESTER
ADD CONSTRAINT SemesterNameUnique Unique([Name])

ALTER TABLE SEMESTER
ADD CONSTRAINT StartDateUnique Unique(StartDate)

ALTER TABLE SEMESTER
ADD CONSTRAINT EndDateUnique Unique(EndDate)

ALTER TABLE SEMESTER
ADD CONSTRAINT StartmustbebeforeEndDate CHECK (StartDate<EndDate)

--Add a constraint that Start Date must be before End Date for Semester
--2 days a week 90 minutes
--1 Day 3 hours
---5 days 1 hour or 50 min

ALTER TABLE ClassLocation
ADD CONSTRAINT DaysoftheWeekDefault Default '0000000' for DaysoftheWeek --In this case default means no classes

ALTER TABLE Classlocation
ADD CONSTRAINT DaysoftheWeekLength Check(DaysoftheWeek LIKE '_______')

--Default for Buildings Duration of 

ALTER TABLE Classlocation
ADD CONSTRAINT DaysoftheWeekMondayCheck Check(DaysoftheWeek LIKE 'M______' OR DaysoftheWeek LIKE '0______') 

ALTER TABLE Classlocation
ADD CONSTRAINT DaysoftheWeekTuesdayCheck Check(DaysoftheWeek LIKE '_T_____' OR DaysoftheWeek LIKE '_0_____')

ALTER TABLE Classlocation
ADD CONSTRAINT DaysoftheWeekWednesdayCheck Check(DaysoftheWeek LIKE '__W____' OR DaysoftheWeek LIKE '__0____')

ALTER TABLE Classlocation
ADD CONSTRAINT DaysoftheWeekThursdayCheck Check(DaysoftheWeek LIKE '___R___' OR DaysoftheWeek LIKE '___0___')

ALTER TABLE Classlocation
ADD CONSTRAINT DaysoftheWeekFridayCheck Check(DaysoftheWeek LIKE '____F__' OR DaysoftheWeek LIKE '____0__')

ALTER TABLE Classlocation
ADD CONSTRAINT DaysoftheWeekSaturdayCheck Check(DaysoftheWeek LIKE '_____S_' OR DaysoftheWeek LIKE '_____0_')

ALTER TABLE Classlocation
ADD CONSTRAINT DaysoftheWeekSundayCheck Check(DaysoftheWeek LIKE '______U' OR DaysoftheWeek LIKE '______0')

INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity)
VALUES('1256 West Charity Street','101','0000000','00:00',1440,40) 

INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity)
VALUES('1256 West Charity Street','102','0000000','00:00',1440,34) 

INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity)
VALUES('1256 West Charity Street','103','0000000','00:00',1440,37) 

INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity)
VALUES('1213 West Charity Street ChemLabs','402','0000000','00:00',1440,10) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity)
VALUES('1213 West Charity Street ChemLabs','403','0000000','00:00',1440,10) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity)
VALUES('1213 West Charity Street ChemLabs','404','0000000','00:00',1440,7) 

INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('1213 West Charity Street ChemLabs','404','0000000','00:00',1440,7) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('211 North Chesters','101','0000000','00:00',1440,60) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('211 North Chesters','102','0000000','00:00',1440,60) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('211 North Chesters','103','0000000','00:00',1440,64) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('211 North Chesters','104','0000000','00:00',1440,62) 

INSERT INTO Semester VALUES (20131,'SPRING 2013','2013-01-15','2013-05-31')
INSERT INTO Semester VALUES (20132,'SUMMER 2013','2013-06-16','2013-08-01')
INSERT INTO Semester VALUES (20133,'FALL 2013','2013-09-15','2013-12-01')
INSERT INTO Semester VALUES (20134,'WINTERBREAK 2013','2013-12-10','2013-12-30')
INSERT INTO Semester VALUES (20141,'SPRING 2014','2014-01-15','2014-05-31')
INSERT INTO Semester VALUES (20142,'SUMMER 2014','2014-06-16','2014-08-01')
INSERT INTO Semester VALUES (20143,'FALL 2014','2014-09-15','2014-12-01')
INSERT INTO Semester VALUES (20144,'WINTERBREAK 2014','2014-12-10','2014-12-30')
INSERT INTO Semester VALUES (20151,'SPRING 2015','2015-01-15','2015-05-31')
INSERT INTO Semester VALUES (20152,'SUMMER 2015','2015-06-16','2015-08-01')
INSERT INTO Semester VALUES (20153,'FALL 2015','2015-09-15','2015-12-01')
INSERT INTO Semester VALUES (20154,'WINTERBREAK 2015','2015-12-10','2015-12-30')
INSERT INTO Semester VALUES (20161,'SPRING 2016','2016-01-15','2016-05-31')
INSERT INTO Semester VALUES (20162,'SUMMER 2016','2016-06-16','2016-08-01')
INSERT INTO Semester VALUES (20163,'FALL 2016','2016-09-15','2016-12-01')
INSERT INTO Semester VALUES (20164,'WINTERBREAK 2016','2016-12-10','2016-12-30')
INSERT INTO Semester VALUES (20171,'SPRING 2017','2017-01-15','2017-05-31')
INSERT INTO Semester VALUES (20172,'SUMMER 2017','2016-06-17','2017-08-01')
INSERT INTO Semester VALUES (20173,'FALL 2017','2017-09-15','2017-12-01')
INSERT INTO Semester VALUES (20174,'WINTERBREAK 2017','2017-12-10','2017-12-30')
INSERT INTO Semester VALUES (20181,'SPRING 2018','2018-01-15','2018-05-31')
INSERT INTO Semester VALUES (20182,'SUMMER 2018','2018-06-16','2018-08-01')
INSERT INTO Semester VALUES (20183,'FALL 2018','2018-09-15','2018-12-01')
INSERT INTO Semester VALUES (20184,'WINTERBREAK 2018','2018-12-10','2018-12-30')
INSERT INTO Semester VALUES (20191,'SPRING 2019','2019-01-15','2019-05-31')
INSERT INTO Semester VALUES (20192,'SUMMER 2019','2019-06-16','2019-08-01')
INSERT INTO Semester VALUES (20193,'FALL 2019','2019-09-15','2019-12-01')
INSERT INTO Semester VALUES (20194,'WINTERBREAK 2019','2019-12-10','2019-12-30')
INSERT INTO Semester VALUES (20201,'SPRING 2020','2020-01-15','2020-05-31')
INSERT INTO Semester VALUES (20202,'SUMMER 2020','2020-06-16','2020-08-01')

INSERT INTO MAJOR(Name,CreditstoGrad) VALUES('English',120)
INSERT INTO MAJOR(Name,CreditstoGrad) VALUES('Pre-Med',130)
INSERT INTO MAJOR(Name,CreditstoGrad) VALUES('Economics',115)
INSERT INTO MAJOR(Name,CreditstoGrad) VALUES('Engineering',151)
INSERT INTO MAJOR(Name,CreditstoGrad) VALUES('Art',138)
INSERT INTO MAJOR(Name,CreditstoGrad) VALUES('Philosophy',127)
INSERT INTO MAJOR(Name,CreditstoGrad) VALUES('Physical Therapy',140)
INSERT INTO MAJOR(Name,CreditstoGrad) VALUES('History',150)
INSERT INTO MAJOR(Name,CreditstoGrad) VALUES('Math',140)
INSERT INTO MAJOR(Name,CreditstoGrad) VALUES('Psychology',160)

INSERT INTO STUDENT(MajorID,FirstName,LastName,Age,HasFinancialAid,Email) VALUES (1,'Mary','Lincoln',16,1,'Mlincoln@gmail.com')
INSERT INTO STUDENT(MajorID,FirstName,LastName,Age,HasFinancialAid,Email) VALUES (2,'Jack','Thompson',18,1,'Jthompson@hotmail.com')
INSERT INTO STUDENT(MajorID,FirstName,LastName,Age,HasFinancialAid,Email) VALUES (3,'Louise','Valliere',20,0,'LValliere@gmail.com')
INSERT INTO STUDENT(MajorID,FirstName,LastName,Age,HasFinancialAid,Email) VALUES (4,'Mike','Tyson',21,1,'MTyson@aol.com')
INSERT INTO STUDENT(MajorID,FirstName,LastName,Age,HasFinancialAid,Email) VALUES (1,'Larry', 'Tillson',19,0,'LTillson@hotmail.com')
INSERT INTO STUDENT(MajorID,FirstName,LastName,Age,HasFinancialAid,Email) VALUES (7,'Jeanne','Darc',20,0,'JDarc@gmail.com')
INSERT INTO STUDENT(MajorID,FirstName,LastName,Age,HasFinancialAid,Email) VALUES (8,'Alexander','Great',18,1,'AGreat@gmail.com')
INSERT INTO STUDENT(MajorID,FirstName,LastName,Age,HasFinancialAid,Email) VALUES (9,'Becky','Vons',18,1,'Bvons@aol.com')
INSERT INTO STUDENT(MajorID,FirstName,LastName,Age,HasFinancialAid,Email) VALUES (10,'Melissa','Ferrian',18,1,'MFerrian@gmail.com')
INSERT INTO STUDENT(MajorID,FirstName,LastName,Age,HasFinancialAid,Email) VALUES (5,'Taylor','Hebert',17,1,'Therbert@PO.com')
INSERT INTO STUDENT (MajorID, FirstName, LastName, Age, HasFinancialAid, Email) VALUES (1, 'Tim', 'Pool', 25, 0, 'fake@something.com');
INSERT INTO STUDENT (MajorID, FirstName, LastName, Age, HasFinancialAid, Email) VALUES (3, 'Joe', 'Shmo', 42, 0, 'fake2@something.com');
INSERT INTO STUDENT (MajorID, FirstName, LastName, Age, HasFinancialAid, Email) VALUES (2, 'Joe', 'Plumber', 25, 1, 'fake3@something.com');
INSERT INTO STUDENT (MajorID, FirstName, LastName, Age, HasFinancialAid, Email) VALUES (4, 'Kelly', 'Green', 20, 1, 'fake4@something.com');
INSERT INTO STUDENT (MajorID, FirstName, LastName, Age, HasFinancialAid, Email) VALUES (3, 'Jeffrey', 'Epstool', 25, 0, 'fake5@something.com');
INSERT INTO STUDENT (MajorID, FirstName, LastName, Age, HasFinancialAid, Email) VALUES (2, 'Tim', 'Pool', 18, 0, 'fake6@something.com');
INSERT INTO STUDENT (FirstName, LastName, Age, HasFinancialAid, Email) VALUES ('George', 'Unsure', 25, 0, 'fake7@something.com');

INSERT INTO Course ([Name], Credits) VALUES ('EasyA 101', 3) 
INSERT INTO Course ([Name], Credits) VALUES ('CS 6.002', 5)
INSERT INTO Course ([Name], Credits) VALUES ('PHYS 102', 3)
INSERT INTO Course ([Name], Credits) VALUES ('HowToStudent 100', 1)
INSERT INTO Course ([Name], Credits) VALUES ('Psych 301', 4)

INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('1256 West Charity Street','101','0000000','00:00',1440,40) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('1256 West Charity Street','102','0000000','00:00',1440,34) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('1256 West Charity Street','103','0000000','00:00',1440,37) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('1213 West Charity Street ChemLabs','402','0000000','00:00',1440,10) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('1213 West Charity Street ChemLabs','403','0000000','00:00',1440,10) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('1213 West Charity Street ChemLabs','404','0000000','00:00',1440,7) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('1213 West Charity Street ChemLabs','404','0000000','00:00',1440,7) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('211 North Chesters','101','0000000','00:00',1440,60) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('211 North Chesters','102','0000000','00:00',1440,60) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('211 North Chesters','103','0000000','00:00',1440,64) 
INSERT INTO ClassLocation(Address,RoomNumber,DaysoftheWeek,Startime,DurationTimes,StudentCapacity) VALUES('211 North Chesters','104','0000000','00:00',1440,62) 

INSERT INTO Enrollment (StudentID, CourseID, SemesterID, ClassLocationID, DateEnrolled, GradePoint) VALUES (1, 1, '20164', 1, '2006-12-30 00:38:54.840', 3)
INSERT INTO Enrollment (StudentID, CourseID, SemesterID, ClassLocationID, DateEnrolled, GradePoint) VALUES (2, 1, '20182', 1, '2018-06-04', 4)
INSERT INTO Enrollment (StudentID, CourseID, SemesterID, ClassLocationID, DateEnrolled, GradePoint) VALUES (3, 2, '20192', 1, '2019-06-07', NULL)
INSERT INTO Enrollment (StudentID, CourseID, SemesterID, ClassLocationID, DateEnrolled, GradePoint) VALUES (4, 1, '20182', 1, '2018-06-01', NULL)
INSERT INTO Enrollment (StudentID, CourseID, SemesterID, ClassLocationID, DateEnrolled, GradePoint) VALUES (5, 3, '20162', 1, '2016-06-10', 0)
INSERT INTO Enrollment (StudentID, CourseID, SemesterID, ClassLocationID, DateEnrolled, GradePoint) VALUES (5, 5, '20182', 1, NULL, 1)
INSERT INTO Enrollment (StudentID, CourseID, SemesterID, ClassLocationID, DateEnrolled, GradePoint) VALUES (6, 1, '20172', 1, '2078-06-01', 3)

--Date lookup using Between
Select 
StudentID
,DateEnrolled
FROM Enrollment
WHERE DateEnrolled BETWEEN '12/29/2006' AND '12/31/2016'

--Working Code
Select
	DateEnrolled
	,dateadd(dd,0,datediff(dd,0,DateEnrolled)) AS [Calculateddate]
	,datediff(dd,0,DateEnrolled) AS [Datediff]
FROM Enrollment

SELECT *
FROM Enrollment
WHERE CAST(Dateenrolled as Date) = '2006-12-30'


Select 
StudentID
,DateEnrolled
FROM Enrollment
WHERE dateadd(dd,0,datediff(dd,0,DateEnrolled))='2006-12-30'

Select 
	StudentID
	,DateEnrolled
FROM Enrollment
WHERE DateEnrolled>(Getdate()-5*365)


DROP TABLE Enrollment, ClassLocation, Semester, Course, Student, Major

--Stretch Goal-Feature Request
--Departments like School of Business and maybe Course Number for Course like Calculus 201

--Semester Chunks
-- ClassLocation cannot be taken by two courses during the same semester
-- Some semmesters overlap
-- Think of ways to resolve this
-- semester chunks
-- semesterToChunks bridge table that identifies many to many relationship of Semester to SemesterChunk
-- spring2019 = spring1, spring2
-- springTenWeek1 = spring1
-- springTenWeek2 = spring2

--Add Department, with Course number