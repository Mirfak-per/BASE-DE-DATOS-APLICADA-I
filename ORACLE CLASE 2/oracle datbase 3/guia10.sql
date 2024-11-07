
--drop table COMUNA;
--drop table PROVINCIA;
--drop table REGION;
--drop table MES;
--drop table REGISTRO_ASISTENCIA;
--drop table EMPRESA;
--drop table EMPLEADO_EMPRESA;
--drop table ESTADO_CIVIL;
--drop table EMPLEADO;

Create table COMUNA(
id_comuna INTeger primary key,
descripcion_comuna VARCHAR2(30) not null,
provincia_id_provincia integer not null
);

Create table PROVINCIA(
id_provincia INTEGER PRIMARY key,
descripcion_provincia varchar2(30) not null,
region_id_region INteger not null
);

Create table REGION(
id_region integer primary key,
descripcion_region varchar2(30)
);

Create table MES(
id_mes integer primary key,
descripcione_mes varchar2(30)
);

Create table REGISTRO_ASISTENCIA(
id_registro_asistencia integer primary key,
dia integer not null,
anno integer not null,
mes_id_mes integer not null,
empleado_idempleado integer not null
);

create table EMPRESA(
id_empresa integer primary key,
nombre_empresa varchar2(30) not null,
fecha_creacion date not null
);

create table EMPLEADO_EMPRESA(
empresa_id_empresa integer not null,
empleado_id_empresa integer not null
);

create table ESTADO_CIVIL(
id_estado_civil integer primary key,
descripcion_estado_civil VARCHAR2(30) not null
);

create table EMPLEADO(
id_empleado integer primary key,
rut_empleado varchar2(30) not null,
nombres_empleado VARCHAR2(30) not null,
apellidos_empleado VARCHAR2(30) not null,
fecha_nacimiento date not null,
sueldo integer not null,
estado_civil_id_estado_civil integer not null,
comuna_id_comuna integer not null
);

alter table COMUNA 
add CONSTRAINT FK_comuna_provincia
FOREIGN key (provincia_id_provincia)
REFERENCES PROVINCIA (id_provincia);

alter table PROVINCIA
add CONSTRAINT provincia_region_FK
FOREIGN key (region_id_region)
references region(id_region);

alter table EMPLEADO 
add CONSTRAINT empleado_comuna_FK
FOREIGN key (comuna_id_comuna)
REFERENCES COMUNA(id_comuna);

alter table REGISTRO_ASISTENCIA
add CONSTRAINT registro_asistencia_mes_FK
FOREIGN key (mes_id_mes)
references MES(id_mes);

alter table REGISTRO_ASISTENCIA
add CONSTRAINT registro_asistencia_empleado_FK
FOREIGN key (empleado_idempleado)
references EMPLEADO(id_empleado);

alter table EMPLEADO
add CONSTRAINT empleado_estado_civil_FK
FOREIGN key (estado_civil_id_estado_civil)
REFERENCES ESTADO_CIVIL(id_estado_civil);

alter table EMPLEADO_EMPRESA
add CONSTRAINT  empleado_empresa_empresa_FK
FOREIGN key (empresa_id_empresa)
REFERENCES EMPRESA(id_empresa);

alter table EMPLEADO_EMPRESA
add CONSTRAINT  empleado_empresa_empleado_FK
FOREIGN key (empleado_id_empresa)
REFERENCES EMPRESA(id_empresa);

alter table EMPLEADO_EMPRESA
add CONSTRAINT  empleado_empresa_PK
PRIMARY key (empresa_id_empresa,empleado_id_empresa);