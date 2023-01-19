2] Consider the relations: PART, SUPPLIER and SUPPLY. The Supplier relation holds information
about suppliers. The attributes SID, SNAME, SADDR describes the supplier. The Part relation holds
the attributes such as PID, PNAME and PCOLOR. The Shipment relation holds information about
shipments that include SID and PID attributes identifying the supplier of the shipment and the part
shipped, respectively. The Shipment relation should contain information on the number of parts
shipped.

SQL> create table part(
  2  pid varchar2(10),
  3  pname varchar2(10),
  4  pcolour varchar2(10),
  5  primary key (pid));
  
  SQL> select*from part;

PID        PNAME      PCOLOUR
---------- ---------- ----------
p1         nut        black
p2         bolt       blue
p3         wheel      black
p4         chain      red

SQL> create table supplier(
  2  sid varchar2(10),
  3  sname varchar2(10),
  4  sadder varchar2(10),
  5  primary key(sid));
	
SQL> select*from supplier;

SID        SNAME      SADDER
---------- ---------- ----------
s1         rama       ayodya
s2         lakshman   bharatha
s3         ravana     lanka
s4         vibhishana srilanka
s5         maruthi    kishkinde

SQL> create table supply(
  2  sid varchar2(10) references supplier(sid)on delete cascade,
  3  pid varchar2(10) references part(pid)on delete cascade,
  4  primary key(sid,pid));
  
  SQL> select*from supply;

SID        PID
---------- ----------
s1         p1
s1         p2
s2         p3
s2         p4
s3         p4
s4         p4


a) Mention the constraints neatly.
b) Design the ER diagram for the problem statement
c) State the schema diagram for the ER diagram.
d) Create the above tables, insert suitable tuples and perform the following operations in
Oracle SQL:
1. Obtain the details of parts supplied by supplier #SNAME.


SQL> select * from part
  2  where pid in (select pid from supply
  3  where sid in (select sid from supplier
  4  where sname ='rama'));

PID        PNAME      PCOLOUR
---------- ---------- ----------
p1         nut        black
p2         bolt       blue



2. Obtain the Names of suppliers who supply #PNAME.

SQL> select * from supplier
  2  where sid in (select sid from supply
  3  where pid in (select pid from part
  4  where pname='bolt'));

SID        SNAME      SADDER
---------- ---------- ----------
s1         rama       ayodya

3. Delete the parts which are in #PCOLOR.


SQL> delete
  2  from part
  3  where pcolour='blue';

1 row deleted.

SQL> select * from part;

PID        PNAME      PCOLOUR
---------- ---------- ----------
p1         nut        black
p3         wheel      black
p4         chain      red

4. List the suppliers who supplies exactly two parts.


SQL> select sid ,count(pid)
  2  from supply
  3  group by sid
  4  having count(pid)=2;

SID        COUNT(PID)
---------- ----------
s2                  2

e) Create the table, insert suitable tuples and perform the following operations using
MongoDB

db.createCollection('warehouse')
db.warehouse.insertMany([
    {pid:1,pname:'Nuts',color:'Blue',sid:11,sname:'A'},
    {pid:2,pname:'Bolts',color:'Blue',sid:22,sname:'B'},
    {pid:3,pname:'Screws',color:'Black',sid:33,sname:'C'},
    {pid:4,pname:'Screws',color:'Blue',sid:11,sname:'A'},
    {pid:1,pname:'Nuts',color:'Blue',sid:22,sname:'B'}
    ])
    
db.warehouse.find().pretty()   

{ "ok" : 1 }
{
	"acknowledged" : true,
	"insertedIds" : [
		ObjectId("63c83c7fd4e1f7c177f06b91"),
		ObjectId("63c83c7fd4e1f7c177f06b92"),
		ObjectId("63c83c7fd4e1f7c177f06b93"),
		ObjectId("63c83c7fd4e1f7c177f06b94"),
		ObjectId("63c83c7fd4e1f7c177f06b95")
	]
}
{
	"_id" : ObjectId("63c83c7fd4e1f7c177f06b91"),
	"pid" : 1,
	"pname" : "Nuts",
	"color" : "Blue",
	"sid" : 11,
	"sname" : "A"
}
{
	"_id" : ObjectId("63c83c7fd4e1f7c177f06b92"),
	"pid" : 2,
	"pname" : "Bolts",
	"color" : "Blue",
	"sid" : 22,
	"sname" : "B"
}
{
	"_id" : ObjectId("63c83c7fd4e1f7c177f06b93"),
	"pid" : 3,
	"pname" : "Screws",
	"color" : "Black",
	"sid" : 33,
	"sname" : "C"
}
{
	"_id" : ObjectId("63c83c7fd4e1f7c177f06b94"),
	"pid" : 4,
	"pname" : "Screws",
	"color" : "Blue",
	"sid" : 11,
	"sname" : "A"
}
{
	"_id" : ObjectId("63c83c7fd4e1f7c177f06b95"),
	"pid" : 1,
	"pname" : "Nuts",
	"color" : "Blue",
	"sid" : 22,
	"sname" : "B"
}
    
1. Update the details of parts for a given part identifier: #PID.

db.warehouse.update({pid:4},{$set:{color:'Red'}},multi=true)
db.warehouse.find().pretty()    

WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
{
	"_id" : ObjectId("63c83c7fd4e1f7c177f06b91"),
	"pid" : 1,
	"pname" : "Nuts",
	"color" : "Blue",
	"sid" : 11,
	"sname" : "A"
}
{
	"_id" : ObjectId("63c83c7fd4e1f7c177f06b92"),
	"pid" : 2,
	"pname" : "Bolts",
	"color" : "Blue",
	"sid" : 22,
	"sname" : "B"
}
{
	"_id" : ObjectId("63c83c7fd4e1f7c177f06b93"),
	"pid" : 3,
	"pname" : "Screws",
	"color" : "Black",
	"sid" : 33,
	"sname" : "C"
}
{
	"_id" : ObjectId("63c83c7fd4e1f7c177f06b94"),
	"pid" : 4,
	"pname" : "Screws",
	"color" : "Red",
	"sid" : 11,
	"sname" : "A"
}
{
	"_id" : ObjectId("63c83c7fd4e1f7c177f06b95"),
	"pid" : 1,
	"pname" : "Nuts",
	"color" : "Blue",
	"sid" : 22,
	"sname" : "B"
}

2. Display all suppliers who supply the part with part identifier: #PID.

db.warehouse.find({pid:1},{sname:1,_id:0}).pretty()

{ "sname" : "A" }
{ "sname" : "B" }

3. Write a PL/SQL program to copy the contents of the Shipment table to another table
for maintaining records for specific part number. 

create table shipment as(
  select * from supply
  where 1=2);


Declare
		 cursor c1 is select * from supply where pid in(3,4);
		 v_rec supply%rowtype;
Begin
		open c1;
		loop
		fetch c1 into v_rec;
		exit when c1%notfound;
		insert into shipment values(v_rec.pid,v_rec.sid,v_rec.qty);
		end loop;
		close c1;
end;
/
