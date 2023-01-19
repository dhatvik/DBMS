4] Consider the Banking database – CUSTOMER, BRANCH, ACCOUNT and TRANSACTION. An
account can be a savings account or a current account. Customer can have both types of accounts.
The transactions can be a deposit or a withdrawal. Mention the constraints neatly.
a) Design the ER diagram for the problem statement
b) State the schema diagram for the ER diagram.
24
c) Create the above tables, insert suitable tuples and perform the following operations in
SQL:


1. Obtain the details of customers who have both Savings and Current Account.
2. Retrieve the details of branches and the number of accounts in each branch.
3. Obtain the details of customers who have performed at least 3 transactions.
4. List the details of branches where the number of accounts is less than the average
number of accounts in all branches.
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

