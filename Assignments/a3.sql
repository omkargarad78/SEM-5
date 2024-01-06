Assignment No:3
Assignment Title:Write at least10 SQL queries for suitable database application
using SQL DML statements.
Note: Instructor will design the queries which demonstrate the use of concepts like
all types of
Join, Sub-Query and View.
=============================================================================================
mysql> use bank;
Database changed

mysql> show tables;
+----------------+
| Tables_in_bank |
+----------------+
| account        |
| borrower       |
| branch         |
| customer       |
| depositor      |
| loan           |
+----------------+
6 rows in set (0.00 sec)

mysql> select * from account;
+--------+-------------+---------+
| acc_no | branch_name | balance |
+--------+-------------+---------+
|      1 | alandi      |     100 |
|      2 | koregaon    |  100000 |
|      3 | kothrud     |    1000 |
|      4 | nanded      | 1000000 |
|      5 | nevasa      |   10000 |
+--------+-------------+---------+
5 rows in set (0.01 sec)

mysql> select * from borrower;
+-----------+---------+
| cust_name | loan_no |
+-----------+---------+
| aniket    |     100 |
| omkar     |     101 |
| pratik    |     102 |
| utkarsh   |     103 |
| vaibhav   |     104 |
+-----------+---------+
5 rows in set (0.00 sec)

mysql> select * from branch;
+-------------+-------------+--------+
| branch_name | branch_city | assets |
+-------------+-------------+--------+
| alandi      | pune        | car    |
| koregaon    | pune        | house  |
| kothrud     | pune        | laptop |
| nanded      | pune        | bike   |
| nevasa      | ahmednagar  | gold   |
+-------------+-------------+--------+
5 rows in set (0.00 sec)

mysql> select * from customer;
+-----------+-------------+-----------+
| cust_name | cust_street | cust_city |
+-----------+-------------+-----------+
| aniket    | street1     | pune      |
| omkar     | street2     | pune      |
| pratik    | street3     | pune      |
| utkarsh   | street5     | pune      |
| vaibhav   | street4     | pune      |
+-----------+-------------+-----------+
5 rows in set (0.00 sec)

mysql> select * from depositor;
+-----------+--------+
| cust_name | acc_no |
+-----------+--------+
| aniket    |      1 |
| omkar     |      2 |
| pratik    |      3 |
| utkarsh   |      4 |
| vaibhav   |      5 |
+-----------+--------+
5 rows in set (0.00 sec)

mysql> select * from loan;
+---------+-------------+--------+
| loan_no | branch_name | amount |
+---------+-------------+--------+
|     100 | alandi      |   1000 |
|     101 | koregaon    |  25000 |
|     102 | kothrud     |  25000 |
|     103 | nanded      | 100000 |
|     104 | nevasa      |  50000 |
+---------+-------------+--------+
5 rows in set (0.00 sec)

Q.1)
mysql> create view view1 as
    -> select c.cust_name
    -> from customer c
    -> join borrower b on c.cust_name=b.cust_name
    -> join loan l on b.loan_no=l.loan_no
    -> where l.branch_name='pune_station'
    -> order by c.cust_name;
Query OK, 0 rows affected (0.00 sec)

Q.2)
mysql> create view view2 as
    -> select branch_name,branch_city
    -> from branch;
Query OK, 0 rows affected (0.01 sec)

Q.3)
mysql> create view view3 as
    -> select b.cust_name
    -> from borrower b
    -> union
    -> select d.cust_name
    -> from depositor d;
Query OK, 0 rows affected (0.00 sec)

Q.4)
mysql> create view unionview as
    -> select c.cust_name,a.acc_no,NULL as loan_no
    -> from customer c
    -> left join depositor d on c.cust_name=d.cust_name
    -> left join account a on d.acc_no,l.loan_no
    -> from customer c
    -> left join borrower b on c.cust_name=b.cust_name
    -> left join loan l on b.loan_no=l.loan_no;
Query OK, 0 rows affected (0.01 sec)

Q.5)
mysql> select * from view1;
Empty set (0.00 sec)

mysql> select * from view2;
+-------------+-------------+
| branch_name | branch_city |
+-------------+-------------+
| alandi      | pune        |
| koregaon    | pune        |
| kothrud     | pune        |
| nanded      | pune        |
| nevasa      | ahmednagar  |
+-------------+-------------+
5 rows in set (0.00 sec)

mysql> select * from view3;
+-----------+
| cust_name |
+-----------+
| aniket    |
| omkar     |
| pratik    |
| utkarsh   |
| vaibhav   |
+-----------+
5 rows in set (0.00 sec)

Q.6)
mysql> create index index1
    -> on customer(cust_name);
Query OK, 0 rows affected (0.03 sec)
Records: 0 Duplicates: 0 Warnings: 0

