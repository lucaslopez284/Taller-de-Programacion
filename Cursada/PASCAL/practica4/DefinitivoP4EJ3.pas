program prac4ej3;

{a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.

b. Imprimir el contenido del árbol ordenado por código de producto.

c. Retornar el código de producto con mayor cantidad de unidades vendidas.

d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.

e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}


type 
  producto = record
   codigo: integer;
   CantVendida: integer;
   MontoTotal : real;
  end;
  
  venta = record
  codigoventa: integer;
  codigoproducto: integer;
  CantVendida : integer;
  preciounitario: real;
 end;
 
 arbol = ^nodo;
 nodo = record 
     dato: producto;
     hd: arbol;
     hi: arbol;
  end;   
  
  
 Procedure CargarVenta(var v:venta);
 begin 


 v.codigoventa:= random(10);
 if (v.codigoventa <> 0) then begin
        v.codigoproducto:= random (50) + 100;
        v.cantvendida:= random (15) + 1;
        v.preciounitario:= (100 + random (100))/2;
      end;
      
 end;
 
 
 Procedure ArmarProducto(var p: producto; v: venta);
 begin
     p.codigo:= v.codigoproducto;
     p.cantvendida:= v.cantvendida;
     p.montototal:= v.cantvendida * v.preciounitario;
 end;


Procedure InsertarProducto (var a: arbol; v: venta);
var
 p: producto;
 
begin 
   if (a= nil) then begin
         new(a);
         ArmarProducto(p,v);
         a^.dato:= p;
         a^.hi:= nil;
         a^.hd:= nil;
       end
       else if (v.codigoproducto = a^.dato.codigo) then begin
                a^.dato.cantvendida:= a^.dato.cantvendida + v.cantvendida;
                a^.dato.montototal:= a^.dato.montototal + (v.cantvendida * v.preciounitario);
             end
             else if (v.codigoproducto < a^.dato.codigo) then InsertarProducto(a^.hi,v)
                                                         else InsertarProducto(a^.hd,v);
end;


Procedure ProcesarDatos (var a: arbol);
var v: venta;
begin
   writeln;
   writeln ('----- Ingreso de ventas y armado de arbol de productos ----->');
   writeln;
   a:= nil;
   CargarVenta(v);
   While(v.codigoventa <> 0) do begin
                InsertarProducto(a,v);
                CargarVenta(v);
   end;
 writeln;
 writeln ('-----------------------------------------------');
 writeln;

end;


Procedure ImprimirArbol(a:arbol);
begin 
 if (a<>nil) then begin
         imprimirarbol(a^.hi);
         writeln ('Codigo producto: ', a^.dato.codigo, ' cantidad unidades: ', a^.dato.cantvendida, ' monto total: ', a^.dato.montoTotal:2:2);
         imprimirarbol(a^.hd);
       end;
 end;
 
 
 
 
 Procedure ImprimirDatos (a:arbol);
 begin
  writeln;
  writeln ('----- Modulo B ----->');
  writeln;
  if ( a = nil) then writeln ('Arbol vacio')
                else ImprimirArbol (a);
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
 
 
 end; 

Procedure Maximo (a: arbol; var max: integer; var codmax: integer);
begin
    if (a^.dato.cantvendida > max) then begin
        max:= a^.dato.cantvendida;
        codmax:= a^.dato.codigo;
    end;
end;

Procedure CodMaxUniVendidas(a:arbol);
var max,codmax: integer;
begin
   max:= 0;
   if (a<>nil) then begin          
           if (a^.hi <>nil) then maximo(a^.hi,max,codmax);
           maximo(a,max,codmax);
           if (a^.hd <>nil) then maximo(a^.hd,max,codmax);
        end;
   writeln;
  writeln ('----- Modulo C ----->');
  writeln;
  if (max > 0) then writeln (' el producto mas vendido fue el de codigo ' , codmax , ' con la cantidad de ' , max)
               else writeln ('arbol vacio');
end;
  
Function Menores (a:arbol; valor: integer) : integer;

begin
    
    if (a = nil) then menores:= 0
    
            else if (valor > a^.dato.codigo) then begin
                 menores:= 1 + menores(a^.hi,valor)  + menores(a^.hd,valor)
                end
                 else if (valor <= a^.dato.codigo) then
                                       menores:= menores (a^.hd,valor);
    

end;
  
 
Procedure CantMenores (a:arbol);
var cantidad,valor: integer;
begin
 writeln;
 writeln ('----- Modulo D ----->');
 writeln;
 writeln('Inserte un valor');
 readln (valor);
 cantidad:= Menores(a,valor);
 if (cantidad > 0) then writeln (' La cantidad de codigos menores a ' , valor , ' es igual a ' , cantidad)
                   else if (a<>nil) then writeln (' No hay codigos menores que ' , valor)
                                    else writeln (' El arbol esta vacio');
end;

Function CalcularMonto(a:arbol;num1:integer;num2: integer):real;

begin
   
   if (a= nil) then CalcularMonto:= 0
            else  if ((a^.dato.codigo > num1) and (a^.dato.codigo < num2)) then begin
                    CalcularMonto:= a^.dato.MontoTotal + CalcularMonto(a^.hi,num1,num2) + CalcularMonto(a^.hd,num1,num2);
                  end
                          else if ( num1 >= a^.dato.codigo) then CalcularMonto:= CalcularMonto(a^.hd,num1,num2)
                                                          else if (a^.dato.codigo > num2) then CalcularMonto:= CalcularMonto(a^.hi,num1,num2);
   
end;

Procedure MontoTotalEntreDos (a: arbol);
var num1, num2: integer; total: real;
begin
 writeln;
 writeln ('----- Modulo E ----->');
 writeln;
 writeln('Ingrese el primer numero');
 readln(num1);
 writeln;
 writeln('Ingrese el segundo numero (que sea mayor al primero)');
 readln(num2);
 writeln;
 Total:= CalcularMonto(a,num1,num2);
 If(Total > 0) then writeln('El monto total de los productos cuyo codigo se encuentra entre ' , num1 , ' y ' , num2, ' es ' , total:2:2)
               else if (a<>nil) then writeln ('No hay codigos de producto entre ' , num1 , ' y ' , num2)
                                else writeln ('El arbol esta vacio');
end;






var a: arbol;

begin
randomize;
ProcesarDatos(a);
ImprimirDatos(a);
CodMaxUniVendidas(a);
CantMenores(a);
MontoTotalEntreDos(a);
readln
end.
