--arrays
--por un lado tenemos la declaracion del tipo
--por otro lado, tenemos la variable de dicho  tipo
DECLARE
    --un tipo array para numeros
    type table_numeros IS TABLE OF NUMBER
    INDEX BY BINARY_INTEGER;
    --objeto para lmacenar varios numeros
    lista_numeros table_numeros;
BEGIN
    --almacenamos datos en su interior
    lista_numeros(1):= 88;
    lista_numeros(2):= 99;
    lista_numeros(3):= 222;
    DBMS_OUTPUT.PUT_LINE('Numero elementos:'||  lista_numeros.count);
--podemos recorrer todos los registros/numeros que tenemos
    for i in 1..lista_numeros.count loop 
        DBMS_OUTPUT.PUT_LINE('Numero: ' ||  lista_numeros(i));
    end loop;
END;

--almacenamos a la vez
--guardamos un tipo de fila de dpto
DECLARE
    TYPE table_dept IS table OF DEPT%ROWTYPE  INDEX BY
     BINARY_INTEGER;
     lista_dept table_dept;
BEGIN
    select * into lista_dept(1) from DEPT where DEPT_NO=10;
    select * into lista_dept(2) from DEPT where DEPT_NO=30;
    for i in 1..lista_dept.count
    loop
        DBMS_OUTPUT.PUT_LINE(lista_dept(i).DNOMBRE || ',' ||  lista_dept(i).LOC);
    end loop;    
END;

--triggers
--restriccion de alto nivel 

create or replace trigger tr_dept_before_insert
before insert
on DEPT
for each ROW
declare 
begin 
    DBMS_OUTPUT.PUT_LINE('Trigger DEPT before insert row');
    DBMS_OUTPUT.PUT_LINE(:new.DEPT_NO || ',' || :new.DNOMBRE
    ||',' || :new.LOC);
end;
--otro para delete
create or replace trigger tr_dept_before_delete
before delete
on DEPT
for each ROW
declare 
begin 
    DBMS_OUTPUT.PUT_LINE('Trigger DEPT before insert row');
    DBMS_OUTPUT.PUT_LINE(:old.DEPT_NO || ',' || :old.DNOMBRE
    ||',' || :old.LOC);
end;
delete from DEPT where DEPT_NO=47;
select * from  DEPT;

--update
create or replace trigger tr_dept_before_update
before update
on DEPT
for each ROW
declare 
begin 
    DBMS_OUTPUT.PUT_LINE('Trigger DEPT before insert row');
    DBMS_OUTPUT.PUT_LINE(:old.DEPT_NO || ', Antigua loc: ' || :old.LOC
    ||', NUeva loc: ' || :new.LOC);
end;

select * from DEPT;

update DEPT set LOC='Vitoria' where DEPT_NO=111;

--trigger control doctor

create or replace trigger tr_doctor_control_salario_update
before update
on DOCTOR
for each ROW
--si le metemos el when le decimos cuando se tiene que activar
    when(new.SALARIO > 250000)
declare 
begin 
    DBMS_OUTPUT.PUT_LINE('Trigger DOCTOR before insert row');
    DBMS_OUTPUT.PUT_LINE('Dr/Dra ' || :old.APELLIDO
    ||'cobra mucho dinero: ' || :new.SALARIO || '. Antes: '|| :old.SALARIO);
end;

update DOCTOR set SALARIO  = 350000 where DOCTOR.DOCTOR_NO= 386;
update DOCTOR set SALARIO  = 200000 where DOCTOR.DOCTOR_NO= 435;

create or replace trigger tr_dept_before_barcelona
before insert
on DEPT
for each ROW
declare 
begin 
    DBMS_OUTPUT.PUT_LINE('Trigger  control Barcelona');
    if(upper(:new.LOC)= 'BARCELONA') then
        DBMS_OUTPUT.PUT_LINE('No se admiten dep nuevos en Barcelona');
        RAISE_APPLICATION_ERROR(-20001, 'En Munich solo ganadores');
    end if;
end;
insert into DEPT values (5, 'MILAN', 'BARCELONA');
select * from DEPT;
drop trigger tr_dept_before_insert;