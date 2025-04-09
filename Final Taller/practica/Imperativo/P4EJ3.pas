program jkdskj;

 type
 
 venta = record
   codVenta : integer;
   codProducto: integer;
   cantVendida: integer;
   precioU: real;
 end;
 
 producto = record
  cod: integer;
  ventas: integer;
  monto: real;
 end;
 
 
 arbol = ^nodo;
 nodo = record
   dato: producto;
   hd: arbol;
   hi: arbol;
 end;
 
 procedure leerVenta (var v: venta);
 begin
   v.codVenta:= Random (50) - 1;
   if (v.codVenta <> -1) then begin
     v.CodProducto:= Random (100) + 100;
     v.cantVendida:= Random (20) + 1;
     v.precioU:= Random (50) + 200;
   end;
 end;
 
 procedure cargarArbol (var a: arbol; v: venta);
 begin
   if (a= nil) then begin
     new (a);
     a^.hd:= nil;
     a^.hi:= nil;
     a^.dato.cod:= v.codProducto;
     a^.dato.ventas:= v.cantVendida;
     a^.dato.monto:= v.cantVendida * v.precioU;
   end
   else if (a^.dato.cod= v.codProducto) then begin
          a^.dato.ventas:= a^.dato.ventas + v.cantVendida;
          a^.dato.monto:= a^.dato.monto +(v.cantVendida * v.precioU);
        end
        else if (v.codProducto < a^.dato.cod) then cargarArbol(a^.hi,v)
             else cargarArbol(a^.hd,v)
 end;
 
 procedure cargarDatos (var a: arbol);
 var v: venta;
 begin
   a:= nil;
   leerVenta(v);
   while (v.codVenta <> - 1) do begin
     cargarArbol(a,v);
     leerVenta(v);
   end;
 
 end;
 
 procedure imprimirDatos (a: arbol);
 begin
   if (a  <> nil) then begin
     imprimirDatos(a^.hi);
     writeln('Codigo de producto: ' , a^.dato.cod, ' cantidad vendida: ' , a^.dato.ventas, ' monto recaudado: ' , a^.dato.monto:2:2);
     imprimirDatos(a^.hd);
   end;
 end;
 
 procedure mayorCantidadVentas (a: arbol; var max: integer; var cod: integer);
 begin
   if (a<> nil) then begin
     mayorCantidadVentas(a^.hi,max,cod);
     if (a^.dato.ventas > max) then begin
       max:= a^.dato.ventas;
       cod:= a^.dato.cod;
     end;
     mayorCantidadVentas(a^.hd,max,cod);
   end;
 
 end;
 
 function menores (a: arbol; cod: integer) : integer;
 begin
   if (a = nil) then menores:= 0
   else if (a^.dato.cod < cod) then menores:= 1 + menores(a^.hi, cod) + menores(a^.hd, cod)
        else menores := menores(a^.hi,cod);
 end;
  
 function rango (a: arbol; c1: integer; c2: integer): real;
 begin
   if (a = nil) then rango:= 0
   else if (c1 < a^.dato.cod) and (c2 > a^.dato.cod) then rango:= a^.dato.monto + rango(a^.hi,c1,c2) + rango(a^.hd,c1,c2)
        else if (c1 >= a^.dato.cod) then rango:= rango(a^.hd,c1,c2)
             else rango:= rango(a^.hi,c1,c2)
 end;

var a: arbol; var cod,cod2,max: integer;  

begin
  Randomize;
  cargarDatos(a);
  imprimirDatos(a);
  cod:= -1;
  max:= 0;
  mayorCantidadVentas(a,max,cod);
  writeln('El codigo con mayor ventas es ' , cod, ' con la cantidad de ' , max);
  writeln;
  writeln('Inserte codigo a buscar');
  readln (cod);
  writeln('La cantidad de codigos menores a ' , cod, ' es ', menores(a,cod)); 
  writeln;
  writeln('Ingrese primer codigo');
  readln(cod);
  writeln('Ingrese segundo codigo');
  readln(cod2);
  writeln('El monto total recaudado entre productos de codigo entre ' , cod, ' y ' , cod2,' es ', rango(a,cod,cod2):2:2 ); 
end.
