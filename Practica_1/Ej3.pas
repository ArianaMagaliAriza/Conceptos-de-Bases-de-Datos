{3. Realizar un programa que permita crear un archivo de texto. El archivo se debe cargar con
  la información ingresada mediante teclado. La información a cargar representa los tipos de dinosaurios
  que habitaron en Sudamérica.
  La carga finaliza al procesar el nombre ‘zzz’ que no debe incorporarse al archivo.}

program p1e3;
const
    valor_alto='zzz';
type
    cadena=string[25];
var
  arch:text;
  cad:cadena;
BEGIN
  assign(arch,'dinos.txt');
  rewrite(arch);
  writeln('Ingrese un tipo de dinosaurio que habito en sudamerica:');
  readln(cad);
  while(cad <> valor_alto)do begin
    writeln(arch,cad);
    writeln('Ingrese un tipo de dinosaurio que habito en sudamerica:');
    readln(cad);
  end;
  close(arch);
END.