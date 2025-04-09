program hjj;

type

 ids = 1..5;
 cants = 1..10;
 ubi = 1..100;
 
 esquina = record
   av: ubi;
   ca: ubi;
 end;
 
 msj = record
   id : ids;
   flo: cants;
   pap: cants;
   esq: esquina;
 end;
 
 msj2= record
   flo: cants;
   pap: cants;
   esq: esquina;
 end;
 

 
 arbol = ^nodo;
 nodo = record
   dato: msj2;
   hd: arbol;
   hi: arbol; 
 end;
 
 infoVector = record
   id: ids;
   a: arbol;
 end;
 vector = array [ids] of infoVector;
 
  datoLista = record
   av: ubi;
   flo: integer;
   sinPap: integer;
  end;
  
  lista = ^nodoLista;
  nodoLista = record
    dato: datoLista;
    sig: lista;
  end;
  
  
 
 procedure inicializarVector (var v: vector);
 var i: integer;
 begin
  for i:= 1 to 5 do begin
    v[i].id := i;
    v[i].a:= nil;
  end;
 end;
 
 procedure leerEsquina (var e: esquina);
 begin
   e.av:= Random (100) + 1;
   e.ca:= Random (100) + 1;
 end;

 procedure leerMensaje (var m: msj);
 begin
   m.id:= Random (5) + 1;
   m.flo:= Random (11);
   m.pap:= Random (11);
   leerEsquina(m.esq)
 end;
 
 procedure asignar(var m2: msj2; m: msj);
 begin
   m2.flo:= m.flo;
   m2.pap:= m.pap;
   m2.esq:= m.esq;
 end;
 
 procedure cargarArbol (var a: arbol; m: msj2);
 begin
   if (a= nil) then begin
     new (a);
     a^.hd:= nil;
     a^.hi:= nil;
     a^.dato:= m;
   end
   else if (m.esq.av <= a^.dato.esq.av)then cargarArbol(a^.hi,m)
        else if (m.esq.av > a^.dato.esq.av) then cargarArbol(a^.hd,m);
 
 end;
 
 procedure procesarDatos (var v: vector);
 var cant: integer; m: msj; m2: msj2;
 begin
   inicializarVector(v);
   cant:=0;
   leerMensaje(m);
   while (cant < 100) do begin
     asignar(m2,m);
     cargarArbol(v[m.id].a,m2);
     cant:= cant + 1;
     leerMensaje(m);
   end
 end;
 
 procedure imprimirArbol (a: arbol);
 begin
   if (a<> nil) then begin
     imprimirArbol(a^.hi);
     writeln('Avenida : ', a^.dato.esq.av, ' Calle: ', a^.dato.esq.ca, ' Flores: ' , a^.dato.flo , ' Papeles: ' , a^.dato.pap);
     imprimirArbol(a^.hd);
   end
 end;
 
 procedure imprimirVector (v: vector);
 var i: integer;
 begin
   for i:= 1 to 5 do begin
     writeln('Mensajes del robot de id ' , v[i].id, ' : ');
     imprimirArbol(v[i].a);
   end;
 end;
 
 procedure sumarFlores (var flo: integer; flo2: cants);
  begin
    flo:= flo + flo2;
  end;
  
  procedure evaluarPapeles (var cant: integer;pap: integer);
  begin
    if (pap = 0) then cant:= cant + 1;
  end;
  
  procedure insertarOrdenado (var l: lista; m: msj2 );
  var nue,act,ant: lista;
  begin
    new (nue); 
    act := l;
    while (act <> nil) and (act^.dato.av < m.esq.av) do begin
      ant:= act;
      act:= act^.sig
    end;
    if (act^.dato.av = m.esq.av) then begin
      sumarFlores(act^.dato.flo, m.flo);
      evaluarPapeles(act^.dato.sinPap, m.pap);
     end
    else 
      nue^.dato.av:= m.esq.av;
      nue^.dato.flo:= m.flo;
      nue^.dato.sinPap:= 0;
      evaluarPapeles(nue^.dato.sinPap, m.pap);
      if (act = l) then
        l:= nue
      else
        ant^.sig:= nue;
      nue^.sig:= act;
  end;
  
  procedure evaluarArbol(var l: lista; a: arbol);
  begin
    if (a<> nil) then begin
      evaluarArbol(l,a^.hi);
      insertarOrdenado(l,a^.dato);
      evaluarArbol(l,a^.hd);
    end;
  end;
  
  procedure pasarVectorAlista (var l: lista; v: vector);
  var i: integer;
  begin
    l:= nil;
    for i:= 1 to 5 do begin
      evaluarArbol(l,v[i].a);
    end
  end;
  
  procedure imprimirLista (l: lista);
  begin
    writeln('----------------');
    writeln;
    writeln;
    writeln('Lista del inciso B ');
    while (l<> nil) do begin
      writeln('Avenida ' : l^.dato.av, ' Flores juntadas: ' , l^.dato.flo , ' Esquinas sin papeles: ' , l^.dato.sinPap);
      l:= l^.sig;
    end;
  end;
 
 
var v: vector; l: lista;
begin
  Randomize;
  procesarDatos(v);
  imprimirVector(v);
  pasarVectorAlista(l,v);
  imprimirLista(l);
  
end.
