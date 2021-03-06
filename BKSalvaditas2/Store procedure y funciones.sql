USE Salvaditas

--Buscar por c?dula
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
	[Mi?rcoles] [int] NULL,
	[Jueves] [int] NULL,
	[Viernes] [int] NULL,
	[S?bado] [int] NULL,
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
	[Mi?rcoles] [int] NULL,
	[Jueves] [int] NULL,
	[Viernes] [int] NULL,
	[S?bado] [int] NULL,
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


--Se hace el ingreso de la visita
GO
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

--As? se realiza la consulta de la funci?n
Select * from fs_ConsultarCedula('115670466')
--Select * from [dbo].[fs_ConsultarFuncionario]('Desarrollo')
--SELECT idDepartamento FROM fs_ConsultarFuncionarioID(5)


--Se busca al colaborador por nombre, apellidos ? por departamento
GO
CREATE PROCEDURE sp_BuscarEmpleado
@Variable varchar(50)
AS
SELECT F.id,F.idDepartamento,P.Nombre,P.Apellido1,P.Apellido2 FROM Funcionario F
INNER JOIN Persona P ON F.idCedula=P.id
INNER JOIN Departamento D ON F.idDepartamento=D.id
WHERE P.Nombre LIKE ('%'+@Variable+'%') OR P.Apellido1 LIKE ('%'+@Variable+'%')  OR P.Apellido2 LIKE  ('%'+@Variable+'%')  OR D.Nombre LIKE ('%'+@Variable+'%') 

--exec sp_BuscarEmpleado'Desarro'


--Se piensa para cargar el dropdown
go
CREATE PROCEDURE sp_CargarDepartamento
AS
SELECT *  FROM Departamento

--Se carga los funcionarios por despartameno
go
CREATE PROCEDURE sp_CargarEmpleadosPorDepartamento
@IdDepartamento int
as
select F.id AS IdFunconario, P.Nombre,P.Apellido1,P.Apellido2,F.idDepartamento,D.Nombre AS Departamento FROM Funcionario F
INNER JOIN Persona P ON F.idCedula=P.id
INNER JOIN Departamento D ON F.idDepartamento=D.id
WHERE f.idDepartamento=@IdDepartamento