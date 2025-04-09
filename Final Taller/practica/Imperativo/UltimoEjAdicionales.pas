program ej4pracadi;

type
 reclamo = record
   cod: integer;
   dni: integer;
   a: integer;
   tipo: integer;
 end;
 
 reclamo2 = record
   cod: integer;
   a: integer;
   tipo: integer;
  end;
  
  lista = ^nodoLista;
  nodoLista =  record
     dato: reclamo2;
     sig: lista;
  end;
  
  lista2 = ^nodoLista2;
  nodoLista2 = record
    cod: integer;
    sig: lista2;
  end;
  
  datoArbol = record
    dni: integer;
    cant: integer;
    lis: lista;
  end;
  
  arbol = ^nodo;
  nodo = record
    dato: datoArbol;
    hd: arbol;
    hi: arbol;
  end;
  
  procedure leerReclamo (var r: reclamo);
  begin
     r.cod:= Random (150);
     if (r.cod > 0) then begin
       r.dni:= Random (100) + 4300;
       r.a:= Random (15) + 2010;
       r.tipo:= Random (5) + 1;
     end;
  end;
  
  
  procedure asignar (var r2: reclamo2; var r: reclamo);
  begin
    r2.a:= r.a;
    r2.cod:= r.cod;
    r2.tipo:= r.tipo;
  end;
  
  procedure insertarReclamo (var l:lista; r: reclamo2);
  var nue:lista;
  begin
    new (nue);
    nue^.dato:= r;
    nue^.sig:= l;
    l:= nue;
  end;
  
  procedure cargarArbol (var a: arbol; r: reclamo);
  var r2: reclamo2;
  begin
    if (a= nil) then begin
      new (a);
      a^.dato.dni := r.dni;
      a^.dato.cant:= 1;
      a^.dato.lis:= nil;
      asignar(r2,r);
      insertarReclamo(a^.dato.lis,r2);
      a^.hd:= nil;
      a^.hi:= nil;
    end
    else if (r.dni = a^.dato.dni) then begin
           a^.dato.cant:= a^.dato.cant + 1;
           asignar(r2,r);
           insertarReclamo(a^.dato.lis, r2);
         end
         else if (r.dni < a^.dato.dni) then cargarArbol(a^.hi,r)
              else cargarArbol(a^.hd,r);  
  end;
  
  procedure cargarDatos( var a: arbol);
  var r: reclamo;
  begin
    a:= nil;
    leerReclamo(r);
    while (r.cod > 0)do begin
      cargarArbol(a,r);
      leerReclamo(r);
    end;
  end;
  
  procedure imprimirReclamo (r: reclamo2);
  begin
    writeln('Codigo: ', r.cod, ' Anio: ' , r.a, ' Tipo: ' , r.tipo);
  end;
  
  procedure imprimirLista (l: lista);
  begin
    while (l<> nil) do begin
       imprimirReclamo(l^.dato);
       l:= l^.sig;
    end;
  end;
  
  procedure imprimirArbol (a:arbol);
  begin
    if (a<> nil) then begin
      imprimirArbol(a^.hi);
      writeln('Persna con DNI: ' , a^.dato.dni, ' Cantidad de reclamos: ' , a^.dato.cant , ' lista: ');
      imprimirLista(a^.dato.lis);
      imprimirArbol(a^.hd);
    end;
  end;
  
  function incisoB (a: arbol; d: integer): integer;
  begin
    if (a = nil) then incisoB:= 0
    else if (d = a^.dato.dni) then incisoB:= a^.dato.cant
         else if (d < a^.dato.dni) then incisoB:= incisoB(a^.hi,d)
              else incisoB:= incisoB(a^.hd,d);
  end;
  
  function incisoC (a: arbol;d1: integer; d2: integer): integer;
  begin
    if (a = nil) then incisoC:= 0
    else if ((d1 < a^.dato.dni) and (d2 >a^.dato.dni)) then incisoC:= a^.dato.cant + incisoC(a^.hi,d1,d2) + incisoC(a^.hd,d1,d2)
         else if (d1 >= a^.dato.dni) then incisoC:= incisoC(a^.hd,d1,d2)
              else incisoC:= incisoC(a^.hi,d1,d2);
  end;
  
  procedure insertarCodigo (var l:lista2; c: integer);
  var nue:lista2;
  begin
    new (nue);
    nue^.cod:= c;
    nue^.sig:= l;
    l:= nue;
  end;
  
  procedure imprimirLista2 (l: lista2);
  begin
    while (l<> nil) do begin
       writeln('Codigo: ' , l^.cod);
       l:= l^.sig;
    end;
  end;
  
  procedure buscarAnioLista (var l2: lista2;l: lista; an: integer);
  var cant: integer;
  begin
    cant:= 0;
    while (l<>nil) do begin
      if (l^.dato.a = an) then 
        insertarCodigo(l2,l^.dato.cod);
      l:= l^.sig
    end;
    cant:= cant + 1;
  end;
  
  procedure buscarAnioArbol (var l2: lista2; a: arbol; an: integer);
  begin
    if (a <> nil) then begin
      buscarAnioArbol(l2,a^.hi,an);
      buscarAnioLista(l2,a^.dato.lis,an);
      buscarAnioArbol(l2,a^.hd,an);
    end;  
  end;
  
  
var a: arbol; d,d1,d2,cantB,cantC, an: integer; l: lista2;
begin
  Randomize;
  writeln('-------------- Inciso A ---------------');
  cargarDatos(a);
  imprimirArbol(a);
  writeln('-------------- Inciso B ---------------');
  writeln('Ingrese un DNI');
  readln(d);
  cantB:= incisoB(a,d);
  writeln('La cantidad de reclamos efectuados por el cliente de DNI ' , d, ' es ' , cantB);
  writeln('-------------- Inciso C ---------------');
  writeln('Ingrese dos DNIS');
  writeln('Ingrese el primero');
  readln(d1);
  writeln('Ingrese el segundo');
  readln(d2);
  cantC:= incisoC(a,d1,d2);
  writeln('La cantidad de reclamos realizados por los clientes con DNI entre ' , d1 , ' y ' , d2, ' es ', cantC);
  writeln('-------------- Inciso D ---------------');
  l:= nil;
  writeln('Inserte anio');
  readln(an);
  buscarAnioArbol(l,a,an);
  writeln('Lista correspondientes a los codigos de reclamo del anio ' , an, ' : ');
  imprimirLista2(l);
  
  
end.
