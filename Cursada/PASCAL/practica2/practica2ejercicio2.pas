program prac2ej2;

{ 2.- Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario }


type 
 lista = ^nodo;
 nodo = record
 dato: integer;
 sig: lista;
 end;
 
 
 
procedure Agregaradelante (VAR L: lista; num: integer);
var nue: lista;
begin 
   new (nue);
   nue^.dato:= num;
   nue^.sig:= L;
   l:= nue;
end;
 
Procedure CargarLista(var L: lista);
var 
  num: integer;
begin
      num:= random (101) + 100;
      if(num <> 100) then begin
             agregarAdelante(l,num);
             cargarlista (l);
       end;
      
end;     
     


procedure imprimirlista (L:lista);
begin 
 if (l <> nil) then
 begin 
   writeln(l^.dato);
   imprimirlista(l^.sig);
 end;
end;

procedure imprimirlistaInversa (L:lista);
begin 
 if (l <> nil) then
 begin 
   imprimirlistainversa(l^.sig);
   writeln(l^.dato);
    
 end;
end;

function minimo(l: lista): integer;
procedure  ObtenerMinimo (l:lista; var min: integer);

begin
  if (l<>nil) then begin
                          if (l^.dato < min) then min:= l^.dato;
                          obtenerminimo (l^.sig, min);             
                         end;
                         
end;
  
var
min: integer;
begin
 min:= 220;
 obtenerminimo(l, min);
 if (min = 220)then
   minimo:= 0
 else minimo:= min;
end;   
      
function Busqueda (l:lista ; valor:integer):boolean;
var esta: boolean;
begin 
 if(l=nil) then esta:= false
           else if (l^.dato = valor) then esta := true 
                                     else esta:= busqueda (l^.sig, valor);
   
                  
busqueda:= esta;
end;
 
var l:lista; valormin, valorabuscar:integer;
SeEncuentra: boolean;
begin
randomize;
l:= nil;
cargarlista(l);
imprimirlista(l);
writeln('ahora inversa');
imprimirlistaInversa(l);

valormin:= minimo(l);
writeln('el valor minimo de la lista es:' , valormin);
writeln('ingrese valor a buscar');
readln(valorabuscar);
SeEncuentra:= busqueda(l,valorabuscar);
if (SeEncuentra) then writeln ('el valor leido desde teclado se encuentra en la lista')
                else writeln ('el valor leido desde teclado no se encuentra en la lista');
end.
