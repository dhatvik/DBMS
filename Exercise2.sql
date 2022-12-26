2] Consider the relations: PART, SUPPLIER and SUPPLY. The Supplier relation holds information
about suppliers. The attributes SID, SNAME, SADDR describes the supplier. The Part relation holds
the attributes such as PID, PNAME and PCOLOR. The Shipment relation holds information about
shipments that include SID and PID attributes identifying the supplier of the shipment and the part
shipped, respectively. The Shipment relation should contain information on the number of parts
shipped.
a) Mention the constraints neatly.
b) Design the ER diagram for the problem statement
c) State the schema diagram for the ER diagram.
23
d) Create the above tables, insert suitable tuples and perform the following operations in
Oracle SQL:
1. Obtain the details of parts supplied by supplier #SNAME.
2. Obtain the Names of suppliers who supply #PNAME.
3. Delete the parts which are in #PCOLOR.
4. List the suppliers who supplies exactly two parts.
e) Create the table, insert suitable tuples and perform the following operations using
MongoDB
1. Update the details of parts for a given part identifier: #PID.
2. Display all suppliers who supply the part with part identifier: #PID.
3. Write a PL/SQL program to copy the contents of the Shipment table to another table
for maintaining records for specific part number. 
