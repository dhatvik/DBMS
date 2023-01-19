5] Consider the Book Lending system from the library- BOOKS, STUDENT, BORROWS. The
students are allowed to borrow any number of books on a given date from the library. The details of
the book should include ISBN, Title of the Book, author and publisher. All students need not
compulsorily borrow books.
a) Mention the constraints neatly.
b) Design the ER diagram for the problem statement
c) State the schema diagram for the ER diagram.
d) Create the above tables, insert suitable tuples and perform the following operations in
SQL:

SQL> create table student(
  2  sid number(5),
  3  sname varchar(10),
  4  gender varchar(5),
  5  primary key(sid));

Table created.

SQL> create table books
  2  (
  3  isbn number(5) primary key,
  4  title varchar(10) ,
  5  author varchar(10));

Table created.


SQL> create table borrows(
  2  isbn number (5) references books(isbn) on delete cascade,
  3  sid number (5) references student(sid) on delete cascade,
  4  da date,
  5  primary key(isbn,sid));

Table created.

SQL> select * from student;

       SID SNAME      GENDE
---------- ---------- -----
        11 dhatvik    M
        22 manoj      M
        33 ankesh     M
        44 Nishitha   F
        55 shreya     F
        66 akshatha   F
        77 joshitha   F
	
	
SQL> select * from books;

      ISBN TITLE      AUTHOR
---------- ---------- ----------
      1111 DAA        xyz
       222 DATABASE   pqr
       333 datasci    pqr
       444 se         pqr
       555 OR         abc
       666 maths      fgh
1. Obtain the names of the student who has borrowed either book bearing ISBN ‘123’
or ISBN ‘124’.


SQL> select sname
  2  from student
  3  where sid in (select sid from borrows
  4  where isbn in(1111,222));

SNAME
----------
dhatvik
manoj

2. Obtain the Names of female students who have borrowed “Database” books.
SQL> select sname
  2  from student,borrows,books
  3  where student.sid=borrows.sid
  4  and borrows.isbn=books.isbn
  5  and gender='F'
  6  and upper(title)='DATABASE';

SNAME
----------
joshitha

3. Find the number of books borrowed by each student. Display the student details
along with the number of books.

SQL> select student.sid,sname,count(borrows.isbn)
  2  from student,borrows
  3  where student.sid=borrows.sid
  4  group by student.sid,sname;

       SID SNAME      COUNT(BORROWS.ISBN)
---------- ---------- -------------------
        55 shreya                       1
        22 manoj                        1
        33 ankesh                       1
        44 Nishitha                     1
        77 joshitha                     1
        66 akshatha                     1
        11 dhatvik                      1
	
	
4. List the books that begin with the letters “DA” and has never been borrowed by any
students.

SQL> select * from books
  2  where isbn in (select isbn
  3  from books
  4  where upper(title) like 'DA%'
  5  minus
  6  select isbn
  7  from borrows);

      ISBN TITLE      AUTHOR
---------- ---------- ----------
      1111 DAA        xyz
       666 data       fgh


e) Create the table, insert suitable tuples and perform the following operations using
MongoDB

db.createCollection('Library')

db.Library.insertMany([
    {isbn:1111,title:'Database',author:'ABC',ssn:123,sname:'Vinay'},
    {isbn:2222,title:'Blockchain',author:'XYZ',ssn:159,sname:'Vineeth'},
    {isbn:3333,title:'Cloud',author:'PQR',ssn:193,sname:'Vikas'},
    {isbn:4444,title:'DataStructures',author:'ABC',ssn:143,sname:'Vamshi'},
    {isbn:1111,title:'Database',author:'ABC',ssn:456,sname:'Vishanav'}
    ])
    
 
 { "ok" : 1 }
{
	"acknowledged" : true,
	"insertedIds" : [
		ObjectId("63c8cff47b9fb85f84137f60"),
		ObjectId("63c8cff47b9fb85f84137f61"),
		ObjectId("63c8cff47b9fb85f84137f62"),
		ObjectId("63c8cff47b9fb85f84137f63"),
		ObjectId("63c8cff47b9fb85f84137f64")
	]
}

{
	"_id" : ObjectId("63c8d0991305dddfc654429b"),
	"isbn" : 1111,
	"title" : "Database",
	"author" : "ABC",
	"ssn" : 123,
	"sname" : "Vinay"
}
{
	"_id" : ObjectId("63c8d0991305dddfc654429c"),
	"isbn" : 2222,
	"title" : "Blockchain",
	"author" : "XYZ",
	"ssn" : 159,
	"sname" : "Vineeth"
}
{
	"_id" : ObjectId("63c8d0991305dddfc654429d"),
	"isbn" : 3333,
	"title" : "Cloud",
	"author" : "PQR",
	"ssn" : 193,
	"sname" : "Vikas"
}
{
	"_id" : ObjectId("63c8d0991305dddfc654429e"),
	"isbn" : 4444,
	"title" : "DataStructures",
	"author" : "ABC",
	"ssn" : 143,
	"sname" : "Vamshi"
}
{
	"_id" : ObjectId("63c8d0991305dddfc654429f"),
	"isbn" : 1111,
	"title" : "Database",
	"author" : "ABC",
	"ssn" : 456,
	"sname" : "Vishanav"
}

    
1. Obtain the book details authored by “author_name”.
db.Library.find({author:'ABC'}).pretty()

{
	"_id" : ObjectId("63c8cff47b9fb85f84137f60"),
	"isbn" : 1111,
	"title" : "Database",
	"author" : "ABC",
	"ssn" : 123,
	"sname" : "Vinay"
}
{
	"_id" : ObjectId("63c8cff47b9fb85f84137f63"),
	"isbn" : 4444,
	"title" : "DataStructures",
	"author" : "ABC",
	"ssn" : 143,
	"sname" : "Vamshi"
}
{
	"_id" : ObjectId("63c8cff47b9fb85f84137f64"),
	"isbn" : 1111,
	"title" : "Database",
	"author" : "ABC",
	"ssn" : 456,
	"sname" : "Vishanav"
}


2. Obtain the Names of students who have borrowed “Database” books.
db.Library.find({title:'Database'},{sname:1,_id:0}).pretty()

{ "sname" : "Vinay" }
{ "sname" : "Vishanav" }

F] Write a PL/SQL procedure to print the first 8 Fibonacci numbers and a program to call
the same.
    
    
Declare
		 a number:=0;
		 b number:=1;
		 c number:=0;
		 n number:=2;
procedure fibonacci is
Begin 
		while(n<8)loop
			c:=a+b;
			dbms_output.put_line(c);
			a:=b;
			b:=c;
			n:=n+1;
		end loop;
end;
Begin
		dbms_output.put_line('The Fibonacci Series is');
		dbms_output.put_line(a);
		dbms_output.put_line(b);
		fibonacci;
end;
/
