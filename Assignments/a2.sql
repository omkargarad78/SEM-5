Assignment Title:
a. Design and Develop SQL DDL statements which demonstrate the use of SQL objects such as
Table, View, Index, Sequence, Synonym, different constraints etc.
b. Write at least 10 SQL queries on the suitable database application using SQL DML
statements.

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
5 rows in set (0.00 sec)

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
mysql> select branch_name from loan;
+-------------+
| branch_name |
+-------------+
| alandi      |
| koregaon    |
| kothrud     |
| nanded      |
| nevasa      |
+-------------+
5 rows in set (0.00 sec)


Q.2)
mysql> select loan_no
    -> from loan
    -> where branch_name='akurdi' and amount>12000;
Empty set (0.01 sec)


Q.3)
mysql> select borrower.cust_name, borrower.loan_no, loan.amount from borrower join Loan on borrower.loan_no=loan.loan_no;
+-----------+---------+--------+
| cust_name | loan_no | amount |
+-----------+---------+--------+
| aniket    |     100 |   1000 |
| omkar     |     101 |  25000 |
| pratik    |     102 |  25000 |
| utkarsh   |     103 | 100000 |
| vaibhav   |     104 |  50000 |
+-----------+---------+--------+
5 rows in set (0.00 sec)

Q.4)
mysql> select cust_name from borrower join loan on loan.loan_no = borrower.loan_no where branch_name='KATRAJ'
    -> ;
Empty set (0.00 sec)


Q.5)
mysql> select cust_name from customer union select cust_name from borrower;
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
mysql> select cust_name from borrower join loan on loan.loan_no = borrower.loan_no where branch_name='KATRAJ' order by cust_name asc;
Empty set (0.00 sec)


Q.7)
mysql> select cust_name from customer intersect select cust_name from borrower;
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

Q.8)
mysql> select cust_name from customer except select cust_name from borrower;
Empty set (0.00 sec)


Q.9)
mysql> select avg(balance) from account group by branch_name;
+--------------+
| avg(balance) |
+--------------+
|     100.0000 |
|  100000.0000 |
|    1000.0000 |
| 1000000.0000 |
|   10000.0000 |
+--------------+
5 rows in set (0.00 sec)

Q.10)
mysql> select cust_name,cust_city from Customer where cust_name like 'P%';
+-----------+-----------+
| cust_name | cust_city |
+-----------+-----------+
| pratik    | pune      |
+-----------+-----------+
1 row in set (0.00 sec)

Q.11)
mysql> select distinct branch_city from branch;
+-------------+
| branch_city |
+-------------+
| pune        |
| ahmednagar  |
+-------------+
2 rows in set (0.00 sec)


Q.12)
mysql> select branch_name from Account group by branch_name having avg(balance) > 12000;
+-------------+
| branch_name |
+-------------+
| koregaon    |
| nanded      |
+-------------+
2 rows in set (0.00 sec)

Q.13)
mysql> select count(*) from Customer;
+----------+
| count(*) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)

Q.14)
mysql> select sum(amount) from Loan;
+-------------+
| sum(amount) |
+-------------+
|      201000 |
+-------------+
1 row in set (0.00 sec)

Q.15)
mysql> delete from loan WHERE amount >=1300 and amount <=1500;
Query OK, 0 rows affected (0.00 sec)

Q.16)
mysql> delete from branch where branch_city='Nigdi';
Query OK, 0 rows affected (0.01 sec)
