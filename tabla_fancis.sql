

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
