// Selction 1 :

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sampledb           |
| sys                |
+--------------------+
5 rows in set (0.02 sec)

// UC1 : create database | show database | use payroll_service

mysql> create database payroll_service;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sampledb           |
| sys                |
+--------------------+
6 rows in set (0.00 sec)


// UC2 : Create Table employee_payroll | Id is set to auto increment.

mysql> create table employee_payroll ( id int auto_increment primary key, name varchar(30),address varchar(40), salary decimal(10,2), start_date date );
Query OK, 0 rows affected (0.04 sec)

mysql> show tables;
+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| employee_payroll          |
+---------------------------+
1 row in set (0.00 sec)


// UC3 : INSERT INTO employee_payroll 

mysql> insert into employee_payroll values(1,"Mayur","Surat",9000.00,"2022-02-23");
Query OK, 1 row affected (0.00 sec)

mysql> select * from employee_payroll;
+----+-------+---------+---------+------------+
| id | name  | address | salary  | start_date |
+----+-------+---------+---------+------------+
|  1 | Mayur | Surat   | 9000.00 | 2022-02-23 |
+----+-------+---------+---------+------------+
1 row in set (0.00 sec)


// UC4 : SELECT * FROM employee_payroll

mysql> select * from employee_payroll;
+----+--------+---------+----------+------------+
| id | name   | address | salary   | start_date |
+----+--------+---------+----------+------------+
|  1 | Mayur  | Surat   |  9000.00 | 2022-02-23 |
|  2 | Akshay | Surat   | 10000.00 | 2020-02-23 |
|  3 | Raj    | Olpad   |  5000.00 | 2024-01-01 |
|  4 | Paras  | Olpad   | 15000.00 | 2023-06-01 |
+----+--------+---------+----------+------------+
4 rows in set (0.00 sec)

// UC5 : SELECT salary FROM employee_payroll WHERE name = 'Bill’ | WHERE start BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());

mysql> select salary from employee_payroll where name='Bill';
+----------+
| salary   |
+----------+
| 15000.00 |
+----------+
1 row in set (0.00 sec)

mysql> select * from employee_payroll where start_date between '2022-01-01' and '2023-12-31';
+----+-------+---------+----------+------------+
| id | name  | address | salary   | start_date |
+----+-------+---------+----------+------------+
|  1 | Mayur | Surat   |  9000.00 | 2022-02-23 |
|  4 | Paras | Olpad   | 15000.00 | 2023-06-01 |
|  5 | Bill  | Surat   | 15000.00 | 2023-08-10 |
+----+-------+---------+----------+------------+
3 rows in set (0.00 sec)

// UC6 : UPDATE employee_payroll set gender = 'M' where name = 'Bill' or name = 'Charlie';


mysql> UPDATE employee_payroll set gender = 'M' where name = 'Bill' or name = 'Charlie';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+----+--------+--------+---------+----------+------------+
| id | name   | gender | address | salary   | start_date |
+----+--------+--------+---------+----------+------------+
|  1 | Mayur  | NULL   | Surat   |  9000.00 | 2022-02-23 |
|  2 | Akshay | NULL   | Surat   | 10000.00 | 2020-02-23 |
|  3 | Raj    | NULL   | Olpad   |  5000.00 | 2024-01-01 |
|  4 | Paras  | NULL   | Olpad   | 15000.00 | 2023-06-01 |
|  5 | Bill   | M      | Surat   | 15000.00 | 2023-08-10 |
+----+--------+--------+---------+----------+------------+
5 rows in set (0.00 sec)

// SUM, AVG, MIN, MAX, COUNT & grop BY


mysql> select gender, count(*) AS total_employees from employee_payroll group by gender;
+--------+-----------------+
| gender | total_employees |
+--------+-----------------+
| M      |               4 |
| F      |               1 |
+--------+-----------------+
2 rows in set (0.00 sec)

mysql> select gender, SUM(salary) AS total_salary from employee_payroll group by gender;
+--------+--------------+
| gender | total_salary |
+--------+--------------+
| M      |     49000.00 |
| F      |      5000.00 |
+--------+--------------+
2 rows in set (0.00 sec)

