--DDL: Lenguaje de descripcion de datos
--Para crear el modelo de la base de datos

CREATE TABLE MARCA(
    CODIGO INTEGER PRIMARY KEY,
    NOMBRE VARCHAR2(30) not null
);

CREATE TABLE PRODUCTO(
    CODIGO INTEGER PRIMARY KEY,
    NOMBRE VARCHAR2(30) not null,
    DESCRIPCION VARCHAR2(200) not null,
    stock integer not null,
    precio integer not null,
    MARCA_CODIGO Integer not null

);

--agregando clave foreanea de marca a producto
--alteramos la tabla producto
ALTER TABLE PRODUCTO 
--agregamos una restriccion
add CONSTRAINT PRODUCTO_MARCA_FK
--agregamos la clave foranea
FOREIGN key (MARCA_CODIGO) 
--agregamos de donde viene
REFERENCES MARCA(CODIGO);

--DML: lenguaje de manipulacion de datos
--para insertar datos sobre la tabla 

INSERT INTO MARCA VALUES (10,'LG');
INSERT INTO MARCA VALUES (20,'Lenovo');
INSERT INTO MARCA VALUES (30,'HP');
INSERT INTO MARCA VALUES (40,'Samsung');
INSERT INTO MARCA VALUES (50,'Motorola');

select * from marca;

Insert INTO PRODUCTO VALUES(1001,'notebook','descripcion',55,850000,20);

--confirmar los cambios realizados
commit;