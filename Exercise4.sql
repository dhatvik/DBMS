4] Consider the Banking database – CUSTOMER, BRANCH, ACCOUNT and TRANSACTION. An
account can be a savings account or a current account. Customer can have both types of accounts.
The transactions can be a deposit or a withdrawal. Mention the constraints neatly.
a) Design the ER diagram for the problem statement
b) State the schema diagram for the ER diagram.
24
c) Create the above tables, insert suitable tuples and perform the following operations in
SQL:


SQL> create table branch(
  2  bno number(3) primary key,
  3  addr varchar(10));

Table created.
SQL> select * from branch;

       BNO ADDR
---------- ----------
         1 hunsur
         2 mysore
         3 hassan
         4 bangalore
         5 magadi

SQL> select * from customer;

       CID CNAME
---------- ----------
        11 ram
        22 rahim
        33 rahul
        44 ramesh
        55 rohith

SQL> select * from account;

     ACCNO TYPE          BALANCE        BNO        CID
---------- ---------- ---------- ---------- ----------
       123 S                 500          1         11
       456 C                 100          2         11
       789 S                 700          3         22
       147 S                 560          4         33
       258 C                 999          5         44
       369 S                 777          4         55

SQL> select * from transaction;

       CID      ACCNO        TID TYP     AMOUNT
---------- ---------- ---------- --- ----------
        11        123          1 D          200
        11        456          2 D          600
        11        123          3 D          700
        11        123          4 W          100
        22        789          5 D          400
        33        147          6 D          900
	 

1. Obtain the details of customers who have both Savings and Current Account.

SQL> select * from customer
  2  where cid in (select cid from account
  3  where type='S'
  4  intersect
  5  select cid from account
  6  where type='C');

       CID CNAME
---------- ----------
        11 ram
	
	
2. Retrieve the details of branches and the number of accounts in each branch.

SQL> select branch.bno,addr,count(account.accno)
  2  from branch,account
  3  where branch.bno=account.bno
  4  group by branch.bno,addr;

       BNO ADDR       COUNT(ACCOUNT.ACCNO)
---------- ---------- --------------------
         1 hunsur                        1
         2 mysore                        1
         4 bangalore                     2
         3 hassan                        1
         5 magadi                        1
	 
	 
3. Obtain the details of customers who have performed at least 3 transactions.

SQL> select customer.cid,cname,count(transaction.cid)
  2  from customer,transaction
  3  where customer.cid=transaction.cid
  4  group by customer.cid,cname
  5  having count(transaction.cid)>=3;

       CID CNAME      COUNT(TRANSACTION.CID)
---------- ---------- ----------------------
        11 ram                             4
	
	
4. List the details of branches where the number of accounts is less than the average
number of accounts in all branches.

SQL> select branch.bno,addr,count(account.accno)
  2  from branch,account
  3  where branch.bno=account.bno
  4  group by branch.bno,addr
  5  having count(account.accno)<(select avg(count(accno))
  6                               from account
  7                               group by bno);

       BNO ADDR       COUNT(ACCOUNT.ACCNO)
---------- ---------- --------------------
         1 hunsur                        1
         2 mysore                        1
         3 hassan                        1
         5 magadi                        1
	 
	 
d) Create the table, insert suitable tuples and perform the following operations using
MongoDB

db.createCollection('bank')

db.bank.insertMany([
    {cid:1,cname:'A',accno:1234,bid:11,bname:'hunsur'},
    {cid:2,cname:'B',accno:1235,bid:22,bname:'hassan'},
    {cid:2,cname:'B',accno:1236,bid:33,bname:'mysore'},
    {cid:1,cname:'A',accno:1237,bid:44,bname:'bangalore'}
    ])

db.bank.find().pretty()

{ "ok" : 1 }
{
	"acknowledged" : true,
	"insertedIds" : [
		ObjectId("63c8cb4d8a26018834d559f2"),
		ObjectId("63c8cb4d8a26018834d559f3"),
		ObjectId("63c8cb4d8a26018834d559f4"),
		ObjectId("63c8cb4d8a26018834d559f5")
	]
}
{
	"_id" : ObjectId("63c8cb4d8a26018834d559f2"),
	"cid" : 1,
	"cname" : "A",
	"accno" : 1234,
	"bid" : 11,
	"bname" : "hunsur"
}
{
	"_id" : ObjectId("63c8cb4d8a26018834d559f3"),
	"cid" : 2,
	"cname" : "B",
	"accno" : 1235,
	"bid" : 22,
	"bname" : "hassan"
}
{
	"_id" : ObjectId("63c8cb4d8a26018834d559f4"),
	"cid" : 2,
	"cname" : "B",
	"accno" : 1236,
	"bid" : 33,
	"bname" : "mysore"
}
{
	"_id" : ObjectId("63c8cb4d8a26018834d559f5"),
	"cid" : 1,
	"cname" : "A",
	"accno" : 1237,
	"bid" : 44,
	"bname" : "bangalore"
}
    
1. Find the branch name for a given Branch_ID.
db.bank.find({bid:11},{bname:1,_id:0})    

{ "bname" : "hunsur" }

2. List the total number of accounts for each customer.
db.bank.aggregate([
    {
        $group:{_id:'$cid',no_of_accounts:{$sum:1}}    
    }
])
{ "_id" : 1, "no_of_accounts" : 2 }
{ "_id" : 2, "no_of_accounts" : 2 }


e) Using cursors demonstrate the process of copying the contents of one table to a new table.
create table branchcopy as
(select * from branch
 where 1=2);
 
 Declare
		cursor c1 is select * from branch;
		v_rec branch%rowtype;
Begin
		open c1;
		loop
		fetch c1 into v_rec;
		exit when c1%notfound;
		insert into branchcopy values(v_rec.bname,v_rec.addr);
		end loop;
		close c1;
end;
/

