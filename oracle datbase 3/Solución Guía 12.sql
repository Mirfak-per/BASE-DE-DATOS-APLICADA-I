--BORRAR TABLAS (borrar de adentro para afuera)
DROP TABLE EMPLEADO_EMPRESA;
DROP TABLE REGISTROASISTENCIA;
DROP TABLE EMPLEADO;
DROP TABLE EMPRESA;
DROP TABLE ESTADOCIVIL;
DROP TABLE COMUNA;
DROP TABLE PROVINCIA;
DROP TABLE REGION;

--CREACIÓN TABLAS (Crear de afuera para adentro)
CREATE TABLE REGION(
    IDREGION INTEGER PRIMARY KEY,
    DESCRIPCIONREGION VARCHAR2(30) NOT NULL
);

CREATE TABLE PROVINCIA(
    IDPROVINCIA INTEGER PRIMARY KEY,
    DESCRIPCIONPROVINCIA VARCHAR2(30) NOT NULL,
    REGION_IDREGION INTEGER NOT NULL
);

CREATE TABLE COMUNA(
    IDCOMUNA INTEGER PRIMARY KEY,
    DESCRIPCIONCOMUNA VARCHAR2(30) NOT NULL,
    PROVINCIA_IDPROVINCIA INTEGER NOT NULL
);

CREATE TABLE ESTADOCIVIL(
    IDESTADOCIVIL INTEGER PRIMARY KEY,
    DESCRIPCIONESTADOCIVIL VARCHAR2(30) NOT NULL
);

CREATE TABLE EMPRESA(
    IDEMPRESA INTEGER PRIMARY KEY,
    NOMBREEMPRESA VARCHAR2(30) NOT NULL,
    FECHACREACION DATE NOT NULL
);

CREATE TABLE REGISTROASISTENCIA(
    IDREGISTROASISTENCIA INTEGER PRIMARY KEY,
    DIA INTEGER NOT NULL,
    MES INTEGER NOT NULL,
    ANNO INTEGER NOT NULL,
    EMPLEADO_IDEMPLEADO INTEGER NOT NULL
);

CREATE TABLE EMPLEADO(
    IDEMPLEADO INTEGER PRIMARY KEY,
    RUTEMPLEADO  VARCHAR2(30) NOT NULL,
    NOMBREEMPLEADO VARCHAR2(30) NOT NULL,
    APELLIDOSEMPLEADO  VARCHAR2(30) NOT NULL,
    FECHANACIMIENTO DATE NOT NULL,
    SUELDO INTEGER NOT NULL,
    ESTADOCIVIL_IDESTADOCIVIL INTEGER NOT NULL,
    COMUNA_IDCOMUNA INTEGER NOT NULL
);

CREATE TABLE EMPLEADO_EMPRESA(
    EMPRESA_IDEMPRESA INTEGER NOT NULL,
    EMPLEADO_IDEMPLEADO INTEGER NOT NULL
);

--ASIGNAR DOS ATRIBUTOS PRIMARIOS
ALTER TABLE EMPLEADO_EMPRESA
    ADD CONSTRAINT EMPLEADO_EMPRESA_PK
    PRIMARY KEY (EMPRESA_IDEMPRESA,EMPLEADO_IDEMPLEADO);

--CREAMOS LAS RELACIONES
ALTER TABLE PROVINCIA ADD CONSTRAINT PROVINCIA_REGION_FK
FOREIGN KEY (REGION_IDREGION) REFERENCES REGION(IDREGION);

ALTER TABLE COMUNA ADD CONSTRAINT COMUNA_PROVINCIA_FK
FOREIGN KEY (PROVINCIA_IDPROVINCIA) REFERENCES PROVINCIA(IDPROVINCIA);

ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_COMUNA_FK
FOREIGN KEY (COMUNA_IDCOMUNA) REFERENCES COMUNA(IDCOMUNA);

ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_ESTADOCIVIL_FK
FOREIGN KEY (ESTADOCIVIL_IDESTADOCIVIL) REFERENCES ESTADOCIVIL(IDESTADOCIVIL);

ALTER TABLE REGISTROASISTENCIA ADD CONSTRAINT REGISTROASISTENCIA_EMPLEADO_FK
FOREIGN KEY (EMPLEADO_IDEMPLEADO) REFERENCES EMPLEADO(IDEMPLEADO);

ALTER TABLE EMPLEADO_EMPRESA ADD CONSTRAINT EMPLEADO_EMPRESA_EMPLEADO_FK 
FOREIGN KEY (EMPLEADO_IDEMPLEADO) REFERENCES EMPLEADO(IDEMPLEADO);

ALTER TABLE EMPLEADO_EMPRESA ADD CONSTRAINT EMPLEADO_EMPRESA_EMPRESA_FK
FOREIGN KEY (EMPRESA_IDEMPRESA) REFERENCES EMPRESA(IDEMPRESA);
/*Comandos DML*/
Insert into REGION values(1,"Region Metropolitana",1);
Insert into PROVINCIA values(1,"Cordillera",1);
insert into comuna values(1,"Puente alto");

insert into ESTADOCIVIL values(1,"Soltero");

insert into EMPLEADO values(100,"111-1","Alan","Cajardo",TO_DATE("10/04/1990"),150000,1,1);

insert into REGISTROASISTENCIA values(1000,10,12,2023,100);

Insert into EMPRESA values(101,"Duoc UC",TO_DATE("01/01/1968"));

insert into EMPLEADO_EMPRESA values(101,100);

--Consultar tabla

Select  
        EMP.NOMBREEMPLEADO,
        EMP.APELLIDOSEMPLEADO,
        ES.ESTADOCIVIL_IDESTADOCIVIL
from EMPLEADO EMP join ESTADOCIVIL ES 
ON emp.ESTADOCIVIL_IDESTADOCIVIL=es.IDESTADOCIVIL;