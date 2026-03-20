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
ALTER TABLE cliente_usa_automovil ADD CONSTRAINT fk_cliente_usa_automovil_DNI FOREIGN KEY (DNI) REFERENCES clientes(DNI) on update cascade;

ALTER TABLE doctor_contratado ADD CONSTRAINT fk_doctor_contratado_codigo_h FOREIGN KEY (Codigo_h) REFERENCES hospital(Codigo_h) on update cascade;
ALTER TABLE doctor_contratado ADD CONSTRAINT fk_doctor_contratado_codigo_d FOREIGN KEY (Codigo_d) REFERENCES doctor(Codigo_d) on update cascade;

ALTER TABLE doctor_atiende ADD CONSTRAINT fk_doctor_atiende_codigo_d FOREIGN KEY (Codigo_d) REFERENCES doctor(Codigo_d) on update cascade;
ALTER TABLE doctor_atiende ADD CONSTRAINT fk_doctor_atiende_DNI FOREIGN KEY (DNI) REFERENCES personas(DNI) on update cascade;

ALTER TABLE clientes ADD CONSTRAINT fk_lientes_DNI FOREIGN KEY (DNI) REFERENCES personas(DNI) on update cascade;
ALTER TABLE no_clientes ADD CONSTRAINT fk_No_clientes_DNI FOREIGN KEY (DNI) REFERENCES personas(DNI) on update cascade;

ALTER TABLE implicados_accidentes ADD CONSTRAINT fk_implicados_accidentes_matricula FOREIGN KEY (Matricula) REFERENCES automovil(Matricula) on update cascade;
ALTER TABLE implicados_accidentes ADD CONSTRAINT fk_implicados_accidentes_DNI FOREIGN KEY (DNI) REFERENCES personas(DNI) on update cascade;
ALTER TABLE implicados_accidentes ADD CONSTRAINT fk_implicados_accidentes_codigo_A FOREIGN KEY (Codigo_A) REFERENCES accidentes(Codigo_A) on update cascade;

# INSERTS DE PRIMER NIVEL
insert into taller (Codigo_Taller, Nombre_T, Direccion_T) values (25548, 'Taller Paco', 'Av. Barcelona n1');
insert into taller (Codigo_Taller, Nombre_T, Direccion_T) values (69891, 'Taller Jose', 'C/europa 10c');

insert into hospital (Codigo_h, Nombre_h, Direcion_h) values (1001, 'Sant Jaume I', 'Pl Doctor Robert');
insert into hospital (Codigo_h, Nombre_h, Direcion_h) values (1002, 'Sant Jaume II', 'Pl Doctor Guardiet');
insert into hospital (Codigo_h, Nombre_h, Direcion_h) values (1003, 'Sant Jaume III', 'Av. San Sebastian');
insert into hospital (Codigo_h, Nombre_h, Direcion_h) values (1004, 'Sant Jaume IV', 'Av. Judas');

insert into doctor values (12345);
insert into doctor values (15438);
insert into doctor values (18456);
insert into doctor values (14576);

insert into personas (DNI, Nombre, Edad, Direccion_P) values ("47735239X", "Carlos", 19, "C/ magallanes n19");
insert into personas (DNI, Nombre, Edad, Direccion_P) values ("54875236D", "Veronica", 30, "C/ europa 24");
insert into personas (DNI, Nombre, Edad, Direccion_P) values ("54872145F", "Elias", 54, "C/ Tatuatge 01");
insert into personas (DNI, Nombre, Edad, Direccion_P) values ("97588545P", "Jean Pierre", 36, "C/ Tulipa");
insert into personas (DNI, Nombre, Edad, Direccion_P) values ("58424697A", "Francisco", 29, "C/ Santa Maria 06");

insert into accidentes (Codigo_A, Ubicacion, Fecha) values (3333, "C/ Josep i Maria", 10/10/2010);
insert into accidentes (Codigo_A, Ubicacion, Fecha) values (5678, "Av. Barcelona", 20/01/2015);



# INSERTS DE SEGUNDO NIVEL
INSERT INTO mecanico(Codigo_M, Codigo_Taller) values (54682, 25548);
INSERT INTO mecanico(Codigo_M, Codigo_Taller) values (94625, 69891);

