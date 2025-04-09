program dos;

type 
 oficina = record
 CodIden : integer;
 DniPropietario : integer;
 valorExpensa: integer;

 end;
 vector = array [1..300] of oficina;
 
 Procedure CargarVector (var v: vector);
 var i: integer;
  
 begin
  for i:= 1 to 300 do begin;
   v[i].CodIden:= random (300) + 1;
   v[i].DniPropietario:= random (1500) + 44321000;
   v[i].valorExpensa:= random (2500) + 200;
  end;
 end;
 
 Procedure ImprimirVector (v: vector);
 var i: integer;
 begin
     for i:= 1 to 300 do begin;
         
         writeln(' el codigo de identidad de la ofi    '   ,   i  ,   '   es    '   ,  v[i].CodIden);
         
         writeln(' el DNI del propietario de la ofi    '   ,  i   ,   '   es    '   ,    v[i].DniPropietario);
         
         writeln(' el valor de la expensa de la ofi    '    ,  i   ,  '   es    '   , v[i].valorExpensa);
     
     end;
 
 
 end;
 
 Procedure OrdenarInsercion (var v: vector);
 var 
  i, j: integer; actual: oficina;
begin
  for i:= 2 to 300 do begin
   actual:= v[i];
   j:= i - 1;
   while ( j > 0) and (v[j].codiden > actual.codiden) do begin;
    v[j+1]:= v[j];
    j:= j -1;
   end;
   v[j+1]:= actual; 
 end;
end;
 
 
Procedure OrdenarSeleccion (var v: vector);
var 
i,j, pos: integer;
item: oficina;

begin
for i:= 1 to 300-1 do begin;
 pos:= i;
 for j:= i +1 to 300 do
   if (v[j].codiden < v[pos].codiden) then pos := j;
 item:= v[pos];
 v[pos]:= v[i];
 v[i]:= item;
 end;
end;

 
var
 vec: vector;
 extra1: vector;
 extra2: vector;
begin
  randomize;
  CargarVector (vec);
  ImprimirVector(vec);
  extra1:= vec;
  extra2:= vec;
  OrdenarInsercion(extra1);
  ImprimirVector(extra1);
  OrdenarSeleccion(extra2);
  ImprimirVector(extra2);
  readln;
end.
