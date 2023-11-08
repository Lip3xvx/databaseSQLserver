create database LaboratorioSQL
use LaboratorioSQL;

--tablas del laboratorio:

create table profesor(
doc_prof char(20) primary key not null,
nom_prof char(30),
ape_prof char (30),
cate_prof int,
sal_prof int
);

create table curso(
cod_cur int primary key not null,
nom_cur char (100),
horas_cur int,
valor_cur int
);

create table estudiante(
doc_est char(30) primary key not null,
nom_est char(30),
ape_estchar char (30),
edad_est int
);

create table estudianteXcurso(
cod_cur_estcur int,
foreign key (cod_cur_estcur) references curso (cod_cur),
doc_est_estcur char(30),
foreign key (doc_est_estcur) references estudiante (doc_est),
fec_ini_estcur date
);

create table cliente(
id_cli char(30) primary key not null,
nom_cli char(30),
ape_cli char(30),
dir_cli char(100),
dep_cli char(20),
mes_cum_cli char(10)
);

create table articulo(
id_art int identity primary key not null,
tit_art char(100),
aut_art char(100),
edi_art char(300),
prec_art int
);

create table pedido(
id_ped int identity primary key,
id_cli_ped char(30),
foreign key (id_cli_ped) references cliente (id_cli),
fec_ped date,
val_ped int
);
set dateformat dmy;

create table articuloXpedido(
id_ped_artped int,
foreign key (id_ped_artped) references pedido (id_ped),
id_art_artped int,
foreign key (id_art_artped) references articulo (id_art),
cant_art_artped int,
val_ven_art_artped int
);

create table compañia(
comnit char(11) primary key not null,
comnombre char(30),
comañofun int,
comreplegal char(100)
);

create table tiposAutomotores(
auttipo int primary key not null,
nombre char(30)
);

create table automotores(
autoplaca char(6) primary key not null,
automarca char(30),
autotipo int,
foreign key (autotipo) references tiposAutomotores(auttipo),
automodelo int,
autopasajeros int,
autocilindraje int,
autonumchasis char(20)
);

create table aseguramientos(
asecodigo int identity primary key not null,
asefechainicio date,
asefechaexpiracion date,
asevalorasegurado int,
aseestado char(30),
asecosto int,
aseplaca char(6),
foreign key (aseplaca) references automotores (autoplaca)
);

create table incidentes(
incicodigo int identity primary key not null,
incifecha date,
inciplaca char(6),
foreign key (inciplaca) references automotores (autoplaca),
incilugar char(40),
inciantheridos int,
incicanfatalidades int,
incicanautosinvolucrados int
);


--inserciones:

insert into profesor values
('63.502.720', 'Martha', 'Rojas', 2, 690000),
('91.216.904', 'Carlos', 'Pérez', 3, 950000),
('13.826.789', 'Maritza', 'Angarita', 1, 550000),
('1.098.765.789', 'Alejandra', 'Torres', 4, 1100000);

insert into curso values
(149842, 'Fundamentos de bases de datos', 40, 500000),
(250067, 'Fundamentos de SQL', 20, 700000),
(289011, 'Manejo de Mysql', 45, 550000),
(345671, 'Findamentos of Oraacle', 60, 1100000);

insert into estudiante values
('63.502.720', 'Maria', 'Peréz', 2),
('91.245.678', 'Carlos Jóse', 'López', 3),
('1.098.098.097', 'Jonatan', 'Ardila', 1),
('1.098.765.679', 'Carlos', 'Martínez', 4);

insert into estudianteXcurso values 
(289011, '1.098.765.679', '01/02/2011'),
(250067, '63.502.720', '01/03/2011'),
(289011, '1.098.098.097', '01/02/2011'),
(345671, '63.502.720', '01/04/2011');

insert into cliente values
('63502718', 'Maritza', 'Rojas', 'Calle 34 No. 14-45', 'Santander', 'Abril'),
('13890234', 'Roger', 'Ariza', 'Cra 30 No. 13-45', 'Antioquia', 'Junio'),
('77191956', 'Juan Carlos', 'Arenas', 'Diagonal 23 No. 12-34 apto 101', 'Valle', 'Marzo'),
('1098765789', 'Catalina', 'Zapata', 'Av. El libertador No. 30-14', 'Cauca', 'Marzo');

