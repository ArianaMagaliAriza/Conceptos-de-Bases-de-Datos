{1. Realizar un programa que permita crear un archivo conteniendo información de nombres de materiales
 de construcción, el archivo no es ordenado. Efectúe la declaración de tipos correspondiente y luego 
 realice un programa que permita la carga del archivo con datos ingresados por el usuario. 
 El nombre del archivo debe ser proporcionado por el usuario.
 La carga finaliza al procesar el nombre ‘cemento’ que debe incorporarse al archivo.}

 program p1e1;
 type
    texto=string[25];
 var
    material:texto;
    nombre:texto;
    arch:text;
 BEGIN
    writeln('Ingrese el nombre del archivo:');
    readln(nombre);
    assign(arch,nombre);
    rewrite(arch);
    writeln('Ingrese un material:');
    readln(material);
    while(material <> 'cemento')do
    begin
        writeln(arch,material);
        writeln('Ingrese un material:');
        readln(material);
    end;
    if(material = 'cemento') do writeln(arch,material);
    close(arch);
 END.