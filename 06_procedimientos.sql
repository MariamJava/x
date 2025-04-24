--ejemplo procedimiento para mostrar un mensaje  
CREATE  or REPLACE PROCEDURE  sp_mensaje
AS
begin
        --mostramos mensaje
        DBMS_OUTPUT.PUT_LINE('Hoy es juernes con musica !!! ');
end;
--Este procedimiento ya no se mueve de ahi
--dependiendo de donde este yo para llamarlo

begin
    sp_mensaje;
end;

--procedimiento con bloque pl/sql


CREATE or REPLACE PROCEDURE sp_ejemplo_plsql
as
BEGIN

    DECLARE
        v_numero number;
    BEGIN
        v_numero:= 14;
        if v_numero  > 0 then
            DBMS_OUTPUT.PUT_LINE('Positivo ');
        else 
            DBMS_OUTPUT.PUT_LINE('Negativo ');

        end if;
    END;
END;
--si tenemos todo bien escribo el procedimiento.
BEGIN
        SP_EJEMPLO_PLSQL;
END;
--Tenemo otra sintaxis para tener variables
--dentro de un procedimiento
--no se utiliza declade
CREATE or REPLACE PROCEDURE sp_ejemplo_plsql2
AS
    v_numero NUMBER:= 14;
BEGIN
        v_numero:= 14;
        if v_numero  > 0 then
            DBMS_OUTPUT.PUT_LINE('Positivo ');
        else 
            DBMS_OUTPUT.PUT_LINE('Negativo ');

        end if;
END;

BEGIN
        SP_EJEMPLO_PLSQL2;
END;

CREATE or REPLACE PROCEDURE sp_sumar_numeros
(p_numero1 number, p_numero2 number)
as
    v_suma number;
BEGIN
    v_suma := p_numero1 + p_numero2;
    DBMS_OUTPUT.PUT_LINE('La suma de ' || p_numero1||
    '+'||p_numero2||' es igual a  '||v_suma);
END;

BEGIN
    sp_sumar_numeros(5,6);
END;

--Necesito un procedimiento para dividir dos numeros: 
CREATE or REPLACE PROCEDURE sp_dividir_numeros
(p_numero1 number, p_numero2 number)
AS
BEGIN
    DECLARE
        v_division NUMBER;
    BEGIN
        v_division :=  p_numero1 / p_numero2;
        DBMS_OUTPUT.PUT_LINE('La division de ' || p_numero1 ||
        ' / ' ||p_numero2|| ' es igual a '||v_division);
        EXCEPTION
        when ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('Division entre cero ');
    END;
        
EXCEPTION
    when ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Division entre cero PROCEDURE');
END;

BEGIN
    SP_DIVIDIR_NUMEROS(16,0);
EXCEPTION
    when  ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('diVISION ENTRE CERO, pl/sql');
END;