insert into articulo values
('Redes cisco', 'Ernesto Arigasello', 'Alfaomega-Rama', 60.000),
('Facebook y Twitter para adultos', 'Veloso Claudio', 'Alfaomega', 52.000),
('Creación de un portal con php y mysql', 'Jacob Pavón Puertas', 'Alfaomega - Rama', 40.000),
('Administración de sistemas operativos', 'Julio Gómez López', 'Alfaomega - Rama', 55.000);


insert into pedido values 
('63502718', '25/02/2012', 120000),
('77191956', '30/04/2012', 55000),
('63502718', '10/12/2011', 260000),
('1098765789', '25/02/2012', 1800000);

insert into articuloXpedido values
(1,3,5,40000),
(1,4,12,55000),
(2,1,5,65000),
(3,2,10,55000),
(3,3,12,45000),
(4,1,10,65000);

insert into compañia values
('800890890-2', 'Seguros Atlantida' ,1998 ,'Carlos López'),
('899999999-1',' Aseguradora Rojas', 1991,' Luis Fernando Rojas' ),
('899999999-5', 'Seguros delEstado', 2001 ,'María Margarita Pérez');

insert into tiposAutomotores values
(1,'Automóviles'),
(2,'Camperos'),
(3,'Camiones');

select* from tiposAutomotores

insert into automotores values
('FLL420','chevrolet corsa',1, 2003, 5, 1400, 'wywzzz167kk009d25'),
('DKZ820','renault stepway',1, 2008, 5, 1600, 'wywwzz157kk009d45'),
('KJQ920','kia sportage',2, 2009, 7, 2000, 'wywzzz167kk009d25');

insert into aseguramientos values
('2012-09-30','2013-09-30', 30000000,'Vigente', 500000 ,'FLL420'),
('2012-09-27','2013-09-27', 35000000,'Vigente', 600000,'DKZ820'),
('2011-09-28','2013-09-28', 50000000,'Vigente', 800000 ,'KJQ920');

insert into incidentes values
('2012-09-30', 'DKZ820', 'Bucaramanga', 0 ,0, 2),
('2012-09-27', 'FLL420', 'Girón', 1 ,0, 1),
('2011-09-28', 'FLL420', 'Bucaramanga', 1 ,0, 2);

--consultas a realizar: 

--1. mostrar los salarios de los profesores ordenados por categoría.
SELECT sal_prof
FROM profesor
ORDER BY cate_prof;

--2. Mostrar los cursos cuyo valor sea mayor a $500.000.
SELECT *
FROM curso
WHERE valor_cur > 500000;

--3. Contar el número de estudiantes cuya edad sea mayor a 22.
SELECT COUNT(*)
FROM estudiante
WHERE edad_est > 22;

--4. Mostrar el nombre y la edad del estudiante más joven.
SELECT TOP 1 nom_est, edad_est
FROM estudiante
ORDER BY edad_est;

--5. Calcular el valor promedio de los cursos cuyas horas sean mayores a 40
SELECT AVG(valor_cur) as ValorPromedio
FROM curso
WHERE horas_cur > 40;

--6. Obtener el sueldo promedio de los profesores de la categoría 1.
SELECT AVG(sal_prof) as SueldoPromedio
FROM profesor
WHERE cate_prof = 1;

--7. Mostrar todos los campos de la tabla curso en orden ascendente según el valor
SELECT *
FROM curso
ORDER BY valor_cur ASC;

--8. Mostrar el nombre del profesor con menor sueldo.
SELECT TOP 1 nom_prof
FROM profesor
ORDER BY sal_prof ASC;

--9. profesores cuyo sueldo este entre $500.000 y $700.000
SELECT *
FROM profesor
WHERE sal_prof BETWEEN 500000 AND 700000;

--10.Listar todos los pedidos realizados incluyendo el nombre del artículo.

SELECT p.*, a.tit_art
FROM pedido p
INNER JOIN articuloXpedido ap ON p.id_ped = ap.id_ped_artped
INNER JOIN articulo a ON ap.id_art_artped = a.id_art;

