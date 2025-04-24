DECLARE
    v_id number;
BEGIN
    select DEPT_NO into v_id
    from DEPT
    where DNOMBRE= 'VENTAS';
    DBMS_OUTPUT.PUT_LINE('Ventas es el numero  ' || v_id);
EXCEPTION
    when TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Demasiadas filas en cursor ');
    when OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Algo esta pasando... ');
END;



-PRAGMA EXCEPTION_INIT
/*
Basadas en el numero de error. 
Se declara primero y luego se ejecuta
Asocio el error

*/


DESCRIBE DEPT;
DECLARE
    exception_nulos EXCEPTION;
    PRAGMA EXCEPTION_INIT (exception_nulos, -1400);
BEGIN
    insert into DEPT values (null, 'DEPARTAMENTO', 'PRAGMA');
EXCEPTION
    when exception_nulos then
        DBMS_OUTPUT.PUT_LINE('No me sirven los nulos... ');
END;


SELECT * FROM emp;
--cuando los emp tengan una comision con valor 0
--lanzamos excepcion
--tendremos tabla donde almacenaremos los empleados
--con comision mayor a 0
select APELLIDO, COMISION from EMP order by COMISION desc;
create table emp_comision (apellido varchar2(50), comsion number(9));
DECLARE
    --DECLARAMOS CURSOR
        cursor curosr_emp IS
        select APELLIDO, COMISION  from EMP order by COMISION DESC;
        excepcion_comision EXCEPTION;
BEGIN
    for v_record in curosr_emp
    LOOP 
        INSERT INTO EMP_COMISION values (v_record.APELLIDO, v_record.COMISION);     
        IF(v_record.COMISION=0) THEN
            RAISE excepcion_comision;
        END IF;
    END LOOP; 
EXCEPTION
    when excepcion_comision THEN
        DBMS_OUTPUT.PUT_LINE('Comisiones a ZERO ');
    --QUIERO DETENER CUANDO LA COMISION SEA =0.
    --QUIERO SABER CUANTAS VECES VA A ENTRAR.  
END;

SELECT * FROM EMP_COMISION;
--siempre la excepcion sale una vez, va al final


--Capturar una excepcion del sistema
DECLARE
    v_num1 number := &num1;
    v_num2 number := &num2;
    v_division number;
BEGIN
    v_division := v_num1 / v_num2;
    DBMS_OUTPUT.PUT_LINE('La division es  ' || v_division);
EXCEPTION
    when  ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error al dividivir entre 0');

END;

UNDEFINE num1;
UNDEFINE num2;