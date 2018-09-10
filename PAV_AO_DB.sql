USE [Pav_AO]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 08/14/2018 16:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfiles](
	[id_perfil] [int] IDENTITY(1,1) NOT NULL,
	[nombre_perfil] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[id_perfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Perfiles] ON
INSERT [dbo].[Perfiles] ([id_perfil], [nombre_perfil]) VALUES (1, N'Administrador')
INSERT [dbo].[Perfiles] ([id_perfil], [nombre_perfil]) VALUES (2, N'Odontologo')
INSERT [dbo].[Perfiles] ([id_perfil], [nombre_perfil]) VALUES (3, N'Secretaria')

SET IDENTITY_INSERT [dbo].[Perfiles] OFF
/****** Object:  Table [dbo].[Pacientes]    Script Date: 08/14/2018 16:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pacientes](
	[id_paciente] [int] IDENTITY(1,1) NOT NULL,
	[nro_documento] [int]  NOT NULL,
	[tipo_documento] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[fecha_nac] [date],
	[domicilio] [varchar](50),
	[telefono] [int],
	[obra_Social] [varchar](50),
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[nro_documento],
	[id_paciente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Pacientes] ON
INSERT [dbo].[Pacientes] ([id_paciente],[nro_documento],[tipo_documento],[nombre],[apellido],
[fecha_nac],[domicilio],[telefono],[obra_Social]) VALUES (1, 01, 1, N'Pepe', N'Argento', '2010-08-08', N'ituzaingo 1211',
3333333,N'Osde')
SET IDENTITY_INSERT [dbo].[Pacientes] OFF
/****** Object:  Table [dbo].[Tipo_Documento]   Script Date: 08/14/2018 16:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_Documento](
	[cod_tipo] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](50),
 CONSTRAINT [PK_Tipo_Documento] PRIMARY KEY CLUSTERED 
(
	[cod_tipo] 
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

INSERT [dbo].[Tipo_Documento] ([cod_tipo], [nombre], [descripcion]) VALUES (1, N'DNI','documento nacional de Identidad')
INSERT [dbo].[Tipo_Documento] ([cod_tipo], [nombre], [descripcion]) VALUES (2, N'Pasaporte','pasaporte')


/****** Object:  Table [dbo].[Odontologos]    Script Date: 08/14/2018 16:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Odontologos](
	[nro_Matricula] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[nombre] [varchar](50),
	[apellido] [varchar](50),
	[nro_documento] [int]  NOT NULL,
	[tipo_documento] [int] NOT NULL,
	[telefono] [int]
	
 CONSTRAINT [PK_Odontologos] PRIMARY KEY CLUSTERED 
(
	[nro_documento],
	[nro_Matricula] 
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Odontologos] ([nro_Matricula],[id_usuario], [nombre],[apellido],[nro_documento],
[tipo_documento],[telefono] )
 VALUES (1, 2, N'Jose', N'Perez', 02, 1, 44444)
/****** Object:  Table [dbo].[Historial_Med]    Script Date: 08/14/2018 16:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Historial_Med](
	[id_Historial] [int] IDENTITY(1,1) NOT NULL,
	[doc_paciente] [int] NOT NULL,
	[nro_matricula] [int] NOT NULL,
	[fecha_inicio] [date],
	[importe_total] [int],
	[observacion] [varchar](50),
	[cod_odontograma] [int] NOT NULL,
 CONSTRAINT [PK_Historial_Med] PRIMARY KEY CLUSTERED 
(
	[id_Historial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Historial_Med] ON
INSERT [dbo].[Historial_Med] ([id_Historial],[doc_paciente],[nro_matricula],[fecha_inicio],[importe_total],[observacion],[cod_odontograma]) 
VALUES (1,01, 001, '2011-11-11','',N'Ibuprofeno',1)
/****** Object:  Table [dbo].[Det_Histo_Med]    Script Date: 08/14/2018 16:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Det_Histo_Med](
	[id_detalleHistorial] [int] IDENTITY(1,1) NOT NULL,
	[id_Historial] [int]NOT NULL,
	[id_prestacion] [int],
	[id_elemento] [int],
	[id_cara] [int],
	[descripcion] [varchar](50),
	[importe] [int],
		
 CONSTRAINT [PK_Det_Histo_Med] PRIMARY KEY CLUSTERED 
(
	[id_detalleHistorial] ASC,
	[id_Historial]
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

INSERT [dbo].[Det_Histo_Med] ([id_Historial],[id_prestacion],[id_elemento],[id_cara],
[descripcion],[importe]) VALUES (1, 1, 1, 1 , 'puto', 0)

/****** Object:  Table [dbo].[Usuarios]    Script Date: 08/14/2018 16:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre_usuario] [varchar](50) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[id_perfil] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Usuarios] ([nombre_usuario], [password], [email], [id_perfil]) VALUES (N'ADMIN', N'1234', N'admin@gmail.com', 1)
INSERT [dbo].[Usuarios] ([nombre_usuario], [password], [email], [id_perfil]) VALUES (N'josesito', N'hola', N'hola@gmail.com', 2)
/****** Object:  Table [dbo].[Bugs]    Script Date: 08/14/2018 16:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Elementos](
	[id_elemento] [int] IDENTITY(1,1) NOT NULL,
	[cod_elemento] [varchar](10) NOT NULL,
	[nombre] [varchar](50),
 CONSTRAINT [Elementos] PRIMARY KEY CLUSTERED 
(
	[id_elemento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Elementos] ([id_elemento],[cod_elemento],[nombre]) VALUES (1,'1A','')
/****** Object:  Table [dbo].[Caras]   Script Date: 08/14/2018 16:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caras](
	[id_cara] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Caras] PRIMARY KEY CLUSTERED 
(
	[id_cara] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Caras] ([nombre]) VALUES ('lateral')
/****** Object:  Table [dbo].[Historiales_Bug]    Script Date: 08/14/2018 16:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestaciones](
	[id_prestacion] [int] NOT NULL,
	[cod_prestacion] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Prestaciones] PRIMARY KEY CLUSTERED 
(
	[id_prestacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Prestaciones] ([id_prestacion],[cod_prestacion],[nombre],[descripcion]) 
VALUES (1,1,'arreglo','')

/****** Object:  ForeignKey [FK_Bugs_Criticidades]    Script Date: 08/14/2018 16:21:06 ******/
ALTER TABLE [dbo].[Odontologos]  WITH CHECK ADD  CONSTRAINT [FK_Odontologos] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Odontologos] CHECK CONSTRAINT [FK_Odontologos]
GO
/****** Object:  ForeignKey [FK_Bugs_Prioridades]    Script Date: 08/14/2018 16:21:06 ******/
ALTER TABLE [dbo].[Odontologos]  WITH CHECK ADD  CONSTRAINT [FK_odontologos_doc] FOREIGN KEY([tipo_Documento])
REFERENCES [dbo].[Tipo_Documento] ([cod_tipo])
GO
ALTER TABLE [dbo].[Odontologos] CHECK CONSTRAINT [FK_odontologos_doc]
GO
/****** Object:  ForeignKey [FK_Bugs_Productos]    Script Date: 08/14/2018 16:21:06 ******/
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_pacientes_doc] FOREIGN KEY([tipo_documento])
REFERENCES [dbo].[Tipo_Documento] ([cod_tipo])
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [FK_pacientes_doc]
GO
/****** Object:  ForeignKey [FK_Historales_Bug_Bugs]    Script Date: 08/14/2018 16:21:06 ******/
ALTER TABLE [dbo].[Historial_Med]  WITH CHECK ADD  CONSTRAINT [FK_Historal_paciente] FOREIGN KEY([doc_paciente])
REFERENCES [dbo].[Pacientes] ([nro_documento])
GO
ALTER TABLE [dbo].[Historial_Med] CHECK CONSTRAINT [FK_Historal_paciente]
GO
/****** Object:  ForeignKey [FK_Historales_Bug_Estados]    Script Date: 08/14/2018 16:21:06 ******/
ALTER TABLE [dbo].[Historial_Med]  WITH CHECK ADD  CONSTRAINT [FK_Historal_matricula] FOREIGN KEY([nro_matricula])
REFERENCES [dbo].[Odontologos] ([nro_matricula])
GO
ALTER TABLE [dbo].[Historial_Med] CHECK CONSTRAINT [FK_Historal_matricula]
GO
/****** Object:  ForeignKey [FK_Historales_Bug_Users]    Script Date: 08/14/2018 16:21:06 ******/
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_perfil] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[Perfiles] ([id_perfil])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_usuarios_perfil]
GO
--/****** Object:  ForeignKey [FK_Historales_Bug_Users1]    Script Date: 08/14/2018 16:21:06 ******/
--ALTER TABLE [dbo].[Historiales_Bug]  WITH CHECK ADD  CONSTRAINT [FK_Historales_Bug_Users1] FOREIGN KEY([asignado_a])
--REFERENCES [dbo].[Users] ([id_usuario])
--GO
--ALTER TABLE [dbo].[Historiales_Bug] CHECK CONSTRAINT [FK_Historales_Bug_Users1]
--GO
--/****** Object:  ForeignKey [FK_Permisos_Formularios]    Script Date: 08/14/2018 16:21:06 ******/
--ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Formularios] FOREIGN KEY([id_formulario])
--REFERENCES [dbo].[Formularios] ([id_formulario])
--GO
--ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Formularios]
--GO
--/****** Object:  ForeignKey [FK_Permisos_Perfiles]    Script Date: 08/14/2018 16:21:06 ******/
--ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Perfiles] FOREIGN KEY([id_perfil])
--REFERENCES [dbo].[Perfiles] ([id_perfil])
--GO
--ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Perfiles]
--GO
--/****** Object:  ForeignKey [FK_Users_Perfiles]    Script Date: 08/14/2018 16:21:06 ******/
--ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Perfiles] FOREIGN KEY([id_perfil])
--REFERENCES [dbo].[Perfiles] ([id_perfil])
--GO
--ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Perfiles]
--GO
