program arbol2;
{Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.
b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
1

c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.
d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.}



type 
 dias = 1..31;
 meses = 1..12;
 
 fecha = record
 dia : dias;
 mes : meses; 
end;

venta = record
   cod : integer;
   fec: fecha;
   cantven: integer;
end;

info2 = record
   cod : integer;
   cantven : integer;
end;

arboluno= ^nodo;
 nodo = record
  dato: venta;
  hi: arboluno;
  hd: arboluno;
 end; 
 
arboldos= ^nodo2;
 nodo2 = record
  dato: info2;
  hi: arboldos;
  hd: arboldos;
 end;

ventaredu = record
  fec : fecha;
  cantven : integer;
end;

lista = ^nodoLista;
  nodoLista = record
   dato : ventaredu;
   sig : lista;
  end;
 
 info3 = record
  cod : integer;
  lis : lista;
 end; 
 
 arboltres= ^nodo3;
 nodo3 = record
  dato: info3;
  hi: arboltres;
  hd: arboltres;
 end;
  
procedure leerfecha (var f: fecha);
begin
    f.dia:= random (31) + 1;
    f.mes:= random (12) + 1;
end;

 
procedure leerventa (var v: venta);

begin
  leerfecha(v.fec);
  v.cod:= random (20);
  v.cantven:= random(10);
end;


procedure AgregarAdelante (var L: lista; dato: ventaredu);
var 
   nue : lista;
begin
  new (nue);
  nue^.dato:= dato;
  nue^.sig:= l;
  l:= nue;
end;


Procedure CargarArboluno (var a: arboluno; info: venta);
begin
  if (a = nil) then begin new(a); a^.dato:= info; a^.hi := nil; a^.hd:= nil; 
                    end
                else if (info.cod >= a^.dato.cod) then cargararboluno (a^.hd, info)
                                                  else cargararboluno (a^.hi, info);
end;
                                      
procedure CargarArboldos (var a: arboldos; info: venta);

begin
 if (a = nil) then begin new(a); a^.dato.cantven:= info.cantven ; a^.dato.cod:= info.cod; a^.hi := nil; a^.hd:= nil; 
                    end
                else if (info.cod >= a^.dato.cod) then cargararboldos(a^.hd, info)
                                                  else cargararboldos(a^.hi, info);
 end;

Procedure Cargararboltres (var a: arboltres; info: venta);
var v:ventaredu;
begin 
    if (a = nil) then begin new (a); a^.dato.cod:= info.cod; a^.dato.lis:= nil; v.fec:= info.fec; v.cantven:= info.cantven;
                            agregaradelante(a^.dato.lis, v); a^.hd:= nil; a^.hi:= nil;
                            end
                  else if (a^.dato.cod = info.cod) then agregaradelante(a^.dato.lis, v)
                                                   else if  (info.cod > a^.dato.cod) then cargararboltres(a^.hd, info)
                                                                                    
                                                                                     else cargararboltres(a^.hi, info);
end;

 
Procedure ProcesarInformacion (Var a1:arboluno; var a2: arboldos; var a3:arboltres);
var ven: venta; 
begin
 a1:= nil; a2:= nil; a3:= nil;
 leerVenta(ven);
 while(ven.cod <> 0) do begin
     CargarArboluno(a1,ven); 
     CargarArboldos(a2,ven);
     Cargararboltres(a3,ven);
     leerVenta(ven);
 end;

end;
   
Procedure ImprimirFecha (f:fecha);
begin
   write('el dia:' , F.dia, ' del mes ' , f.mes);
end;
  
Procedure ImprimirNodoArboluno (v:venta);
begin
  ImprimirFecha(v.fec);
  writeln ('se vendieron ' , v.cantven , 'cantidades del producto de codigo' , v.cod);
end;


procedure ImprimirNodoArbolDos (info:info2);
begin
  writeln ('se vendieron ' , info.cantven , 'cantidades del producto de codigo' ,info.cod);
end;

procedure Informar (v: ventaredu;cod: integer);
begin 
   ImprimirFecha(v.fec);
   writeln(' se vendieron ', v.cantven, 'cantidades del producto', cod);

end;

procedure ImprimirNodoArbolTres(l:lista; cod: integer);
 begin
  while (l<>nil) do begin
       informar(l^.dato,cod);
       l:=L^.sig;
  end
 
 end;
 
procedure ImprimirArbolUno(a: arboluno);
begin 
    if (a<>nil) then begin;
        ImprimirArbolUno(a^.hi);
        ImprimirNodoArboluno(a^.dato);
        ImprimirArbolUno(a^.hd);
     end;
 end;
 
 
procedure ImprimirArboldos(a: arboldos);
begin
    if (a<>nil) then begin;
        ImprimirArboldos(a^.hi);
        ImprimirNodoArboldos(a^.dato);
        ImprimirArboldos(a^.hd);

end;
        

end;

 
procedure ImprimirArbolTres(a:arboltres);
begin
    if(a<>nil) then begin
          ImprimirArbolTres(a^.hi);
          imprimirnodoarboltres(a^.dato.lis, a^.dato.cod);
          ImprimirArbolTres(a^.hd);
       end;
end;
 
 
Procedure InformarDatos (a1: arboluno; a2:arboldos; a3:arboltres);
begin
  writeln('ahora arbol 1');
  ImprimirArbolUno(a1);
  writeln;
  writeln;
  writeln('ahora arbol 2');
  ImprimirArboldos(a2);
  writeln;
  writeln;
  writeln('ahora arbol 3');
  ImprimirArboltres(a3);
  writeln;
  writeln;
end;


var a1: arboluno ; a2:arboldos; a3:arboltres;

begin
randomize;
ProcesarInformacion(a1,a2,a3);
InformarDatos(a1,a2,a3);
end.
