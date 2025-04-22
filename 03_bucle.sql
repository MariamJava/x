--Necesito un programa donde el usuario introducirá un texto numero: 1234
--Necesito mostrar la suma de todos los caracteres numericos en un mensaje. 
--La suma de 1234 es 10
DECLARE 
    v_texto varchar2(50);
    v_longitud  int;
    v_letra char(1);
    v_numero int;
    v_suma int;
    
BEGIN
    v_suma:= 0;
    v_texto := '&text';
    v_longitud:= length(v_texto);

    for i in 1..v_longitud loop

        v_letra:= substr(v_texto, i, 1);
        v_numero:= to_number(v_letra);
        v_suma:= v_suma + v_numero;
        dbms_output.put_line(v_numero);
    end loop;
    dbms_output.put_line('la suma de'||v_suma|| v_texto|| 'es' || v_suma);
END;



--Quiero un programa que nos pedirá un texto
--debemos recorrer dicho texto letra a letra, es decir, mostramos cada letra del texto
--de forma individual
DECLARE 
    v_texto varchar2(50);
    v_longitud  int;
    v_letra varchar2(1);
BEGIN
    v_texto := '&texto';
    -- un elemento en oracle empieza en 1
    --en un lugar de ....--> lenght
    v_longitud:= length(v_texto);
    for i in 1..v_longitud loop
    --substr(v_texto, 1, 1) --> E
    --substr(v_texto, 2, 1) --> N
        v_letra:= substr(v_texto, i, 1);
        dbms_output.put_line(v_letra);
    end loop;
    dbms_output.put_line('Fin programa');
END;


--Mostrar la tabla de multiplicar de un numero que pidamos al usuario. 
DECLARE 
    numero int;
BEGIN
    numero:=  &valor;

    for i in 1..10 loop
        dbms_output.put_line (numero || '*' || i || '=' || numero * i);
    end loop;
    dbms_output.put_line ('fin del programa');
END;
undefine valor;

--Conjetura de collatz
--la teoria indica que cualquier numero siempre llegara a ser 1
--siguiendo una serie de instrucciones.
--si el numero  es par, se divide entre 2
--si el numero es impart, se multiplica por 3 y sumamos 1.  
--6,  3, 10, 5, 16, 8, 4, 2, 1
DECLARE 
    numero int;
BEGIN
    numero:=  &num;

    while 
        numero <> 1 loop
        dbms_output.put_line (numero);
        if(mod(numero, 2) = 0) THEN
        numero:= (numero/2);
        else
        numero:=((numero*3) +1);
        end if;
    end loop;
    dbms_output.put_line (numero);
END;

undefine num;




--combinacion
--queremos un bucle pidiendo un incio y un fin
--mostrar los numeros pares comprendidos entre dicho inicio y  fin DECLARE
DECLARE 
    ini int;
    fin int;
BEGIN
    ini:=  &inicial;
    fin:= &final;
    --preguntamos por los valores de los numeros que nos han dado 
    --si el numero de incio es mayor
    for i in ini..fin loop
        if(mod(i, 2) = 0) THEN
        dbms_output.put_line(i);
        end if;
    end loop;
    dbms_output.put_line ('fin de programa');
END;

undefine inicia;
undefine final;



DECLARE
    inicio int;
    fin int;
BEGIN
    inicio:=  &inicia;
    fin:= &final;
    --preguntamos por los valores de los numeros que nos han dado 
    --si el numero de incio es mayor
    if (inicio >= fin) then
        dbms_output.put_line('El numero de inicio ('|| inicio ||') debe ser menor al numero de fin ('|| fin ||')');
    else
    for i in inicio..fin LOOP
        dbms_output.put_line(i);
    end loop;
    end if;
    dbms_output.put_line ('fin de programa');
END;

undefine inicia;
undefine final;


