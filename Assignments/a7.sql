Assignment No: 07
==================================================================

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

CREATE TABLE N_Rollcall (
    rollcall_id INT PRIMARY KEY,
    student_name VARCHAR(20),
    attendance_status VARCHAR(10)
);

CREATE TABLE O_Rollcall (
    rollcall_id INT PRIMARY KEY,
    student_name VARCHAR(20),
    attendance_status VARCHAR(10)
);



insert into O_RollCall values(1,'omkar','present'),(2,'aniket','absent'),(3,'advik','absent'),(4,'jadeja','absent'),(5,'kohli','absent');


insert into N_RollCall values(4,'jadeja','absent'),(5,'kohli','absent');



SQL> select * from O_RollCall;

ROLLCALL_ID STUDENT_NAME         ATTENDANCE_STATUS
----------- -------------------- --------------------
          1 omkar                present
          2 aniket               absent
          3 advik                absent
          4 jadeja               absent
          5 kohli                absent

SQL> select * from N_RollCall;

ROLLCALL_ID STUDENT_NAME         ATTENDANCE_STATUS
----------- -------------------- --------------------
          4 jadeja               absent
          5 kohli                absent

==========================================================================================
DELIMITER //

CREATE PROCEDURE MoveData(IN p_rollcall_id INT)
BEGIN
  DECLARE rollcall_id_val INT;
  DECLARE student_name_val VARCHAR(255);
  DECLARE attendance_status_val VARCHAR(10);
  DECLARE flag INT DEFAULT 0;

  SET rollcall_id_val := p_rollcall_id;

  SELECT COUNT(*) INTO flag
  FROM N_Rollcall
  WHERE rollcall_id = rollcall_id_val;

  IF flag = 0 THEN
    SELECT student_name, attendance_status INTO student_name_val, attendance_status_val
    FROM O_Rollcall
    WHERE rollcall_id = rollcall_id_val;

    INSERT INTO N_Rollcall (rollcall_id, student_name, attendance_status)
    VALUES (rollcall_id_val, student_name_val, attendance_status_val);

    SELECT 'Data moved successfully from O_Rollcall to N_Rollcall...' AS Message;
  ELSE
    SELECT 'Data skipped. Record already present in N_Rollcall' AS Message;
  END IF;
END //

DELIMITER ;
===============================================================================



mysql> CALL MoveData(4);
+----------------------------------------------------+
| Message                                            |
+----------------------------------------------------+
| Data skipped. Record already present in N_Rollcall |
+----------------------------------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> select * from N_Rollcall;
+-------------+--------------+-------------------+
| rollcall_id | student_name | attendance_status |
+-------------+--------------+-------------------+
|           4 | jadeja       | absent            |
|           5 | kohli        | absent            |
+-------------+--------------+-------------------+
2 rows in set (0.00 sec)

mysql> CALL MoveData(1);
+----------------------------------------------------------+
| Message                                                  |
+----------------------------------------------------------+
| Data moved successfully from O_Rollcall to N_Rollcall... |
+----------------------------------------------------------+
1 row in set (0.00 sec)