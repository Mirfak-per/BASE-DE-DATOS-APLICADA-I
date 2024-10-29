--CREAR TABLAS
create table TIPO_CLIENT(
CODIGO INTEGER PRIMARY KEY,
NOMBRE VARCHAR2(30) NOT NULL
);

CREATE TABLE CLIENTE(
RUT INTEGER PRIMARY KEY,
NOMBRE VARCHAR2(30) NOT NULL,
APELLIDO VARCHAR2(30) NOT NULL,
TELEFONO INTEGER,
CORREO VARCHAR2(40) NOT NULL,
TIPOCLIENTE_CODIGO INTEGER NOT NULL
);

--RElACIONES
ALTER table CLIENTE
add constraint FK_TIPOCLIENTE
FOREIGN KEY (TIPOCLIENTE_CODIGO)
REFERENCES TIPO_CLIENT(CODIGO);
----
drop table CLIENTE;
drop table TIPO_CLIENT;

drop table TEMA;
drop table NACIONALIDAD;
drop table AUTOR;
drop table LIBRO;
drop table AUTOR_LIBRO;

CREATE table TEMA(
codigo_tema integer PRIMARY key,
descripcion varchar2(200)
);

create table NACIONALIDAD(
codigo_nacionalidad integer primary key,
nombre_pais varchar2(40) not null
);

Create table AUTOR(
codigo_autor integer primary key,
nombre VARCHAR2(30) not null,
pseudonimo varchar2(30),
nacionalidad_codigo integer not null
);

CREATE TABLE AUTOR_LIBRO(
autor_codigo integer not null,
libro_codigo integer not null
);

create table LIBRO(
codigo_libro integer primary key,
titulo varchar2(30) not null,
anio integer not null,
ISBN varchar2(60) not null,
catidad_paginas integer,
tema_codigo integer not null,
autor_codigo integer not null
);

alter table AUTOR
add CONSTRAINT FK_NACIONALIDAD
FOREIGN key (nacionalidad_codigo)
REFERENCES NACIONALIDAD(codigo_nacionalidad);

alter table LIBRO
add CONSTRAINT FK_TEMA
FOREIGN key (tema_codigo)
REFERENCES TEMA(codigo_tema);

ALTER table AUTOR_LIBRO
add CONSTRAINT FK_LIBRO
FOREIGN key (libro_codigo)
REFERENCES LIBRO(codigo_libro);

ALTER table AUTOR_LIBRO
add CONSTRAINT FK_AUTOR
FOREIGN key (autor_codigo)
REFERENCES AUTOR(codigo_autor);

--TABLE CON DOS ATRIBUTOS COMO PRIMARIOS
ALTER table AUTOR_LIBRO
add CONSTRAINT PK_LIBRO_AUTOR
PRIMARY KEY (AUTOR_CODIGO,LIBRO_CODIGO);