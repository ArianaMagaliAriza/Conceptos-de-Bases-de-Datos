{Se desea actualizar un archivo maestro a partir de 500 archivos detalle de votos de localidades.
Cada archivo detalle contiene código de provincia, código de localidad, cantidad de votos válidos, cantidad de votos en blanco y cantidad de votos anulados. El archivo se encuentra ordenado por código de provincia y código de localidad.
El archivo maestro tiene código de provincia, nombre de provincia, cantidad total de votos válidos, cantidad total de votos en blanco y cantidad total de votos anulados. El archivo se encuentra ordenado por código de provincia.
Realizar la actualización de archivo maestro con la información de los archivos detalles. Además al final se debe informar en un archivo de texto denominado cantidad_votos_04_07_2023.txt la cantidad de archivos procesados, la cantidad total de votos válidos, cantidad total de votos en blanco y cantidad total de votos anulados de los archivos detalles con el siguiente formato:
Cantidad de archivos procesados : ___
Cantidad Total de votos: __
Cantidad de votos válidos: __
Cantidad de votos anulados: __
Cantidad de votos en blanco: __
Se debe realizar el programa completo con sus declaraciones de tipo.
}


program adc2;
const
	valor_alto=9999;
	dim=500;
type
	texto=string[30];
	rdetalle=record
		cod_prov:integer;
		cod_loc:integer;
		votV:integer;
		votB:integer;
		votA:integer;
		end;
		
	rmaestro=record
		cod_prov:integer;
		votTotalV:integer;
		votTotalB:integer;
		votTotalA:integer;
		nomProv:texto;
		end;
	maestro = file of rmaestro;
	detalle = file of rdetalle;
	detalles = array [1..dim] of detalle;
	rdetalles = array [1..dim] of rdetalle;

var
	
BEGIN
	
	
END.

