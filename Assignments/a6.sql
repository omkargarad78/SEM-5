Assignment No: 06
=================================================================

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

mysql> create table stud_marks(
    -> name varchar(20),
    -> total_marks int
    -> );

Table created.

SQL> create table Result(
  2     Roll int auto increment,
  3      Name varchar2(20),
  4      Class varchar2(20),
  5      Foreign Key(Roll) references Stud_Marks(Roll)
  6  );

Table created.

SQL> select * from Stud_Marks;

no rows selected

SQL> select * from Result;

no rows selected

==========================================================================================
(in sql)

delimiter !
create procedure proc_grade(
  in p_name varchar(20),
  in p_totalmarks int
)
begin
  declare p_class varchar(20);

  insert into stud_marks values(p_name, p_totalmarks);

  if p_totalmarks >= 990 and p_totalmarks <= 1500 then
    insert into result values(p_name, 'Distinction');
  elseif p_totalmarks >= 900 and p_totalmarks <= 989 then
    insert into result values(p_name, 'First Class');
  elseif p_totalmarks >= 825 and p_totalmarks <= 899 then
    insert into result values(p_name, 'Higher Second Class');
  else
    insert into result values(p_name, 'Second Class');
  end if;

  commit;
end;


call proc_grade("omkar",1345);
===========================================================================================

SQL> select * from Stud_Marks;

      ROLL           name            total_marks
----------- -------------------- --------------------
          6          omkar              1000

SQL> select * from Result;

      ROLL           name              class
----------- -------------------- --------------------
          6          omkar            Distinction


=======================================================================
(Using FOR loop Cursor)

SQL> create table marks(
  2       Roll int,
  3       name varchar2(20),
  4       total_marks int
  5      );

Table created.

SQL> create table result(
  2       Roll int,
  3       Name varchar2(20),
  4       Class varchar2(20)
  5       );

Table created.

SQL> select * from marks;

no rows selected

SQL> select * from result;

no rows selected

SQL> insert into marks values (1, 'omkar', 1356);

1 row created.

SQL> insert into marks values (2, 'ashwin', 438);

1 row created.

SQL> insert into marks values (3, 'priya', 880);

1 row created.

SQL> insert into marks values (4, 'shukla', 830);

1 row created.

SQL> insert into marks values (5, 'dinesh', 1000);

1 row created.

SQL> insert into marks values (6, 'prakash', 950);

1 row created.

SQL> DECLARE
  2      v_class VARCHAR2(20);
  3
  4  BEGIN
  5      FOR c_rec IN (SELECT Roll, name, total_marks FROM marks) LOOP
  6          IF c_rec.total_marks <= 1500 AND c_rec.total_marks >= 990 THEN
  7              v_class := 'Distinction';
  8          ELSIF c_rec.total_marks <= 989 AND c_rec.total_marks >= 900 THEN
  9              v_class := 'First Class';
 10          ELSIF c_rec.total_marks <= 899 AND c_rec.total_marks >= 825 THEN
 11              v_class := 'Higher Second Class';
 12          ELSE
 13              v_class := 'Pass';
 14          END IF;
 15
 16          INSERT INTO result (Roll, Name, Class)
 17          VALUES (c_rec.Roll, c_rec.name, v_class);
 18      END LOOP;
 19
 20      COMMIT;
 21  END;
 22  /

PL/SQL procedure successfully completed.

SQL> select * from result;

      ROLL NAME                 CLASS
---------- -------------------- --------------------
         1 omkar                Distinction
         2 ashwin               Pass
         3 priya                Higher Second Class
         4 shukla               Higher Second Class
         5 dinesh               Distinction
         6 prakash              First Class

6 rows selected.
