
CREATE DATABASE OBLBD2
GO

SET DATEFORMAT DMY

CREATE TABLE BARRIO(codBarrio numeric(6), 
                    nomBarrio varchar(30),
					CONSTRAINT PK_Barrio PRIMARY KEY(codBarrio))
GO
CREATE TABLE ES_VECINO(codBarrio1 numeric(6),
                       codBarrio2 numeric(6),
					   CONSTRAINT PK_Vecino PRIMARY KEY(codBarrio1,codBarrio2),
					   CONSTRAINT FK_Barrio1 FOREIGN KEY(codBarrio1) REFERENCES Barrio(codBarrio),
					   CONSTRAINT FK_Barrio2 FOREIGN KEY(codBarrio2) REFERENCES Barrio(codBarrio))
GO
CREATE TABLE ESTACION(codEst numeric(6), 
                      dscEst varchar(30),
					  codBarrio numeric(6),
					  tipoEst character(1),
					  CONSTRAINT PK_Estacion PRIMARY KEY(codEst),
					  CONSTRAINT FK_BarrioEstacion FOREIGN KEY(codBarrio) REFERENCES Barrio(codBarrio))
GO
CREATE TABLE LINEA(numLinea numeric(6),
                   dscLinea varchar(30),
				   colorLinea varchar(20), 
				   longLinea numeric(12,2),
				   codEstOrigen numeric(6), 
				   codEstDestino numeric(6),
				   CONSTRAINT PK_Linea PRIMARY KEY(numLinea),
				   CONSTRAINT FK_Origen FOREIGN KEY(codEstOrigen) REFERENCES Estacion(codEst),
				   CONSTRAINT FK_Destino FOREIGN KEY(codEstDestino) REFERENCES Estacion(codEst))
GO
CREATE TABLE MOLINETE(codEst numeric(6), 
                      numMol numeric(3),
					  acumMol numeric(10),
					  fchMol datetime,
					  CONSTRAINT PK_Molinete PRIMARY KEY(codEst,numMol),
					  CONSTRAINT FK_EstMol FOREIGN KEY(codEst) REFERENCES Estacion(codEst))
GO
CREATE TABLE TREN(numTren numeric(6),
                  dscTren varchar(30),
				  letraTren char(1), 
				  CONSTRAINT PK_Tren PRIMARY KEY(numTren))
GO
CREATE TABLE VAGON(numTren numeric(6),
                   numVagon numeric(2),
				   capVagon numeric(10),
				   CONSTRAINT PK_Vagon PRIMARY KEY(numTren,numVagon),
				   CONSTRAINT FK_TrenVagon FOREIGN KEY(numTren) REFERENCES Tren(numTren))
GO
CREATE TABLE LIN_EST(numLinea numeric(6), 
                     codEst numeric(6),
					 CONSTRAINT PK_Lin_Est PRIMARY KEY(numLinea,codEst),
					 CONSTRAINT FK_Linea_LinEst FOREIGN KEY(numLinea) REFERENCES Linea(numLinea),
					 CONSTRAINT FK_Estac_LinEst FOREIGN KEY(codEst) REFERENCES Estacion(codEst))
GO
CREATE TABLE PASA_POR(numTren numeric(6), 
                      numLinea numeric(6), 
					  codEst numeric(6), 
					  fechahora_pasa datetime,
					  CONSTRAINT PK_PasaPor PRIMARY KEY(numTren,numLinea,codEst,fechahora_pasa),
					  CONSTRAINT FK_TrenPasaPor FOREIGN KEY(numTren) REFERENCES Tren(numTren),
					  CONSTRAINT FK_LineaEstacion FOREIGN KEY(numLinea,codEst) REFERENCES LIN_EST(numLinea,codEst))
GO

--INSERTS

insert into BARRIO (codBarrio, nomBarrio) values (1,'ABarrio 1')
insert into BARRIO (codBarrio, nomBarrio) values (2,'BBarrio 2')
insert into BARRIO (codBarrio, nomBarrio) values (3,'CBarrio 3')
insert into BARRIO (codBarrio, nomBarrio) values (4,'DBarrio 4')
insert into BARRIO (codBarrio, nomBarrio) values (5,'EBarrio 5')
insert into BARRIO (codBarrio, nomBarrio) values (6,'CBarrio 6')
GO