--11.Visualizar los clientes que cumplen años en marzo.
SELECT *
FROM cliente
WHERE mes_cum_cli = 'Marzo';

--12.Visualizar los datos del pedido 1, 
--incluyendo el nombre del cliente, 
--la dirección del mismo, el nombre y el valor de los artículos que tiene dicho 
--pedido
SELECT c.nom_cli, c.dir_cli, a.tit_art, ap.cant_art_artped, ap.val_ven_art_artped
FROM pedido p
INNER JOIN cliente c ON p.id_cli_ped = c.id_cli
INNER JOIN articuloXpedido ap ON p.id_ped = ap.id_ped_artped
INNER JOIN articulo a ON ap.id_art_artped = a.id_art
WHERE p.id_ped = 1;

--13.Visualizar el nombre del cliente, la fecha y el valor del pedido más costoso.
SELECT TOP 1 c.nom_cli, p.fec_ped, p.val_ped
FROM pedido p
INNER JOIN cliente c ON p.id_cli_ped = c.id_cli
ORDER BY p.val_ped DESC;

--14.Mostrar cuantos artículos se tienen de cada editorial.
SELECT edi_art, COUNT(*) as Cantidad
FROM articulo
GROUP BY edi_art;

--15.Mostrar los pedidos con los respectivos artículos
--(código, nombre, valor y cantidad pedida).
SELECT p.id_ped, a.tit_art, a.prec_art, ap.cant_art_artped
FROM pedido p
INNER JOIN articuloXpedido ap ON p.id_ped = ap.id_ped_artped
INNER JOIN articulo a ON ap.id_art_artped = a.id_art;

--16.Visualizar todos los clientes organizados por apellido
SELECT *
FROM cliente
ORDER BY ape_cli;


--17.Visualizar todos los artículos organizados por autor
SELECT *
FROM articulo
ORDER BY aut_art;

--18.Visualizar los pedidos que se han realizado para el articulo con id 2, el listado debe
--mostrar el nombre y dirección del cliente, el respectivo número de pedido y la cantidad
--solicitada.
SELECT c.nom_cli, c.dir_cli, p.id_ped, ap.cant_art_artped
FROM pedido p
INNER JOIN cliente c ON p.id_cli_ped = c.id_cli
INNER JOIN articuloXpedido ap ON p.id_ped = ap.id_ped_artped
WHERE ap.id_art_artped = 2;

--19.Visualizar los datos de las empresas fundadas entre el año 1991 y 1998
SELECT *
FROM compañia
WHERE comañofun BETWEEN 1991 AND 1998;

--20.Listar los todos datos de los automotores cuya póliza expira en octubre de 2013, este
--reporte debe visualizar la placa, el modelo, la marca, número de pasajeros, cilindraje
--nombre de automotor, el valor de la póliza y el valor asegurado.
SELECT a.autoplaca, a.automodelo, a.automarca, a.autopasajeros, a.autocilindraje, a.autotipo,
       asf.asefechaexpiracion, asf.asecosto, asf.asevalorasegurado
FROM automotores a
INNER JOIN aseguramientos asf ON a.autoplaca = asf.aseplaca
WHERE MONTH(asf.asefechaexpiracion) = 10 AND YEAR(asf.asefechaexpiracion) = 2013;

--21.Visualizar los datos de los incidentes ocurridos el 30 de septiembre de 2012, con su
--respectivo número de póliza, fecha de inicio de la póliza, valor asegurado y valor de
--la póliza
SELECT i.incicodigo, i.incifecha, asf.asecodigo, asf.asefechainicio, asf.asevalorasegurado, asf.asecosto
FROM incidentes i
INNER JOIN aseguramientos asf ON i.aseplaca = asf.aseplaca
WHERE i.incifecha = '2012-09-30';

--22.Visualizar los datos de los incidentes que han tenido un (1) herido, este reporte debe
--visualizar la placa del automotor, con los respectivos datos de la póliza como son
--fecha de inicio, valor, estado y valor asegurado.
SELECT i.inciplaca, asf.asefechainicio, asf.asecosto, asf.aseestado, asf.asevalorasegurado
FROM incidentes i
INNER JOIN aseguramientos asf ON i.aseplaca = asf.aseplaca
WHERE inciantheridos = 1;

