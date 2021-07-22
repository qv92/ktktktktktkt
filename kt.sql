create database kt;
use kt;
set sql_safe_updates = 0;

create table Students(
	StudentID int(4) not null primary key,
    StudentName nvarchar(50),
    Age int(4),
    Email varchar(100)
);
create table Classes(
	ClassID int(4) not null primary key,
    ClassName nvarchar(50)
);
create table ClassStudent(
	StudentID int(4) not null,
    CLassID int(4) not null,
    foreign key (StudentID) references Students(StudentID),
    foreign key (ClassID) references Classes(ClassID)
);
alter table ClassStudent
add CSID int(4) not null primary key;
create table Subjects(
	SubjectID int(4) not null primary key,
    SubjectName nvarchar(50)
);
create table Marks(
	Mark int not null primary key,
    SubjectID int(4) not null,
    StudentID int(4) not null,
    foreign key (StudentID) references Students(StudentID),
    foreign key (SubjectID) references Subjects(SubjectID)
);
alter table Marks drop primary key;

-- 1.
select * from Students;

-- 2.
select * from Subjects;

-- 3.
select StudentName, avg(mark) as TB from Students s join Marks m on s.StudentID = m.studentID group by m.StudentID;

-- 4.
select SubjectName, max(mark) as HighestMark from Subjects s join Marks m on s.SubjectID = m.SubjectID;

-- 5.
select row_number() over (order by mark desc) as 'rank', mark from marks;

-- 6.
alter table Subjects
modify SubjectName nvarchar(4000);

-- 7.
update Subjects
set SubjectName = concat('Đây là môn học: ',SubjectName);

-- 8.
alter table Students
modify age int(4) check (age > 15 and age < 50);

-- 9.
alter table ClassStudent
drop foreign key classstudent_ibfk_1,
drop foreign key classstudent_ibfk_2;

alter table Marks
drop foreign key marks_ibfk_1,
drop foreign key marks_ibfk_2;

-- 10.
delete from Students where StudentID = 1;

-- 11.
alter table Students
add Status bit default 1;

-- 12.
update Students
set Status = 0;