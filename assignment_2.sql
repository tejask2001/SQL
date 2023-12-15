-- Students table
create table Students(student_id int identity(1,1) primary key,first_name varchar(30),last_name varchar(30),
date_of_birth date,email varchar(30),phone_number varchar(20))

-- Teacher table
create table Teacher(teacher_id int identity(1,1) primary key, first_name varchar(30),last_name varchar(30),email varchar(30))

-- Courses table
create table Courses(course_id int identity(1,1) primary key,course_name varchar(30),credits int,teacher_id int,
foreign key(teacher_id) references Teacher(teacher_id) on delete cascade)

-- Enrollments table
create table Enrollments(enrollment_id int identity(1,1) primary key,student_id int,course_id int,enrollment_date date,
foreign key(student_id) references Students(student_id) on delete cascade,foreign key(course_id) references Courses(course_id) on delete cascade)

-- Payments table
create table Payments(payment_id int identity(1,1) primary key,student_id int,amount int,payment_date date,
foreign key(student_id) references Students(student_id))

--Inserting values

insert into Students values ('John', 'Doe', '2000-05-15', 'john.doe@gmail.com', '9876543210')
insert into Students values ('Jane', 'Smith', '1999-08-22', 'jane.smith@gmail.com', '8765432109')
insert into Students values  ('Amit', 'Patel', '2001-11-10', 'amit.patel@gmail.com', '7654321098')
insert into Students values ('Sara', 'Khan', '1998-07-05', 'sara.khan@gmail.com', '6543210987')
insert into Students values ('Rahul', 'Sharma', '2003-02-18', 'rahul.sharma@gmail.com', '5432109876')
insert into Students values ('Priya', 'Singh', '2002-09-30', 'priya.singh@gmail.com', '4321098765')
insert into Students values ('Ankit', 'Verma', '2004-04-12', 'ankit.verma@gmail.com', '3210987654')
insert into Students values ('Aisha', 'Rajput', '1998-12-25', 'aisha.rajput@gmail.com', '2109876543')
insert into Students values ('Vikram', 'Yadav', '2000-08-08', 'vikram.yadav@gmail.com', '1098765432')
insert into Students values ('Neha', 'Gupta', '2003-06-14', 'neha.gupta@gmail.com', '9876543210')

select * from Students

insert into Teacher (first_name, last_name, email) values ('Michael', 'Johnson', 'michael.johnson@gmail.com'),
('Aarti', 'Sharma', 'aarti.sharma@gmail.com'), ('Rajesh', 'Patil', 'rajesh.patil@gmail.com'),('Priyanka', 'Singh', 'priyanka.singh@gmail.com'),
('Amit', 'Verma', 'amit.verma@gmail.com'),('Sneha', 'Yadav', 'sneha.yadav@gmail.com'),('Rahul', 'Gupta', 'rahul.gupta@gmail.com'),
('Neha', 'Malhotra', 'neha.malhotra@gmail.com'),('Vikram', 'Rajput', 'vikram.rajput@gmail.com'),('Anita', 'Kumar', 'anita.kumar@gmail.com');

select * from Teacher

insert into Courses (course_name, credits, teacher_id)values ('Mathematics 101', 3, 1),('Electronics', 4, 2),
('Computer Science', 5, 3),('History', 3, 4),('Physics', 4, 5),('Chemistry', 2, 6),
('Programming in Python', 4, 7),('Economics', 3, 8),('LLB', 2, 9),('Physical Education', 1, 10);

select * from Courses

insert into Enrollments values (5, 8, '2023-01-15'),(1, 4, '2023-01-16'),(8, 1, '2023-01-17'),(7, 6, '2023-01-18'),(4, 2, '2023-01-19'),
(10, 5, '2023-01-20'),(3, 9, '2023-01-21'),(6, 10, '2023-01-22'),(9, 7, '2023-01-23'),(2, 3, '2023-01-24');

select * from Enrollments

insert into Payments values (1, 5000, '2023-02-01'),(2, 4500, '2023-02-02'),(3, 6000, '2023-02-03'),(4, 5500, '2023-02-04'),(5, 7000, '2023-02-05')
,(6, 4800, '2023-02-06'),(7, 5200, '2023-02-07'),(8, 6300, '2023-02-08'),(9, 5800, '2023-02-09'),(10, 6700, '2023-02-10');

select * from Payments

-- Data Manipulation Language

--1. Write an SQL query to insert a new student into the "Students" table with the following details:
--a. First Name: John
--b. Last Name: Doe
--c. Date of Birth: 1995-08-15
--d. Email: john.doe@example.com
--e. Phone Number: 1234567890
insert into  Students values('John','Doe','1995-08-15','john.doe@example.com','123567890')

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into 
--the "Enrollments" table with the enrollment date.
insert into Enrollments values(4,7,'2023-08-14')

--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address
update Teacher set email='anitak@gmail.com' where teacher_id=10

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select 
--an enrollment record based on student and course.
delete from Enrollments where enrollment_id=11

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables
update Courses set teacher_id=6 where course_id=8

--6. Delete a specific student from the "Students" table and remove all their enrollment records 
--from the "Enrollments" table. Be sure to maintain referential integrity.
delete from Students where student_id=10

--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount
update Payments set amount=8400 where payment_id=9


-- Joins:

