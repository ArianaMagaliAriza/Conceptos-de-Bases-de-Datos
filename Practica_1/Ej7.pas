{Realizar un programa con opciones para:
a. Crear un archivo de registros no ordenados con la información correspondiente a los alumnos de la facultad de 
ingeniería y cargarlo con datos obtenidos a partir de un archivo de texto denominado “alumnos.txt”.
Los registros deben contener DNI, legajo, nombre y apellido, dirección, año que cursa y fecha de nacimiento (longInt).
b. Listar en pantalla toda la información de los alumnos cuyos nombres comiencen con un carácter proporcionado por
 el usuario.
c. Listar en un archivo de texto denominado “alumnosAEgresar.txt” todos los registros del archivo de alumnos
 que cursen 5º año.
d. Añadir uno o más alumnos al final del archivo con sus datos obtenidos por teclado.
e. Modificar el año que cursa un alumno dado. Las búsquedas son por legajo del alumno.}

program p1e7;
type
    text=string[25];
    alumno=record
        dni:integer;
        legajo:integer;
        nombre:texto;
        apellido:texto;
        dire:texto;
        anio:integer;
        fecha:longInt;
        end;
var
BEGIN

END.