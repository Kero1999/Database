--SYS DBA--
GRANT CREATE ANY DIRECTORY
TO kyrillos;

GRANT SELECT
ON hr.EMPLOYEES
TO Kyrillos;

 

--kyrillos user--
CREATE or REPLACE DIRECTORY ext_tab
AS 'D:\4th Computer\DB\External tables';

CREATE TABLE employees_copy(
    id                      EMPLOYEES.EMPLOYEE_ID%TYPE,
    name                    EMPLOYEES.FIRST_NAME%TYPE,
    salary                  EMPLOYEES.SALARY%TYPE,
    commission_pct          EMPLOYEES.COMMISSION_PCT%TYPE
);

INSERT INTO employees_copy (id, name, salary, commission_pct)
    SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, SALARY, COMMISSION_PCT
    FROM hr.EMPLOYEES
    WHERE job_id LIKE '%REP%';

INSERT INTO
    (SELECT employee_id, last_name,
            email, hire_date, job_id, salary, 
            department_id
    FROM    EMPLOYEES
    WHERE   department_id = 200)      /*We use the WHERE clause to retrieve one row and avoid multible row*/
VALUES
    (99998, 'Taylor', 'DTAYLOR1',
        TO_DATE('07-JUN-99', 'DD-MON-RR'),
        'ST_CLERK', 5000, 50);


SELECT  a.EMPLOYEE_ID, a.SALARY,
        a.DEPARTMENT_ID, b.salavg
FROM EMPLOYEES a, (SELECT DEPARTMENT_ID, AVG(SALARY) salavg
                        FROM EMPLOYEES
                        GROUP BY DEPARTMENT_ID) b
WHERE a.DEPARTMENT_ID = b.DEPARTMENT_ID
AND a.SALARY = b.salavg;

INSERT ALL
    WHEN something THEN
        INTO
    WHEN something THEN
        INTO

        SELECT
        FROM
        WHERE


--Insert first inserts in the first hapenning condition--

MERGE INTO --table name--
USING --another table name--
ON --condition--

WHEN MATCHED THEN
    --update--
WHEN NOT MATCHED THEN
    --inesrt--
    ;


SELECT versions_starttime "START_DATE",
        versions_endtime   "END_DATE", 
       salary 
       FROM   employees
        VERSIONS BETWEEN SCN MINVALUE 
    AND MAXVALUE
    WHERE  last_name = 'Lorentz';

FLASHBACK TABLE SALARY
TO TIMESTAMP '';


























CREATE TABLE oldemp (
    fname char(25), lname CHAR(25))
    ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ext_tab
    ACCESS PARAMETERS
        (RECORDS DELIMITED BY NEWLINE
        NOBADFILE
        NOLOGFILE
        FIELDS TERMINATED BY ','
        (fname POSITION ( 1:20) CHAR,
        lname POSITION (22:41) CHAR))
        LOCATION ('emp.dat'))
        PARALLEL 5
        REJECT LIMIT 200;

INSERT INTO oldemp
VALUES ('Kyrillos', 'Adel');
