USE [Club_Deportivo]
GO
/****** Object:  Table [dbo].[Actividad]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_Actividad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoCuota]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoCuota](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mes] [int] NOT NULL,
	[anio] [int] NOT NULL,
	[idSocio] [int] NOT NULL,
 CONSTRAINT [IX_PAGO_MES_ANIO_SOCIO] PRIMARY KEY CLUSTERED 
(
	[idSocio] ASC,
	[mes] ASC,
	[anio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publicacion]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[texto] [varchar](150) NULL,
	[idActividad] [int] NOT NULL,
	[habilitada] [bit] NULL,
 CONSTRAINT [PK_Publicacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Socio]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Socio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[apellido] [varchar](100) NULL,
	[dni] [varchar](12) NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](15) NULL,
	[mail] [varchar](100) NULL,
	[idTipoCuota] [int] NOT NULL,
 CONSTRAINT [PK_Socio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocioXActividad]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocioXActividad](
	[idActividad] [int] NOT NULL,
	[idSocio] [int] NOT NULL,
 CONSTRAINT [IX_ACTIVIDAD_POR_SOCIO] PRIMARY KEY CLUSTERED 
(
	[idSocio] ASC,
	[idActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCuota]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCuota](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[monto] [numeric](8, 2) NULL,
 CONSTRAINT [PK_TipoCuota] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[contrasenia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ACTIVIDADES_HABILITADAS_FILTRADA]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ACTIVIDADES_HABILITADAS_FILTRADA]
AS
SELECT a.id,a.descripcion
FROM Actividad A INNER JOIN Publicacion P ON A.id=P.idActividad
WHERE P.habilitada =1
GO
/****** Object:  View [dbo].[informeDos]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[informeDos]
as
select s.id as Codigo, s.apellido as Apellido,s.nombre as Nombre, p.mes as 'Mes Pagado', p.anio 
from PagoCuota p inner join Socio s on p.idSocio = s.id inner join TipoCuota t on s.idTipoCuota = t.id 
GO
/****** Object:  View [dbo].[informeDosVista]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[informeDosVista]
as
select s.id as Codigo, s.apellido as Apellido,s.nombre as Nombre, p.mes as 'Mes Pagado', p.anio as Anio
from PagoCuota p inner join Socio s on p.idSocio = s.id inner join TipoCuota t on s.idTipoCuota = t.id 
GO
/****** Object:  View [dbo].[informeUnoVista]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[informeUnoVista]
as
select SUM (t.monto) as 'Monto total' , p.anio as 'Año'
from PagoCuota p inner join Socio s on p.idSocio = s.id inner join TipoCuota t on s.idTipoCuota = t.id 
group by p.anio
GO
/****** Object:  View [dbo].[publicacionesAdm]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[publicacionesAdm]
as
select a.descripcion, p.texto , p.id, p.habilitada
from Publicacion p inner join Actividad a on p.idActividad = a.id
GO
/****** Object:  View [dbo].[publicacionesVista]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[publicacionesVista]
as
select p.texto,a.descripcion
from Publicacion p inner join Actividad a on p.idActividad=a.id
where p.habilitada = 1
GO
/****** Object:  View [dbo].[publicacionView]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create view [dbo].[publicacionView]
  as
  select a.descripcion, p.texto , p.id
  from Publicacion p inner join Actividad a on p.idActividad = a.id
GO
/****** Object:  View [dbo].[publicacionVista2]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create view [dbo].[publicacionVista2]
  as
  select a.descripcion, p.texto , p.id
  from Publicacion p inner join Actividad a on p.idActividad = a.id
GO
/****** Object:  View [dbo].[SociosVistaUno]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[SociosVistaUno]
as
Select s.id as 'Cod', s.nombre as 'Nombre',s.direccion as 'Apellido',s.dni,s.direccion,s.mail, t.nombre as 'Tipo de cuota'
from Socio s inner join TipoCuota t on s.idTipoCuota = t.id   
GO
SET IDENTITY_INSERT [dbo].[Actividad] ON 

INSERT [dbo].[Actividad] ([id], [descripcion]) VALUES (1, N'Abono Futbol')
INSERT [dbo].[Actividad] ([id], [descripcion]) VALUES (2, N'Pileta')
INSERT [dbo].[Actividad] ([id], [descripcion]) VALUES (3, N'Escuela Futbol')
INSERT [dbo].[Actividad] ([id], [descripcion]) VALUES (4, N'Escuela Bastquet')
INSERT [dbo].[Actividad] ([id], [descripcion]) VALUES (5, N'Karate')
SET IDENTITY_INSERT [dbo].[Actividad] OFF
SET IDENTITY_INSERT [dbo].[PagoCuota] ON 

INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (1, 1, 2018, 3)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (3, 2, 2018, 3)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (5, 1, 2018, 4)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (7, 2, 2018, 4)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (23, 3, 2018, 4)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (18, 4, 2017, 4)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (21, 4, 2018, 4)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (29, 5, 2018, 4)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (30, 6, 2018, 4)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (35, 7, 2018, 4)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (36, 8, 2018, 4)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (37, 9, 2018, 4)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (38, 10, 2018, 4)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (39, 11, 2018, 4)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (40, 12, 2018, 4)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (11, 1, 2017, 5)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (8, 1, 2018, 5)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (10, 2, 2018, 5)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (13, 3, 2018, 5)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (19, 4, 2018, 5)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (14, 1, 2016, 6)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (15, 2, 2018, 6)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (25, 1, 2018, 8)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (28, 2, 2018, 8)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (32, 7, 2018, 8)
INSERT [dbo].[PagoCuota] ([id], [mes], [anio], [idSocio]) VALUES (20, 3, 2017, 30)
SET IDENTITY_INSERT [dbo].[PagoCuota] OFF
SET IDENTITY_INSERT [dbo].[Publicacion] ON 

INSERT [dbo].[Publicacion] ([id], [texto], [idActividad], [habilitada]) VALUES (2, N'Aca se cambio el item', 2, 1)
INSERT [dbo].[Publicacion] ([id], [texto], [idActividad], [habilitada]) VALUES (4, N'Modificacion', 3, 1)
INSERT [dbo].[Publicacion] ([id], [texto], [idActividad], [habilitada]) VALUES (5, N'Sin novedades', 2, 1)
SET IDENTITY_INSERT [dbo].[Publicacion] OFF
SET IDENTITY_INSERT [dbo].[Socio] ON 

INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (3, N'xxxxxx', N'Quevedo', N'2566666', N'Av Dante 4233', N'03543-46666666', N'martinquevedo@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (4, N'Alberto Pepin', N'Funes', N'9562365', N'Mirasoles 58', N'0351-45678999', NULL, 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (5, N'lucas', N'Nuevo', N'1111111', N'pto principe ', N'4444444', N'email@net.in', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (6, N'lucas', N'david', NULL, N'pto principe ', N'4444444', NULL, 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (7, N'lucas', N'david', N'7777777', N'pto principe ', N'4444444', NULL, 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (8, N'Pedrito', N'david', N'7777777', N'pto principe ', N'4444444', N'tontin@ger.im', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (9, N'lucas', N'david', N'7777777', N'pto principe ', N'4444444', NULL, 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (10, N'lucas', N'david', N'7777777', N'pto principe ', N'4444444', NULL, 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (11, N'lucas', N'david', N'7777777', N'pto principe ', N'4444444', NULL, 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (12, N'lucas', N'david', N'7777777', N'pto principe ', N'4444444', N'lucas@gmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (13, N'lucas', N'david', N'7777777', N'pto principe ', N'4444444', N'luciadl@gmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (14, N'Daniel', N'Colazo', N'23568569', N'Urquiza 456', N'156456123', N'urquiza@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (15, N'Daniel', N'Colazo', N'23568569', N'Urquiza 456', N'156456123', N'urquiza@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (16, N'Miguel', N'Suarez', N'23568569', N'Urquiza 456', N'156456123', N'miguel@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (17, N'Daniel', N'Colazo', N'23568569', N'Urquiza 456', N'4444444', N'luciadl@gmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (18, N'Daniel', N'david', N'23568569', N'Urquiza 456', N'4444444', N'urquiza@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (19, N'Miguel', N'Colazo', N'23568569', N'Urquiza 456', N'4444444', N'miguel@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (20, N'Miguel', N'Colazo', N'7777777', N'pto principe ', N'4444444', N'urquiza@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (21, N'lucas', N'Colazo', N'7777777', N'Urquiza 456', N'4444444', N'urquiza@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (22, N'Daniel', N'Colazo', N'23568569', N'Urquiza 456', N'4444444', N'urquiza@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (23, N'Daniel', N'david', N'23568569', N'pto principe ', N'4444444', N'urquiza@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (24, N'lucas', N'Colazo', N'7777777', N'Urquiza 456', N'4444444', N'miguel@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (25, N'Miguel', N'Colazo', N'7777777', N'Urquiza 456', N'4444444', N'urquiza@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (26, N'Daniel', N'Colazo', N'7777777', N'Urquiza 456', N'4444444', N'urquiza@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (27, N'Daniel', N'Colazo', N'7777777', N'pto principe ', N'4444444', N'luciadl@gmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (28, N'lucas', N'Colazo', N'23568569', N'Urquiza 456', N'4444444', N'luciadl@gmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (29, N'lucas', N'Colazo', N'7777777', N'Urquiza 456', N'4444444', N'luciadl@gmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (30, N'Daniel', N'Colazo', N'7777777', N'Urquiza 456', N'4444444', N'luciadl@gmail.com', 9)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (31, N'Daniel', N'Colazo', N'7777777', N'Urquiza 456', N'4444444', N'luciadl@gmail.com', 8)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (32, N'Mayor', N'Cuellar', N'123456789', N'Urquiza 456', N'4444444', N'MayorCuellar@hotmail.com', 3)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (33, N'Luciana', N'Perez', N'456464654', N'Ulklklk', N'45464656', N'luciana@hotmail.com', 8)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (34, N'Daniel', N'Colazo', N'7777777', N'Urquiza 456', N'4444444', N'luciadl@gmail.com', 9)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (35, N'Ezequiel', N'Gatti', N'25636987', N'Arenales 2563', N'4559687', N'', 7)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (36, N'Luciana', N'Perez', N'456464654', N'Entre Rios ', N'45464656', N'luciana@hotmail.com', 6)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (37, N'lucas', N'david', N'25897456', N'Rio Primero 1737', N'4444444', N'', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (38, N'lucas', N'Tinelli', N'40325698', N'Murcia 856 ', N'4444444', N'MayorCuellar@hotmail.com', 1)
INSERT [dbo].[Socio] ([id], [nombre], [apellido], [dni], [direccion], [telefono], [mail], [idTipoCuota]) VALUES (39, N'Enrique', N'PINTI', N'55897456', N'pto principe ', N'4444444', N'', 1)
SET IDENTITY_INSERT [dbo].[Socio] OFF
INSERT [dbo].[SocioXActividad] ([idActividad], [idSocio]) VALUES (2, 4)
INSERT [dbo].[SocioXActividad] ([idActividad], [idSocio]) VALUES (4, 8)
INSERT [dbo].[SocioXActividad] ([idActividad], [idSocio]) VALUES (2, 14)
SET IDENTITY_INSERT [dbo].[TipoCuota] ON 

INSERT [dbo].[TipoCuota] ([id], [nombre], [monto]) VALUES (1, N'Mayor_Popular', CAST(150.00 AS Numeric(8, 2)))
INSERT [dbo].[TipoCuota] ([id], [nombre], [monto]) VALUES (2, N'Mayor_Platea', CAST(175.00 AS Numeric(8, 2)))
INSERT [dbo].[TipoCuota] ([id], [nombre], [monto]) VALUES (3, N'Mayor_Cuellar', CAST(250.00 AS Numeric(8, 2)))
INSERT [dbo].[TipoCuota] ([id], [nombre], [monto]) VALUES (4, N'Dam/Jub/CadeteMay_Popular', CAST(105.00 AS Numeric(8, 2)))
INSERT [dbo].[TipoCuota] ([id], [nombre], [monto]) VALUES (5, N'Dam/Jub/CadeteMay_Platea', CAST(190.00 AS Numeric(8, 2)))
INSERT [dbo].[TipoCuota] ([id], [nombre], [monto]) VALUES (6, N'Dam/Jub/CadeteMay_Cuellar', CAST(250.00 AS Numeric(8, 2)))
INSERT [dbo].[TipoCuota] ([id], [nombre], [monto]) VALUES (7, N'CadeteMenor_Popular', CAST(80.00 AS Numeric(8, 2)))
INSERT [dbo].[TipoCuota] ([id], [nombre], [monto]) VALUES (8, N'CadeteMenor_Platea', CAST(140.00 AS Numeric(8, 2)))
INSERT [dbo].[TipoCuota] ([id], [nombre], [monto]) VALUES (9, N'CadeteMenor_Cuellar', CAST(250.00 AS Numeric(8, 2)))
INSERT [dbo].[TipoCuota] ([id], [nombre], [monto]) VALUES (10, N'Premiun', CAST(5000.00 AS Numeric(8, 2)))
INSERT [dbo].[TipoCuota] ([id], [nombre], [monto]) VALUES (11, N'Full', CAST(15000.00 AS Numeric(8, 2)))
INSERT [dbo].[TipoCuota] ([id], [nombre], [monto]) VALUES (12, N'Prueba', CAST(100.00 AS Numeric(8, 2)))
INSERT [dbo].[TipoCuota] ([id], [nombre], [monto]) VALUES (13, N'Otra Prueba', CAST(5000.00 AS Numeric(8, 2)))
SET IDENTITY_INSERT [dbo].[TipoCuota] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [nombreUsuario], [contrasenia]) VALUES (2, N'Administrador', N'1234')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Publicacion] ADD  CONSTRAINT [pub_hab_def]  DEFAULT ((1)) FOR [habilitada]
GO
ALTER TABLE [dbo].[PagoCuota]  WITH CHECK ADD  CONSTRAINT [FK_Socio_PagoCuota] FOREIGN KEY([idSocio])
REFERENCES [dbo].[Socio] ([id])
GO
ALTER TABLE [dbo].[PagoCuota] CHECK CONSTRAINT [FK_Socio_PagoCuota]
GO
ALTER TABLE [dbo].[Publicacion]  WITH CHECK ADD  CONSTRAINT [FK_Publicacion_Actividad] FOREIGN KEY([idActividad])
REFERENCES [dbo].[Actividad] ([id])
GO
ALTER TABLE [dbo].[Publicacion] CHECK CONSTRAINT [FK_Publicacion_Actividad]
GO
ALTER TABLE [dbo].[Socio]  WITH CHECK ADD  CONSTRAINT [FK_Socio_TipoCuota] FOREIGN KEY([idTipoCuota])
REFERENCES [dbo].[TipoCuota] ([id])
GO
ALTER TABLE [dbo].[Socio] CHECK CONSTRAINT [FK_Socio_TipoCuota]
GO
ALTER TABLE [dbo].[SocioXActividad]  WITH CHECK ADD  CONSTRAINT [FK_SocioXActividad_Actividad] FOREIGN KEY([idActividad])
REFERENCES [dbo].[Actividad] ([id])
GO
ALTER TABLE [dbo].[SocioXActividad] CHECK CONSTRAINT [FK_SocioXActividad_Actividad]
GO
ALTER TABLE [dbo].[SocioXActividad]  WITH CHECK ADD  CONSTRAINT [FK_SocioXActividad_Socio] FOREIGN KEY([idSocio])
REFERENCES [dbo].[Socio] ([id])
GO
ALTER TABLE [dbo].[SocioXActividad] CHECK CONSTRAINT [FK_SocioXActividad_Socio]
GO
/****** Object:  StoredProcedure [dbo].[Sp_FiltrarListadoCuotasPagas]    Script Date: 18/11/2018 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_FiltrarListadoCuotasPagas]
@id int 
As 
Begin 
select s.id as Codigo, s.apellido as Apellido,s.nombre as Nombre, p.mes as 'Mes Pagado', p.anio 
from PagoCuota p inner join Socio s on p.idSocio = s.id inner join TipoCuota t on s.idTipoCuota = t.id 
where s.id like @id
End 
GO