--23.Visualizar todos los datos de la póliza más costos
SELECT TOP 1 *
FROM aseguramientos
ORDER BY asecosto DESC;

--24.Visualizar los incidentes con el mínimo número de autos involucrados, de este incidente
SELECT i.*, asf.aseestado, asf.asevalorasegurado
FROM incidentes i
INNER JOIN aseguramientos asf ON i.aseplaca = asf.aseplaca
WHERE incicanautosinvolucrados = (
    SELECT MIN(incicanautosinvolucrados)
    FROM incidentes
);

--25.Visualizar el estado de la póliza y el valor asegurado.
SELECT asf.aseestado, asf.asevalorasegurado
FROM aseguramientos asf
WHERE asecodigo = (
    SELECT TOP 1 asecodigo
    FROM aseguramientos
    ORDER BY asecosto DESC
);

--26.Visualizar los incidentes del vehículo con placas " FLL420", este reporte debe visualizar
--la fecha, el lugar, la cantidad de heridos del incidente, la fecha de inicio la de expiración
--de la póliza y el valor asegurado
SELECT i.incifecha, i.incilugar, i.inciantheridos, asf.asefechainicio, asf.asefechaexpiracion, asf.asevalorasegurado
FROM incidentes i
INNER JOIN aseguramientos asf ON i.aseplaca = asf.aseplaca
WHERE i.inciplaca = 'FLL420';

--27.Visualizar los datos de la empresa con nit 899999999-5
SELECT *
FROM compañia
WHERE comnit = '899999999-5';

--28.Visualizar los datos de la póliza cuyo valor asegurado es el más costoso, este reporte
--además de visualizar todos los datos de la póliza, debe presentar todos los datos de
--vehículo que tiene dicha póliza.
SELECT asf.*, a.*
FROM aseguramientos asf
INNER JOIN automotores a ON asf.aseplaca = a.autoplaca
WHERE asf.asevalorasegurado = (
    SELECT MAX(asevalorasegurado)
    FROM aseguramientos
);

--29.Visualizar los datos de las pólizas de los automotores tipo 1, este reporte debe incluir
--placa, marca, modelo, cilindraje del vehículo junto con la fecha de inicio, de finalización
--y estado de la póliza.
SELECT a.autoplaca, a.automarca, a.automodelo, a.autocilindraje, asf.asefechainicio, asf.asefechaexpiracion, asf.aseestado
FROM aseguramientos asf
INNER JOIN automotores a ON asf.aseplaca = a.autoplaca
WHERE a.autotipo = 1



--parte dos del laboratorio con la base de datos del taller 1. 