mysql> select gender, avg(salary) AS avg_salary from employee_payroll group by gender;
+--------+--------------+
| gender | avg_salary   |
+--------+--------------+
| M      | 12250.000000 |
| F      |  5000.000000 |
+--------+--------------+
2 rows in set (0.00 sec)

mysql> select gender, min(salary) AS min_salary from employee_payroll group by gender;
+--------+------------+
| gender | min_salary |
+--------+------------+
| M      |    9000.00 |
| F      |    5000.00 |
+--------+------------+
2 rows in set (0.62 sec)

mysql>
mysql> select gender, max(salary) AS max_salary from employee_payroll group by gender;
+--------+------------+
| gender | max_salary |
+--------+------------+
| M      |   15000.00 |
| F      |    5000.00 |
+--------+------------+
2 rows in set (0.00 sec)

mysql> desc employee_payroll;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| id         | int           | NO   | PRI | NULL    | auto_increment |
| name       | varchar(30)   | YES  |     | NULL    |                |
| gender     | varchar(10)   | YES  |     | NULL    |                |
| address    | varchar(40)   | YES  |     | NULL    |                |
| salary     | decimal(10,2) | YES  |     | NULL    |                |
| start_date | date          | YES  |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
6 rows in set (0.11 sec)

// UC8 

mysql> alter table employee_payroll add column department varchar(20) after phone;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| id         | int           | NO   | PRI | NULL    | auto_increment |
| name       | varchar(30)   | YES  |     | NULL    |                |
| gender     | varchar(10)   | YES  |     | NULL    |                |
| address    | varchar(40)   | YES  |     | NULL    |                |
| phone      | varchar(13)   | YES  |     | NULL    |                |
| department | varchar(20)   | YES  |     | NULL    |                |
| salary     | decimal(10,2) | YES  |     | NULL    |                |
| start_date | date          | YES  |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
8 rows in set (0.01 sec)

mysql> alter table employee_payroll modify column department varchar(20) default 'Not Mentioned';
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+------------+---------------+------+-----+---------------+----------------+
| Field      | Type          | Null | Key | Default       | Extra          |
+------------+---------------+------+-----+---------------+----------------+
| id         | int           | NO   | PRI | NULL          | auto_increment |
| name       | varchar(30)   | YES  |     | NULL          |                |
| gender     | varchar(10)   | YES  |     | NULL          |                |
| address    | varchar(40)   | YES  |     | NULL          |                |
| phone      | varchar(13)   | YES  |     | NULL          |                |
| department | varchar(20)   | YES  |     | Not Mentioned |                |
| salary     | decimal(10,2) | YES  |     | NULL          |                |
| start_date | date          | YES  |     | NULL          |                |
+------------+---------------+------+-----+---------------+----------------+
8 rows in set (0.00 sec)


//* UC9 : basic_pay deduction  taxtablepay income_text net_pay */

mysql> alter table employee_payroll add column basic_pay decimal(10,2);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add column deduction decimal(10,2);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add column taxtablepay decimal(10,2);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add column income_text decimal(10,2);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add column net_pay decimal(10,2);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> select * from employee_payroll;
+----+--------+--------+---------+-------+------------+----------+------------+-----------+-----------+-------------+-------------+---------+
| id | name   | gender | address | phone | department | salary   | start_date | basic_pay | deduction | taxtablepay | income_text | net_pay |
+----+--------+--------+---------+-------+------------+----------+------------+-----------+-----------+-------------+-------------+---------+
|  1 | Mayur  | M      | Surat   | NULL  | NULL       |  9000.00 | 2022-02-23 |      NULL |      NULL |        NULL |        NULL |    NULL |
|  2 | Akshay | M      | Surat   | NULL  | NULL       | 10000.00 | 2020-02-23 |      NULL |      NULL |        NULL |        NULL |    NULL |
|  3 | Raj    | F      | Olpad   | NULL  | NULL       |  5000.00 | 2024-01-01 |      NULL |      NULL |        NULL |        NULL |    NULL |
|  4 | Paras  | M      | Olpad   | NULL  | NULL       | 15000.00 | 2023-06-01 |      NULL |      NULL |        NULL |        NULL |    NULL |
|  5 | Bill   | M      | Surat   | NULL  | NULL       | 15000.00 | 2023-08-10 |      NULL |      NULL |        NULL |        NULL |    NULL |
+----+--------+--------+---------+-------+------------+----------+------------+-----------+-----------+-------------+-------------+---------+
5 rows in set (0.01 sec)

