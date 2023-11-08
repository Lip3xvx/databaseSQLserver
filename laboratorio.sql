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

create table compa�ia(
comnit char(11) primary key not null,
comnombre char(30),
coma�ofun int,
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
('91.216.904', 'Carlos', 'P�rez', 3, 950000),
('13.826.789', 'Maritza', 'Angarita', 1, 550000),
('1.098.765.789', 'Alejandra', 'Torres', 4, 1100000);

insert into curso values
(149842, 'Fundamentos de bases de datos', 40, 500000),
(250067, 'Fundamentos de SQL', 20, 700000),
(289011, 'Manejo de Mysql', 45, 550000),
(345671, 'Findamentos of Oraacle', 60, 1100000);

insert into estudiante values
('63.502.720', 'Maria', 'Per�z', 2),
('91.245.678', 'Carlos J�se', 'L�pez', 3),
('1.098.098.097', 'Jonatan', 'Ardila', 1),
('1.098.765.679', 'Carlos', 'Mart�nez', 4);

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
('Creaci�n de un portal con php y mysql', 'Jacob Pav�n Puertas', 'Alfaomega - Rama', 40.000),
('Administraci�n de sistemas operativos', 'Julio G�mez L�pez', 'Alfaomega - Rama', 55.000);


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

insert into compa�ia values
('800890890-2', 'Seguros Atlantida' ,1998 ,'Carlos L�pez'),
('899999999-1',' Aseguradora Rojas', 1991,' Luis Fernando Rojas' ),
('899999999-5', 'Seguros delEstado', 2001 ,'Mar�a Margarita P�rez');

insert into tiposAutomotores values
(1,'Autom�viles'),
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
('2012-09-27', 'FLL420', 'Gir�n', 1 ,0, 1),
('2011-09-28', 'FLL420', 'Bucaramanga', 1 ,0, 2);

--consultas a realizar: 

--1. mostrar los salarios de los profesores ordenados por categor�a.
SELECT sal_prof
FROM profesor
ORDER BY cate_prof;

--2. Mostrar los cursos cuyo valor sea mayor a $500.000.
SELECT *
FROM curso
WHERE valor_cur > 500000;

--3. Contar el n�mero de estudiantes cuya edad sea mayor a 22.
SELECT COUNT(*)
FROM estudiante
WHERE edad_est > 22;

--4. Mostrar el nombre y la edad del estudiante m�s joven.
SELECT TOP 1 nom_est, edad_est
FROM estudiante
ORDER BY edad_est;

--5. Calcular el valor promedio de los cursos cuyas horas sean mayores a 40
SELECT AVG(valor_cur) as ValorPromedio
FROM curso
WHERE horas_cur > 40;

--6. Obtener el sueldo promedio de los profesores de la categor�a 1.
SELECT AVG(sal_prof) as SueldoPromedio
FROM profesor
WHERE cate_prof = 1;

--7. Mostrar todos los campos de la tabla curso en orden ascendente seg�n el valor
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

--10.Listar todos los pedidos realizados incluyendo el nombre del art�culo.

SELECT p.*, a.tit_art
FROM pedido p
INNER JOIN articuloXpedido ap ON p.id_ped = ap.id_ped_artped
INNER JOIN articulo a ON ap.id_art_artped = a.id_art;

--11.Visualizar los clientes que cumplen a�os en marzo.
SELECT *
FROM cliente
WHERE mes_cum_cli = 'Marzo';

--12.Visualizar los datos del pedido 1, 
--incluyendo el nombre del cliente, 
--la direcci�n del mismo, el nombre y el valor de los art�culos que tiene dicho 
--pedido
SELECT c.nom_cli, c.dir_cli, a.tit_art, ap.cant_art_artped, ap.val_ven_art_artped
FROM pedido p
INNER JOIN cliente c ON p.id_cli_ped = c.id_cli
INNER JOIN articuloXpedido ap ON p.id_ped = ap.id_ped_artped
INNER JOIN articulo a ON ap.id_art_artped = a.id_art
WHERE p.id_ped = 1;

--13.Visualizar el nombre del cliente, la fecha y el valor del pedido m�s costoso.
SELECT TOP 1 c.nom_cli, p.fec_ped, p.val_ped
FROM pedido p
INNER JOIN cliente c ON p.id_cli_ped = c.id_cli
ORDER BY p.val_ped DESC;

--14.Mostrar cuantos art�culos se tienen de cada editorial.
SELECT edi_art, COUNT(*) as Cantidad
FROM articulo
GROUP BY edi_art;

--15.Mostrar los pedidos con los respectivos art�culos
--(c�digo, nombre, valor y cantidad pedida).
SELECT p.id_ped, a.tit_art, a.prec_art, ap.cant_art_artped
FROM pedido p
INNER JOIN articuloXpedido ap ON p.id_ped = ap.id_ped_artped
INNER JOIN articulo a ON ap.id_art_artped = a.id_art;

--16.Visualizar todos los clientes organizados por apellido
SELECT *
FROM cliente
ORDER BY ape_cli;


--17.Visualizar todos los art�culos organizados por autor
SELECT *
FROM articulo
ORDER BY aut_art;

--18.Visualizar los pedidos que se han realizado para el articulo con id 2, el listado debe
--mostrar el nombre y direcci�n del cliente, el respectivo n�mero de pedido y la cantidad
--solicitada.
SELECT c.nom_cli, c.dir_cli, p.id_ped, ap.cant_art_artped
FROM pedido p
INNER JOIN cliente c ON p.id_cli_ped = c.id_cli
INNER JOIN articuloXpedido ap ON p.id_ped = ap.id_ped_artped
WHERE ap.id_art_artped = 2;

--19.Visualizar los datos de las empresas fundadas entre el a�o 1991 y 1998
SELECT *
FROM compa�ia
WHERE coma�ofun BETWEEN 1991 AND 1998;

--20.Listar los todos datos de los automotores cuya p�liza expira en octubre de 2013, este
--reporte debe visualizar la placa, el modelo, la marca, n�mero de pasajeros, cilindraje
--nombre de automotor, el valor de la p�liza y el valor asegurado.
SELECT a.autoplaca, a.automodelo, a.automarca, a.autopasajeros, a.autocilindraje, a.autotipo,
       asf.asefechaexpiracion, asf.asecosto, asf.asevalorasegurado
FROM automotores a
INNER JOIN aseguramientos asf ON a.autoplaca = asf.aseplaca
WHERE MONTH(asf.asefechaexpiracion) = 10 AND YEAR(asf.asefechaexpiracion) = 2013;

--21.Visualizar los datos de los incidentes ocurridos el 30 de septiembre de 2012, con su
--respectivo n�mero de p�liza, fecha de inicio de la p�liza, valor asegurado y valor de
--la p�liza
SELECT i.incicodigo, i.incifecha, asf.asecodigo, asf.asefechainicio, asf.asevalorasegurado, asf.asecosto
FROM incidentes i
INNER JOIN aseguramientos asf ON i.aseplaca = asf.aseplaca
WHERE i.incifecha = '2012-09-30';

--22.Visualizar los datos de los incidentes que han tenido un (1) herido, este reporte debe
--visualizar la placa del automotor, con los respectivos datos de la p�liza como son
--fecha de inicio, valor, estado y valor asegurado.
SELECT i.inciplaca, asf.asefechainicio, asf.asecosto, asf.aseestado, asf.asevalorasegurado
FROM incidentes i
INNER JOIN aseguramientos asf ON i.aseplaca = asf.aseplaca
WHERE inciantheridos = 1;

--23.Visualizar todos los datos de la p�liza m�s costos
SELECT TOP 1 *
FROM aseguramientos
ORDER BY asecosto DESC;

--24.Visualizar los incidentes con el m�nimo n�mero de autos involucrados, de este incidente
SELECT i.*, asf.aseestado, asf.asevalorasegurado
FROM incidentes i
INNER JOIN aseguramientos asf ON i.aseplaca = asf.aseplaca
WHERE incicanautosinvolucrados = (
    SELECT MIN(incicanautosinvolucrados)
    FROM incidentes
);

--25.Visualizar el estado de la p�liza y el valor asegurado.
SELECT asf.aseestado, asf.asevalorasegurado
FROM aseguramientos asf
WHERE asecodigo = (
    SELECT TOP 1 asecodigo
    FROM aseguramientos
    ORDER BY asecosto DESC
);

--26.Visualizar los incidentes del veh�culo con placas " FLL420", este reporte debe visualizar
--la fecha, el lugar, la cantidad de heridos del incidente, la fecha de inicio la de expiraci�n
--de la p�liza y el valor asegurado
SELECT i.incifecha, i.incilugar, i.inciantheridos, asf.asefechainicio, asf.asefechaexpiracion, asf.asevalorasegurado
FROM incidentes i
INNER JOIN aseguramientos asf ON i.aseplaca = asf.aseplaca
WHERE i.inciplaca = 'FLL420';

--27.Visualizar los datos de la empresa con nit 899999999-5
SELECT *
FROM compa�ia
WHERE comnit = '899999999-5';

--28.Visualizar los datos de la p�liza cuyo valor asegurado es el m�s costoso, este reporte
--adem�s de visualizar todos los datos de la p�liza, debe presentar todos los datos de
--veh�culo que tiene dicha p�liza.
SELECT asf.*, a.*
FROM aseguramientos asf
INNER JOIN automotores a ON asf.aseplaca = a.autoplaca
WHERE asf.asevalorasegurado = (
    SELECT MAX(asevalorasegurado)
    FROM aseguramientos
);

--29.Visualizar los datos de las p�lizas de los automotores tipo 1, este reporte debe incluir
--placa, marca, modelo, cilindraje del veh�culo junto con la fecha de inicio, de finalizaci�n
--y estado de la p�liza.
SELECT a.autoplaca, a.automarca, a.automodelo, a.autocilindraje, asf.asefechainicio, asf.asefechaexpiracion, asf.aseestado
FROM aseguramientos asf
INNER JOIN automotores a ON asf.aseplaca = a.autoplaca
WHERE a.autotipo = 1



--parte dos del laboratorio con la base de datos del taller 1. 

--inserciones 
--COMPA�IA
INSERT INTO compa�ia (comnit, comnombre, coma�ofun, comreplegal)
VALUES('NIT12345-1', 'Empresa A S.A.', 1995, 'Carlos P�rez'),
  ('NIT12345-2', 'Inversiones B Ltda.', 2000, 'Ana Rodr�guez'),
  ('NIT12345-3', 'Consultores C SAS', 2012, 'Luis Garc�a'),
  ('NIT12345-4', 'Constructora D SA', 1990, 'Mar�a L�pez'),
  ('NIT12345-5', 'Tecnolog�a E SRL', 2005, 'Javier Mart�nez'),
  ('NIT12345-6', 'Servicios F Ltda.', 2017, 'Laura Torres'),
  ('NIT12345-7', 'Comercio G SAS', 2002, 'Pedro S�nchez'),
  ('NIT12345-8', 'Industrias H SA', 1998, 'Sof�a Ram�rez'),
  ('NIT12345-9', 'Log�stica I SRL', 2010, 'Andr�s G�mez'),
  ('NIT12345-10', 'Energ�a J Ltda.', 1993, 'Carolina Castro'),
  ('NIT12345-11', 'Publicidad K SAS', 2003, 'Felipe Ruiz'),
  ('NIT12345-12', 'Inmobiliaria L SA', 2008, 'Valeria Ochoa'),
  ('NIT12345-13', 'Transportes M Ltda.', 2015, 'Roberto D�az'),
  ('NIT12345-14', 'Agropecuaria N SAS', 1997, 'M�nica Herrera'),
  ('NIT12345-15', 'Consultor�a O SRL', 2004, 'Hugo Soto'),
  ('NIT12345-16', 'Construcci�n P SA', 2001, 'Isabella Vargas'),
  ('NIT12345-17', 'Tecnolog�a Q Ltda.', 2011, 'Alejandro Torres'),
  ('NIT12345-18', 'Comercio R SAS', 2006, 'Paula Salazar'),
  ('NIT12345-19', 'Industrias S SA', 1996, 'Andr�s P�rez'),
  ('NIT12345-20', 'Log�stica T SRL', 2014, 'Sof�a Gonz�lez'),
  ('NIT12345-21', 'Energ�a U Ltda.', 1999, 'David Mart�nez'),
  ('NIT12345-22', 'Publicidad V SAS', 2009, 'Mar�a Rodr�guez'),
  ('NIT12345-23', 'Inmobiliaria W SA', 1994, 'Javier Garc�a'),
  ('NIT12345-24', 'Transportes X Ltda.', 2007, 'Valeria L�pez'),
  ('NIT12345-25', 'Agropecuaria Y SAS', 2013, 'Andr�s Torres'),
  ('NIT12345-26', 'Consultor�a Z SRL', 1991, 'Luis S�nchez'),
  ('NIT12345-27', 'Construcci�n AA SA', 1992, 'Ana P�rez'),
  ('NIT12345-28', 'Tecnolog�a BB Ltda.', 1999, 'Pedro Mart�nez'),
  ('NIT12345-29', 'Comercio CC SAS', 2005, 'Laura Gonz�lez'),
  ('NIT12345-30', 'Industrias DD SA', 2001, 'M�nica D�az'),
  ('NIT12345-31', 'Log�stica EE SRL', 2002, 'Felipe Ochoa'),
  ('NIT12345-32', 'Energ�a FF Ltda.', 2010, 'Roberto Herrera'),
  ('NIT12345-33', 'Publicidad GG SAS', 2007, 'Hugo Vargas'),
  ('NIT12345-34', 'Inmobiliaria HH SA', 1998, 'Paula Salazar'),
  ('NIT12345-35', 'Transportes II Ltda.', 2004, 'Isabella Soto'),
  ('NIT12345-36', 'Agropecuaria JJ SAS', 1995, 'Andr�s Ruiz'),
  ('NIT12345-37', 'Consultor�a KK SRL', 2003, 'Sof�a S�nchez')

  --CURSO 
  INSERT INTO curso (cod_cur, nom_cur, horas_cur, valor_cur)
VALUES
  (1, 'Matem�ticas I', 48, 600),
  (2, 'Historia Universal', 32, 400),
  (3, 'Biolog�a Avanzada', 56, 700),
  (4, 'Programaci�n en C', 64, 800),
  (5, 'Ingl�s Intermedio', 40, 500),
  (6, 'Literatura Cl�sica', 36, 450),
  (7, 'Qu�mica Org�nica', 52, 650),
  (8, 'F�sica Aplicada', 60, 750),
  (9, 'Econom�a Internacional', 44, 550),
  (10, 'Arquitectura Moderna', 42, 525),
  (11, 'Dise�o Gr�fico', 48, 600),
  (12, 'Geograf�a Mundial', 34, 425),
  (13, 'C�lculo Avanzado', 54, 675),
  (14, 'Derecho Empresarial', 50, 625),
  (15, 'Marketing Digital', 46, 575),
  (16, 'M�sica Cl�sica', 30, 375),
  (17, 'Medicina Preventiva', 58, 725),
  (18, 'Psicolog�a del Comportamiento', 38, 475),
  (19, 'Dise�o de Moda', 32, 400),
  (20, 'Cocina Internacional', 66, 825),
  (21, 'Arte Contempor�neo', 36, 450),
  (22, 'Teatro Cl�sico', 28, 350),
  (23, 'Ciencias Pol�ticas', 50, 625),
  (24, 'Filosof�a Antigua', 42, 525),
  (25, 'Astronom�a Avanzada', 62, 775),
  (26, 'Rob�tica Industrial', 54, 675),
  (27, 'Ecolog�a Marina', 48, 600),
  (28, 'Educaci�n Infantil', 44, 550),
  (29, 'Gesti�n de Proyectos', 52, 650),
  (30, 'Fotograf�a Art�stica', 38, 475),
  (31, 'Antropolog�a Cultural', 32, 400),
  (32, 'Estad�sticas Avanzadas', 56, 700),
  (33, 'Arqueolog�a Moderna', 40, 500),
  (34, 'Dise�o de Interiores', 46, 575),
  (35, 'Ingenier�a Civil', 60, 750),
  (36, 'M�rketing Estrat�gico', 50, 625),
  (37, 'Arte Abstracto', 34, 425),
  (38, 'Ciencias Sociales', 64, 800),
  (39, 'Derecho Internacional', 58, 725),
  (40, 'Gastronom�a Cl�sica', 30, 375),
  (41, 'Medicina Moderna', 52, 650),
  (42, 'Psicolog�a Infantil', 42, 525),
  (43, 'Dise�o de Joyas', 62, 775),
  (44, 'Cocina Gourmet', 48, 600),
  (45, 'Arte Moderno', 36, 450),
  (46, 'Teatro Contempor�neo', 28, 350),
  (47, 'Ciencias Econ�micas', 50, 625),
  (48, 'Filosof�a Contempor�nea', 46, 575),
  (49, 'Astronom�a Espacial', 38, 475),
  (50, 'Inteligencia Artificial', 54, 675);

  --CLIENTE 
INSERT INTO cliente (id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli)
VALUES
  ('ID1001', 'Juan', 'P�rez', 'Calle A #123', 'Bogot�', 'Enero'),
  ('ID1002', 'Mar�a', 'G�mez', 'Av. Principal #45', 'Medell�n', 'Febrero'),
  ('ID1003', 'Luis', 'Mart�nez', 'Carrera 7 #678', 'Cali', 'Marzo'),
  ('ID1004', 'Ana', 'Rodr�guez', 'Calle B #567', 'Barranquilla', 'Abril'),
  ('ID1005', 'Pedro', 'L�pez', 'Av. Central #987', 'Cartagena', 'Mayo'),
  ('ID1006', 'Laura', 'Garc�a', 'Calle C #345', 'Santa Marta', 'Junio'),
  ('ID1007', 'Carlos', 'Hern�ndez', 'Av. Norte #789', 'Pereira', 'Julio'),
  ('ID1008', 'Sof�a', 'D�az', 'Carrera 8 #234', 'Manizales', 'Agosto'),
  ('ID1009', 'Andr�s', 'Jim�nez', 'Calle D #456', 'Bucaramanga', 'Septiembre'),
  ('ID1010', 'M�nica', 'Vargas', 'Av. Sur #567', 'Pasto', 'Octubre'),
  ('ID1011', 'Hugo', 'Ram�rez', 'Calle E #678', 'Neiva', 'Noviembre'),
  ('ID1012', 'Valeria', 'Herrera', 'Carrera 9 #123', 'Villavicencio', 'Diciembre'),
  ('ID1013', 'David', 'Rojas', 'Calle F #234', 'Ibagu�', 'Enero'),
  ('ID1014', 'Isabella', 'Silva', 'Av. Occidente #345', 'Armenia', 'Febrero'),
  ('ID1015', 'Felipe', 'Ochoa', 'Carrera 10 #456', 'Popay�n', 'Marzo'),
  ('ID1016', 'Carolina', 'Molina', 'Calle G #567', 'Tunja', 'Abril'),
  ('ID1017', 'Javier', 'R�os', 'Av. Central #678', 'C�cuta', 'Mayo'),
  ('ID1018', 'Roberto', 'Gutierrez', 'Carrera 11 #123', 'Sincelejo', 'Junio'),
  ('ID1019', 'Mar�a', 'Paz', 'Calle H #234', 'Monter�a', 'Julio'),
  ('ID1020', 'Andrea', 'Camacho', 'Av. Principal #345', 'Valledupar', 'Agosto'),
  ('ID1021', 'Lorenzo', 'Su�rez', 'Carrera 12 #456', 'Riohacha', 'Septiembre'),
  ('ID1022', 'Alejandra', 'Parra', 'Calle I #567', 'Manizales', 'Octubre'),
  ('ID1023', 'C�sar', 'Guzm�n', 'Av. Sur #678', 'Pereira', 'Noviembre'),
  ('ID1024', 'Estefan�a', 'Luna', 'Carrera 13 #123', 'Neiva', 'Diciembre'),
  ('ID1025', 'Manuel', 'Jim�nez', 'Calle J #234', 'Villavicencio', 'Enero'),
  ('ID1026', 'Ana Mar�a', 'Rojas', 'Av. Occidente #345', 'Ibagu�', 'Febrero'),
  ('ID1027', 'Diego', 'Molina', 'Carrera 14 #456', 'Armenia', 'Marzo'),
  ('ID1028', 'Diana', 'Gutierrez', 'Calle K #567', 'Popay�n', 'Abril'),
  ('ID1029', 'Andr�s', 'R�os', 'Av. Central #678', 'Tunja', 'Mayo'),
  ('ID1030', 'Paola', 'Garc�a', 'Carrera 15 #123', 'C�cuta', 'Junio'),
  ('ID1031', 'Miguel', 'Herrera', 'Calle L #234', 'Sincelejo', 'Julio'),
  ('ID1032', 'Sara', 'Silva', 'Av. Principal #345', 'Monter�a', 'Agosto'),
  ('ID1033', 'Andr�s', 'Ochoa', 'Carrera 16 #456', 'Valledupar', 'Septiembre'),
  ('ID1034', 'Lina', 'Camacho', 'Calle M #567', 'Riohacha', 'Octubre'),
  ('ID1035', 'Jorge', 'Su�rez', 'Av. Occidente #678', 'Manizales', 'Noviembre'),
  ('ID1036', 'Gabriela', 'Parra', 'Carrera 17 #123', 'Pereira', 'Diciembre'),
  ('ID1037', 'Rafael', 'Guzm�n', 'Calle N #234', 'Neiva', 'Enero'),
  ('ID1038', 'Valentina', 'Luna', 'Av. Sur #345', 'Villavicencio', 'Febrero'),
  ('ID1039', 'Juan Pablo', 'Jim�nez', 'Carrera 18 #456', 'Ibagu�', 'Marzo'),
  ('ID1040', 'Alejandro', 'Rojas', 'Calle O #567', 'Armenia', 'Abril'),
  ('ID1041', 'Marcela', 'Molina', 'Av. Central #678', 'Popay�n', 'Mayo'),
  ('ID1042', 'Jos�', 'Gutierrez', 'Carrera 19 #123', 'Tunja', 'Junio'),
  ('ID1043', 'Camila', 'R�os', 'Calle P #234', 'C�cuta', 'Julio'),
  ('ID1044', 'Andrea', 'Herrera', 'Av. Principal #345', 'Sincelejo', 'Agosto'),
  ('ID1045', 'Luisa', 'Silva', 'Carrera 20 #456', 'Monter�a', 'Septiembre');

-- Dise�ar un procedimiento almacenado para crear, editar y eliminar registros en las tablas

--COMPA�IA

--crear

CREATE PROCEDURE CrearCompania
  @comnit CHAR(11),
  @comnombre CHAR(30),
  @coma�ofun INT,
  @comreplegal CHAR(100)
AS
BEGIN
  INSERT INTO compa�ia(comnit, comnombre, coma�ofun, comreplegal)
  VALUES (@comnit, @comnombre, @coma�ofun, @comreplegal);
END


--actualizar
CREATE PROCEDURE EditarCompania
  @comnit CHAR(11),
  @comnombre VARCHAR(30),
  @coma�ofun INT,
  @comreplegal VARCHAR(100)
AS
BEGIN
  UPDATE compa�ia
  SET comnombre = @comnombre,
      coma�ofun = @coma�ofun,
      comreplegal = @comreplegal
  WHERE comnit = @comnit;
END;


--eliminar
CREATE PROCEDURE EliminarCompania
  @comnit CHAR(11)
AS
BEGIN
  DELETE FROM compa�ia
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

--i. Visualizar los clientes que cumplen a�os seg�n un mes ingresado por par�metros:

CREATE PROCEDURE ConsultarClientesPorMesCumpleanos
  @mes_cum CHAR(10)
AS
BEGIN
  SELECT id_cli, nom_cli, ape_cli, mes_cum_cli
  FROM cliente
  WHERE mes_cum_cli = @mes_cum;
END;

--ii.Visualizar el nombre del cliente, la fecha y el valor seg�n el ID del cliente ingresado:


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


--iii. Visualizar los datos de las empresas fundadas seg�n a�o ingresado:
CREATE PROCEDURE ConsultarCompaniasPorAnoFundacion
  @coma�ofun INT
AS
BEGIN
  SELECT comnit, comnombre, coma�ofun
  FROM compa�ia
  WHERE coma�ofun = @coma�ofun;
END;


--iv. Visualizar los datos de la empresa seg�n NIT ingresado:
CREATE PROCEDURE ConsultarCompaniaPorNIT
  @comnit CHAR(11)
AS
BEGIN
  SELECT comnit, comnombre, coma�ofun, comreplegal
  FROM compa�ia
  WHERE comnit = @comnit;
END;


--v. Visualizar los pedidos que se han realizado seg�n ID de art�culo ingresado
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
