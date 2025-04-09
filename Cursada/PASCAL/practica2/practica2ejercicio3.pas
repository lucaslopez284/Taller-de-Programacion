 program practica2ejercicio3;
 const
 dimF = 20;
 
{Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).

b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)

c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.
}
 
type 
 vector = array [1..20] of integer;
 indice = 1..20;
 
 
procedure cargarvector(var v: vector; var dimL: integer);
var  valor: integer;
begin
valor:= random (1249) + 301;
if (dimL < dimF) then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVector (v, dimL);
         end;
 
 end;
 
procedure imprimirvector (v:vector; dimL: integer);
begin
if (dimL > 0) then begin
     imprimirvector(v, dimL - 1);
     writeln(v[dimL]);
end;
end;
  
procedure ordenarvector (var v: vector; diml : integer);
var
  i, j, pos, item: integer;

begin
 for i:= 1 to diml - 1 do begin
     pos:= i;
     for j:= i + 1 to diml do
       if v[j] < v[pos] then pos:= J;
       
     item:= v[pos];
     v[pos]:= v[i];
     v[i]:= item;
 end;
     
 
 
end;
  

Procedure busquedaDicotomica (v: vector; ini, fin, dato:integer; var pos: integer);
var medio: integer; 
begin
 
 if (ini<=fin)then begin
                        medio:= (ini + fin) div 2;
                        if (v[medio] = dato) then pos:= medio
                                             else if (dato < v[medio]) then busquedaDicotomica (v,ini, medio - 1, dato, pos)
                                                                       else busquedaDicotomica (v, medio + 1, fin, dato, pos);

end;
end;


var
 v: vector; valor, pos, diml, ini, fin: integer;


begin 
diml:= 0; ini:= 1; pos:= -1;
randomize;
cargarvector(v, diml);
imprimirvector(v,diml);
ordenarvector(v,diml);
writeln('ahora ordenado');
imprimirvector(v,diml);
writeln('ingrese un valor a buscar en el vector mediante la busqueda dicotomica');
readln(valor);
fin:= dimL;
busquedaDicotomica(v,ini, fin, valor, pos);
if (pos = -1) then writeln('el valor: ', valor, ' no se encuentra en el vector')
              else writeln('el valor: ', valor, ' se encuentra en la posicion ' , pos);
               
readln
end.
