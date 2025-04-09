program ej3;
const
  dimf = 20;
type
  vector = array [1..20] of integer;
  
 procedure cargarVector(var v: vector; var diml: integer);
 var n: integer;
 begin
   if (diml < dimf) then begin
     diml:= diml + 1;
     n:= Random (1249) + 301;
     v[diml]:= n;
     cargarVector(v,diml);
   end;
 end;
 
 procedure imprimirVector(v: vector; diml:integer);
 begin
   if (diml >0) then begin
       imprimirVector(v, diml - 1);
       writeln('Elemento ' , diml , ': ' ,v[diml]);
   end;
 end;
   
 procedure seleccion (var v: vector; diml : integer);
 var i, j, pos, item: integer;
 begin
   for i:= 1 to diml - 1 do begin;
     pos:= i;
     for j:= i + 1 to diml do 
      if (v[j] < v[pos]) then
          pos:=j;
     item:= v[pos];
     v[pos]:=v[i];
     v[i]:= item;
 end;
 end;
  
  procedure busquedaDicotomica (v: vector; ini,fin,dato: integer; var pos: integer);
  var medio: integer;
  begin
     if (ini <= fin) then begin
       medio:= (ini + fin) div 2;
       if (v[medio] = dato) then pos:= medio
       else 
         if (dato < v[medio]) then
           busquedaDicotomica(v, ini, medio - 1, dato,pos)
         else
           if (dato > v[medio]) then
             busquedaDicotomica(v,medio + 1, fin, dato,pos);
   end;
  end;
var
  v: vector; diml, ini, fin, dato, pos: integer;
begin
   Randomize;
   diml:= 0;
   cargarVector(v,diml);
   imprimirVector(v,diml);
   writeln('----------Ahora Ordenado -------');
   seleccion(v,diml);
   imprimirVector(v,diml);
   writeln('-------------Busqueda Dicotomica------');
   pos:= -1;
   ini:= 1;
   fin:= dimf;
   writeln('Inserte numero a buscar ' );
   readln(dato);
   busquedaDicotomica(v,ini,fin,dato,pos);
   if (pos <> -1) then
     writeln('Se encontro el numero ' , dato , ' en la posicion ' , pos)
   else
     writeln('El numero ' , dato , ' no se encuentra en el vector' );
end.
