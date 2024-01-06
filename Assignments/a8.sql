Assignment No: 08
===================================================================

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> create table library(
  2  book_id int primary key,
  3  book_title varchar2(20),
  4  author varchar2(20)
  5  );

//in pl/sql use varchar2() and in sql use varchar()

Table created.

SQL> create table library_audit(
  2  book_id int,
  3  book_title varchar2(20),
  4  author varchar2(20)
  5  );

Table created.

SQL> insert into library values(1,'DSA','omkar');

1 row created.

SQL> insert into library values(2,'OOPS','vaibhav');

1 row created.

SQL> insert into library values(3,'M3','ashwin');

1 row created.

SQL> insert into library values(4,'SPOS','rohit');

1 row created.

SQL> insert into library values(5,'TOC','rutvik');

1 row created.


SQL> select * from library;

   BOOK_ID BOOK_TITLE           AUTHOR
---------- -------------------- --------------------
         1 DSA                  omkar
         2 OOPS                 vaibhav
         3 M3                   ashwin
         4 SPOS                 rohit
         5 TOC                  rutvik


SQL> select * from library_audit;

no rows selected


SQL> create or replace trigger library_audit_trigger
  2  before delete or update on library
  3  for each row
  4  begin
  5      if deleting then
  6          insert into library_audit values(:old.book_id, :old.book_title, :old.author);
  7      elsif updating then
  8          insert into library_audit values(:old.book_id, :old.book_title, :old.author);
  9      end if;
 10  end;
 11  /

Trigger created.

SQL> delete from library where book_id=2;

1 row deleted.

SQL> select * from library;

   BOOK_ID BOOK_TITLE           AUTHOR
---------- -------------------- --------------------
         1 DSA                  omkar
         3 M3                   ashwin
         4 SPOS                 rohit
         5 TOC                  rutvik


SQL> select * from library_audit;

   BOOK_ID BOOK_TITLE           AUTHOR
---------- -------------------- --------------------
         2 OOPS                 vaibhav


SQL> delete from library where book_id=1;

1 row deleted.



SQL> select * from library
  2  ;

   BOOK_ID BOOK_TITLE           AUTHOR
---------- -------------------- --------------------
         3 M3                   ashwin
         4 SPOS                 rohit
         5 TOC                  rutvik

SQL> select * from library_audit;

   BOOK_ID BOOK_TITLE           AUTHOR
---------- -------------------- --------------------
         2 OOPS                 vaibhav
         1 DSA                  omkar


SQL> update library set book_id=6 where book_id=5;

1 row updated.


SQL> select * from library;

   BOOK_ID BOOK_TITLE           AUTHOR
---------- -------------------- --------------------
         3 M3                   ashwin
         4 SPOS                 rohit
         6 TOC                  rutvik

SQL> select * from library_audit;

   BOOK_ID BOOK_TITLE           AUTHOR
---------- -------------------- --------------------
         2 OOPS                 vaibhav
         1 DSA                  omkar
         5 TOC                  rutvik
