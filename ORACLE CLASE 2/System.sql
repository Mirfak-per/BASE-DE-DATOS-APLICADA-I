--2 Activar script
ALTER SESSION SET "_oracle_script" = true;
--3 crear usuario
create user UNIDAD3_USUARIO1 IDENTIFIED by duoc;
--4 dar permisios al usuario
grant all PRIVILEGES TO UNIDAD3_USUARIO1;