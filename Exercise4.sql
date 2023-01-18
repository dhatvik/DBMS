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
    {cid:1,cname:'A',accno:1237,bid:44,bname:'bangalore'},
    ])
db.bank.find().pretty()    
db.bank.find({bid:11},{bname:1,_id:0}).pretty()
db.bank.aggregate([
    {
        $group:{_id:'$cid',no_of_accounts:{$sum:1}}
        
    }
    ])
    
1. Find the branch name for a given Branch_ID.
2. List the total number of accounts for each customer.
e) Using cursors demonstrate the process of copying the contents of one table to a new table.
