/*********************CURSORS*********************/
/******************Kyrillos Adel******************/
/******************Final Review*******************/
/*************************************************/
/*************************************************/

--Every SQL statement has an individual cursor associated
--to it
/*[OPEN] the CURSOR (Execute the query associated to it)
**Then position the cursor -cursor pointer- to the first
**row
**[FETCH]: Retrieves the current row and advances the
**CURSOR to the next one until the CURSOR is empty
**[CLOSE]: releases the CURSOR
*/
-- SET SERVEROUTPUT ON;

/*
DECLARE
    CURSOR emp_cursor IS
        SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME Full_name
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID = 30;
    -- emp_record emp_cursor%ROWTYPE;
BEGIN
    FOR emp_record IN emp_cursor LOOP
        DBMS_OUTPUT.PUT_LINE(emp_record.EMPLOYEE_ID
                                ||' '||
                                emp_record.Full_name);
    END LOOP;


    -- LOOP
    --     FETCH emp_cursor INTO emp_record;
    --     EXIT WHEN emp_cursor%NOTFOUND;
    --     DBMS_OUTPUT.PUT_LINE(emp_record.EMPLOYEE_ID||' '||emp_record.Full_name);
    -- END LOOP;
    -- CLOSE emp_cursor;
END;
*/

-- BEGIN
--     -- Here we cannot use CURSOR attributes like %NOTFOUND
--     FOR emp_record IN (SELECT EMPLOYEE_ID, LAST_NAME
--                         FROM EMPLOYEES
--                         WHERE DEPARTMENT_ID=30)
--     LOOP
--         DBMS_OUTPUT.PUT_LINE(emp_record.EMPLOYEE_ID
--                                 ||' '||
--                                 emp_record.LAST_NAME);
--     END LOOP;
-- END;

/*CURSOR with parameter*/
DECLARE
    CURSOR emp_cursor(deptno NUMBER) IS
        SELECT      EMPLOYEE_ID, LAST_NAME
        FROM        EMPLOYEES
        WHERE       DEPARTMENT_ID=deptno
        FOR UPDATE WAIT 20;
BEGIN
    DBMS_OUTPUT.PUT_LINE('department number = 30');
    FOR emp_record IN emp_cursor(30) LOOP
        DBMS_OUTPUT.PUT_LINE(emp_record.EMPLOYEE_ID
                                ||' '||
                                emp_record.LAST_NAME);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('department number = 20');
    FOR emp_record IN emp_cursor(20) LOOP
        DBMS_OUTPUT.PUT_LINE(emp_record.EMPLOYEE_ID
                                ||' '||
                                emp_record.LAST_NAME);
    END LOOP;
    UPDATE EMPLOYEES
        SET SALARY = 10000
        WHERE CURRENT OF emp_cursor(30);
END;

