{Se cuenta con un archivo que almacena información sobre especies de plantas originarias de Europa,
de cada especie se almacena: código especie, nombre vulgar, nombre científico, altura promedio, descripción y zona geográfica.
El archivo no está ordenado por ningún criterio. Realice un programa que elimine especies de plantas trepadoras.
Para ello se recibe por teclado los códigos de especies a eliminar.

a. Implemente una alternativa para borrar especies, que inicialmente marque los registros a borrar y posteriormente compacte el archivo,
	creando un nuevo archivo sin los registros eliminados.
b. Implemente otra alternativa donde para quitar los registros se deberá copiar el último registro del archivo en la posición
	del registro a borrar y luego eliminar del archivo el último registro de forma tal de evitar registros duplicados.
Nota: Las bajas deben finalizar al recibir el código 100000 
}

program p3e1;
uses crt;
const
	valor_alto=100000;
type
	texto=string[30];
	especie=record
			cod:integer;
			nomVulgar:texto;
			nomCientifico:texto;
			alturaProm:double;
			descripcion:texto;
			zonaGeo:texto;
			end;
	archivo=file of especie;
var
	arch,arch2:archivo;
	r:especie;
	c,posBorrar:integer;
	nomb:texto;
BEGIN
	assign(arch,'archivo.dat');
	assign(arch,'archivo_nuevo.dat');
	reset(arch);
	reset(arch2);
	readln(c);
	while((not eof(arch) and (c != valor_alto))do begin
		read(arch,r);
		while((not eof(arch)) and (r.cod != c))do
			read(arch,r);
		if(r.cod = c)then begin
			posBorrar=filepos(arch)-1;
			seek(arch,filesize(arch)-1);
			read(arch,r);
			
			write(arch2,r);
		end;
	end;
	close(arch);
	close(arch2);
END.