--inserciones 
--COMPAÑIA
INSERT INTO compañia (comnit, comnombre, comañofun, comreplegal)
VALUES('NIT12345-1', 'Empresa A S.A.', 1995, 'Carlos Pérez'),
  ('NIT12345-2', 'Inversiones B Ltda.', 2000, 'Ana Rodríguez'),
  ('NIT12345-3', 'Consultores C SAS', 2012, 'Luis García'),
  ('NIT12345-4', 'Constructora D SA', 1990, 'María López'),
  ('NIT12345-5', 'Tecnología E SRL', 2005, 'Javier Martínez'),
  ('NIT12345-6', 'Servicios F Ltda.', 2017, 'Laura Torres'),
  ('NIT12345-7', 'Comercio G SAS', 2002, 'Pedro Sánchez'),
  ('NIT12345-8', 'Industrias H SA', 1998, 'Sofía Ramírez'),
  ('NIT12345-9', 'Logística I SRL', 2010, 'Andrés Gómez'),
  ('NIT12345-10', 'Energía J Ltda.', 1993, 'Carolina Castro'),
  ('NIT12345-11', 'Publicidad K SAS', 2003, 'Felipe Ruiz'),
  ('NIT12345-12', 'Inmobiliaria L SA', 2008, 'Valeria Ochoa'),
  ('NIT12345-13', 'Transportes M Ltda.', 2015, 'Roberto Díaz'),
  ('NIT12345-14', 'Agropecuaria N SAS', 1997, 'Mónica Herrera'),
  ('NIT12345-15', 'Consultoría O SRL', 2004, 'Hugo Soto'),
  ('NIT12345-16', 'Construcción P SA', 2001, 'Isabella Vargas'),
  ('NIT12345-17', 'Tecnología Q Ltda.', 2011, 'Alejandro Torres'),
  ('NIT12345-18', 'Comercio R SAS', 2006, 'Paula Salazar'),
  ('NIT12345-19', 'Industrias S SA', 1996, 'Andrés Pérez'),
  ('NIT12345-20', 'Logística T SRL', 2014, 'Sofía González'),
  ('NIT12345-21', 'Energía U Ltda.', 1999, 'David Martínez'),
  ('NIT12345-22', 'Publicidad V SAS', 2009, 'María Rodríguez'),
  ('NIT12345-23', 'Inmobiliaria W SA', 1994, 'Javier García'),
  ('NIT12345-24', 'Transportes X Ltda.', 2007, 'Valeria López'),
  ('NIT12345-25', 'Agropecuaria Y SAS', 2013, 'Andrés Torres'),
  ('NIT12345-26', 'Consultoría Z SRL', 1991, 'Luis Sánchez'),
  ('NIT12345-27', 'Construcción AA SA', 1992, 'Ana Pérez'),
  ('NIT12345-28', 'Tecnología BB Ltda.', 1999, 'Pedro Martínez'),
  ('NIT12345-29', 'Comercio CC SAS', 2005, 'Laura González'),
  ('NIT12345-30', 'Industrias DD SA', 2001, 'Mónica Díaz'),
  ('NIT12345-31', 'Logística EE SRL', 2002, 'Felipe Ochoa'),
  ('NIT12345-32', 'Energía FF Ltda.', 2010, 'Roberto Herrera'),
  ('NIT12345-33', 'Publicidad GG SAS', 2007, 'Hugo Vargas'),
  ('NIT12345-34', 'Inmobiliaria HH SA', 1998, 'Paula Salazar'),
  ('NIT12345-35', 'Transportes II Ltda.', 2004, 'Isabella Soto'),
  ('NIT12345-36', 'Agropecuaria JJ SAS', 1995, 'Andrés Ruiz'),
  ('NIT12345-37', 'Consultoría KK SRL', 2003, 'Sofía Sánchez')

  --CURSO 
  INSERT INTO curso (cod_cur, nom_cur, horas_cur, valor_cur)
VALUES
  (1, 'Matemáticas I', 48, 600),
  (2, 'Historia Universal', 32, 400),
  (3, 'Biología Avanzada', 56, 700),
  (4, 'Programación en C', 64, 800),
  (5, 'Inglés Intermedio', 40, 500),
  (6, 'Literatura Clásica', 36, 450),
  (7, 'Química Orgánica', 52, 650),
  (8, 'Física Aplicada', 60, 750),
  (9, 'Economía Internacional', 44, 550),
  (10, 'Arquitectura Moderna', 42, 525),
  (11, 'Diseño Gráfico', 48, 600),
  (12, 'Geografía Mundial', 34, 425),
  (13, 'Cálculo Avanzado', 54, 675),
  (14, 'Derecho Empresarial', 50, 625),
  (15, 'Marketing Digital', 46, 575),
  (16, 'Música Clásica', 30, 375),
  (17, 'Medicina Preventiva', 58, 725),
  (18, 'Psicología del Comportamiento', 38, 475),
  (19, 'Diseño de Moda', 32, 400),
  (20, 'Cocina Internacional', 66, 825),
  (21, 'Arte Contemporáneo', 36, 450),
  (22, 'Teatro Clásico', 28, 350),
  (23, 'Ciencias Políticas', 50, 625),
  (24, 'Filosofía Antigua', 42, 525),
  (25, 'Astronomía Avanzada', 62, 775),
  (26, 'Robótica Industrial', 54, 675),
  (27, 'Ecología Marina', 48, 600),
  (28, 'Educación Infantil', 44, 550),
  (29, 'Gestión de Proyectos', 52, 650),
  (30, 'Fotografía Artística', 38, 475),
  (31, 'Antropología Cultural', 32, 400),
  (32, 'Estadísticas Avanzadas', 56, 700),
  (33, 'Arqueología Moderna', 40, 500),
  (34, 'Diseño de Interiores', 46, 575),
  (35, 'Ingeniería Civil', 60, 750),
  (36, 'Márketing Estratégico', 50, 625),
  (37, 'Arte Abstracto', 34, 425),
  (38, 'Ciencias Sociales', 64, 800),
  (39, 'Derecho Internacional', 58, 725),
  (40, 'Gastronomía Clásica', 30, 375),
  (41, 'Medicina Moderna', 52, 650),
  (42, 'Psicología Infantil', 42, 525),
  (43, 'Diseño de Joyas', 62, 775),
  (44, 'Cocina Gourmet', 48, 600),
  (45, 'Arte Moderno', 36, 450),
  (46, 'Teatro Contemporáneo', 28, 350),
  (47, 'Ciencias Económicas', 50, 625),
  (48, 'Filosofía Contemporánea', 46, 575),
  (49, 'Astronomía Espacial', 38, 475),
  (50, 'Inteligencia Artificial', 54, 675);

  --CLIENTE 
