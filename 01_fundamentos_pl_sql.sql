declare
--mi comentario
--declaramos una variable
    numero int;
    texto varchar2(50);
BEGIN
    texto:='mi primer PL/SQL';
    dbms_output.put_line('Mensaje:' || texto);
    DBMS_OUTPUT.PUT_LINE('Mi primer bloque anonimo');
    numero := 44;
    DBMS_OUTPUT.PUT_LINE('valor numero: ' ||  numero);
    numero := 22;
    DBMS_OUTPUT.PUT_LINE('valor numero: ' ||  numero);
END;
--no puedo pintar y declarar a la vez.
/*
Que se puede hacer? Pedir variables al usuario
*/

DECLARE
    nombre VARCHAR2(30);
BEGIN
    NOMBRE:= 'ALUMNO';
    DBMS_OUTPUT.PUT_LINE('Su nombre es ' || nombre);
end;

DECLARE
    nombre VARCHAR2(30);
BEGIN
    NOMBRE:= '&dato';
    DBMS_OUTPUT.PUT_LINE('Su nombre es ' || nombre);
end;


DECLARE
    fecha date;
    texto varchar2(50);
    longitud int;
BEGIN
    fecha := SYSDATE;
    texto := '&data';
    --lo que quiero es almacenar la longitud del texto
    longitud := LENGTH(texto);
    --la longitud de su texto es 41
    DBMS_OUTPUT.PUT_LINE('La  longitud de su texto es '|| longitud);
    -- hoy es ... miercoles
    DBMS_OUTPUT.PUT_LINE('Hoy es' || to_char(fecha, 'day'));
    DBMS_OUTPUT.PUT_LINE(texto);
END;    



--Quiero un programa sencillo, que pida dos numeros y probar.  

DECLARE 
    numero1 int;
    numero2 int;
    suma int;
BEGIN
    numero1 := &num1;
    numero2 := &num2;
    suma :=  numero1  + numero2;
    DBMS_OUTPUT.PUT_LINE('La suma de  ' ||  numero1
    || '+' || numero2|| '='|| suma);
end;

UNDEFINE num1;
UNDEFINE num2;
--Quitar la def de las variables para que sea mas dinamico
--no podemos hacer un  select para mostrar datos. 
DECLARE
    v_departamento int;
BEGIN
    --pedimos un nº al usuario de dept
    v_departamento  :=  &dept;
    update EMP set SALARIO = SALARIO +  1 where DEPT_NO =  v_departamento;
end;
UNDEFINE dept;

select * from EMP;



