program ej2p1;

const 
  dimf = 10;

type
  oficina = record
    cod: integer;
    dni: integer;
    expensa: real;
   end;
   
   vector = array [1..dimf] of oficina;
   
 procedure leerOficina(var o:oficina);
 begin
   o.cod:= Random (301) - 1;
   if (o.cod <> -1) then begin
     o.dni:= Random(2000)+ 30000;
     o.expensa:= Random(300) + 3000;
    end;
 
 end; 
 
 procedure agregaralVector(var v: vector; var diml: integer; o: oficina);
 begin
  if (diml <> dimf) then begin
    diml:= diml + 1;
    v[diml]:= o;
   end;
 end;
 
 procedure procesarDatos (var v: vector; var diml: integer);
 var o: oficina;
 begin
   diml:= 0;
   leerOficina(o);
   while (diml<> dimf) and (o.cod <> -1) do begin
     agregaralVector(v,diml,o);
     leerOficina(o);
   end;
 end;
  
 procedure imprimirInfo (o: oficina);
 begin
   writeln('codigo: ' , o.cod, ' dni: ' , o.dni , ' expensa: ' , o.expensa:2:2);
 end;
 
 procedure imprimirVector(v: vector; diml: integer);
 var i: integer;
 begin
   for i:= 1 to diml do begin
     writeln('Elemento: ' , i);
     imprimirInfo(v[i]);
   end;
 end;
  
 procedure seleccion (var v: vector; diml: integer);
 var i, j, pos: integer;
     item: oficina;
 begin
   for i:= 1 to (diml-1) do begin
     pos:= i;
     for j:= (i+1) to diml do
       if (v[j].cod < v[pos].cod) then
         pos:= j;
     item:= v[pos];
     v[pos]:= v[i];
     v[i]:= item;
   end;
   
 
 end;
 
 procedure insercion (var v: vector; diml: integer);
 var i, j: integer; actual: oficina;
 begin
   for i:= 2 to diml do begin
     actual:= v[i];
     j:= i - 1;
     while (j > 0) and (v[j].dni > actual.dni) do
      begin
        v[j+1]:= v[j];
        j:= j - 1;
      end; 
     v[j+1]:= actual;
 end;
 end;
 
 
var
 v,v2,v3: vector; diml: integer;
begin
  writeln('------------A------------');
  procesarDatos(v,diml);
  imprimirVector(v,diml);
  writeln('------------B------------');
  v2:= v;
  insercion(v2,diml);
  imprimirVector(v2,diml);
  writeln('------------C------------');
  v3:= v;
  seleccion(v3,diml);
  imprimirVector(v3,diml);
  
  

end.