INSERT INTO cliente (id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli)
VALUES
  ('ID1001', 'Juan', 'Pérez', 'Calle A #123', 'Bogotá', 'Enero'),
  ('ID1002', 'María', 'Gómez', 'Av. Principal #45', 'Medellín', 'Febrero'),
  ('ID1003', 'Luis', 'Martínez', 'Carrera 7 #678', 'Cali', 'Marzo'),
  ('ID1004', 'Ana', 'Rodríguez', 'Calle B #567', 'Barranquilla', 'Abril'),
  ('ID1005', 'Pedro', 'López', 'Av. Central #987', 'Cartagena', 'Mayo'),
  ('ID1006', 'Laura', 'García', 'Calle C #345', 'Santa Marta', 'Junio'),
  ('ID1007', 'Carlos', 'Hernández', 'Av. Norte #789', 'Pereira', 'Julio'),
  ('ID1008', 'Sofía', 'Díaz', 'Carrera 8 #234', 'Manizales', 'Agosto'),
  ('ID1009', 'Andrés', 'Jiménez', 'Calle D #456', 'Bucaramanga', 'Septiembre'),
  ('ID1010', 'Mónica', 'Vargas', 'Av. Sur #567', 'Pasto', 'Octubre'),
  ('ID1011', 'Hugo', 'Ramírez', 'Calle E #678', 'Neiva', 'Noviembre'),
  ('ID1012', 'Valeria', 'Herrera', 'Carrera 9 #123', 'Villavicencio', 'Diciembre'),
  ('ID1013', 'David', 'Rojas', 'Calle F #234', 'Ibagué', 'Enero'),
  ('ID1014', 'Isabella', 'Silva', 'Av. Occidente #345', 'Armenia', 'Febrero'),
  ('ID1015', 'Felipe', 'Ochoa', 'Carrera 10 #456', 'Popayán', 'Marzo'),
  ('ID1016', 'Carolina', 'Molina', 'Calle G #567', 'Tunja', 'Abril'),
  ('ID1017', 'Javier', 'Ríos', 'Av. Central #678', 'Cúcuta', 'Mayo'),
  ('ID1018', 'Roberto', 'Gutierrez', 'Carrera 11 #123', 'Sincelejo', 'Junio'),
  ('ID1019', 'María', 'Paz', 'Calle H #234', 'Montería', 'Julio'),
  ('ID1020', 'Andrea', 'Camacho', 'Av. Principal #345', 'Valledupar', 'Agosto'),
  ('ID1021', 'Lorenzo', 'Suárez', 'Carrera 12 #456', 'Riohacha', 'Septiembre'),
  ('ID1022', 'Alejandra', 'Parra', 'Calle I #567', 'Manizales', 'Octubre'),
  ('ID1023', 'César', 'Guzmán', 'Av. Sur #678', 'Pereira', 'Noviembre'),
  ('ID1024', 'Estefanía', 'Luna', 'Carrera 13 #123', 'Neiva', 'Diciembre'),
  ('ID1025', 'Manuel', 'Jiménez', 'Calle J #234', 'Villavicencio', 'Enero'),
  ('ID1026', 'Ana María', 'Rojas', 'Av. Occidente #345', 'Ibagué', 'Febrero'),
  ('ID1027', 'Diego', 'Molina', 'Carrera 14 #456', 'Armenia', 'Marzo'),
  ('ID1028', 'Diana', 'Gutierrez', 'Calle K #567', 'Popayán', 'Abril'),
  ('ID1029', 'Andrés', 'Ríos', 'Av. Central #678', 'Tunja', 'Mayo'),
  ('ID1030', 'Paola', 'García', 'Carrera 15 #123', 'Cúcuta', 'Junio'),
  ('ID1031', 'Miguel', 'Herrera', 'Calle L #234', 'Sincelejo', 'Julio'),
  ('ID1032', 'Sara', 'Silva', 'Av. Principal #345', 'Montería', 'Agosto'),
  ('ID1033', 'Andrés', 'Ochoa', 'Carrera 16 #456', 'Valledupar', 'Septiembre'),
  ('ID1034', 'Lina', 'Camacho', 'Calle M #567', 'Riohacha', 'Octubre'),
  ('ID1035', 'Jorge', 'Suárez', 'Av. Occidente #678', 'Manizales', 'Noviembre'),
  ('ID1036', 'Gabriela', 'Parra', 'Carrera 17 #123', 'Pereira', 'Diciembre'),
  ('ID1037', 'Rafael', 'Guzmán', 'Calle N #234', 'Neiva', 'Enero'),
  ('ID1038', 'Valentina', 'Luna', 'Av. Sur #345', 'Villavicencio', 'Febrero'),
  ('ID1039', 'Juan Pablo', 'Jiménez', 'Carrera 18 #456', 'Ibagué', 'Marzo'),
  ('ID1040', 'Alejandro', 'Rojas', 'Calle O #567', 'Armenia', 'Abril'),
  ('ID1041', 'Marcela', 'Molina', 'Av. Central #678', 'Popayán', 'Mayo'),
  ('ID1042', 'José', 'Gutierrez', 'Carrera 19 #123', 'Tunja', 'Junio'),
  ('ID1043', 'Camila', 'Ríos', 'Calle P #234', 'Cúcuta', 'Julio'),
  ('ID1044', 'Andrea', 'Herrera', 'Av. Principal #345', 'Sincelejo', 'Agosto'),
  ('ID1045', 'Luisa', 'Silva', 'Carrera 20 #456', 'Montería', 'Septiembre');

