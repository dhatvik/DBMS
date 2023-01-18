3] Consider the relations BOAT, SAILOR and RESERVES. The relation BOAT identifies the features
of a boat such as unique identifier, color and a name. The list of sailors with attributes such as
SailorID, name, age etc., are stored in the relation SAILOR. The sailors are allowed to reserve any
number of boats on any day of the week and the records are to be updated in the RESERVES table.
a) Mention the constraints neatly.
b) Design the ER diagram for the problem statement
c) State the schema diagram for the ER diagram.
d) Create the tables, insert suitable tuples and perform the following operations in SQL:
1. Obtain the details of the boats reserved by ‘#Sailor_Name’.
2. Retrieve the BID of the boats reserved necessarily by all the sailors.
3. Find the number of boats reserved by each sailor. Display the Sailor_Name along
with the number of boats reserved.
4. Identify which boats have the same name as their sailor.
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
