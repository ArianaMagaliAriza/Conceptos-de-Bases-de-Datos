{2. Desarrollar un programa que permita la apertura de un archivo de números enteros no ordenados.
 La información del archivo corresponde a la cantidad de votantes de cada ciudad de la Provincia 
 de Buenos Aires en una elección presidencial. Recorriendo el archivo una única vez, informe por pantalla
 la cantidad mínima y máxima de votantes. Además durante el recorrido, el programa deberá listar el contenido
 del archivo en pantalla.
 El nombre del archivo a procesar debe ser proporcionado por el usuario.}

 program p1e2;
 type
    texto=string[25];
    ciudad=record
        nom:texto;
        cant:integer;
    end;
    archivo=file of ciudad;
 var
    nombre:texto;
    arch:archivo;
    ciu:ciudad;
    max, min:integer;
 BEGIN
    max:=-1;
    min:=9999;
    writeln('Ingrese el nombre del archivo:');
    readln(nombre);
    assign(arch,nombre);
    reset(arch);
    while(not eof(arch))do begin
        read(arch,ciu);
        writeln(ciu.nom);
        writeln(ciu.cant);
        writeln("");
        if(ciu.cant<min)then 
            min:=ciu.cant
        else if(ciu.cant>max)then
            max:=ciu.cant;
    end;
    writeln('max: ',max,' min: ',min);
    close(arch);
 END.