-- Diseñar un procedimiento almacenado para crear, editar y eliminar registros en las tablas

--COMPAÑIA

--crear

CREATE PROCEDURE CrearCompania
  @comnit CHAR(11),
  @comnombre CHAR(30),
  @comañofun INT,
  @comreplegal CHAR(100)
AS
BEGIN
  INSERT INTO compañia(comnit, comnombre, comañofun, comreplegal)
  VALUES (@comnit, @comnombre, @comañofun, @comreplegal);
END


--actualizar
CREATE PROCEDURE EditarCompania
  @comnit CHAR(11),
  @comnombre VARCHAR(30),
  @comañofun INT,
  @comreplegal VARCHAR(100)
AS
BEGIN
  UPDATE compañia
  SET comnombre = @comnombre,
      comañofun = @comañofun,
      comreplegal = @comreplegal
  WHERE comnit = @comnit;
END;


--eliminar
CREATE PROCEDURE EliminarCompania
  @comnit CHAR(11)
AS
BEGIN
  DELETE FROM compañia
  WHERE comnit = @comnit;
END;



--CLIENTE 

--crear
CREATE PROCEDURE CrearCliente
  @id_cli CHAR(30),
  @nom_cli VARCHAR(30),
  @ape_cli VARCHAR(30),
  @dir_cli VARCHAR(100),
  @dep_cli CHAR(20),
  @mes_cum_cli CHAR(10)
