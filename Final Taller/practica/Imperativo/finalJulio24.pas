program finaljulio;

type 
  importancias= 1..5;
  sectores= 1..50;
  
  llamada = record
    importancia : importancias;
    sector: sectores;
    empleados: integer;
  end;
  
  llamada2 = record
    sector: sectores;
    empleados: integer;
  end;
  
  arbol =^nodo;
  nodo = record
    dato: llamada2;
    hd: arbol;
    hi: arbol;
  end;
  
  vector = array [importancias] of arbol;
  contador = array [sectores] of integer;
  
  procedure leerLlamada (var l: llamada);
  begin
    l.importancia := Random (5) + 1;
    l.sector:= Random (50) + 1;
    l.empleados:= Random (10) + 1;
  end;
  
  procedure asignar (var l2: llamada2; l: llamada);
  begin
    l2.sector:= l.sector;
    l2.empleados:= l.empleados;
  end;
  
  procedure cargarArbol (var a: arbol; l: llamada);
  var l2: llamada2;
  begin
    if (a = nil) then begin 
      new (a);
      asignar(l2,l);
      a^.dato:= l2;
      a^.hd:= nil;
      a^.hi:= nil;
    end
    else if (l.sector <= a^.dato.sector) then cargarArbol(a^.hi,l)
         else cargarArbol(a^.hd,l);
  end;
  
  procedure inicializar (var v: vector);
  var i: importancias;
  begin
    for i:= 1 to 5 do
      v[i]:= nil;
  end;
  
  procedure cargarDatos (var v: vector);
  var i: integer; l:llamada;
  begin
    i:= 0;
    while (i< 100) do begin
       leerLlamada(l);
       cargarArbol(v[l.importancia],l);
       i:= i + 1;
    end;
  end;
  
  procedure imprimirNodo (l: llamada2);
  begin
    writeln('Sector ', l.sector, ' , empleados afectados ', l.empleados);
  end;
  
  procedure imprimirArbol (a: arbol);
  begin
    if (a<> nil) then begin
      imprimirArbol(a^.hi);
      imprimirNodo(a^.dato);
      imprimirArbol(a^.hd);
    end;
  end;
  
  procedure imprimirVector (v: vector);
  var i: importancias;
  begin
    for i:= 1 to 5 do begin
      writeln('Listado de llamadas del nivel de importancia ', i);
      imprimirArbol(v[i]);
    end;
  end;
  
  procedure cargarArbolNuevo (var a: arbol; l: llamada2);
  begin
    if (a = nil) then begin 
      new (a);
      a^.dato:= l;
      a^.hd:= nil;
      a^.hi:= nil;
    end
    else if (l.empleados <= a^.dato.empleados) then cargarArbolNuevo(a^.hi,l)
         else cargarArbolNuevo(a^.hd,l);
  end;
  
  procedure nuevaEstructura (var a2: arbol; a1: arbol);
  begin
    if (a1<> nil) then begin
      nuevaEstructura(a2,a1^.hi);
      cargarArbolNuevo(a2,a1^.dato);
      nuevaEstructura(a2,a1^.hd);
    end;
  end;
  
  procedure inicializarContador (var c: contador);
  var i: sectores; 
  begin
    for i:= 1 to 50 do 
      c[i]:= 0;
  end;
  
  procedure contabilizarEmpleados (var c: contador ;a: arbol);
  begin
    if (a<> nil) then begin
      contabilizarEmpleados(c,a^.hi);
      c[a^.dato.sector]:= c[a^.dato.sector] + a^.dato.empleados;
      contabilizarEmpleados(c,a^.hd);
    end;
  end;
  
  function mayor (c: contador): integer;
  var i: sectores; max,maxCant: integer;
  begin
    max:= 0;
    maxCant:= 0;
    for i:= 1 to 50 do begin
      if (c[i] > maxCant) then begin
        maxCant:= c[i];
        max:= i;
      end;
    end;
    mayor:= max;
  end;
  
  function sectorMaxEmpleados (var c: contador; a: arbol): integer;
  var maximo: integer;
  begin
    inicializarContador(c);
    contabilizarEmpleados(c,a);
    maximo:= mayor(c);
    sectorMaxEmpleados:= maximo;
  end;

var v: vector; a: arbol; n: importancias; c: contador; max: integer;
begin
  Randomize;
  writeln('------------INCISO A--------------');
  cargarDatos(v);
  imprimirVector(v);
  writeln('------------INCISO B--------------');
  writeln('Ingrese nivel de importancia');
  readln(n);
  a:= nil;
  nuevaEstructura(a,v[n]);
  imprimirArbol(a);
  writeln('------------INCISO C--------------');
  max:= sectorMaxEmpleados (c,a);
  writeln('El numero de sector con mayor cantidad de empleados afectados es ', max);
end.