insert into ES_VECINO(codBarrio1,codBarrio2) values (1,2)
insert into ES_VECINO(codBarrio1,codBarrio2) values (1,3)
insert into ES_VECINO(codBarrio1,codBarrio2) values (3,5)
insert into ES_VECINO(codBarrio1,codBarrio2) values (2,4)
insert into ES_VECINO(codBarrio1,codBarrio2) values (5,6)
GO

insert into ESTACION(codEst,dscEst,codBarrio,tipoEst) values (100,'Estacion 100',1,'U')
insert into ESTACION(codEst,dscEst,codBarrio,tipoEst) values (200,'Estacion 200',2,'U')
insert into ESTACION(codEst,dscEst,codBarrio,tipoEst) values (300,'Estacion 300',3,'U')
insert into ESTACION(codEst,dscEst,codBarrio,tipoEst) values (3000,'Estacion 3000',3,'U')
insert into ESTACION(codEst,dscEst,codBarrio,tipoEst) values (400,'Estacion 400',4,'U')
insert into ESTACION(codEst,dscEst,codBarrio,tipoEst) values (4000,'Estacion 4000',4,'U')
insert into ESTACION(codEst,dscEst,codBarrio,tipoEst) values (4100,'Estacion 4100',4,'U')
insert into ESTACION(codEst,dscEst,codBarrio,tipoEst) values (500,'Estacion 500',5,'S')
insert into ESTACION(codEst,dscEst,codBarrio,tipoEst) values (600,'Estacion 600',6,'U')
GO

insert into LINEA(numLinea,dscLinea,colorLinea,longLinea,codEstOrigen, codEstDestino) values (10,'Linea 10', 'NARANJA', 1, 200, 400)
insert into LINEA(numLinea,dscLinea,colorLinea,longLinea,codEstOrigen, codEstDestino) values (20,'Linea 20', 'AZUL', 2, 100, 400)
insert into LINEA(numLinea,dscLinea,colorLinea,longLinea,codEstOrigen, codEstDestino) values (30,'Linea 30', 'VERDE', 3, 300, 400)
insert into LINEA(numLinea,dscLinea,colorLinea,longLinea,codEstOrigen, codEstDestino) values (50,'Linea 50', 'NEGRO', 2, 500, 100)
insert into LINEA(numLinea,dscLinea,colorLinea,longLinea,codEstOrigen, codEstDestino) values (60,'Linea 60', 'ROJO', 4, 600, 300)
insert into LINEA(numLinea,dscLinea,colorLinea,longLinea,codEstOrigen, codEstDestino) values (300,'Linea 300', 'ROJO', 7, 300, 3000)
insert into LINEA(numLinea,dscLinea,colorLinea,longLinea,codEstOrigen, codEstDestino) values (400,'Linea 400', 'GRIS', 1, 400, 4000)
insert into LINEA(numLinea,dscLinea,colorLinea,longLinea,codEstOrigen, codEstDestino) values (410,'Linea 410', 'GRIS OSCURO', 1, 400, 4100)

GO

insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (100,1,100,'14/11/2022')  

insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (200,1,200,'14/11/2022')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (200,2,200,'14/11/2022')

insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (300,1,300,'14/11/2022')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (300,2,300,'14/11/2022')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (300,3,300,'14/11/2022')

insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (3000,1,3000,'14/11/2022') 
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (3000,2,3000,'14/11/2022') 
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (3000,3,3000,'14/11/2022')

insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (400,1,400,'14/11/2022')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (400,2,400,'14/11/2022')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (400,3,400,'14/11/2022')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (400,4,400,'14/11/2022')

insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (4000,1,4000,'14/11/2022')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (4000,2,4000,'14/11/2022')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (4000,3,4000,'14/11/2022')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (4000,4,4000,'14/11/2022')

insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (600,1,600,'14/11/2021')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (600,2,600,'14/11/2021')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (600,3,600,'14/11/2021')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (600,4,600,'14/11/2021')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (600,5,600,'14/11/2021')
insert into MOLINETE(codEst,numMol,acumMol,fchMol) values (600,6,600,'14/11/2021')

GO

insert into TREN(numTren,dscTren,letraTren) values (1,'Tren 1','A')
insert into TREN(numTren,dscTren,letraTren) values (2,'Tren 2','B')
insert into TREN(numTren,dscTren,letraTren) values (3,'Tren 3','C')
insert into TREN(numTren,dscTren,letraTren) values (5,'Tren 5','D')
insert into TREN(numTren,dscTren,letraTren) values (6,'Tren 6','E')
insert into TREN(numTren,dscTren,letraTren) values (30,'Tren 30','Z')
insert into TREN(numTren,dscTren,letraTren) values (40,'Tren 40','Y')
insert into TREN(numTren,dscTren,letraTren) values (41,'Tren 41','X')
GO

insert into VAGON(numTren,numVagon,capVagon) values (1,1,40)
insert into VAGON(numTren,numVagon,capVagon) values (2,2,40)
insert into VAGON(numTren,numVagon,capVagon) values (2,3,40)
insert into VAGON(numTren,numVagon,capVagon) values (3,4,40)
insert into VAGON(numTren,numVagon,capVagon) values (3,5,40)
insert into VAGON(numTren,numVagon,capVagon) values (3,6,40)
insert into VAGON(numTren,numVagon,capVagon) values (3,7,40)
insert into VAGON(numTren,numVagon,capVagon) values (3,8,40)
insert into VAGON(numTren,numVagon,capVagon) values (5,9,40)
insert into VAGON(numTren,numVagon,capVagon) values (6,10,40)
insert into VAGON(numTren,numVagon,capVagon) values (6,11,40)
insert into VAGON(numTren,numVagon,capVagon) values (30,12,40)
insert into VAGON(numTren,numVagon,capVagon) values (30,13,40)
insert into VAGON(numTren,numVagon,capVagon) values (40,14,40)
insert into VAGON(numTren,numVagon,capVagon) values (41,15,40)
insert into VAGON(numTren,numVagon,capVagon) values (41,16,40)
GO

insert into LIN_EST(numLinea,codEst) values (10,200) 
insert into LIN_EST(numLinea,codEst) values (10,400)
insert into LIN_EST(numLinea,codEst) values (20,100)
insert into LIN_EST(numLinea,codEst) values (20,200)
insert into LIN_EST(numLinea,codEst) values (20,400)
insert into LIN_EST(numLinea,codEst) values (30,300)
insert into LIN_EST(numLinea,codEst) values (30,100)
insert into LIN_EST(numLinea,codEst) values (30,200)
insert into LIN_EST(numLinea,codEst) values (30,400)
insert into LIN_EST(numLinea,codEst) values (50,100)
insert into LIN_EST(numLinea,codEst) values (50,500)
insert into LIN_EST(numLinea,codEst) values (60,600)
insert into LIN_EST(numLinea,codEst) values (60,300)
insert into LIN_EST(numLinea,codEst) values (300,300)
insert into LIN_EST(numLinea,codEst) values (300,100)
insert into LIN_EST(numLinea,codEst) values (300,200)
insert into LIN_EST(numLinea,codEst) values (300,400)
insert into LIN_EST(numLinea,codEst) values (300,3000)
insert into LIN_EST(numLinea,codEst) values (400,400)
insert into LIN_EST(numLinea,codEst) values (400,4000)
insert into LIN_EST(numLinea,codEst) values (410,400)
insert into LIN_EST(numLinea,codEst) values (410,4100)

GO

insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (1,10,200,'14/11/2021') 
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (1,10,400,'14/11/2021') 
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (2,20,200,'14/11/2021') 
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (3,30,200,'14/11/2021') 
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (6,60,600,'14/11/2021')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (6,60,300,'10/11/2021')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (30,300,300,'14/11/2021')  
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (30,300,100,'14/11/2021')       
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (30,300,200,'14/11/2021')   
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (30,300,400,'14/11/2021')      
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (30,300,3000,'14/11/2021')  

insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (1,10,200,'14/11/2022') 
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (1,10,400,'14/11/2022') 
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (1,10,200,'13/11/2022') 
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (1,10,400,'13/11/2022') 
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (1,10,200,'12/11/2022') 
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (1,10,400,'12/11/2022') 
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (2,20,100,'14/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (2,20,200,'14/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (2,20,400,'14/11/2022')     
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (3,30,300,'14/11/2022') 
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (3,30,200,'14/11/2022') 
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (3,30,100,'14/11/2022')     
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (3,30,400,'14/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (5,50,500,'14/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (5,50,100,'14/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (30,300,300,'14/11/2022')  
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (30,300,100,'14/11/2022')       
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (30,300,200,'14/11/2022')   
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (30,300,400,'14/11/2022')      
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (30,300,3000,'14/11/2022') 
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (40,400,400,'14/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (40,400,4000,'14/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (40,400,400,'13/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (40,400,4000,'13/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (40,400,400,'12/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (40,400,4000,'12/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (40,400,400,'11/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (40,400,4000,'11/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (40,400,400,'10/11/2022')
insert into PASA_POR(numTren,numLinea,codEst,fechahora_pasa) values (40,400,4000,'10/11/2022')

GO


--CONSULTAS

--------------------------------------------------------------------------------------------------

-- 1 (OK) Listar código de Barrio y descripción de Barrio para todos aquellos Barrios de Estaciones por donde pasaron 
	--Trenes este año, filtrar resultados repetidos.

select distinct codBarrio, nomBarrio 
	from BARRIO 
	where codBarrio in (
		select codBarrio 
		from ESTACION,PASA_POR 
		where (ESTACION.codEst = PASA_POR.codEst) 
			and	PASA_POR.fechahora_pasa >= CAST('01/01/2022' AS datetime))

GO
	

-- 2 (OK) Listar las 5 Estaciones por las que pasaron mas trenes el año pasado.

SELECT top(5) ESTACION.codEst, ESTACION.dscEst  
			from ESTACION join PASA_POR on ESTACION.codEst = PASA_POR.codEst 
			WHERE PASA_POR.fechahora_pasa >= CAST('01/01/2021' AS datetime) 
				and PASA_POR.fechahora_pasa <= CAST('31/12/2021' AS datetime)
		select ESTACION.codEst CodigoEstacion, ESTACION.dscEst DescripcionEstacion, 
	sum(MOLINETE.acumMol) AcumuladoMolinete 
		from ESTACION, MOLINETE 
		where ESTACION.codEst = MOLINETE.codEst
		group by ESTACION.codEst, ESTACION.dscEst		group by ESTACION.codEst, ESTACION.dscEst  
				order by count(PASA_POR.fechahora_pasa) desc
				--aca si ordenamos por codestacion asc da, sino no deberia porque 
				--3 veces pasa 101, 105, 107 dos veces pasa 108, 109, 102, 104, 200 y una vez 110 (test Rafael)

GO

-- 3 (OK) Para cada Estación mostrar sus datos y el total acumulado de todos sus Molinetes.

select ESTACION.codEst CodigoEstacion, ESTACION.dscEst DescripcionEstacion, 
	sum(MOLINETE.acumMol) AcumuladoMolinete 
		from ESTACION, MOLINETE 
		where ESTACION.codEst = MOLINETE.codEst
		group by ESTACION.codEst, ESTACION.dscEst

GO


-- 4 (OK) Para las Líneas que tengan más de 5 kmts de longitud y tengan como destino Estaciones del mismo Barrio 
       -- mostrar su número, descripción y nombre del Barrio, ordenar los resultados por número de Línea.

	select distinct numLinea as NumeroLinea, dscLinea as DescripcionLinea, nomBarrio as NombreBarrio 
	from BARRIO,LINEA, ESTACION a, Estacion b 
	where Barrio.codBarrio = a.codBarrio 
		and a.codBarrio = b.codBarrio 
		and a.codEst = LINEA.codEstDestino 
		and b.codEst =  LINEA.codEstDestino 
		and Linea.longLinea >5 
	order by numLinea ASC

	select numLinea as NumeroLinea, dscLinea as DescripcionLinea, nomBarrio as NombreBarrio 
	from BARRIO,LINEA,ESTACION 
	where Barrio.codBarrio = ESTACION.codBarrio 
		and ESTACION.codEst = LINEA.codEstDestino 
		and Linea.longLinea >5  
	order by numLinea ASC

GO

-- 5 (OK) Mostrar para cada Tren sus datos, la cantidad de Vagones que tiene y su capacidad total de pasajeros, 
   -- solo debe mostrarse aquellos Trenes que tengan más de 1 Vagón (ordenar el resultado por cantidad de vagones descendente).

select TREN.numTren as NumeroTren, Tren.dscTren Descripcion, Tren.letraTren LetraTren, 
	count(VAGON.capVagon) CantidadVagon, sum (Vagon.capVagon) CantidadPasajeros 
	from Tren,Vagon 
		where tren.numTren = vagon.numTren 
		group by tren.numTren, tren.dsctren, tren.letraTren
		having count(VAGON.capVagon) >1
		order by count(VAGON.capVagon) desc

GO

-- 6 (OK) Mostrar los datos de las Estaciones por donde aún no pasaron Trenes.

select distinct estacion.* from Estacion 
	where Estacion.codEst 
	not in(SELECT p.codEst
	       FROM PASA_POR p) 

GO

-- 7 (OK) Para las Líneas de color ROJO, mostrar sus datos y los datos de las Estaciones Origen y Destino.

select L.numLinea, L.dscLinea, L.colorLinea, L.longLinea, L.codEstOrigen, L.codEstDestino, EstacionOrigen.dscEst Origen, 
	EstacionDestino.dscEst Destino 
	from LINEA L
		JOIN ESTACION EstacionOrigen 
			on EstacionOrigen.codEst = L.codEstOrigen
		JOIN ESTACION EstacionDestino 
			on EstacionDestino.codEst = L.codEstDestino
	where L.colorLinea = 'Rojo'

GO


-- 8 (OK) Mostrar número y descripción de Línea, código y descripción de Estación, número y descripción de Tren para todos los 
     -- trenes que pasaron por esas estaciones y líneas en el año corriente.

select distinct linea.numLinea NumeroLinea, Linea.dscLinea DescripcionLinea, Estacion.codEst CodigoEstacion, 
	ESTACION.dscEst DescripcionEstacion,Tren.numTren NumeroTren, Tren.dscTren DescripcionTren 
	from Linea,ESTACION,TREN,PASA_POR 
	where PASA_POR.numTren = Tren.numTren 
		and	PASA_POR.numLinea = Linea.numLinea 
		and PASA_POR.codEst = ESTACION.codEst 
		and PASA_POR.fechahora_pasa >= CAST(convert (varchar(4),Year (GetDate())) +	'/01/01' AS datetime)
	Order by NumeroTren

GO

-- 9 (OK) Mostrar la cantidad de líneas Urbanas diferentes que tienen Estaciones donde el nombre de sus Barrios comienzan con la letra “C”

select count(numLinea) AS CantLineas from linea 
	where LINEA.numLinea 
		in (select distinct numLinea 
			from LIN_EST 
			where LIN_EST.codEst 
				in (select LIN_EST.codEst 
					from LIN_EST,ESTACION,Barrio
					where LIN_EST.codEst = ESTACION.codEst 
						and ESTACION.codBarrio = BARRIO.codBarrio 
						and Barrio.nomBarrio like 'C%' 
						and ESTACION.tipoEst = 'U'))

GO

drop table PASA_POR
drop table LIN_EST
drop table vagon
drop table tren
drop table molinete
drop table linea
drop table ESTACION
drop table ES_VECINO
drop table barrio

go