mysql> create unique index index2
    -> on branch(branch_name);
Query OK, 0 rows affected (0.03 sec)
Records: 0 Duplicates: 0 Warnings: 0

Q.7)
mysql> show index from customer;
+----------+------------+----------+--------------+-------------+-----------+------
-------+----------+--------+------+------------+---------+---------------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation |
Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+----------+------------+----------+--------------+-------------+-----------+------
-------+----------+--------+------+------------+---------+---------------+
| customer |	 0 | PRIMARY | 		1 | cust_name | A
|		 4 |		 NULL | NULL | 	| BTREE 	| |
 |
| customer | 1 | index1 | 1 | cust_name | A
|		 5 | 		NULL | NULL | 	| BTREE 	| |
 |
+----------+------------+----------+--------------+-------------+-----------+------
-------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)


mysql> show index from branch;
+--------+------------+----------+--------------+-------------+-----------+--------
-----+----------+--------+------+------------+---------+---------------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation |
Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+----------+--------------+-------------+-----------+--------
-----+----------+--------+------+------------+---------+---------------+
| branch | 		0 | PRIMARY |		 1 | branch_name | A |
 4 |		 NULL | NULL |		 | BTREE |		 |
 |
| branch |		 0 | index2 | 		 1 | branch_name | A |
 5 | 		 NULL | NULL |		 | BTREE |		 |
 |
+--------+------------+----------+--------------+-------------+-----------+--------
-----+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

Q.8)
mysql> truncate table customer;
ERROR 1701 (42000): Cannot truncate a table referenced in a foreign key constraint
(`bank`.`borrower`, CONSTRAINT `borrower_ibfk_1` FOREIGN KEY (`cust_name`)
REFERENCES `bank`.`customer` (`cust_name`))

=========================================================================================================



mysql> use company;
Database changed

mysql> select * from companies;
+---------+------+------+------+
| comp_id | name | cost | year |
+---------+------+------+------+
| C001    | ONGC | 2000 | 2010 |
| C002    | HPCL | 2500 | 2012 |
| C005    | IOCL | 1000 | 2014 |
| C006    | BHEL | 3000 | 2015 |
+---------+------+------+------+
4 rows in set (0.00 sec)

mysql> select * from orders;
+---------+---------+----------+
| comp_id | domain | quantity |
+---------+---------+----------+
| C001    | Oil     |      109 |
| C002    | Gas     |      121 |
| C005    | Telecom |      115 |
+---------+---------+----------+
3 rows in set (0.00 sec)

Q1.
mysql> select name,cost,domain,quantity
    -> from companies
    -> inner join orders
    -> on orders.comp_id=companies.comp_id;
+------+------+---------+----------+
| name | cost | domain | quantity |
+------+------+---------+----------+
| ONGC | 2000 | Oil     |      109 |
| HPCL | 2500 | Gas     |      121 |
| IOCL | 1000 | Telecom |      115 |
+------+------+---------+----------+
3 rows in set (0.00 sec)

Q2.
mysql> select name,cost,domain,quantity from companies left join orders on
orders.comp_id=companies.comp_id;
+------+------+---------+----------+
| name | cost | domain | quantity |
+------+------+---------+----------+
| ONGC | 2000 | Oil     |      109 |
| HPCL | 2500 | Gas     |      121 |
| IOCL | 1000 | Telecom |      115 |
| BHEL | 3000 | NULL    |     NULL |
+------+------+---------+----------+
4 rows in set (0.00 sec)

Q3.
mysql> select name,cost,domain,quantity
    -> from companies
    -> right join orders
    -> on orders.comp_id=companies.comp_id;
+------+------+---------+----------+
| name | cost | domain | quantity |
+------+------+---------+----------+
| ONGC | 2000 | Oil     |      109 |
| HPCL | 2500 | Gas     |      121 |
| IOCL | 1000 | Telecom |      115 |
+------+------+---------+----------+
3 rows in set (0.00 sec)

Q4.
mysql> select name,cost from companies
    -> join orders on orders.comp_id=companies.comp_id
    -> union
    -> select domain,quantity from orders
    -> join companies on orders.comp_id=companies.comp_id;
+------+------+
| name | cost |
+------+------+
| ONGC | 2000 |
| HPCL | 2500 |
| Oil  | 109  |
| Gas  | 121  |
+------+------+
4 rows in set (0.01 sec)

Q5.
mysql> create view view_1 as
    -> select name,quantity
    -> from companies,orders
    -> where companies.comp_id=orders.comp_id;
Query OK, 0 rows affected (0.01 sec)

Q7.
mysql> select * from view_1;
+------+----------+
| name | quantity |
+------+----------+
| ONGC |      109 |
| HPCL |      121 |
| IOCL |      115 |
+------+----------+
3 rows in set (0.00 sec)