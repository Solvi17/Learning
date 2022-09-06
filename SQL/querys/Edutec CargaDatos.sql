USE EDUTEC
GO


-- Agragar Datos a la Tabla Tarifa
-- ===============================

Insert Into Tarifa(IdTarifa,PreTarifa,Descripcion) Values('A',200,'Herramientas de Oficina')
Insert Into Tarifa(IdTarifa,PreTarifa,Descripcion) Values('B',250,'SoftWare de Desarrollo - Basico')
Insert Into Tarifa(IdTarifa,PreTarifa,Descripcion) Values('C',300,'SoftWare de Desarrollo - Intermedio/Avanzado')
Insert Into Tarifa(IdTarifa,PreTarifa,Descripcion) Values('D',350,'Sistemas Operativos - Intermedio/Avanzado')
Insert Into Tarifa(IdTarifa,PreTarifa,Descripcion) Values('E',350,'Administradores de Bases de Datos')


-- Agragar Datos a la Tabla Curso
-- ==============================

Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C001','A','Windows 98')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C002','B','MS Visual Basic - Fundamentos')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C003','C','MS Visual Basic - Bases de Datos')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C004','C','MS Visual Basic - Cliente/Servidor')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C005','B','Power Builder - Nivel Basico')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C006','C','Power Builder - Nivel Intermedio')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C007','C','Power Builder - Nivel Avanzado')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C008','C','Power Builder - PFC')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C009','B','MS Visual FoxPro - Interactivo')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C010','C','MS Visual FoxPro - Programaci�n')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C011','C','MS Visual FoxPro - Cliente/Servidor')


-- Agragar Datos a la Tabla Ciclo
-- ==============================

Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2007-01','20070115','20070220')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2007-02','20070220','20070325')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2007-03','20070405','20070510')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2007-04','20070515','20070620')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2007-05','20070621','20070722')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2007-06','20070801','20070830')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2007-07','20070905','20071005')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2007-08','20071006','20071108')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2007-09','20071110','20071212')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2008-01','20080110','20080215')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2008-02','20080218','20080320')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2008-03','20080322','20080425')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2008-04','20080326','20080428')


-- Agragar Datos a la Tabla Profesor
-- =================================

Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P001','Valencia Morales','Pedro Hugo','Magdalena','None','hugovm@terra.com.pe')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P002','Coronel Castillo','Eric Gustavo','Los Olivos','None','gcoronel@uni.edu.pe')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P003','Diaz Vilela','Pedro Pablo','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P004','Matsukawa Maeda','Sergio','Bella Vista','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P005','Bustamante Gutierrez','Cesar Augusto','Lince','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P006','Henostroza Macedo','Guino','Los Olivos','None','guino@telematic.edu.pe')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P007','Flores Manco','Julio Enrrique','Los Olivos','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P008','Bardon Mayta','Julio Cesar','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P009','Allauca Paucar','Juan Jose','Los Olivos','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P010','Serna Jherry','Jose Luis','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P011','Chuco Barrera','Raul','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P012','Alegre Mendoza','Jose','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P013','Quispe Tineo','Cesar','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P014','Ramirez Salvador','Julio','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P015','Chuquin Espinoza','Willian','Lince','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P016','Rosas Ayala','Dario','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P017','Rodriguez Villacorta','Manuel','Lima','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P018','Zegarra Zavaleta','Tereza','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P019','Guzman Azcurra','Manuel','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P020','Zegarra Zavaleta','Daniel','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P021','Cueva Contreras','Martin','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P022','Lostaunau Navarro','Alberto','Lima','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P023','Condor Ortiz','Saul','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P024','Ganoza Zelada','David','Comas','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P025','Fabian Avila','Dionicio','Comas','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P026','Quintana Saenz','Jorge','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P027','Yupanqui Villegas','Juan','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P028','Yupanqui Villegas','Julio','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P029','Alcantara Cerna','Violeta','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P030','Oceda Samaniego','Cesar Miguel','San Miguel','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P031','Becerra Flores','Ursula','San Miguel','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P032','Marcelo Villalobos','Marvin','Lince','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P033','Narvaez Garcia','Victor','Lima','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P034','Reynoso Zarate','Jose','Los Olivos','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P035','Suarez Valenzuela','Misael','Lima','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P036','Carrasco Mu�oz','Joel','','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P037','Salcedo Martinez','Percy','Lima','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P038','Vasquez Valenzuela','Javier','Comas','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P039','Herrera Huanca','Javier','Comas','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P040','Marcelo Villalobos','Ricardo','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P041','Quiroz Villon','Edgar','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P042','Veliz','Fortumato','La Molina','None','None')