--1. Write an SQL query to calculate the total payments made by a specific student. You will need to 
--join the "Payments" table with the "Students" table based on the student's ID.
select amount from Payments join Students on Payments.student_id=Students.student_id where Students.student_id=3

--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each 
--course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.select Courses.course_name,count(Enrollments.student_id) from Courses join Enrollments on Courses.course_id=Enrollments.enrollment_id
group by Courses.course_name

--3. Write an SQL query to find the names of students who have not enrolled in any course. Use a 
--LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.
select Students.student_id, Students.first_name,Students.last_name from Students left join Enrollments on Students.student_id=Enrollments.student_id
where Enrollments.student_id is null

--4. Write an SQL query to retrieve the first name, last name of students, and the names of the 
--courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.
select Students.first_name,Students.last_name,Courses.course_name from Students join Enrollments on Students.student_id=Enrollments.student_id
join Courses on Courses.course_id=Enrollments.course_id

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.
select Teacher.first_name,Teacher.last_name,Courses.course_name from Teacher join Courses on Teacher.teacher_id=Courses.teacher_id

--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the 
--"Enrollments" and "Courses" tables.
select Students.first_name,Students.last_name,  Enrollments.enrollment_date from Students join Enrollments on
Enrollments.student_id=Students.student_id join Courses on Courses.course_id=Enrollments.course_id where Courses.course_name='LLB'

--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the 
--"Students" table and the "Payments" table and filter for students with NULL payment records.
select Students.first_name,Students.last_name from Students left join Payments on Students.student_id=Payments.student_id where
Payments.student_id is null

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN 
--between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records
select Courses.course_name from Courses left join Enrollments on Courses.course_id=Enrollments.course_id where
Enrollments.course_id is null

--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" 
--table to find students with multiple enrollment records.
select Students.first_name from Students where student_id in (select e1.student_id from Enrollments e1, Enrollments e2
where e1.student_id=e2.student_id and e1.course_id!=e2.course_id)

--10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" 
--table and the "Courses" table and filter for teachers with NULL course assignments.
select Teacher.first_name,Teacher.last_name from Teacher left join Courses on Teacher.teacher_id=Courses.teacher_id
where Courses.teacher_id is null


--Aggregate Functions and Subqueries
--1. Write an SQL query to calculate the average number of students enrolled in each course. Use 
--aggregate functions and subqueries to achieve this.
select Courses.course_name from Courses

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum 
--payment amount and then retrieve the student(s) associated with that amount
select first_name, last_name from Students where student_id=(select student_id from Payments where amount=
(select max(amount) from Payments))

-- 3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the 
--course(s) with the maximum enrollment count.
select top 2 Courses.course_name,(select count(Enrollments.student_id) from Enrollments where Enrollments.course_id=Courses.course_id)
as Enrolled_student from Courses order by Enrolled_student desc 


--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses
select course_name,(select sum(amount) from Payments p where p.student_id in (select student_id from Enrollments e
where e.course_id = c.course_id)) as total_payment from Courses c;

--5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the 
--total number of courses.
select Students.first_name from Students where Students.student_id in (select Enrollments.student_id from Enrollments group by
Enrollments.student_id having count(distinct Enrollments.course_id)=(select count(*) from Courses))

--6. 6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to 
--find teachers with no course assignment
select Teacher.first_name from Teacher where Teacher.teacher_id not in (select Courses.teacher_id from Courses)

--7. Calculate the average age of all students. Use subqueries to calculate the age of each student 
--based on their date of birth.
select avg(DATEDIFF(year,Students.date_of_birth,getdate())) from Students

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.select Courses.course_name from Courses where Courses.course_id not in (select Enrollments.course_id from
Enrollments)

--9. Calculate the total payments made by each student for each course they are enrolled in. Use 
--subqueries and aggregate functions to sum payments.
select (select Students.first_name from Students where Students.student_id= Payments.student_id),
(select Courses.course_name from Courses where Courses.course_id=Enrollments.course_id),
sum(Payments.amount) from Payments,Enrollments
where Payments.student_id=Enrollments.student_id
group by Payments.student_id,Enrollments.course_id

--10. Identify students who have made more than one payment. Use subqueries and aggregate 
--functions to count payments per student and filter for those with counts greater than one.
select (select Students.first_name from Students where Students.student_id=Payments.student_id), count(Payments.student_id)
from Payments group by Payments.student_id having count(Payments.student_id)>1

--11. Write an SQL query to calculate the total payments made by each student. Join the "Students" 
--table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
select Students.first_name, sum(Payments.amount) from Students join Payments on Students.student_id=Payments.student_id
group by Students.first_name

--12. Retrieve a list of course names along with the count of students enrolled in each course. Use 
--JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.
select Courses.course_name , count(Enrollments.student_id) from Courses join Enrollments on Courses.course_id=
Enrollments.course_id group by Courses.course_name

--13. Calculate the average payment amount made by students. Use JOIN operations between the 
--"Students" table and the "Payments" table and GROUP BY to calculate the average.
select Students.first_name, avg(amount) from Payments join Students on Payments.student_id=Students.student_id
group by Students.first_name

select * from Courses
select * from Students
select * from Enrollments
select * from Payments
select * from Teacher




select course_id, course_name,(select avg(enrollment_count) from (select count(student_id) as enrollment_count from 
Enrollments e where e.course_id = c.course_id group by e.course_id) as CourseEnrollment) as average_students_enrolled
from Courses c;