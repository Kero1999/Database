CREATE USER Kyrillos2
IDENTIFIED BY kero7799adel;

--Then we have somthing called ROLE

GRANT DBA TO Kyrillos WITH ADMIN OPTION;

REVOKE DBA FROM Kyrillos;

GRANT DBA TO Kyrillos;


DROP USER Kyrillos2;

[CREATE SESSION, CREATE VIEW, CREATE TABLE, CREATE SEQUENCE, CREATE PROCEDURE]

GRANT CREATE TABLE, CREATE VIEW, create SESSION
TO Kyrillos;

REVOKE CREATE TABLE, CREATE VIEW, create SESSION
FROM Kyrillos;

CREATE ROLE regUser;

GRANT CREATE TABLE, CREATE VIEW, create SESSION
TO regUser
WITH GRANT OPTION;

GRANT regUser TO Kyrillos;

-- GRANT UPDATE(FIRST_NAME, LAST_NAME)
-- ON EMPLOYEES
-- TO Kyrillos
-- with GRANT OPTION;

CREATE USER kero
IDENTIFIED BY kero;

--On kyrillos user--
SELECT * FROM hr.EMPLOYEES;  --To select a granted table from other user's schema

--On HR user--
GRANT ALL
ON DEPARTMENTS
TO Kyrillos
WITH GRANT OPTION;

--On kyrillos user--
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM HR.DEPARTMENTS;

GRANT SELECT
ON HR.DEPARTMENTS
TO kero;

--------------------------------------DEVELOPED BY KYRILLOS ADEL-------------------------------------------
--To remove previlages from user without affecting other users grantions [a specific user left the company
--for example], DROP this user--

CREATE TABLE newTable(
    first_c             NUMBER(6) CONSTRAINT f_p_k PRIMARY KEY,
    second_c            VARCHAR2(20)
);

ALTER TABLE newTable
DROP PRIMARY KEY CASCADE;

--You can only a NOT NULL column to an empty table--

--Modifying a column default value affects only the subsequent data--
ALTER TABLE newTable
ADD (
    third_c             NUMBER(6)
);

--Changing data type can be done if the coumn has only NULL values--
--You can convert from char to varchar and vice versa only if the column has only null values--
--or not changing the size--

ALTER TABLE newTable
MODIFY (
    first_c             NUMBER(8)     CONSTRAINT f_p_k PRIMARY KEY 
);

--Disable constraint--
ALTER TABLE newTable
disable CONSTRAINT f_p_k;

CREATE INDEX f_c_ix
ON newTable(UPPER(second_c));

DROP INDEX f_c_ix;

DROP TABLE newTable;

FLASHBACK TABLE newTable
TO BEFORE DROP;

GRANT CREATE SYNONYM
TO Kyrillos;


/* It works without "GRANT UNLIMITED SPACETABLE TO <user>;"
CREATE USER ka1
IDENTIFIED BY ka1;

GRANT CREATE SESSION
TO ka1;

GRANT CREATE TABLE
TO ka1;

CREATE TABLE TAB1(
    id                      NUMBER,
    fname                   VARCHAR2(20),
    salary                  NUMBER,
    commission_pct          NUMBER
);

DROP TABLE tab1;

GRANT UNLIMITED TABLESPACE
TO ka1;

DROP USER ka1;
*/
-- Hello there I can write in multible lines at ones, can you do the same? :)
-- Hello there I can write in multible lines at ones, can you do the same? :)
-- Hello there I can write in multible lines at ones, can you do the same? :)
-- Hello there I can write in multible lines at ones, can you do the same? :)
-- Hello there I can write in multible lines at ones, can you do the same? :)
-- Hello there I can write in multible lines at ones, can you do the same? :)
-- Hello there I can write in multible lines at ones, can you do the same? :)
-- Hello there I can write in multible lines at ones, can you do the same? :)
ALTER TABLE newTable
DROP COLUMN third_c;

GRANT DROP ANY TABLE TO Kyrillos;

ALTER TABLE newTable
SET UNUSED COLUMN third_c; /*OR SET UNUSED (column1, column2...)*/

ALTER TABLE newTable
DROP UNUSED COLUMNS;

ALTER TABLE newTable
ADD CONSTRAINT s_f_k
FOREIGN KEY (second_c) REFERENCES hr.departments (DEPARTMENT_NAME) ON DELETE CASCADE;
