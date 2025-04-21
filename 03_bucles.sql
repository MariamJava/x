--vamos a mostrar la suma de los 100 primeros numeros
--1) LOOP..END LOOP

DECLARE
    --variables contador suelen denominarse
    --con una sola letra: i,z, k
    i int;
    suma int;
BEGIN
    --debemos iniciar i, si  no será null
      i :=1;
    --inicializamos suma
    suma:= 0;
    LOOP
        --instrucciones  sumar,restar,dividir etc
        suma := suma +  i;
        --incrementamos la vvariable i
        --la base de mi logica
        i:= i + 1;
        --debemos indicar cuando queremos que el 
        --bucle finalice
        --quiero que finalice cuando i= 100
        exit when i> 100;
    END LOOP;
    dbms_output.put_line('La suma de los 100 primeros numeros es: '
    || suma);
END;

--2) while.. loop
--La condicion se evalua antes de entrar 
DECLARE
    i int;
    suma int;
BEGIN
    i:= 1;
    suma:=0;
    while i < 100 LOOP
    --instrucciones
    suma := suma + i;
    i:= i + 1; 
    END LOOP;
    dbms_output.put_line('La suma de los 100 primeros numeros es '
    || suma);
END;

--3) BUCLE for--loop (contador)
--cuando sabemos el incio  y el fin
DECLARE
    suma int;
BEGIN
    suma :=  0;
    for i in 1..100 loop
        suma  := suma + i;
    end  loop;
    dbms_output.put_line('La suma de los primeros 100 numeros es '
    || suma);
END;

DECLARE
    suma int;
BEGIN
    suma :=  0;
    dbms_output.put_line('Inicio');
    dbms_output.put_line('Antes del bucle');
    for i in 1..100 loop
        suma  := suma + i;
    end  loop;
    dbms_output.put_line('Despues del bucle');
    dbms_output.put_line('La suma de los primeros 100 numeros es '
    || suma);
END;

--No podemos duplicar etiquetas con el mismo nombre
--la etiqueta debe tener bloque o conjunto ordenado
--No se puede saltar al interior de un bucle
--No se puede saltar al interior de una orden if

--a los bucles se les puede poner sentencia exit

--EJEMPLOS
--BUCLE PARA MOSTRAR LOS NUMEROS ENTRE ! Y 10
--necesito  bucle while
--necesio bucle for

DECLARE
    i int;
    suma int;
BEGIN
    i := 1;
    suma:= 0;
    while  i<= 10 LOOP
        dbms_output.put_line(i);
        i:=i+1;
    END LOOP;
    dbms_output.put_line('fin del bucle while');
END;

DECLARE

BEGIN
    for i in 1..10 loop
        dbms_output.put_line(i);
    END LOOP;
    dbms_output.put_line('fin del bucle while');
END;

--pedir al usuario un numero incio & inicio
--un numero final
--mostrar los numeros comprendidos dentro de dicho rango

DECLARE
    inicio int;
    fin int;
BEGIN
    inicio:=  &inicio;
    fin:= &final;
    for i in inicio..fin LOOP
        dbms_output.put_line(i);
    end loop;
    dbms_output.put_line ('fin de programa');
END;

undefine inicio;
undefine final;