mysql> insert into employee_payroll(name,gender,address,phone,department,salary,start_date,basic_pay,deduction,taxtablepay,income_text,net_pay) values("Mayur","M","Olpad","2415498808","MIS",7077.18,"2021-12-04",58976.47,2885.3,5897.65,1769.29,54321.89);
Query OK, 1 row affected (0.02 sec)

mysql> select * from employee_payroll;
+----+-------+--------+---------+------------+------------+---------+------------+-----------+-----------+-------------+-------------+----------+
| id | name  | gender | address | phone      | department | salary  | start_date | basic_pay | deduction | taxtablepay | income_text | net_pay  |
+----+-------+--------+---------+------------+------------+---------+------------+-----------+-----------+-------------+-------------+----------+
|  8 | Mayur | M      | Olpad   | 2415498808 | MIS        | 7077.18 | 2021-12-04 |  58976.47 |   2885.30 |     5897.65 |     1769.29 | 54321.89 |
+----+-------+--------+---------+------------+------------+---------+------------+-----------+-----------+-------------+-------------+----------+
1 row in set (0.00 sec)

mysql> insert into employee_payroll(name,gender,address,phone,department,start_date,salary,basic_pay,deduction,taxtablepay,income_text,net_pay) values("Yash", "M", "Udhana", "9725703996", "sales", "2023-04-25", 10964.58,91371.52,10895.81,9137.15,2741.15,77734.56);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee_payroll;
+----+-------+--------+---------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
| id | name  | gender | address | phone      | department | salary   | start_date | basic_pay | deduction | taxtablepay | income_text | net_pay  |
+----+-------+--------+---------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
|  8 | Mayur | M      | Olpad   | 2415498808 | MIS        |  7077.18 | 2021-12-04 |  58976.47 |   2885.30 |     5897.65 |     1769.29 | 54321.89 |
|  9 | Yash  | M      | Udhana  | 9725703996 | sales      | 10964.58 | 2023-04-25 |  91371.52 |  10895.81 |     9137.15 |     2741.15 | 77734.56 |
+----+-------+--------+---------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
2 rows in set (0.00 sec)

mysql> insert into employee_payroll(name,gender,address,phone,department,start_date,salary,basic_pay,deduction,taxtablepay,income_text,net_pay) values( "Akshay", "M", "Udhana", "1216554589", "marketing", "2023-02-07", 2130.86,17757.16,1134.02,1775.72,532.71,16090.42);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee_payroll(name,gender,address,phone,department,start_date,salary,basic_pay,deduction,taxtablepay,income_text,net_pay) values( "Vaibhav", "M", "Udhana", "9276854025", "sales", "2023-01-03", 1247.8,10398.3,66.46,1039.83,311.95,10019.9);
Query OK, 1 row affected (0.00 sec)

mysql> select * from employee_payroll;
+----+---------+--------+---------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
| id | name    | gender | address | phone      | department | salary   | start_date | basic_pay | deduction | taxtablepay | income_text | net_pay  |
+----+---------+--------+---------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
|  8 | Mayur   | M      | Olpad   | 2415498808 | MIS        |  7077.18 | 2021-12-04 |  58976.47 |   2885.30 |     5897.65 |     1769.29 | 54321.89 |
|  9 | Yash    | M      | Udhana  | 9725703996 | sales      | 10964.58 | 2023-04-25 |  91371.52 |  10895.81 |     9137.15 |     2741.15 | 77734.56 |
| 10 | Akshay  | M      | Udhana  | 1216554589 | marketing  |  2130.86 | 2023-02-07 |  17757.16 |   1134.02 |     1775.72 |      532.71 | 16090.42 |
| 11 | Vaibhav | M      | Udhana  | 9276854025 | sales      |  1247.80 | 2023-01-03 |  10398.30 |     66.46 |     1039.83 |      311.95 | 10019.90 |
+----+---------+--------+---------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
4 rows in set (0.00 sec)

