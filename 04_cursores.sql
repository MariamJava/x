--Realizar un codigo PL/SQL donde pediremos
--numero, nombre y localidad de un DEPT
--si dept existe, moodificamos su  nombre  y localidad
--si dept no existe, lo insertamos.  
undefine v_localidad;
undefine v_nombre;
undefine v_num_dept;

select * from DEPT;

DECLARE
--declaro tipo de variable
    v_num_dept DEPT.DEPT_NO%TYPE;
    v_nombre DEPT.DNOMBRE%TYPE;
    v_localidad DEPT.LOC%TYPE;
    --utilizamos cursor EXPLICITO? 
    cursor CURSORDEPT IS 
    select DEPT_NO from DEPT
    where DEPT_NO=v_num_dept;
BEGIN
--pido las variables.
    v_num_dept:= &numdept;
    v_nombre:= '&nodept';
    v_localidad:= '&locdept';

    open CURSORDEPT;
    --bucle infinito
    loop
        --2)Extraemos los datos del cursor
        FETCH  CURSORDEPT into v_num_dept;
        UPDATE DEPT set DNOMBRE = v_nombre, LOC= v_localidad;
    exit when CURSORDEPT%notfound;
        INSERT into DEPT values(DEPT_NO = v_num_dept, LOC= v_localidad, DNOMBRE= v_nombre);
        --dibujamos los datos
        DBMS_OUTPUT.PUT_LINE('Numero DEPT ' || v_num_dept || ', Nombre DEPT' || v_nombre || 'Localidad DEPT' || v_localidad );
    end loop;
    --cierro cursor dept
    CLOSE CURSORDEPT;
END;



--10, I+D,  Gijon
--Si no existe,  90, I+D, Gijon

--incrementar en 10.000 al empleado que menos cobre
--1. que necesito
--salario minimo implicito
--2 que mas--> update a ese salario 
DECLARE
    v_min_salario EMP.SALARIO%TYPE;
    v_apellido EMP.APELLIDO%TYPE;
BEGIN
    select  MIN(SALARIO) into v_min_salario from EMP;
    select APELLIDO into  v_apellido from EMP 
    where SALARIO= v_min_salario;
    update EMP  set SALARIO = SALARIO +10000  
    where SALARIO = v_min_salario;
    DBMS_OUTPUT.PUT_LINE('El salario incrementado a   ' || SQL%ROWCOUNT || ' empleado de apellido ' || v_apellido );
END;



--atributo rowcount para consultas de accion
--incrementar en 1 el salario de los empleados dept 10
--mostrar nº de emp modificados. 
BEGIN
    update EMP set SALARIO = SALARIO +1
    where DEPT_NO =10;
    dbms_output.put_line('Empleados modificados: ' || SQL%ROWCOUNT);
END;


--Hay dos cursores, implicitos o explicitos
--implicito solo devuelve una fila, si devuelve mas de una fila dará error. 
--Almacena en una variable un valor.
--No hay  que declararlo.


--Explicito,  hay que declarar el cursor, como quiera llamarlo, el valor  y el select
DECLARE
    v_ape EMP.APELLIDO%TYPE;
    v_sal EMP.SALARIO%TYPE;
    --declaramos nuestro cursor con una consulta
    --la consulta debe tener los mismos datos para luego
    --hacer el fetch
    cursor CURSOREMP IS 
    select APELLIDO, SALARIO from EMP;
BEGIN
    open CURSOREMP;
    --bucle infinito
    loop
        --2)Extraemos los datos del cursor
        FETCH  CURSOREMP into v_ape, v_sal;
        exit when CURSOREMP%notfound;
        --dibujamos los datos
        DBMS_OUTPUT.PUT_LINE('Apellido:  ' || v_ape || ', salario' || v_sal );
    end loop;
    --cerramos cursoremp
    CLOSE CURSOREMP;
END;

select * from EMP where APELLIDO= 'gutierrez';


DECLARE
    v_oficio EMP.OFICIO%TYPE;
BEGIN
    select  OFICIO into v_oficio from EMP where upper(APELLIDO)='REY';
    DBMS_OUTPUT.PUT_LINE('El oficio de REY es   ' || v_oficio );
END;


/*
DECLARE
    v_id  int;
BEGIN
    --vamos a realizar un bucle para insertar 5 departamentos
    v_id:= &numero;
    select * from DEPT where DEPT_NO=v_id;
END;
select * from DEPT;
--No puedo usar un select dentro del bloque pl/sql
--Dentro de una subconsulta si 
--insert, update, delete si. (consultas de accion)
*/


--bloque para consultas de acción
--insertar 5 dept en un bloque pl/sql dinamico
DECLARE
v_nombre dept.dnombre%type;
v_loc dept.loc%type;
BEGIN
    --vamos a realizar un bucle para insertar 5 departamentos
    for i in 1..5 loop
        v_nombre:= 'Departamento' ||  i;
        v_loc:=  'Localidad' || i;
        insert into DEPT values 
        ((select max(DEPT_NO) + 1 from DEPT)
        , v_nombre, v_loc);
    end loop;
    DBMS_OUTPUT.PUT_LINE('Fin programa');
END;
select * from DEPT;


--bloque para consultas de acción
--insertar 5 dept en un bloque pl/sql dinamico
DECLARE
v_nombre dept.dnombre%type;
v_loc dept.loc%type;
BEGIN
    --vamos a realizar un bucle para insertar 5 departamentos
    for i in 1..5 loop
        v_nombre:= 'Departamento' ||  i;
        v_loc:=  'Localidad' || i;
        insert into DEPT values (i, v_nombre, v_loc);
    end loop;
    DBMS_OUTPUT.PUT_LINE('Fin programa');
END;
select * from DEPT;