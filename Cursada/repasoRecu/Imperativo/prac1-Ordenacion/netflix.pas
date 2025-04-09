program netflix;

type
 generos = 1..8;
 pelicula = record
   cod: integer;
   genero: generos;
   puntaje: real;
 end;
 
 pelicula2 = record
   cod: integer;
   puntaje: real;
 end;
 
 lista =^nodo;
 nodo = record
   dato: pelicula2;
   sig:lista;
 end;
  
 vector = array [generos] of lista;
 vector2 = array [generos] of pelicula2;
 
 procedure inicializar(var v: vector);
 var i: integer;
 begin
   for i:= 1 to 8 do begin
    v[i]:= nil;
   end;
 end;
 
 procedure leerPelicula (var p: pelicula);
 begin
   p.cod:= Random (100) - 1;
   if (p.cod <> -1) then begin
      p.genero:= Random (8) + 1;
      p.puntaje:= Random (10) + 1;
   end;
 end;
 
 procedure asignar(var aux:pelicula2 ; p: pelicula);
 begin
   aux.cod:= p.cod;
   aux.puntaje:= p.puntaje;
 end;
 
 procedure agregarAlFinal (var pri, ult: lista; p: pelicula2);
 var
   nue: lista;
 begin
   new (nue);
   nue^.dato:= p;
   nue^.sig:= nil;
   if (pri = nil) then
     pri:= nue
   else 
     ult^.sig:= nue;
   ult:= nue;
 end;
 
 procedure cargarDatos(var v: vector);
 var
   p: pelicula;
   p2: pelicula2;
   ultimos: vector;
 begin
   inicializar(v);
   leerPelicula(p);
   while(p.cod <> -1) do begin
     asignar (p2,p);
     agregarAlFinal(v[p.genero], ultimos[p.genero], p2);
     leerPelicula(p);
    end;
 
 end;
 
 procedure imprimirPelicula (p: pelicula2);
 begin
   writeln('codigo: ' , p.cod , ' puntaje ', p.puntaje:2:2);
 end;
 
 procedure imprimirVector(v: vector);
 var i: integer;
 begin
   for i:= 1 to 8 do begin;
     writeln('Lista del genero: ' , i);
     while (v[i] <> nil) do begin
       imprimirPelicula(v[i]^.dato);
       v[i]:= v[i]^.sig;
     end;
 end;
 end;
 procedure inicializarVector(var v2: vector2);
	var 
		i : integer;
	begin
		for i := 1 to 8 do begin
			v2[i].cod := 0;
			v2[i].puntaje := 0;
		end;
	end;
 procedure codigoMax(l: lista; var cod: integer; var puntaje: real);
 begin
   while (l<> nil) do begin
     if (l^.dato.puntaje > puntaje) then begin
       puntaje:= l^.dato.puntaje;
       cod:= l^.dato.cod;
     end;
     l:= l^.sig;
   end;
 end;
 
 procedure obtenerMaximos (v: vector; var v2: vector2);
 var i, cod: integer; aux: real;
 begin
   for i:= 1 to 8 do begin;
     aux:= 0;
     codigoMax(v[i], cod, aux);
     v2[i].puntaje:= aux;
     v2[i].cod:= cod;
   end;
 end; 
 
 procedure imprimirVectorMaximos (v2: vector2);
 var i: integer;
 begin
   for i:= 1 to 8 do
       writeln(' el codigo de puntaje max del genero ' , i , ' es ' , v2[i].cod, ' con puntaje de ' , v2[i].puntaje:2:2)
 end;
 
 procedure seleccion(var v: vector2);
 var i, j, pos, diml: integer; item: pelicula2;
 begin
   diml:= 8;
   for i:= 1 to diml - 1 do begin
     pos:= i;
     for j:= i+1 to diml do 
       if (v[j].puntaje < v[pos].puntaje) then
         pos:= j;
     item:= v[pos];
     v[pos]:= v[i];
     v[i]:= item;
   end;
 
 end; 
 
 procedure imprimirVectorPuntajeOrden (v2: vector2);
 begin
   writeln('El codigo de menor puntaje es ' , v2[1].cod);
   writeln('El codigo de mayor puntaje es ' , v2[8].cod);
 end;
var v: vector;
    v2: vector2;
 
begin
  Randomize;
  cargarDatos(v);
  imprimirVector(v);
  obtenerMaximos(v,v2);
  imprimirVectorMaximos(v2);
  seleccion(v2);
  imprimirVectorMaximos(v2);
  imprimirVectorPuntajeOrden(v2);
end.
