program uddsusduhus;

const
  
  dimf = 300; 

type 
  
  oficina = record
    cod: integer;
    dni: integer;
    expensa: real;
  end;
  
  vector = array [1..dimf] of oficina;
 
 procedure leerOficina (var o: oficina);
 begin
   o.cod:= Random (300);
   if (o.cod > 0) then begin
     o.dni:= Random (500) + 4250;
     o.expensa:= (Random (150) + 1000) / (Random (10) + 6);
   end;
 end;
 
 procedure cargarVector(var v: vector; var diml: integer);
 var o: oficina;
 begin
   diml:= 0;
   leerOficina(o);
   while ((diml < dimf)and(o.cod > 0)) do begin
     diml:= diml + 1;
     v[diml]:= o;
     leerOficina(o);
   end;
 end;
 
 procedure imprimirVector (v: vector; diml: integer);
 var i: integer;
 begin
   for i:= 1 to diml do begin 
     writeln('Oficina ' , i , ' codigo ' , v[i].cod, ' DNI del propietario ' , v[i].dni , ' valor de la expensa ' , v[i].expensa:2:2);
   end;
 end;
 
 procedure seleccion (var v: vector; diml:integer);
 var i, j, pos: integer; item: oficina;
 begin
   for i:= 1 to (diml - 1) do begin
     pos:= i;
     for j:= (i+1) to diml do begin
       if (v[j].cod < v[pos].cod ) then pos:= j;
      end;
     item:= v[pos];
     v[pos]:= v[i]; 
     v[i]:= item;     
  end;
 end; 
 
 
 function busquedaDicotomica(v: vector; ini: integer; fin: integer; cod: integer): integer;
 var medio: integer;
 begin
   medio:= (ini + fin) div 2;
   if (ini >= fin) then busquedaDicotomica:= 0
   else if (v[medio].cod = cod) then busquedaDicotomica:= medio
        else if (v[medio].cod < cod) then busquedaDicotomica:= busquedaDicotomica(v,medio+1, fin,cod)
             else busquedaDicotomica:= busquedaDicotomica(v,ini, fin - 1,cod)
 
 end;
 
 function recursion (v: vector; diml : integer): real;
 begin
   if (diml = 0) then recursion:= 0
   else recursion:= recursion(v, diml-1) + v[diml].expensa;
 end;
 
 
var
 v: vector; diml, ini, fin, cod, pos: integer; 
begin
  Randomize;
  writeln('-------------------- Inciso A ------------------');
  cargarVector(v,diml);
  imprimirVector(v,diml);
  writeln('-------------------- Inciso B ------------------');
  seleccion(v,diml);
  imprimirVector(v,diml);
  writeln('-------------------- Inciso C ------------------');
  ini:= 1;
  fin:= diml;
  writeln('Ingrese codigo a buscar');
  readln(cod);
  pos:= busquedaDicotomica(v,ini,fin,cod);
  if (pos > 0) then writeln ('La oficina de codigo ' , cod, ' se encuentra en la posicion ' , pos)
  else writeln('No se encontro la oficina con codigo ' , cod);
  writeln('-------------------- Inciso D ------------------');
  writeln('El monto total de expensas es ',recursion(v,diml):2:2);
end.

