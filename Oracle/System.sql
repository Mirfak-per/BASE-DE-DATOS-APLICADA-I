--Activar Script De Oracle Para Trabajar
alter session set "_oracle_script"=true;
--Crear Usuario Para Cargar Nuestra Base De Datos
create user BDY09EJEMPLO1 IDENTIFIED BY BDY09EJEMPLO1;
--Permisos Para Que El Usuario Pueda Hacer Cosas
grant all PRIVILEGES to BDY09EJEMPLO1;
--
