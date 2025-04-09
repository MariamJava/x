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
