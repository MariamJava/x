--VISTA ES LO MISMO QUE  UNA TABLA
--UNA VISTA  PUEDE 
--LOS DATOS DE LOS EMPLEADOS SIN EL SALARIO NI COMISION, DIR.
CREATE OR REPLACE VIEW V_EMPLEADOS
AS
    SELECT  EMP_NO,  APELLIDO, OFICIO, FECHA_ALT, DEPT_NO from EMP;

SELECT * FROM  V_EMPLEADOS;
-- UNA VISTA SIMPLIFICA LAS CONSULTAS
--MOSTRAR APPELLIDO, OFICIO, SALARIO, N DEPT, LOC DE EMP
CREATE OR REPLACE view V_EMP_DEPT
as 
    select EMP.APELLIDO, EMP.OFICIO, EMP.SALARIO,
DEPT.DNOMBRE, DEPT.LOC
from EMP 
inner join DEPT 
on EMP.DEPT_NO = DEPT.DEPT_NO;
select * from V_EMP_DEPT;

SELECT  * FROM user_views where VIEW_NAME='V_EMP_DEPT';
select * from V_EMPLEADOS where OFICIO='ANALISTA';

--modificar el salario de los empleados analista 
select * from V_EMPLEADOS;
update  EMP set SALARIO = SALARIO +1 where OFICIO='ANALISTA';
select * from EMP;
update V_EMPLEADOS set SALARIO = SALARIO  + 1 where OFICIO='ANALISTA';

delete from V_EMPLEADOS where EMP_NO=7917;

insert into V_EMPLEADOS VALUES
(1111, 'lunes', 'LUNES', 0, sysdate,  40);

create or replace view V_VENDEDORES
as
    select  EMP_NO, APELLIDO, OFICIO,
    SALARIO, DEPT_NO from EMP
    where OFICIO='VENDEDOR';
update V_VENDEDORES set SALARIO = SALARIO +1;
update V_VENDEDORES set OFICIO  = 'VENDIDOS';
select  * from V_VENDEDORES;

--Vista inutil porque el oficio se ha modificado el where
rollback;
