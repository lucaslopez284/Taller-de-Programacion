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
                  else if (a^.dato.cod = info.cod) then begin 
                   v.fec:= info.fec; v.cantven:= info.cantven; agregaradelante(a^.dato.lis, v)
                                       end
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
   write('el dia: ' , f.dia, ' del mes: ' , f.mes);
end;
  
Procedure ImprimirNodoArboluno (v:venta);
begin
  ImprimirFecha(v.fec);
  writeln (' se vendieron ' , v.cantven , ' cantidades del producto de codigo ' , v.cod);
end;


procedure ImprimirNodoArbolDos (info:info2);
begin
  writeln (' se vendieron ' , info.cantven , 'cantidades del producto de codigo ' ,info.cod);
end;

procedure Informar (v: ventaredu;cod: integer);
begin 
   ImprimirFecha(v.fec);
   writeln(' se vendieron ', v.cantven, ' cantidades del producto ', cod);

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

procedure LeerFechaTeclado (var f: fecha);
begin
   write('inserte el dia');
   readln(f.dia);
   write('inserta el mes');
   readln(f.mes);

end;

Procedure InformarFecEspecifica (a:arboluno);
var
 cantven: integer;
begin
    cantven:= a^.dato.cantven;
    ImprimirFecha(a^.dato.fec);
    writeln('se vendieron ' , cantven , 'productos');
end;



Procedure Buscarfecha(a:arboluno; f:fecha; var esta: boolean);



begin
    
    if (a= nil) then esta:= false
                else if ((a^.dato.fec.dia = f.dia) and (a^.dato.fec.mes = f.mes)) then esta:= true
                                                                                  
                                                                                  else begin Buscarfecha(a^.hi,f,esta) ;
                                                                                             if (esta = false) then
                                                                                                   BuscarFecha(a^.hd,f,esta);
                                                                                         end;
    
    
end;

Procedure Maximo (a: arboldos ;var codmax: integer; var cantmax: integer);
begin
   if (a^.dato.cantven > cantmax) then begin
       cantmax:= a^.dato.cantven;
       codmax:= a^.dato.cod;
 end;
end;

procedure MayorCantUniVendidas (a:arboldos;var codmax: integer; var cantmax: integer);

begin
 
 if (a<>nil) then begin
      MayorCantUniVendidas(a^.hi,codmax,cantmax);
      Maximo(a, codmax, cantmax);
      MayorCantUniVendidas(a^.hd,codmax,cantmax);
  end;

end;

Procedure Calcularcantventas (l:lista; cod:integer; var codmax:integer; var cantmax: integer);
var contador: integer;
begin
    contador:= 0;
    while(l<>nil) do begin
             contador:= contador + 1;
             l:= l^.sig;
    if (contador > cantmax) then begin
          cantmax:= contador;
          codmax:=cod;
     end;
end;
end;
 
Procedure MayorCantventas(a:arboltres; var codmax:integer; var cantmax: integer);
begin
   if (a<> nil) then begin
         MayorCantventas(a^.hi,codmax,cantmax);
         Calcularcantventas(a^.dato.lis,a^.dato.cod, codmax, cantmax);
         MayorCantventas(a^.hd,codmax,cantmax);
  end;
end;



 
var a1: arboluno ; a2:arboldos; a3:arboltres;
    f: fecha; esta: boolean; codmax,cantmax,codmaxbis,cantbis:integer;

begin
randomize;
ProcesarInformacion(a1,a2,a3);
InformarDatos(a1,a2,a3);
leerfechateclado(f);
esta:= false;
BuscarFecha(a1, f,  esta); 
if (esta = true)  then InformarFecEspecifica(a1)
                      else writeln('no se encontro fecha');
cantmax:= 0;
MayorCantUniVendidas (a2, codmax, cantmax); 
if (cantmax <> 0) then writeln (' el producto con mas unidades vendidas fue el de codigo' , codmax , ' con ' , cantmax , ' unidades ')
                  else writeln (' el arbol se encuentra vacio');
      
  
cantbis:= 0;

MayorCantVentas(a3,codmaxbis,cantbis);
if (cantbis <> 0) then writeln (' el producto con mayor cantidad de ventas distintas fue el de codigo ' , codmaxbis , ' con ' , cantbis)
                  else writeln (' el arbol se encuentra vacio ');
end.                    
