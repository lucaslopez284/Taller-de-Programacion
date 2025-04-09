program prac5ej3;

{Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:

a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. El ingreso finaliza con el código de producto igual a 0.

b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.

c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.

d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados}
const
 dimF = 10;
type
 rubros = 1..10;

producto = record
 codigo: integer;
 rubro: rubros;
 stock: integer;
 precio : real;
end;

proredu = record
 codigo: integer;
 stock: integer;
 precio : real;
end;

arbol = ^nodoArbol;
nodoArbol = record
  dato: proredu;
  hd: arbol;
  hi: arbol;
end;

info = record
 rubro: rubros;
 Productos:arbol;
end;

Vector = array [1..10] of info;

Procedure InicializarVector (var v: vector);
var i: integer;
begin
   for i:= 1 to dimF do begin
      v[i].rubro:= i;
      v[i].productos:= nil;
    end;
end;

procedure leerproducto (var p: producto);
begin
   p.codigo:= random (50) - 1;
   if (p.codigo <> -1) then begin
     p.rubro:= random (10) + 1;
     p.stock:= random (15) + 1;
     p.precio:= random (100) * 100;
   end;
end;

procedure armarArbol (var a:arbol; p: producto);

begin
   if (a = nil) then begin
        new (a);
        a^.dato.codigo:= p.codigo;
        a^.dato.stock:= p.stock;
        a^.dato.precio:= p.precio;
        a^.hd:= nil;
        a^.hi:= nil;
   end
   else if (p.codigo <= a^.dato.codigo) then armarArbol(a^.hi,p)
                                        else armarArbol(a^.hd,p);
end;

procedure CargarDatos (var v: vector);
var p: producto;
begin
   leerproducto(p);
   while (p.codigo <> -1) do begin
        armarArbol(v[p.rubro].productos,p);
        leerproducto(p);
   end;
end;



procedure imprimirarbol (a: arbol; rubro: rubros);
begin
   if (a<>nil) then begin
      imprimirarbol(a^.hi,rubro);
      Writeln(' Rubro: ' , rubro , ' codigo: ' , a^.dato.codigo , ' stock: ' , a^.dato.stock , ' precio: ' , a^.dato.precio:2:2);
      imprimirarbol(a^.hd,rubro);
   end;

end;

Procedure InformarDatos(v:vector);
var i: integer;
begin
   for i:= 1 to 10 do begin
          if (v[i].productos <> nil) then imprimirarbol(v[i].productos, i)
                                     else writeln(' No se encontraron elementos del rubro: ' , i);
        end;
end;

function encontre(a: arbol ; cod: integer): boolean;
begin
   if (a= nil) then encontre:= false
               else if (cod = a^.dato.codigo) then encontre:= true
                                              else if (cod < a^.dato.codigo) then encontre:= encontre(a^.hi, cod)
                                                                             else encontre:= encontre(a^.hd,cod);
            

end;

procedure BuscarMaximo(a:arbol; var codmax: integer; var stockmax: integer);
begin
   if(a<>nil) then begin
           codmax:= a^.dato.codigo;
           stockmax:= a^.dato.stock;
           BuscarMaximo(a^.hd, codmax, stockmax);
   end;
end;

 
Function Contar(a:arbol; cod1: integer; cod2: integer): integer;
begin
  if (a= nil) then Contar:= 0
              else if ( (a^.dato.codigo > cod1) and (a^.dato.codigo < cod2)) then
                   Contar:= 1 + Contar(a^.hi,cod1,cod2) + Contar(a^.hd,cod1,cod2)
                   else if (cod1 >= a^.dato.codigo) then Contar:= Contar(a^.hd,cod1,cod2)
                                                    else Contar:= Contar(a^.hi,cod1,cod2);

end;
 
var v: vector; rubroteclado: rubros; codteclado, i, codmax, cod1, cod2, cant,stockmax: integer;
begin
 randomize;
 writeln('-------------------inciso a----------------------');
 inicializarVector(v);
 cargardatos(v);
 informardatos(v);
 writeln('-------------------inciso b----------------------');
 writeln(' inserte un rubro (del 1 al 10)');
 readln(rubroteclado);
 writeln(' inserte un codigo ');
 readln(codteclado);
 if (encontre(v[rubroteclado].productos, codteclado)) then writeln(' el codigo: ' , codteclado , ' se encuentra dentro del rubro ' , rubroteclado)
                                                      else writeln(' el codigo: ' , codteclado , ' no se encuentra dentro del rubro ' , rubroteclado);
 writeln('-------------------inciso c----------------------');
 
 for i:= 1 to 10 do begin;
       codmax:= -1;
       stockmax:= 0;
       BuscarMaximo(v[i].productos,codmax,stockmax);
       if(codmax <> -1) then writeln(' Dentro del rubro ' , i , ' el codigo de producto mas grande es: ' , codmax , ' con stock de ' , stockmax , ' unidades ')
                        else writeln(' el rubro ' , i , ' se encuentra vacio ');
 end;
 writeln('-------------------inciso d----------------------');
 writeln(' ingrese el primer codigo ');
 readln(cod1);
 writeln(' ingrese el segundo codigo (que sea mayor al primero)');
 readln(cod2);
 for i:= 1 to 10 do begin;
      cant:= contar(v[i].productos,cod1,cod2);
      if (cant > 0) then writeln (' En el rubro ', i , ' se encontraron ' , cant , ' productos dentro del rango de ' , cod1, ' a ' , cod2)
                     else writeln (' No se encontraron productos del rubro ' , i , ' dentro del rango de ' , cod1 , ' a ' , cod2);
     end;
end.