mysql> INSERT INTO `payroll_service`.`employee_payroll` (`name`, `gender`, `address`, `phone`, `department`, `salary`, `start_date`, `basic_pay`, `deduction`, `taxtablepay`, `income_text`, `net_pay`) VALUES ('Karitk', 'M', 'Surat', '1919289777', 'returns', '5798.81', '2023-06-17', '48323.40', '351.52', '4832.34', '1449.70', '46522.18');
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee_payroll;
+----+---------+--------+---------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
| id | name    | gender | address | phone      | department | salary   | start_date | basic_pay | deduction | taxtablepay | income_text | net_pay  |
+----+---------+--------+---------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
|  8 | Mayur   | M      | Olpad   | 2415498808 | MIS        |  7077.18 | 2021-12-04 |  58976.47 |   2885.30 |     5897.65 |     1769.29 | 54321.89 |
|  9 | Yash    | M      | Udhana  | 9725703996 | sales      | 10964.58 | 2023-04-25 |  91371.52 |  10895.81 |     9137.15 |     2741.15 | 77734.56 |
| 10 | Akshay  | M      | Udhana  | 1216554589 | marketing  |  2130.86 | 2023-02-07 |  17757.16 |   1134.02 |     1775.72 |      532.71 | 16090.42 |
| 11 | Vaibhav | M      | Udhana  | 9276854025 | sales      |  1247.80 | 2023-01-03 |  10398.30 |     66.46 |     1039.83 |      311.95 | 10019.90 |
| 12 | Karitk  | M      | Surat   | 1919289777 | returns    |  5798.81 | 2023-06-17 |  48323.40 |    351.52 |     4832.34 |     1449.70 | 46522.18 |
+----+---------+--------+---------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
5 rows in set (0.00 sec)

mysql> INSERT INTO `payroll_service`.`employee_payroll` (`name`, `gender`, `phone`, `department`, `salary`, `start_date`, `basic_pay`, `deduction`, `taxtablepay`, `income_text`, `net_pay`) VALUES ('Trupti', 'M', '6788514757', 'uploading', '8869.63', '2023-04-29', '73913.59', '3009.59', '7391.36', '2217.41', '68686.59');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `payroll_service`.`employee_payroll` (`name`, `gender`, `phone`, `department`, `salary`, `start_date`, `basic_pay`, `deduction`, `taxtablepay`, `income_text`, `net_pay`) VALUES ('Anjali', 'F', '4005409585', 'returns', '2618.66', '2023-06-10', '21822.18', '1640.08', '2182.22', '654.67', '19527.44');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `payroll_service`.`employee_payroll` (`name`, `gender`, `phone`, `department`, `salary`, `start_date`, `basic_pay`, `deduction`, `taxtablepay`, `income_text`, `net_pay`) VALUES ('Bill', 'M', '5906951174', 'sales', '11013.53', '2022-12-20', '91779.38', '10656.77', '9177.94', '2753.38', '78369.22');
Query OK, 1 row affected (0.00 sec)

