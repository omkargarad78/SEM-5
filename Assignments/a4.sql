Assignment No: 04-05

CREATE TABLE Borrower (
    Rollin INT PRIMARY KEY,
    Name VARCHAR(50),
    DateofIssue DATE,
    NameofBook VARCHAR(50),
    Status CHAR(1)
);

CREATE TABLE Fine (
    Roll_no INT,
    Date DATE,
    Amt INT
);

INSERT INTO Borrower 
VALUES
  (1, 'John Doe', '2023-01-01', 'dsa', 'I'),
  (2, 'Jane Smith', '2023-02-15', 'oop', 'I'),
  (3, 'Bob Johnson', '2023-03-10', 'dbms', 'I');


========================================================================
DELIMITER //

CREATE PROCEDURE CalculateFine(IN p_roll_no INT, IN p_book_name VARCHAR(50))
BEGIN
  DECLARE days_due INT;
  DECLARE fine_amt INT;
  DECLARE status_val CHAR(1);

  SELECT DATEDIFF(NOW(), DateofIssue) INTO days_due
  FROM Borrower
  WHERE Rollin = p_roll_no AND NameofBook = p_book_name;

  IF days_due > 30 THEN
    SET fine_amt := 50 * days_due;
  ELSE
    SET fine_amt := 5 * days_due;
  END IF;

  UPDATE Borrower
  SET Status = 'R'
  WHERE Rollin = p_roll_no AND NameofBook = p_book_name;

  IF fine_amt > 0 THEN
    INSERT INTO Fine (Roll_no, Date, Amt)
    VALUES (p_roll_no, NOW(), fine_amt);
    SELECT 'Fine details stored in Fine table.' AS Message;
  ELSE
    SELECT 'No fine for the book.' AS Message;
  END IF;
END //
=======================================================================

mysql> CALL CalculateFine(1, 'dsa');
+------------------------------------+
| Message                            |
+------------------------------------+
| Fine details stored in Fine table. |
+------------------------------------+

mysql> select * from Fine;
+---------+------------+-------+
| Roll_no | Date       | Amt   |
+---------+------------+-------+
|       1 | 2023-11-19 | 16100 |
+---------+------------+-------+

mysql> select * from Borrower;
+--------+-------------+------------+------------+--------+
| Rollin | Name        | DateofIssue | NameofBook | Status |
+--------+-------------+-------------+------------+--------+
|      1 | John Doe    | 2023-01-01  | Book1      | R      |
|      2 | Jane Smith  | 2023-02-15  | Book2      | I      |
|      3 | Bob Johnson | 2023-03-10  | Book3      | I      |
+--------+-------------+-------------+------------+--------+