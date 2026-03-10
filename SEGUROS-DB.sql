create database SEGUROS;
use SEGUROS;

create table taller (
Codigo_Taller int,
Nombre_T varchar(20),
Direccion_T varchar(30),
primary key(Codigo_Taller)
);

create table mecanico(
Codigo_M int,
Codigo_Taller int,
primary key(codigo_M, Codigo_Taller)
);

create table mecanico_repara(
Matricula char(7),
Codigo_M int,
Codigo_Taller int,
Informe_Mecanico varchar(150),
Fecha_Reparacion date,
primary key(Matricula, Codigo_M, Codigo_Taller)
);

create table automovil(
Matricula char(7),
Pertenece_DNI char(9),
ITV boolean,
Marca varchar(15),
Combustible varchar(10),
primary key (Matricula)
);
create table coches(
Matricula char(7),
N_Puertas int,
primary key (Matricula)
);
create table autobuses(
Matricula char(7),
Aforo int,
primary key (Matricula)
);
create table camiones(
Matricula char(7),
Peso_Carga int,
primary key (Matricula)
);
create table motocicletas(
Matricula char(7),
CV int,
primary key (Matricula)
);
create table implicados_accidentes(
Codigo_A int,
Matricula char(7),
DNI char(9)
);

create table hospital(
Codigo_h int,
Nombre_h int,
Direcion_h varchar(20),
primary key (Codigo_h)
);
create table Doctor_Contratado(
Salario_d int,
Jornada_d int,
Codigo_h int,
Codigo_d int,
primary key (Codigo_h, Codigo_d)
);

create table Doctor(
Codigo_d int,
primary key (Codigo_d)
);

create table Doctor_Atiende(
Codigo_d int,
DNI varchar(9),
Informe_Medico varchar(150),
Fecha_Visita Date,
primary key (Codigo_d,DNI)
);

create table Personas(
DNI varchar(9),
Nombre varchar(15),
Edad int,
Direccion_p varchar(20),
primary key (DNI)
);

create table No_Clientes(
DNI varchar(9),
primary key (DNI)
);

create table Clientes(
Puntos_carnet int,
DNI varchar(9),
primary key (DNI)
);

create table Cliente_Usa_Automovil(
Matricula char(7),
DNI varchar(9),
Tipo_Seguro varchar(15),
primary key (Matricula, DNI)
);

create table Accidentes(
Codigo_A int,
Ubicaccion varchar(20),
Fecha Date,
primary key (Codigo_A) 
);