-- Agregar Datos a la Tabla Alumno
-- ===============================

Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0001','Donayre Mena','Christian')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0002','Ortiz Rodriguez','Freddy')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0003','Silva Mejia','Ruth Ketty')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0004','Melendez Noriega','Liliana')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0005','Huerta Leon','Silvia')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0006','Carranza Fuentes','Maria Elena')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0007','Prado Castro','Gabriela')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0008','Atuncar Mesias','Juan')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0009','Aguilar Zavala','Patricia Elena')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0010','Rodruigez Trujillo','Rub�n Eduardo')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0011','Canales Ruiz','Gino Leonel')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0012','Ruiz Quispe','Edgar')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0013','PanduroTerrazas','Omar')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0014','Zita Padilla','Peter Wilmer')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0015','Ternero Ubill�s','Luis')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0016','Rivera Garc�a','Ra�l Joel')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0017','Pomar Garc�a','Ana')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0018','Palomares Venegas','Mercedes')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0019','Ruiz Venegaz','Luis Alberto')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0020','Tejada Bernal','Janet')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0021','Sotelo Canales','Juan Carlos')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0022','LLosa Montalvan','Karla')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0023','Galarza Torres','Hugo')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0024','Valverde Jaramillo','Saul')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0025','Cipriano Avila','Roxana')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0026','Rodriguez Quispe','Luis Alberto')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0027','Huerta Leon','Marco Antonio')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0028','Ortiz Fuentes','Ana Mar�a')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0029','Rivera Jaramillo','Martha')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0030','Bustamante Campos','Guino')


-- Agregar Datos a la Tabla Empleado
-- =================================

Insert Into Empleado(IdEmpleado,Password,ApeEmpleado,NomEmpleado,Cargo) 
	Values('psalce','psalce','Salcedo Banderas','Percy','Gerente Ventas')
Insert Into Empleado(IdEmpleado,Password,ApeEmpleado,NomEmpleado,Cargo) 
	Values('lcastr','lcastr','Castro Escobar','Lidia Rosa','Secretaria General')
Insert Into Empleado(IdEmpleado,Password,ApeEmpleado,NomEmpleado,Cargo) 
	Values('jmanrr','jmanrr','Manrique Diaz','Jos� Luis','Coordinador Academico')
Insert Into Empleado(IdEmpleado,Password,ApeEmpleado,NomEmpleado,Cargo) 
	Values('jramir','jramir','Ramirez Salvador','Julio Cesar','Administrador General')
Insert Into Empleado(IdEmpleado,Password,ApeEmpleado,NomEmpleado,Cargo) 
	Values('acampo','acampo','Campos Huapaya','Alberto','Jefe de Seguridad')
Insert Into Empleado(IdEmpleado,Password,ApeEmpleado,NomEmpleado,Cargo) 
	Values('beteta','beteta','Beteta Bustamante','Cesar','Gerente General')


-- Agregar Datos a la Tabla Parametro
-- ==================================

Insert Into Parametro(Campo,Contador) Values('Anno',2008)
Insert Into Parametro(Campo,Contador) Values('NroCiclo',5)
Insert Into Parametro(Campo,Contador) Values('IdCurso',12)
Insert Into Parametro(Campo,Contador) Values('IdProfesor',43)
Insert Into Parametro(Campo,Contador) Values('IdAlumno',31)



-- Agregar Datos a la Tabla CursoProgramado
-- ========================================

-- Ciclo: 2007-01

Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-01','C001','P003','Lu y Mi 19-22 Horas',10,10,1,200)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-01','C002','P002','Mi y Vi 19-22 Horas',10,10,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-01','C003','P005','Ma y Ju 19-22 Horas',10,10,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-01','C004','P001','Ju y Sa 19-22 Horas',10,10,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-01','C005','P001','Lu y Mi 19-22 Horas',10,10,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-01','C006','P002','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-01','C007','P004','Mi y Vi 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-01','C008','P004','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-01','C009','P002','Lu y Mi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-01','C010','P002','Ju y Sa 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-01','C011','P002','Lu y Mi 19-22 Horas',20,0,1,300)


-- 2007-02
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-02','C001','P003','Lu y Mi 19-22 Horas',10,10,1,200)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-02','C002','P002','Mi y Vi 19-22 Horas',10,10,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-02','C003','P005','Ma y Ju 19-22 Horas',10,10,0,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-02','C004','P001','Ju y Sa 19-22 Horas',10,10,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-02','C005','P001','Lu y Mi 19-22 Horas',10,10,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-02','C006','P002','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-02','C007','P004','Mi y Vi 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-02','C008','P004','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-02','C009','P002','Lu y Mi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-02','C010','P002','Ju y Sa 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-02','C011','P002','Lu y Mi 19-22 Horas',20,0,1,300)



