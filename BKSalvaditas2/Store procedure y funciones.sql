USE Salvaditas

GO
Create function fs_ConsultarCedula
(@Cedula varchar(50))
returns @Tabla table
(
Cedula varchar(50),
Nombre varchar(50),
Apellido1 varchar(50),
Apellido2 varchar(50),
id int
)
as 
begin
	insert @Tabla
	SELECT * FROM Persona Where Cedula=@Cedula 
	Return
end;


--se hace la consulta de uula por id
GO
Create function fs_ConsultarCedulaID
(@id int)
returns @Tabla table
(
Cedula varchar(50),
Nombre varchar(50),
Apellido1 varchar(50),
Apellido2 varchar(50),
id int
)
as 
begin
	insert @Tabla
	SELECT * FROM Persona Where id=@id 
	Return
end;


GO
Create function fs_ConsultarFuncionario
(
@variable varchar(50)
)
returns @Tabla table
(
Nombre varchar(50),
Apellido1 varchar(50),
Apellido2 varchar(50),
DescripcionPuesto varchar(50),

	[id] [int],
	[idCedula] [int] NOT NULL,
	[idPuesto] [int] NOT NULL,
	[idHorario] [int] NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[Lunes] [int] NULL,
	[Martes] [int] NULL,
	[Miércoles] [int] NULL,
	[Jueves] [int] NULL,
	[Viernes] [int] NULL,
	[Sábado] [int] NULL,
	[Domingo] [int] NULL

)
as 
begin
	insert @Tabla

	SELECT P.Nombre,P.Apellido1,P.Apellido2,D.Nombre,F.* FROM Funcionario F
	INNER JOIN Persona P on F.idCedula=P.id
	INNER JOIN Departamento D ON F.idDepartamento=D.id
	WHERE P.Nombre LIKE(@variable) OR P.Apellido1 like (@variable) OR P.Apellido2 LIKE (@variable) OR D.Nombre LIKE(@variable)
	Return
end;


--Se hace buscada de empleado por id

GO
Create function fs_ConsultarFuncionarioID
(
@id int
)
returns @Tabla table
(
Nombre varchar(50),
Apellido1 varchar(50),
Apellido2 varchar(50),
DescripcionPuesto varchar(50),

	[id] [int],
	[idCedula] [int] NOT NULL,
	[idPuesto] [int] NOT NULL,
	[idHorario] [int] NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[Lunes] [int] NULL,
	[Martes] [int] NULL,
	[Miércoles] [int] NULL,
	[Jueves] [int] NULL,
	[Viernes] [int] NULL,
	[Sábado] [int] NULL,
	[Domingo] [int] NULL

)
as 
begin
	insert @Tabla

	SELECT P.Nombre,P.Apellido1,P.Apellido2,D.Nombre,F.* FROM Funcionario F
	INNER JOIN Persona P on F.idCedula=P.id
	INNER JOIN Departamento D ON F.idDepartamento=D.id
	WHERE F.id=@id
	Return
end;

CREATE PROCEDURE sp_IngresoVisita
@Cedula varchar(50),
@IdEmpleado int,
@Motivo varchar(100),
@IdDepartamento INT

As
 Declare @IDCEDULA INT= (Select id from fs_ConsultarCedula(@Cedula))
 --SELECT @IDCEDULA,@IdDepartamento,CURRENT_TIMESTAMP,NULL,CONVERT(DATE,GETDATE()),@Motivo, @IdEmpleado
 
INSERT INTO [dbo].[Visitas]
           ([idCedula]
           ,[idDepartamento]
           ,[horaEntrada]
           ,[horaSalida]
           ,[fecha]
           ,[motivo]
           ,[idFuncionario])
     VALUES
           (@IDCEDULA,@IdDepartamento,CURRENT_TIMESTAMP,NULL,CONVERT(DATE,GETDATE()),@Motivo, @IdEmpleado)

--Así se realiza la consulta de la función
Select * from fs_ConsultarCedula('115670466')
--Select * from [dbo].[fs_ConsultarFuncionario]('Desarrollo')
--SELECT idDepartamento FROM fs_ConsultarFuncionarioID(5)