mysql> select * from employee_payroll;
+----+---------+--------+---------------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
| id | name    | gender | address       | phone      | department | salary   | start_date | basic_pay | deduction | taxtablepay | income_text | net_pay  |
+----+---------+--------+---------------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
|  8 | Mayur   | M      | Olpad         | 2415498808 | MIS        |  7077.18 | 2021-12-04 |  58976.47 |   2885.30 |     5897.65 |     1769.29 | 54321.89 |
|  9 | Yash    | M      | Udhana        | 9725703996 | sales      | 10964.58 | 2023-04-25 |  91371.52 |  10895.81 |     9137.15 |     2741.15 | 77734.56 |
| 10 | Akshay  | M      | Udhana        | 1216554589 | marketing  |  2130.86 | 2023-02-07 |  17757.16 |   1134.02 |     1775.72 |      532.71 | 16090.42 |
| 11 | Vaibhav | M      | Udhana        | 9276854025 | sales      |  1247.80 | 2023-01-03 |  10398.30 |     66.46 |     1039.83 |      311.95 | 10019.90 |
| 12 | Karitk  | M      | Surat         | 1919289777 | returns    |  5798.81 | 2023-06-17 |  48323.40 |    351.52 |     4832.34 |     1449.70 | 46522.18 |
| 13 | Trupti  | M      | Not Mentioned | 6788514757 | uploading  |  8869.63 | 2023-04-29 |  73913.59 |   3009.59 |     7391.36 |     2217.41 | 68686.59 |
| 14 | Anjali  | F      | Not Mentioned | 4005409585 | returns    |  2618.66 | 2023-06-10 |  21822.18 |   1640.08 |     2182.22 |      654.67 | 19527.44 |
| 15 | Bill    | M      | Not Mentioned | 5906951174 | sales      | 11013.53 | 2022-12-20 |  91779.38 |  10656.77 |     9177.94 |     2753.38 | 78369.22 |
+----+---------+--------+---------------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
8 rows in set (0.01 sec)

mysql>
mysql> /* UC10 : Ability to make Terissa as part of Sales and Marketing Department */
mysql>
mysql> UPDATE `payroll_service`.`employee_payroll` SET `salary` = '50130.00' WHERE (`id` = '8');
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE `payroll_service`.`employee_payroll` SET `salary` = '77665.79' WHERE (`id` = '9');
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE `payroll_service`.`employee_payroll` SET `salary` = '15093.59' WHERE (`id` = '10');
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE `payroll_service`.`employee_payroll` SET `salary` = '8838.56' WHERE (`id` = '11');
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE `payroll_service`.`employee_payroll` SET `salary` = '41074.89' WHERE (`id` = '12');
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE `payroll_service`.`employee_payroll` SET `salary` = '81087.24' WHERE (`id` = '13');
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE `payroll_service`.`employee_payroll` SET `salary` = '18548.85' WHERE (`id` = '14');
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE `payroll_service`.`employee_payroll` SET `salary` = '78012.47' WHERE (`id` = '15');
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+--------+---------------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
| id | name    | gender | address       | phone      | department | salary   | start_date | basic_pay | deduction | taxtablepay | income_text | net_pay  |
+----+---------+--------+---------------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
|  8 | Mayur   | M      | Olpad         | 2415498808 | MIS        | 50130.00 | 2021-12-04 |  58976.47 |   2885.30 |     5897.65 |     1769.29 | 54321.89 |
|  9 | Yash    | M      | Udhana        | 9725703996 | sales      | 77665.79 | 2023-04-25 |  91371.52 |  10895.81 |     9137.15 |     2741.15 | 77734.56 |
| 10 | Akshay  | M      | Udhana        | 1216554589 | marketing  | 15093.59 | 2023-02-07 |  17757.16 |   1134.02 |     1775.72 |      532.71 | 16090.42 |
| 11 | Vaibhav | M      | Udhana        | 9276854025 | sales      |  8838.56 | 2023-01-03 |  10398.30 |     66.46 |     1039.83 |      311.95 | 10019.90 |
| 12 | Karitk  | M      | Surat         | 1919289777 | returns    | 41074.89 | 2023-06-17 |  48323.40 |    351.52 |     4832.34 |     1449.70 | 46522.18 |
| 13 | Trupti  | M      | Not Mentioned | 6788514757 | uploading  | 81087.24 | 2023-04-29 |  73913.59 |   3009.59 |     7391.36 |     2217.41 | 68686.59 |
| 14 | Anjali  | F      | Not Mentioned | 4005409585 | returns    | 18548.85 | 2023-06-10 |  21822.18 |   1640.08 |     2182.22 |      654.67 | 19527.44 |
| 15 | Bill    | M      | Not Mentioned | 5906951174 | sales      | 78012.47 | 2022-12-20 |  91779.38 |  10656.77 |     9177.94 |     2753.38 | 78369.22 |
+----+---------+--------+---------------+------------+------------+----------+------------+-----------+-----------+-------------+-------------+----------+
8 rows in set (0.00 sec)

