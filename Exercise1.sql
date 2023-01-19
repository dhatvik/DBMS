1] Consider an Employee with a social security number (SSN) working on multiple projects with
definite hours for each. Each Employee belongs to a Department. Each project is associated with
some domain areas such as Database, Cloud and so on. Each Employee will be assigned to some
project. Assume the attributes for Employee and Project relations.
a) Mention the constraints neatly.
b) Design the ER diagram for the problem statement
c) State the schema diagram for the ER diagram.
d) Create the tables, insert suitable tuples (min 6 each) and perform the following operations
in SQL
 1. Obtain the details of employees assigned to “Database” project.
 2. Find the number of employees working in each department with department
details.
 3. Update the Project details of Employee bearing SSN = #SSN to ProjectNo =
#Project_No and display the same.
 4. Retrieve the employee who has not been assigned more than two projects.
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

Begin
		update emp
		set salary=1.15*salary
		where dno=2;
		dbms_output.put_line('The number of Employees who got hike is'||sql%rowcount);
end;
/
