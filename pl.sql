/*  *Benefits of PL/SQL
        1.Integration with procedural constructs SQL
        2.Improved performance
        3.Modularized program development
        4.Exception handling
        5.Portability
        6.Integration with oracle tools
*/

-- SET SERVEROUTPUT ON;

-- -- VARIABLE emp_id     NUMBER := 120; --Not supported
-- -- PRINT emp_id;

-- -- ACCEPT emp_id PROMPT 'please enter a valid id: '

-- DEFINE l_name = your_name;


-- DECLARE
--     EMPLOYEE_ID     EMPLOYEES.EMPLOYEE_ID%TYPE;
--     emp_id          NUMBER(6);
--     bdate           DATE;
--     location        VARCHAR2(20) := q'[sdlkfknsdfns]';
--     c_comm          CONSTANT NUMBER DEFAULT 1400;
-- BEGIN
-- SELECT EMPLOYEE_ID INTO EMPLOYEE_ID
-- FROM EMPLOYEES
-- WHERE LAST_NAME = 'Kochhar';
-- DBMS_OUTPUT.PUT_LINE('Hello from pl/sql'||' '||EMPLOYEE_ID||' '||SQL%rowcount);
-- END;


DECLARE
    TYPE emp_rec IS RECORD(
        LAST_NAME       VARCHAR2(25),
        JOB_ID          VARCHAR2(10),
        SALARY          NUMBER(8,2)
    );

    TYPE emp_idx_tab IS TABLE OF
        EMPLOYEES.FIRST_NAME%TYPE
        INDEX BY PLS_INTEGER;

    TYPE emp_inf_idx_tab IS TABLE OF
        EMPLOYEES%ROWTYPE
        INDEX BY PLS_INTEGER;

    emp_rec2        EMPLOYEES%ROWTYPE;

    emp_record          emp_rec;
    age_you NUMBER := &yor_age;
BEGIN
    --Use the SET ROW  = record_name, in update--

    CASE age_you
        WHEN 22 THEN
            DBMS_OUTPUT.PUT_LINE('You are an adult');
        ELSE
            DBMS_OUTPUT.PUT_LINE('You still a kid');
    END CASE;

    -- IF age_you>18 THEN
    --     DBMS_OUTPUT.PUT_LINE('You are an adult');
    -- ELSIF age_you<18 THEN
    --     DBMS_OUTPUT.PUT_LINE('You still a kid');
    -- END IF;
END;

-- LOOP 
--     Statments
--     EXIT WHEN (condition)
-- END LOOP;

-- WHILE condition LOOP
--     ALL_STATEMENTS
-- END LOOP;

-- FOR i IN 1..3 LOOP
--     ALL_STATEMENTS
-- END LOOP;


-- DECLARE

-- BEGIN


-- EXCEPTION


-- END;