AS
BEGIN
  INSERT INTO cliente (id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli)
  VALUES (@id_cli, @nom_cli, @ape_cli, @dir_cli, @dep_cli, @mes_cum_cli);
END;

--editar
CREATE PROCEDURE EditarCliente
  @id_cli CHAR(30),
  @nom_cli VARCHAR(30),
  @ape_cli VARCHAR(30),
  @dir_cli VARCHAR(100),
  @dep_cli CHAR(20),
  @mes_cum_cli CHAR(10)
AS
BEGIN
  UPDATE cliente
  SET nom_cli = @nom_cli,
      ape_cli = @ape_cli,
      dir_cli = @dir_cli,
      dep_cli = @dep_cli,
      mes_cum_cli = @mes_cum_cli
  WHERE id_cli = @id_cli;
END;


--eliminar
CREATE PROCEDURE EliminarCliente
  @id_cli CHAR(30)
AS
BEGIN
  DELETE FROM cliente
  WHERE id_cli = @id_cli;
END;


--CURSO

--crear
CREATE PROCEDURE CrearCurso
  @cod_cur INT,
  @nom_cur VARCHAR(100),
  @horas_cur INT,
  @valor_cur INT
AS
BEGIN
  INSERT INTO curso (cod_cur, nom_cur, horas_cur, valor_cur)
  VALUES (@cod_cur, @nom_cur, @horas_cur, @valor_cur);
END;


--editar
CREATE PROCEDURE EditarCurso
  @cod_cur INT,
  @nom_cur VARCHAR(100),
  @horas_cur INT,
  @valor_cur INT
AS
BEGIN
  UPDATE curso
  SET nom_cur = @nom_cur,
      horas_cur = @horas_cur,
      valor_cur = @valor_cur
  WHERE cod_cur = @cod_cur;
END;


--eliminar
CREATE PROCEDURE EliminarCurso
  @cod_cur INT
AS
BEGIN
  DELETE FROM curso
  WHERE cod_cur = @cod_cur;
END;


--procedimientos almacenados para consultar. 

--i. Visualizar los clientes que cumplen años según un mes ingresado por parámetros:

CREATE PROCEDURE ConsultarClientesPorMesCumpleanos
  @mes_cum CHAR(10)
AS
BEGIN
  SELECT id_cli, nom_cli, ape_cli, mes_cum_cli
  FROM cliente
  WHERE mes_cum_cli = @mes_cum;
END;

--ii.Visualizar el nombre del cliente, la fecha y el valor según el ID del cliente ingresado:


CREATE PROCEDURE ConsultarPedidosPorIDArticulo
  @id_articulo INT
AS
BEGIN
  SELECT c.nom_cli, c.dir_cli, p.id_ped, ap.cant_art_artped
  FROM cliente c
  JOIN pedido p ON c.id_cli = p.id_cli_ped
  JOIN articuloXpedido ap ON p.id_ped = ap.id_ped_artped
  WHERE ap.id_art_artped = @id_articulo;
END;


--iii. Visualizar los datos de las empresas fundadas según año ingresado:
CREATE PROCEDURE ConsultarCompaniasPorAnoFundacion
  @comañofun INT
AS
BEGIN
  SELECT comnit, comnombre, comañofun
  FROM compañia
  WHERE comañofun = @comañofun;
END;


--iv. Visualizar los datos de la empresa según NIT ingresado:
CREATE PROCEDURE ConsultarCompaniaPorNIT
  @comnit CHAR(11)
AS
BEGIN
  SELECT comnit, comnombre, comañofun, comreplegal
  FROM compañia
  WHERE comnit = @comnit;
END;


--v. Visualizar los pedidos que se han realizado según ID de artículo ingresado
CREATE PROCEDURE ConsultarPedidosPorIDArticulo
  @id_articulo INT
AS
BEGIN
  SELECT c.nom_cli, c.dir_cli, p.id_ped, ap.cant_art_artped
  FROM cliente c
  JOIN pedido p ON c.id_cli = p.id_cli_ped
  JOIN articuloXpedido ap ON p.id_ped = ap.id_ped_artped
  WHERE ap.id_art_artped = @id_articulo;
END;
