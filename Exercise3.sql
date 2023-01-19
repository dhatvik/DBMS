3] Consider the relations BOAT, SAILOR and RESERVES. The relation BOAT identifies the features
of a boat such as unique identifier, color and a name. The list of sailors with attributes such as
SailorID, name, age etc., are stored in the relation SAILOR. The sailors are allowed to reserve any
number of boats on any day of the week and the records are to be updated in the RESERVES table.
a) Mention the constraints neatly.
b) Design the ER diagram for the problem statement
c) State the schema diagram for the ER diagram.
d) Create the tables, insert suitable tuples and perform the following operations in SQL:

SQL> create table sailor(
  2  sid number(3) primary key,
  3  sname varchar(10) ,
  4  addr varchar(10));

Table created.

SQL> create table boat(
  2  bid number(3) primary key,
  3  bname varchar(10),
  4  bcolor varchar(10));

Table created.

SQL> create table reserves(
  2  bid number(3) references boat(bid) on delete cascade,
  3  sid number(3) references sailor(sid) on delete cascade,
  4  primary key(bid,sid));

Table created.

SQL> select * from sailor;

       SID SNAME      ADDR
---------- ---------- ----------
        11 ram        hunsur
        22 sham       mysore
        33 nandan     udupi
        44 umesh      kerala
	
SQL> select * from boat;

       BID BNAME      BCOLOR
---------- ---------- ----------
         1 ins        black
         2 vik        blue
         3 rant       white
         4 nandan     red
	 

SQL> select * from reserves;

       BID        SID
---------- ----------
         1         11
         1         22
         1         33
         1         44
         2         11
         3         22
         4         33
         4         44	 
	
1. Obtain the details of the boats reserved by ‘#Sailor_Name’.

SQL> select * from boat
  2  where bid in (select bid from reserves
  3  where sid in (select sid from sailor where sname='ram'));

       BID BNAME      BCOLOR
---------- ---------- ----------
         1 ins        black
         2 vik        blue
	 
	 
2. Retrieve the BID of the boats reserved necessarily by all the sailors.

SQL> select *
  2  from boat
  3  where not exists(select sid
  4                   from sailor
  5                     minus
  6                   select sid
  7                  from reserves
  8                  where boat.bid=reserves.bid);

       BID BNAME      BCOLOR
---------- ---------- ----------
         1 ins        black
	 
	 
3. Find the number of boats reserved by each sailor. Display the Sailor_Name along
with the number of boats reserved.


SQL> select sname,count(reserves.bid)
  2  from sailor,reserves
  3  where sailor.sid=reserves.sid
  4  group by sname;

SNAME      COUNT(RESERVES.BID)
---------- -------------------
sham                         2
ram                          2
nandan                       2
umesh                        2


4. Identify which boats have the same name as their sailor.

SQL> select boat.bid,boat.bname
  2  from boat,sailor
  3  where boat.bname=sailor.sname;

       BID BNAME
---------- ----------
         4 nandan
	 
	 
e) Create the table, insert suitable tuples and perform the following operations using
MongoDB.

db.createCollection('boaters')
db.boaters.insertMany([
    {bid:11,bname:'INS',color:'Red',sid:101,sname:'A'},
    {bid:22,bname:'SOP',color:'Green',sid:102,sname:'B'},
    {bid:33,bname:'ANS',color:'Black',sid:103,sname:'C'},
    {bid:44,bname:'IBP',color:'Blue',sid:101,sname:'A'},
    ])
    
db.boaters.find().pretty()

{ "ok" : 1 }
{
	"acknowledged" : true,
	"insertedIds" : [
		ObjectId("63c83eabc7e159f60bc9d9b0"),
		ObjectId("63c83eabc7e159f60bc9d9b1"),
		ObjectId("63c83eabc7e159f60bc9d9b2"),
		ObjectId("63c83eabc7e159f60bc9d9b3")
	]
}
{
	"_id" : ObjectId("63c83eabc7e159f60bc9d9b0"),
	"bid" : 11,
	"bname" : "INS",
	"color" : "Red",
	"sid" : 101,
	"sname" : "A"
}
{
	"_id" : ObjectId("63c83eabc7e159f60bc9d9b1"),
	"bid" : 22,
	"bname" : "SOP",
	"color" : "Green",
	"sid" : 102,
	"sname" : "B"
}
{
	"_id" : ObjectId("63c83eabc7e159f60bc9d9b2"),
	"bid" : 33,
	"bname" : "ANS",
	"color" : "Black",
	"sid" : 103,
	"sname" : "C"
}
{
	"_id" : ObjectId("63c83eabc7e159f60bc9d9b3"),
	"bid" : 44,
	"bname" : "IBP",
	"color" : "Blue",
	"sid" : 101,
	"sname" : "A"
}


1. Obtain the number of boats obtained by sailor :#Sailor_Name

db.boaters.find({sname:'A'}).count()
2

2. Retrieve boats of color :”#color”

db.boaters.find({color:'Black'})
{ "_id" : ObjectId("63c83eabc7e159f60bc9d9b2"), "bid" : 33, "bname" : "ANS", "color" : "Black", "sid" : 103, "sname" : "C" }
F) Write a PL/SQL program to check whether a given number is prime or not


Declare
			n number:=&n;
			j number:=2;
			counter number:=0;
Begin
		while(j<=n/2) loop
			if mod(n,j)=0 then
				dbms_output.put_line(n||'is not a prime number');
				counter:=1;
				exit;
			else 
				j:=j+1;
			end if;
		end loop;

		if counter=0 then
			dbms_output.put_line(n||'is a prime number');
		end if;
end;
/
