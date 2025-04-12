{El área de recursos humanos de un ministerio administra el personal del mismo
distribuido en 10 direcciones generales.
Entre otras funciones, recibe periódicamente un archivo detalle de cada una de las
direcciones conteniendo información de las licencias solicitadas por el personal.
Cada archivo detalle contiene información que indica: código de empleado, la fecha y
la cantidad de días de licencia solicitadas. El archivo maestro tiene información de
cada empleado: código de empleado, nombre y apellido, fecha de nacimiento,
dirección, cantidad de hijos, teléfono, cantidad de días que le corresponden de
vacaciones en ese periodo. Tanto el maestro como los detalles están ordenados por
código de empleado. Escriba el programa principal con la declaración de tipos
necesaria y realice un proceso que reciba los detalles y actualice el archivo maestro
con la información proveniente de los archivos detalles. Se debe actualizar la cantidad
de días que le restan de vacaciones. Si el empleado tiene menos días de los que
solicita deberá informarse en un archivo de texto indicando: código de empleado,
nombre y apellido, cantidad de días que tiene y cantidad de días que solicita.
}

program p2e1;
uses crt;
const
	valor_alto=9999;
type
	texto=string[25];
	lic=record
		cod:integer;
		fecha:texto;
		cantDias:integer;
		end;
	empleado=record
		codE:integer;
		nomApe:texto;
		nacimiento:texto;
		dire:texto;
		cantHijos:integer;
		tel:integer;
		diasVacas:integer;
		end;
	detalle=file of lic;
	maestro=file of empleado;
	detalles= array[1..10] of detalle;
	regDetalles= array[1..10] of lic;
	
		
procedure leer(var arch:detalle; var dato:lic);
begin
	if(not(eof(arch)))then
		read(arch,dato)
	else
		dato.cod:=valor_alto;
end;

procedure minimo(var ds:detalles; var min:lic; var regs:regDetalles);
var
	i,pos:integer;
begin
	min.cod:=valor_alto;
	for i:= 1 to 10 do begin
		if(regs[i].cod<min.cod)then begin
			min:=regs[i];
			pos:=i;
		end;
	end;
	leer(ds[pos],regs[pos]);		
end;

var
	m:maestro;
	ds:detalles;
	regDs:regDetalles;
	regD:lic;
	regM:empleado;
	i,codActual,totalDias:integer;
	escraches:text;
	nombre:texto;
	
BEGIN
	assign(m,'maestro.dat');
	reset(m);
	for i:= 1 to 10 do begin
		str(i, nombre);
		assign(ds[i],'detalle'+nombre+'.dat');
		reset(ds[i]);
		leer(ds[i],regDs[i]);
	end;
	
	assign(escraches,'escrachados.txt');//Creo archivo de texto para informar quienes son los picaros
	rewrite(escraches);
	
	minimo(ds,regD,regDs);//Sirve para procesar simultaneamente a varios archivos detalles ordenados 
	while (regD.cod <> valor_alto) do
	begin
		codActual := regD.cod;
		totalDias := 0;
		while (regD.cod = codActual) do //Suma todos los días de licencia del mismo empleado
		begin
			totalDias := totalDias + regD.cantDias;
			minimo(ds, regD, regDs);
		end;
		while(not(eof(m)))do begin
			read(m,regM);
			if(regM.codE = codActual)then 
			begin
				if(regM.diasVacas < totalDias)then begin
					writeln(escraches,regM.codE, ' ', regM.nomApe, ' Tenía: ', regM.diasVacas, ' Solicitó: ', totalDias);//escracheee
				end
				else
				begin
					regM.diasVacas := regM.diasVacas - totalDias;//Actualizo archivo maestro
					seek(m,filepos(m)-1);
					write(m,regM);
				end;
			end;
			break;
		end;
	end;
	close(m);
	for i:=1 to 10 do 
		close(ds[i]);
	close(escraches);
END.

