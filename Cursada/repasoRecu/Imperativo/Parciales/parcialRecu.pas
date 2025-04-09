program parcialRecu;
type
  meses = 1..12;
  provincias = 1..24;
  
  partida = record
    mes: meses;
    anio: integer;
    provincia: provincias;
    monto: real;
   end;
   
  partida2 = record
    mes: meses;
    provincia: provincias;
    monto: real;
  end;
  
  lista = ^nodoL;
  nodoL = record
    dato: partida2;
    sig: lista;
  end;
  
   
  datoArbol = record
    anio: integer;
    lis: lista;
  end;   
  
  arbol = ^nodo;
  nodo = record
    dato: datoArbol;
    hi: arbol;
    hd: arbol;
  end;
  
  datoVector = record
    cant: integer;
    monto: real;
  end;
  
  vector = array [provincias] of datoVector;
  
  
   
   procedure leerPartida (var p: partida);
   begin
     p.mes := Random (12) + 1;
     p.anio:= Random (4) + 2020;
     p.provincia := Random (24) + 1;
     p.monto:= (Random (1000) + 10) / (Random (5) + 1);
   end;
    
   procedure asignar (var p2: partida2; p: partida);
   begin
     p2.mes:= p.mes;
     p2.provincia:= p.provincia;
     p2.monto:= p.monto;
   end;
   
   procedure insertarOrdenado (var l: lista; p: partida2);
   var nue,act,ant: lista;
   begin
     new (nue);
     nue^.dato:= p;
     act:= l;
     while (act<> nil) and (act^.dato.mes < p.mes) do begin
       ant:= act;
       act:= act^.sig;
     end;
     if (act = l) then l:= nue
     else ant^.sig:= nue;
     nue^.sig:= act;
   end;
   
   procedure cargarArbol (var a: arbol; p: partida);
   var p2: partida2;
   begin
     if (a= nil) then begin
       new (a);
       a^.dato.lis:= nil;
       asignar(p2,p);
       a^.dato.anio:= p.anio;
       insertarOrdenado(a^.dato.lis,p2);
       a^.hi:= nil;
       a^.hd:= nil;
     end
     else if (a^.dato.anio = p.anio) then begin
              asignar(p2,p);
              insertarOrdenado(a^.dato.lis,p2);
           end
           else if (p.anio < a^.dato.anio) then cargarArbol(a^.hi,p)
                 else cargarArbol(a^.hd,p);
       
   end;
   
   function compararPartida (p: partida): boolean;
   begin
     if ((p.mes = 12) and (p.provincia = 24) and( p.anio = 2022) )then compararPartida:= false
     else compararPartida:= true;
     
   end;
   
   procedure cargarDatos (var a: arbol);
   var p: partida;
   begin
     a:= nil;
     repeat
       leerPartida(p);
       cargarArbol(a,p);
     until ((p.mes = 12) and (p.provincia = 24) and( p.anio = 2022) )
   
   end;
   
   procedure imprimirLista (l: lista);
   begin
     while (l<> nil) do begin
       writeln(' Mes: ' , l^.dato.mes , ' Provincia: ' , l^.dato.provincia, ' Monto: ' , l^.dato.monto:2:2);
       l:= l^.sig;
     end;
   end;
   
   procedure imprimirArbol (a: arbol);
   begin
     if (a<> nil) then begin
       imprimirArbol(a^.hi);
       writeln('Lista del anio ' , a^.dato.anio);
       imprimirLista(a^.dato.lis);
       imprimirArbol(a^.hd);
     end;
   end;
   
   procedure inicializarVector (var v: vector);
   var i: provincias;
   begin
     for i:= 1 to 24 do begin
         v[i].cant:= 0;
         v[i].monto:= 0;
     end;
   end;
   
   procedure procesarLista (var v: vector;l: lista);
   begin
     while (l<> nil) do begin
       v[l^.dato.provincia].cant:= v[l^.dato.provincia].cant + 1;
       v[l^.dato.provincia].monto:= v[l^.dato.provincia].monto + l^.dato.monto;
       l:= l^.sig;
     end;
   end;
   
   
   procedure cargarVector (var v: vector; a: arbol);
   begin
     if (a<> nil) then begin
       cargarVector(v,a^.hi);
       procesarLista (v,a^.dato.lis);
       cargarVector(v,a^.hd);
     end;
   end;
   
   procedure imprimirVector (v: vector);
   var i: provincias;
   begin
     for i:= 1 to 24 do 
       writeln('Provincia: ' , i , ' Partidas recibidas: ' , v[i].cant , ' Monto total: ' , v[i].monto:2:2);
   end;
   
   
   procedure nuevaEstructura (var v: vector; a: arbol);
   begin
     inicializarVector(v);
     cargarVector(v,a);
   end;
   
   procedure maximo (v: vector; var cod: integer; var max: integer; diml: integer);
   begin
     if (diml > 0) then begin
       if (v[diml].cant > max) then begin
         max:= v[diml].cant;
         cod:= diml;
       end;
       maximo (v,cod,max,diml-1);
     end; 
   end;
   
   function contar (l: lista; mes: meses) : integer;
   var aux: integer;
   begin
     aux:= 0;
     while (l^.dato.mes < mes) do
       l:= l^.sig;
     while (l^.dato.mes = mes) do begin
        aux:= aux + 1;
        l:= l^.sig
      end;
      contar:= aux;
   end;
   
   function cantidad (a: arbol; a1: integer; a2: integer; mes: meses) : integer;
   begin
     if (a= nil) then cantidad:= 0
     else if (a^.dato.anio > a1) and (a^.dato.anio < a2) then 
                cantidad:= contar(a^.dato.lis,mes) + cantidad(a^.hi,a1,a2,mes) + cantidad(a^.hd,a1,a2,mes)
          else if (a^.dato.anio < a1) then cantidad:= cantidad(a^.hd,a1,a2,mes)
               else cantidad:= cantidad(a^.hi,a1,a2,mes);
   end;
   
var a: arbol; v: vector; max,cod,diml,a1,a2: integer; mes: meses;
begin
  Randomize;
  writeln('-------------Inciso A -------------');
  cargarDatos(a); 
  imprimirArbol(a);
  writeln('-------------Inciso B -------------');
  nuevaEstructura(v,a);
  imprimirVector(v);
  writeln('-------------Inciso C -------------');
  max:= 0;
  cod:= 0;
  diml:= 24;
  maximo (v,cod,max,diml);
  if (max > 0) then writeln('La provincia con mas cantidad de partidas es la numero: ' , cod , ' con la cantidad de ' , max)
               else writeln('Estructura sin datos');
  writeln('-------------Inciso D -------------');
  writeln('Inserte un anio');
  readln(a1);
  writeln('Inserte un anio mayor al primero');
  readln(a2);
  writeln('Inserte un mes');
  readln(mes);
  writeln('La cantidad total de partidas enviadas durante el mes ' , mes , ' entre los anios ' , a1 , ' y ' , a2 , ' es ' , cantidad(a,a1,a2,mes));
  readln;
end.