-- 2007-03
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-03','C001','P003','Lu y Mi 19-22 Horas',20,0,1,200)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-03','C002','P002','Mi y Vi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-03','C003','P005','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-03','C004','P001','Ju y Sa 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-03','C005','P001','Lu y Mi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-03','C006','P002','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-03','C007','P004','Mi y Vi 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-03','C008','P004','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-03','C009','P002','Lu y Mi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-03','C010','P002','Ju y Sa 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-03','C011','P002','Lu y Mi 19-22 Horas',20,0,1,300)


-- 2007-04
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-04','C001','P003','Lu y Mi 19-22 Horas',20,0,1,200)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-04','C002','P002','Mi y Vi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-04','C003','P005','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-04','C004','P001','Ju y Sa 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-04','C005','P001','Lu y Mi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-04','C006','P002','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-04','C007','P004','Mi y Vi 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-04','C008','P004','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-04','C009','P002','Lu y Mi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-04','C010','P002','Ju y Sa 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2007-04','C011','P002','Lu y Mi 19-22 Horas',20,0,1,300)




-- Agregar Datos a la Tabla Matricula
-- ==================================


-- Ciclo: 2007-01     Curso: C001

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio ) 
	Values( 1,'A0001','20070103',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0002','20070103',10,14,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0003','20070103',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0004','20070103',09,11,10 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0005','20070103',15,19,17 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0006','20070104',11,13,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio ) 
	Values( 1,'A0007','20070104',07,09,08 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0008','20070104',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0009','20070104',17,19,18 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0010','20070104',12,16,14 )


-- Ciclo: 2007-01     Curso: C002

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0011','20070103',14,16,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0012','20070103',12,14,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0013','20070103',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0014','20070103',09,11,10 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0015','20070103',08,10,09 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0016','20070104',12,16,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0017','20070104',11,13,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0018','20070104',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0019','20070104',14,16,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0020','20070104',13,15,14 )


-- Ciclo: 2007-01     Curso: C003

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0021','20070103',09,11,10 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0022','20070103',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0023','20070103',11,13,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0024','20070103',10,16,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0025','20070103',05,17,11 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0026','20070104',09,15,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0027','20070104',14,16,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0028','20070104',13,17,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0029','20070104',15,19,17 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0030','20070104',18,14,16 )


-- Ciclo: 2007-01     Curso: C004

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0001','20070103',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0003','20070103',10,16,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0005','20070103',16,12,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0007','20070103',14,12,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0009','20070103',18,12,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0011','20070104',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0013','20070104',12,16,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0015','20070104',10,16,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0017','20070104',11,15,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0019','20070104',09,15,12 )


-- Ciclo: 2007-01     Curso: C005

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0002','20070103',12,14,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0004','20070103',15,13,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0006','20070103',12,16,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0008','20070103',08,14,11 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0010','20070103',11,15,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0012','20070104',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0014','20070104',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0016','20070104',17,19,18 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0018','20070104',13,11,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0020','20070104',12,16,14 )


-- Ciclo: 2007-02     Curso: C001

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio ) 
	Values( 12,'A0001','20070103',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0002','20070103',10,14,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0003','20070103',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0004','20070103',09,11,10 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0005','20070103',15,19,17 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0006','20070104',11,13,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio ) 
	Values( 12,'A0007','20070104',07,09,08 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0008','20070104',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0009','20070104',17,19,18 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0010','20070104',12,16,14 )


-- Ciclo: 2007-02     Curso: C002

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0011','20070103',14,16,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0012','20070103',12,14,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0013','20070103',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0014','20070103',09,11,10 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0015','20070103',08,10,09 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0016','20070104',12,16,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0017','20070104',11,13,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0018','20070104',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0019','20070104',14,16,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0020','20070104',13,15,14 )


-- Ciclo: 2007-02     Curso: C003

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0021','20070103',09,11,10 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0022','20070103',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0023','20070103',11,13,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0024','20070103',10,16,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0025','20070103',05,17,11 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0026','20070104',09,15,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0027','20070104',14,16,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0028','20070104',13,17,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0029','20070104',15,19,17 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0030','20070104',18,14,16 )


-- Ciclo: 2007-02     Curso: C004

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0001','20070103',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0003','20070103',10,16,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0005','20070103',16,12,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0007','20070103',14,12,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0009','20070103',18,12,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0011','20070104',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0013','20070104',12,16,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0015','20070104',10,16,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0017','20070104',11,15,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0019','20070104',09,15,12 )


-- Ciclo: 2007-02     Curso: C005

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0002','20070103',12,14,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0004','20070103',15,13,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0006','20070103',12,16,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0008','20070103',08,14,11 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0010','20070103',11,15,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0012','20070104',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0014','20070104',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0016','20070104',17,19,18 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0018','20070104',13,11,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0020','20070104',12,16,14 )

