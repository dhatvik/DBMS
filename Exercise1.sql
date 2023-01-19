1] Consider an Employee with a social security number (SSN) working on multiple projects with
definite hours for each. Each Employee belongs to a Department. Each project is associated with
some domain areas such as Database, Cloud and so on. Each Employee will be assigned to some
project. Assume the attributes for Employee and Project relations.
a) Mention the constraints neatly.
b) Design the ER diagram for the problem statement
c) State the schema diagram for the ER diagram.
d) Create the tables, insert suitable tuples (min 6 each) and perform the following operations
in SQL


SQL> create table emp(
   ssn number(5),
   name varchar(10),
   dno number(5),
   salary number(10),
   primary key(ssn));
   
SQL> select * from emp;

       SSN NAME              DNO     SALARY
---------- ---------- ---------- ----------
       123 Dhatvik             1     100000
       456 vinay               1       1000
       789 vineeth             2       5000
       159 yogesh              3       1000
       357 rishab              3       6000
 
 SQL> create table project(
  2  pno number(5) primary key,
  3  pname varchar(10),
  4  domain varchar(10));


SQL> select * from project;

       PNO PNAME      DOMAIN
---------- ---------- ----------
         1 x          database
         2 Y          cloud
         3 Z          blockchain
	 
	 
SQL> create table works_on (
    pno number(5) references project(pno) on delete cascade,
    ssn number(5) references emp(ssn) on delete cascade,
    no_of_hours number(3),
    primary key(pno,ssn));
    
 SQL> select * from works_on;

       PNO        SSN NO_OF_HOURS
---------- ---------- -----------
         1        123          10
         1        456          15
         2        789          11
         2        159           5
         3        123           6
         3        159           8
         2        123          11   
  
  
 1. Obtain the details of employees assigned to “Database” project.
 
 
SQL> select * from emp
  2  where ssn in(select ssn from works_on
  3  where pno in (select pno from project
  4  where domain='database'));

       SSN NAME              DNO     SALARY
---------- ---------- ---------- ----------
       123 Dhatvik             1     100000
       456 vinay               1       1000
       
 2. Find the number of employees working in each department with department
details.

SQL> select dno,count(ssn)
  2  from emp
  3  group by dno;

       DNO COUNT(SSN)
---------- ----------
         1          2
         2          1
         3          2
	 
	 
 3. Update the Project details of Employee bearing SSN = #SSN to ProjectNo =
#Project_No and display the same.


SQL> update works_on
  2  set pno=2
  3  where ssn=456;

1 row updated.

SQL> select * from works_on;

       PNO        SSN NO_OF_HOURS
---------- ---------- -----------
         1        123          10
         2        456          15
         2        789          11
         2        159           5
         3        123           6
         3        159           8
         2        123          11
	 
	 
 4. Retrieve the employee who has not been assigned more than two projects.
 
 SQL> select ssn,count(pno)
  2  from works_on
  3  group by ssn
  4  having count(pno)<=2;

       SSN COUNT(PNO)
---------- ----------
       789          1
       456          1
       159          2
       
      
e) Create the table, insert suitable tuples and perform the following operations using
MongoDB

db.createCollection('employee')
db.employee.insertMany([
    {ssn:123,name:'A',dno:1,dname:'d1',pno:1},
    {ssn:456,name:'B',dno:2,dname:'d2',pno:2},
    {ssn:789,name:'C',dno:3,dname:'d3',pno:3},
    {ssn:159,name:'D',dno:1,dname:'d1',pno:1}    
    ])
    
db.employee.find().pretty()    

{ "ok" : 1 }
{
	"acknowledged" : true,
	"insertedIds" : [
		ObjectId("63c837993cc8c4960724dce9"),
		ObjectId("63c837993cc8c4960724dcea"),
		ObjectId("63c837993cc8c4960724dceb"),
		ObjectId("63c837993cc8c4960724dcec")
	]
}

{
	"_id" : ObjectId("63c837993cc8c4960724dce9"),
	"ssn" : 123,
	"name" : "A",
	"dno" : 1,
	"dname" : "d1",
	"pno" : 1
}
{
	"_id" : ObjectId("63c837993cc8c4960724dcea"),
	"ssn" : 456,
	"name" : "B",
	"dno" : 2,
	"dname" : "d2",
	"pno" : 2
}
{
	"_id" : ObjectId("63c837993cc8c4960724dceb"),
	"ssn" : 789,
	"name" : "C",
	"dno" : 3,
	"dname" : "d3",
	"pno" : 3
}
{
	"_id" : ObjectId("63c837993cc8c4960724dcec"),
	"ssn" : 159,
	"name" : "D",
	"dno" : 1,
	"dname" : "d1",
	"pno" : 1
}


[Execution complete with exit code 0]

1. List all the employees of Department named #Dept_name.

db.employee.find({dname:'d1'}).pretty()

{
	"_id" : ObjectId("63c837993cc8c4960724dce9"),
	"ssn" : 123,
	"name" : "A",
	"dno" : 1,
	"dname" : "d1",
	"pno" : 1
}
{
	"_id" : ObjectId("63c837993cc8c4960724dcec"),
	"ssn" : 159,
	"name" : "D",
	"dno" : 1,
	"dname" : "d1",
	"pno" : 1
}


2. Name the employees working on Project Number :#Project_No


db.employee.find({pno:1}).pretty()

{
	"_id" : ObjectId("63c837993cc8c4960724dce9"),
	"ssn" : 123,
	"name" : "A",
	"dno" : 1,
	"dname" : "d1",
	"pno" : 1
}
{
	"_id" : ObjectId("63c837993cc8c4960724dcec"),
	"ssn" : 159,
	"name" : "D",
	"dno" : 1,
	"dname" : "d1",
	"pno" : 1
}
f) Write a program that gives all employees in Department #number a 15% pay increase.
Display a message displaying how many employees were awarded the increase.

step1:edit file1.sql
type below code in the editor which gets opened
Begin
		update emp
		set salary=1.15*salary
		where dno=2;
		dbms_output.put_line('The number of Employees who got hike is'||sql%rowcount);
end;
/

How to run :
set serveroutput on
@file1.sql
