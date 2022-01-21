INSERT INTO departments 
           (department_id, department_name, location_id)
VALUES     (&department_id, '&department_name',&location);

UPDATE EMPLOYEES
SET DEPARTMENT_ID = 400
WHERE FIRST_NAME = '%kero%';

DELETE FROM DEPARTMENTS
WHERE
    DEPARTMENT_NAME LIKE '%HELLO%';


CREATE TABLE emp_copy(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID);


CREATE TABLE emp_with_cons(
    EMPLOYEE_ID NUMBER(8) CONSTRAINT emp_id_cons PRIMARY KEY,
    FIRST_NAME VARCHAR2(20), 
);

CREATE TABLE test2(
    empid NUMBER(8),
    FIRST_NAME VARCHAR2(20) CONSTRAINT name_cannot_be_null NOT NULL
);

CREATE TABLE employees_test(
    employee_id          NUMBER(6),
    dept_id              NUMBER(4),
    last_name            VARCHAR2(25) NOT NULL,
    email                VARCHAR2(25) CONSTRAINT emp_test_email_uk UNIQUE,
    salary               NUMBER(8,2) CONSTRAINT s_cons CHECK(salary > 0),
    commission_pct       NUMBER(2,2),
    hire_date            DATE NOT NULL
);


CREATE TABLE emp_copy
AS
    SELECT
        *
    FROM
        EMPLOYEES;

ALTER TABLE emp_copy
ADD emp_he5a        VARCHAR2(20);


--VIEW
CREATE VIEW 	empvu80
 AS SELECT  employee_id, last_name, salary
    FROM    employees
    WHERE   department_id = 80;

CREATE OR REPLACE VIEW empvu80
    (id_number, full_name,salary)
AS SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME, SALARY
    FROM EMPLOYEES;

CREATE VIEW emp_view
AS SELECT e.EMPLOYEE_ID, e.FIRST_NAME || ' ' || e.LAST_NAME FULL_EMP_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
    FROM EMPLOYEES e JOIN DEPARTMENTS d
    ON e.DEPARTMENT_ID = d.department_id;

SELECT * FROM emp_view;

CREATE OR REPLACE VIEW empvu80
    (id_number, full_name,salary)
AS SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME, SALARY
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 20
    WITH READ ONLY;

CREATE SEQUENCE dept_id_seq
    INCREMENT BY 2
    START WITH 100
    NOMAXVALUE
    NOCYCLE
    NOCACHE;


INSERT INTO DEPARTMENTS
    VALUES (DEPARTMENTS_SEQ.NEXTVAL, 'Embedded', 200, 2500);

SELECT DEPARTMENTS_SEQ.CURRVAL FROM DUAL;

DROP TABLE test_sequence;

CREATE TABLE test_sequence(
    test_id     NUMBER(6) DEFAULT he5a11.NEXTVAL,
    test_NAME   VARCHAR2(20)
);

DROP SEQUENCE he5a;

CREATE SEQUENCE dept_id_seq
    INCREMENT BY 2
    START WITH 100
    NOMAXVALUE
    NOCYCLE
    NOCACHE;

INSERT INTO test_sequence (test_NAME)
VALUES('ay 7aga');

INSERT INTO test_sequence (test_NAME)
VALUES('ay 7aga');

CREATE SEQUENCE he5a11
    INCREMENT BY 2
    START WITH 200
    MAXVALUE 210
    MINVALUE 150
    cycle
    nocache;

CREATE INDEX first_name_index
ON EMPLOYEES(FIRST_NAME);

CREATE SYNONYM tseq
FOR test_sequence;

DROP SYNONYM tseq;

COMMENT ON TABLE test_sequence
IS 'Test sequence info.';


CREATE USER Kyrillos
IDENTIFIED BY kero7799del;




INSERT INTO EMP_WITH_CONS(
    EMPLOYEE_ID,
    FIRST_NAME
  )
VALUES
  (
    123,
    'Kyrillos'
  );




CREATE TABLE HIRE_DATES
                (id NUMBER(8), HIRE_DATE DATE DEFAULT SYSDATE);

DESCRIBE HIRE_DATES;

CREATE TABLE time_stamp
                (id NUMBER(8), insertion_date TIMESTAMP(7));

CREATE TABLE time_example3
  (day_duration INTERVAL DAY (3) TO SECOND);

  INSERT INTO time_example3 (day_duration)
  VALUES (INTERVAL '180' DAY(3));

  SELECT sysdate + day_duration "Half Year"
  FROM   time_example3;