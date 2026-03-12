drop database if exists SEGUROS;
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
primary key(Codigo_M, Codigo_Taller)
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
Nombre_h varchar(20),
Direcion_h varchar(20),
primary key (Codigo_h)
);
create table doctor(
Codigo_d int,
primary key (Codigo_d)
);
create table doctor_contratado(
Salario_d int,
Jornada_d int,
Codigo_h int,
Codigo_d int,
primary key (Codigo_h, Codigo_d)
);

create table doctor_atiende(
Codigo_d int,
DNI char(9),
Informe_Medico varchar(150),
Fecha_Visita Date,
primary key (Codigo_d,DNI)
);

create table personas(
DNI char(9),
Nombre varchar(15),
Edad int,
Direccion_p varchar(20),
primary key (DNI)
);

create table no_clientes(
DNI char(9),
primary key (DNI)
);

create table clientes(
Puntos_carnet int,
DNI char(9),
primary key (DNI)
);

create table cliente_usa_automovil(
Matricula char(7),
DNI char(9),
Tipo_Seguro varchar(15),
primary key (Matricula, DNI)
);

create table accidentes(
Codigo_A int,
Ubicacion varchar(20),
Fecha Date,
primary key (Codigo_A) 
);
# falta añadir on delete set null donde se pueda
alter table mecanico add constraint fk_mecanico_Codigo_Taller foreign key (Codigo_Taller) references taller(Codigo_Taller) on update cascade;
alter table mecanico_repara add constraint fk_mecanico_repara_tm foreign key (Codigo_M,Codigo_Taller) references mecanico(Codigo_M,Codigo_Taller) on update cascade;
alter table mecanico_repara add constraint fk_mecanico_repara_matricula foreign key (Matricula) references automovil(Matricula) on update cascade;
alter table coches add constraint fk_coches_Matricula foreign key (Matricula) references automovil(Matricula) on update cascade;
alter table autobuses add constraint fk_autobuses_Matricula foreign key (Matricula) references automovil(Matricula) on update cascade;
alter table camiones add constraint fk_camiones_Matricula foreign key (Matricula) references automovil(Matricula) on update cascade;
alter table motocicletas add constraint fk_motocicletas_Matricula foreign key (Matricula) references automovil(Matricula) on update cascade;
alter table cliente_usa_automovil add constraint fk_cliente_usa_automovil_Matricula foreign key (Matricula) references automovil(Matricula) on update cascade;
ALTER TABLE doctor_contratado ADD CONSTRAINT fk_doctor_contratado_codigo_h FOREIGN KEY (Codigo_h) REFERENCES hospital(Codigo_h) on update cascade;
ALTER TABLE doctor_contratado ADD CONSTRAINT fk_doctor_contratado_codigo_d FOREIGN KEY (Codigo_d) REFERENCES doctor(Codigo_d) on update cascade;
ALTER TABLE doctor_atiende ADD CONSTRAINT fk_doctor_atiende_codigo_d FOREIGN KEY (Codigo_d) REFERENCES doctor(Codigo_d) on update cascade;
ALTER TABLE doctor_atiende ADD CONSTRAINT fk_doctor_atiende_DNI FOREIGN KEY (DNI) REFERENCES personas(DNI) on update cascade;
ALTER TABLE clientes ADD CONSTRAINT fk_lientes_DNI FOREIGN KEY (DNI) REFERENCES personas(DNI) on update cascade;
ALTER TABLE cliente_usa_automovil ADD CONSTRAINT fk_cliente_usa_automovil_DNI FOREIGN KEY (DNI) REFERENCES clientes(DNI) on update cascade;
ALTER TABLE no_clientes ADD CONSTRAINT fk_No_clientes_DNI FOREIGN KEY (DNI) REFERENCES personas(DNI) on update cascade;
ALTER TABLE implicados_accidentes ADD CONSTRAINT fk_implicados_accidentes_matricula FOREIGN KEY (Matricula) REFERENCES automovil(Matricula) on update cascade;
ALTER TABLE implicados_accidentes ADD CONSTRAINT fk_implicados_accidentes_DNI FOREIGN KEY (DNI) REFERENCES personas(DNI) on update cascade;
ALTER TABLE implicados_accidentes ADD CONSTRAINT fk_implicados_accidentes_codigo_A FOREIGN KEY (Codigo_A) REFERENCES accidentes(Codigo_A) on update cascade;

/*
INSERT INTO mecanico(Codigo_M, Codigo_Taller) values (54682, 25548);
INSERT INTO mecanico(Codigo_M, Codigo_Taller) values (94625, 69891);
INSERT INTO automovil(Matricula, Combustible, Marca, ITV, Pertenece_DNI) values ("8989BLP", "Diesel", "Mercedes", 1, "54872145F");
*/


