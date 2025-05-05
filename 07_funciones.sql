--Funcion para saber el nº de personas de un oficio
CREATE or REPLACE  FUNCTION num_personas_oficio

(p_oficio EMP.OFICIO%TYPE)
return NUMBER
as
    v_personas int;
BEGIN
    select COUNT(EMP_NO) into v_personas from EMP
    where lower(OFICIO) = lower(p_oficio);
    return  v_personas;
END;
select num_personas_oficio('ANALISTA') as PERSONAS from DUAL;

CREATE OR REPLACE FUNCTION MAYOR_DOS_NUMEROS
(p_numero1 NUMBER, p_numero2 NUMBER)
RETURN NUMBER;

BEGIN
    if(p_numero1 > p_numero2) THEN
        v_mayor := p_numero1;
    ELSE
        v_mayor := p_numero2;
    end if;
    return v_mayor;
END;
select MAYOR_DOS_NUMEROS(8 , 99) as mayor from DUAL;




