/********************EXCEPTIONS*******************/
/******************Kyrillos Adel******************/
/******************Final Review*******************/
/*************************************************/
/*************************************************/

-- SET SERVEROUTPUT ON;
DECLARE
    insert_exception    EXCEPTION;
    invalid_department  EXCEPTION;
    PRAGMA EXCEPTION_INIT(insert_exception, -01400);
    lname VARCHAR2(15);
    deptno NUMBER := &deptno;
BEGIN
    INSERT INTO DEPARTMENTS
        (DEPARTMENT_ID, DEPARTMENT_NAME)
    VALUES
        (280, NULL);

    IF SQL%NOTFOUND THEN
        RAISE_APPLICATION_ERROR
            (-20202, 'This is not a valid manager');
        RAISE invalid_department;
    END IF;
    -- SELECT last_name
    -- INTO lname
    -- FROM employees
    -- WHERE first_name='John'; 
    -- DBMS_OUTPUT.PUT_LINE ('John''s last name is : '
    --                       ||lname);

EXCEPTION
    WHEN invalid_department THEN
        DBMS_OUTPUT.PUT_LINE('Ay 7aga');
        /*Here I can use RAISE statment by itself
        **to re-raise the same exception and propagate
        **it to the calling environment. 
        */
        RAISE_APPLICATION_ERROR
            (-20202, 'This is not a valid manager');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Your select statement retrieved multiple rows.
                            Consider using a cursor.');

    WHEN insert_exception THEN
        DBMS_OUTPUT.PUT_LINE('Insert operation failed');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);

    WHEN OTHERS THEN -- Must be the last one
        DBMS_OUTPUT.PUT_LINE('haha');
END;
/*
**There are three types of exceptions:-
**  1.Predefined oracle server (Implicitly raised)
**  2.Non-predefined oracle server (Implicitly raised)
**  3.User-defined (Explicitly raised)
*/
/*
**You cannot use SQLCODE or SQLERRM directly in a SQL
**statment, instead assign their values them to
**local variables, then use the variables.
*/

