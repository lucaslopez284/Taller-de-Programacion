program TurnoD2023;

type
   
   pasaje = record
     vuelo: integer;
     cliente : integer;
     destino: integer;
     monto: real;
   end;
  
  pasaje2 = record
     vuelo: integer; 
     cliente : integer;
     monto: real;
   end;
     
   lista=^nodoL;
   nodoL = record
     dato: pasaje2;
     sig: lista;
   end;
  
   datoArbol = record
     destino: integer;
     lis: lista;
   end;
  
   arbol= ^nodo;
   nodo = record
     dato: datoArbol;
     hi: arbol;
     hd: arbol;
   end;
   
   procedure leerPasaje (var p: pasaje);
   begin
     p.monto:= Random (100) / (Random (5) + 1);
     if (p.monto<> 0) then begin
       p.vuelo:= Random (7000);
       p.cliente:= Random (100) + 1;
       p.destino:= Random (500) + 1;
     end;
   end;
   
   procedure asignar (var p2: pasaje2; p: pasaje);
   begin
     p2.monto:= p.monto;
     p2.vuelo:= p.vuelo;
     p2.cliente:= p.cliente;
   end;
   
   procedure agregarAdelante (var l: lista; p: pasaje2);
   var nue: lista;
   begin
     new(nue);
     nue^.dato:= p;
     nue^.sig:= l;
     l:= nue;
   end;
   
   procedure cargarArbol (var a: arbol; p: pasaje);
   var p2: pasaje2;
   begin
     if (a= nil) then begin
        new (a);
        a^.dato.destino:= p.destino;
        a^.dato.lis:= nil;
        asignar(p2,p);
        agregarAdelante(a^.dato.lis,p2);
        a^.hi:= nil;
        a^.hd:= nil;
   end
   else if (a^.dato.destino = p.destino) then begin
          asignar(p2,p);
          agregarAdelante(a^.dato.lis, p2);
        end
        else if (p.destino < a^.dato.destino ) then cargarArbol(a^.hi,p)
             else cargarArbol(a^.hd,p);
  end;
  
  procedure procesarDatos (var a: arbol);
  var p: pasaje;
  begin
    a:= nil;
    leerPasaje(p);
    while (p.monto <> 0) do begin
      cargarArbol(a,p);
      leerPasaje(p);
    end;
  end;
  
  procedure imprimirLista (l: lista);
  begin
    while (l<> nil) do begin
      writeln('Vuelo: ' , l^.dato.vuelo , ' Cliente: ' , l^.dato.cliente , ' Monto: ' , l^.dato.monto:2:2);
      l:= l^.sig;
    end;
  end;
  
  procedure imprimirArbol (a: arbol);
  begin
    if (a<> nil) then begin
       imprimirArbol(a^.hi);
       writeln('Codigo de ciudad destino ' , a^.dato.destino);
       imprimirLista(a^.dato.lis);
       imprimirArbol(a^.hd);
    end;
  end;
  
  function retornoPasajes (a: arbol;cod: integer) : lista;
  begin
    if (a=nil) then retornoPasajes:= nil
    else if (a^.dato.destino = cod) then retornoPasajes:= a^.dato.lis
         else if (cod < a^.dato.destino) then retornoPasajes:= retornoPasajes(a^.hi,cod)
              else retornoPasajes:= retornoPasajes(a^.hd,cod);
  end;
  
  function contarPasajes (l: lista): integer;
  var cant: integer;
  begin
    cant:= 0;
    while (l<> nil) do begin
       cant:= cant + 1;
       l:= l^.sig;
     end;
    contarPasajes:= cant;
  end;
  
  procedure maximo (a: arbol; var cod: integer; var max: integer);
  var aux: integer;
  begin
    if (a<> nil) then begin
      maximo (a^.hi,cod,max);
      aux:= contarPasajes(a^.dato.lis);
      if (aux > max) then begin
        max:= aux;
        cod:= a^.dato.destino;
      end;
      maximo (a^.hd,cod,max);
    end;
  end;
  
 
var a: arbol; l: lista; cod,cod2,max: integer;
begin
  Randomize;
  writeln('---------- Inciso A -------------');
  procesarDatos(a);
  imprimirArbol(a);
  writeln('---------- Inciso B -------------');
  writeln('Ingrese codigo de ciudad destino');
  readln(cod);
  l:= retornoPasajes(a,cod);
  if (l <> nil) then begin
    writeln ('Pasajes a la ciudad de codigo: ' , cod);
    imprimirLista(l);
   end
  else writeln('Lista vacia');
  writeln('---------- Inciso C -------------');
  cod2:= -1;
  max:= 0;
  maximo (a,cod2,max);
  if (max > 0) then writeln ('El codigo de ciudad con mas pasajes vendidos es ' , cod2, ' con la cantidad vendida de ' , max , ' pasajes')
               else writeln ('Al estar vacia la estructura, no hay maximo');
   
  readln;
end.
 
