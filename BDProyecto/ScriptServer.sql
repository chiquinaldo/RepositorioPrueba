USE [dbproyecto]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 26/10/2019 15:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cola1]    Script Date: 26/10/2019 15:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cola1](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[estado] [int] NULL,
	[idCliente] [int] NULL,
	[tipo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (1, N'Term')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (2, N'Juan')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (3, N'Haber ahorita reviso dame 2 min')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (4, N'Juan')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (5, N'va')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (6, N'fg')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (7, N'tr')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (8, N'Juan')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (10, N'Pedro Aguillar')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (11, N'Pedro')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (15, N'Alberto')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (16, N'Mario')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (21, N'Juan ')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (23, N'Pablo Picazo')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (26, N'Pineida ')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (30, N'Pedro escamoso')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (33, N'Juan')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (40, N'Alberto Espinoza')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (80, N'Beermeo')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (85, N'Maria ')
INSERT [dbo].[cliente] ([idCliente], [nombre]) VALUES (120, N'Paco Alcacer')
SET IDENTITY_INSERT [dbo].[cliente] OFF
SET IDENTITY_INSERT [dbo].[cola1] ON 

INSERT [dbo].[cola1] ([id], [estado], [idCliente], [tipo]) VALUES (9, 1, 33, 1)
INSERT [dbo].[cola1] ([id], [estado], [idCliente], [tipo]) VALUES (14, 1, 23, 2)
INSERT [dbo].[cola1] ([id], [estado], [idCliente], [tipo]) VALUES (24, 1, 80, 1)
SET IDENTITY_INSERT [dbo].[cola1] OFF
ALTER TABLE [dbo].[cola1]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[cliente] ([idCliente])
GO
/****** Object:  StoredProcedure [dbo].[CambioEstado]    Script Date: 26/10/2019 15:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CambioEstado] (
@id integer
)
as 
BEGIN 

UPDATE cola1 set estado = 0
where id = @id

DELETE cola1  WHERE id=@id AND estado=0

END 
GO
/****** Object:  StoredProcedure [dbo].[GuardarDatosCliente]    Script Date: 26/10/2019 15:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GuardarDatosCliente](
@idClient integer,
@nombreCliente varchar(100)
) 
as 

begin

SET IDENTITY_INSERT cliente ON

INSERT INTO cliente (idCliente, nombre) VALUES (@idClient, @nombreCliente);

IF((SELECT count(*) from cola1 where tipo=1 AND estado = 1)*2<(SELECT count(*) from cola1 where tipo=2 AND estado = 1)*3)
	INSERT INTO cola1 (estado,idCliente,tipo) values (1,@idClient,1);
ELSE 
	INSERT INTO cola1 (estado,idCliente,tipo) values (1,@idClient,2);
end
GO
/****** Object:  StoredProcedure [dbo].[MostrarColas]    Script Date: 26/10/2019 15:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[MostrarColas]
  as
 BEGIN 
SELECT *
FROM cola1
END 
GO