INSERT INTO automovil(Matricula, Combustible, Marca, ITV, Pertenece_DNI) values ("8989BLP", "Diesel", "Mercedes", TRUE, "54872145F");
INSERT INTO automovil(Matricula, Combustible, Marca, ITV, Pertenece_DNI) values ("6666WWR", "Diesel", "Scorpa", FALSE, "97588545P");
INSERT INTO automovil(Matricula, Combustible, Marca, ITV, Pertenece_DNI) values ("4689YUL", "Gasolina", "BMW", TRUE, "54872145F");
INSERT INTO automovil(Matricula, Combustible, Marca, ITV, Pertenece_DNI) values ("9070KLP", "Gasolina", "Volvo", TRUE, "58424697A");
INSERT INTO automovil(Matricula, Combustible, Marca, ITV, Pertenece_DNI) values ("8954JIP", "Diesel", "Teslas", TRUE, "54872145F");
INSERT INTO automovil(Matricula, Combustible, Marca, ITV, Pertenece_DNI) values ("6969OSI", "Diesel","Mercedes",True, "47735239X");
insert into doctor_atiende(Codigo_D, DNI, Informe_Medico, Fecha_Visita) values (12345, "97588545P", "piernas rotas por 10 lados", 10/10/2010);

insert into clientes (DNI, Puntos_Carnet) values ("47735239X", 10);
insert into clientes (DNI, Puntos_Carnet) values ("54872145F", 15);
insert into clientes (DNI, Puntos_Carnet) values ("97588545P", 1);

insert into no_clientes values ("54875236D");
insert into no_clientes values ("58424697A");

# INSERTS DE TERCER NIVEL
insert into coches (Matricula, N_Puertas) values ("4689YUL", 5);
insert into camiones (Matricula, Peso_Carga) values ("9070KLP",25);
insert into camiones (Matricula, Peso_Carga) values ("6969OSI", 25);
insert into autobuses (Matricula, Aforo) values ("8989BLP", 50);
insert into autobuses (Matricula, Aforo) values ("8954JIP", 65); 
insert into motocicletas (Matricula, CV) values ("6666WWR", 60);

insert into mecanico_repara (Matricula, Codigo_M, Codigo_Taller, Informe_Mecanico, Fecha_Reparacion) values ("6666WWR", 94625, 69891, "siniestro", 15/10/2010);

insert into cliente_usa_automovil (Matricula, DNI, Tipo_Seguro) values ("8989BLP", "47735239X", "a terceros");
insert into cliente_usa_automovil (Matricula, DNI, Tipo_Seguro) values ("4689YUL", "54872145F", "todo riesgo");
insert into cliente_usa_automovil (Matricula, DNI, Tipo_Seguro) values ("6666WWR", "97588545P", "a terceros");
insert into cliente_usa_automovil (Matricula, DNI, Tipo_Seguro) values ("6969OSI", "47735239X", "todo riesgo");

insert into doctor_contratado (Codigo_D, Codigo_H, Salario_D, Jornada_D) values (12345, 1002, 2500, 40);
insert into doctor_contratado (Codigo_D, Codigo_H, Salario_D, Jornada_D) values (15438, 1002, 1250, 20);
insert into doctor_contratado (Codigo_D, Codigo_H, Salario_D, Jornada_D) values (15438, 1001, 1250, 20);
insert into doctor_contratado (Codigo_D, Codigo_H, Salario_D, Jornada_D) values (18456, 1004, 3000, 40);
insert into doctor_contratado (Codigo_D, Codigo_H, Salario_D, Jornada_D) values (14576, 1003, 2000, 40);

insert into implicados_accidentes(DNI, Matricula, Codigo_A) values ("97588545P", "6666WWR", 3333);
insert into implicados_accidentes(DNI, Matricula, Codigo_A) values ("54872145F", "8954JIP", 5678);

select * from taller;
select * from mecanico;
select * from automovil;
select * from clientes;
select * from motocicletas;
select * from hospital;
select * from doctor;
select * from doctor_contratado;
select * from doctor_atiende;
select * from personas;
select * from implicados_accidentes;
select * from personas join clientes on personas.DNI = clientes.DNI join cliente_usa_automovil on clientes.DNI = cliente_usa_automovil.DNI where Nombre like "%Pie%";


update personas set DNI = "66666666L" where DNI ="97588545P";

# falta añadir on delete set null y on update cascade