//* UC10 : Ability to make Terissa as part of Sales and Marketing Department */

mysql> INSERT INTO `payroll_service`.`employee_payroll` (`name`, `gender`, `phone`, `department`, `salary`, `start_date`, `basic_pay`, `deduction`, `taxtablepay`, `income_text`) VALUES ('Terissa', 'F', '8764563787', 'sales', '300000.00', '2022-12-10', '24000', '656.77', '27000.00', '3000.00');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `payroll_service`.`employee_payroll` (`name`, `gender`, `phone`, `department`, `salary`, `start_date`, `basic_pay`, `deduction`, `taxtablepay`, `income_text`) VALUES ('Terissa', 'F', '8764563787', 'marketing', '25000.00', '2022-12-10', '20000', '956.77', '22500.00', '2500.00');
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee_payroll;
+----+---------+--------+---------------+------------+------------+-----------+------------+-----------+-----------+-------------+-------------+-----------+
| id | name    | gender | address       | phone      | department | salary    | start_date | basic_pay | deduction | taxtablepay | income_text | net_pay   |
+----+---------+--------+---------------+------------+------------+-----------+------------+-----------+-----------+-------------+-------------+-----------+
|  8 | Mayur   | M      | Olpad         | 2415498808 | MIS        |  20000.00 | 2021-12-04 |  16000.00 |   2885.30 |    18000.00 |    10000.00 |   7114.70 |
|  9 | Yash    | M      | Udhana        | 9725703996 | sales      |  30000.00 | 2023-04-25 |  24000.00 |  10895.81 |    27000.00 |     3000.00 |  16104.19 |
| 10 | Akshay  | M      | Udhana        | 1216554589 | marketing  |  25000.00 | 2023-02-07 |  20000.00 |   1134.02 |    22500.00 |     2500.00 |  21365.98 |
| 11 | Vaibhav | M      | Udhana        | 9276854025 | sales      |  30000.00 | 2023-01-03 |  24000.00 |     66.46 |    27000.00 |     3000.00 |  26933.54 |
| 12 | Karitk  | M      | Surat         | 1919289777 | returns    |  20000.00 | 2023-06-17 |  16000.00 |    351.52 |    18000.00 |    10000.00 |   9648.48 |
| 13 | Trupti  | F      | Not Mentioned | 6788514757 | uploading  |  25000.00 | 2023-04-29 |  20000.00 |   3009.59 |    22500.00 |     2500.00 |  19490.41 |
| 14 | Anjali  | F      | Not Mentioned | 4005409585 | returns    |  20000.00 | 2023-06-10 |  16000.00 |   1640.08 |    18000.00 |    10000.00 |   8359.92 |
| 15 | Bill    | M      | Not Mentioned | 5906951174 | sales      |  30000.00 | 2022-12-20 |  24000.00 |  10656.77 |    27000.00 |     3000.00 |  16343.23 |
| 16 | Terissa | F      | Not Mentioned | 8764563787 | sales      | 300000.00 | 2022-12-10 |  24000.00 |    656.77 |    27000.00 |     3000.00 | 296343.23 |
| 17 | Terissa | F      | Not Mentioned | 8764563787 | marketing  |  25000.00 | 2022-12-10 |  20000.00 |    956.77 |    22500.00 |     2500.00 |      NULL |
+----+---------+--------+---------------+------------+------------+-----------+------------+-----------+-----------+-------------+-------------+-----------+
10 rows in set (0.00 sec)
