Assignment No: 05

mysql> create table areas(
    -> radius int,
    -> area double
    -> );
    -> !
Query OK, 0 rows affected (0.02 sec)


create procedure CalculateAreas()
begin
  declare radius_val int;
  declare area_val double;

  set radius_val = 5;

  while radius_val <= 9 do
    set area_val = 3.14159265359 * power(radius_val, 2);
    insert into areas (radius, area) values (radius_val, area_val);
    set radius_val = radius_val + 1;
  end while;

  commit;
end;


mysql> select * from areas!
Empty set (0.00 sec)


call calculateareas()


mysql> select * from areas!
+--------+-----------------+
| radius | area            |
+--------+-----------------+
|      5 |  78.53981633975 |
|      6 | 113.09733552924 |
|      7 | 153.93804002591 |
|      8 | 201.06192982976 |
|      9 | 254.46900494079 |
+--------+-----------------+
5 rows in set (0.00 sec)
