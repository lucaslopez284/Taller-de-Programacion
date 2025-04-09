program ej3prac3;

type
  dias = 1..31;
  meses = 1..12;
  notas = 1..10;
  fecha = record
    dia : dias;
    mes : meses;
   end;
  examen = record
    legajo: integer;
    codmateria: integer;
    fec:fecha;
    nota: notas;
  end;
  
  examen2 = record
    codmateria: integer;
    fec:fecha;
    nota: notas;
  end;
  
  lista =^nodo;
  nodo = record
    dato: examen2;
    sig: lista;
  end;
  
  datoArbol = record
    legajo: integer;
    lis: lista;
  end;
  
  arbol =^nodoArbol;
  nodoArbol = record
    dato: datoArbol;
    hi: arbol;
    hd: arbol;
  end;
  
  datoLista2 = record
    promedio: real;
    legajo: integer;
  end;
  
  lista2 = ^nodolista2;
  nodoLista2 = record
    dato: datoLista2;
    sig: lista2;
  end;
  
  procedure leerFecha (var f: fecha) ;
  begin
    f.dia:= Random(31) + 1;
    f.mes:= Random(12) + 1;
  end;
  
  procedure leerFinal (var e: examen);
  begin
    e.legajo:= Random(25);
    leerFecha(e.fec);
    e.codmateria:= Random (50) + 10;
    e.nota:= Random (10) + 1;
  end;
  
  procedure agregarAdelante(var l : lista; e:examen2);
  var nue: lista;
  begin
    new(nue);
    nue^.dato:= e;
    nue^.sig:= l;
    l:= nue;
  end;
  
  procedure asignar(var e2: examen2; e: examen);
  begin
    e2.nota:= e.nota;
    e2.codmateria:= e.codmateria;
    e2.fec:= e.fec;
  end;
  
  procedure cargarArbol(var a: arbol; e: examen);
  var
    e2: examen2;
  begin
    if (a= nil) then begin
      new (a);
      a^.dato.legajo:= e.legajo;
      asignar(e2,e);
      a^.dato.lis:= nil;
      agregarAdelante(a^.dato.lis,e2);
      a^.hi:= nil;
      a^.hd:= nil;
    end
    else if (a^.dato.legajo = e.legajo) then begin
             asignar(e2,e);
             agregarAdelante(a^.dato.lis,e2);
          end
          else if (e.legajo < a^.dato.legajo) then
                  cargarArbol(a^.hi,e)
               else cargarArbol(a^.hd,e);
  end;
         
  procedure procesarDatos(var a: arbol);
  var 
    e: examen;
  begin 
    a:= nil;
    repeat
      leerFinal(e);
      cargarArbol(a,e);
    until (e.legajo = 0);
    end;
    
  procedure imprimirFecha (f: fecha);
  begin
    write('Dia ' , f.dia , ' Mes ' , f.mes);
  end;
  procedure imprimirLista(l: lista);
  begin
    while (l<> nil) do begin
      imprimirFecha(l^.dato.fec);
      writeln(' Nota: ' , l^.dato.nota , ' Materia: ' , l^.dato.codmateria );
      l:= l^.sig;
    end;
  end;
  
  Procedure imprimirArbol(a:arbol);
  begin
    if(a<> nil) then begin
      imprimirArbol(a^.hi);
      writeln(' Lista del alumno de legajo ' , a^.dato.legajo);
      imprimirLista(a^.dato.lis);
      imprimirArbol(a^.hd);
    end;
  end;
  
  function esONo (n: notas) : boolean;
  var resto: integer;
  begin
    resto:= n mod 2;
    if (resto = 1) then
       esONo:= true
    else esOno:= false;
  end;
  
  function cantAlumnos(a: arbol) : integer;
  var imp: boolean;
  begin
    if (a = nil) then cantAlumnos:= 0
    else begin 
         imp:= esONo(a^.dato.legajo);
         if (imp = true) then 
           cantAlumnos:= 1 + cantAlumnos(a^.hi) + cantAlumnos(a^.hd)
         else cantAlumnos:= 0 + cantAlumnos(a^.hi) + cantAlumnos(a^.hd);
     end;
  end;
  
  function cantAprobados (l: lista): integer;
  var cant: integer;
  begin
    cant:= 0;
    while (l<> nil) do begin
      if(l^.dato.nota > 3) then
        cant:= cant + 1;
      l:= l^.sig
    end;
   cantAprobados:= cant;   
  end;
  
  procedure aprobados (a: arbol);
  begin
    if (a<> nil) then begin
      aprobados(a^.hi);
      writeln('La cantidad de finales aprobados del alumno ' , a^.dato.legajo , ' es ' , cantAprobados(a^.dato.lis));
      aprobados(a^.hd);
    end;
  end;
  
  function promedio(l: lista) : real;
  var total: real;cant: integer; 
  begin
    cant:= 0;
    total:= 0;
    while (l<> nil) do begin
      cant:= cant + 1;
      total:= total + l^.dato.nota;
      l:= l^.sig;
    end;
    promedio:= total/cant;
  end; 
  
  procedure agregarAdelante2(var l : lista2; d:datoLista2);
  var nue: lista2; 
  begin
    new(nue);
    nue^.dato:= d;
    nue^.sig:= l;
    l:= nue;
  end;
  
  procedure mayoresParte1 (var lis2: lista2;a: arbol; n: real);
  var prom: real;
      info: datoLista2;
  begin
    if (a<>nil) then begin
      mayoresParte1(lis2,a^.hi,n);
      prom:= promedio(a^.dato.lis);
      if (prom > n) then begin
        info.promedio:= prom;
        info.legajo:= a^.dato.legajo;
        agregarAdelante2(lis2,info);
      end;
      mayoresParte1(lis2,a^.hd,n);
    end;
  end; 
  
 procedure imprimirMayores (l: lista2);
 begin
   while (l<> nil) do begin
     writeln('El promedio del alumno de legajo ' , l^.dato.legajo , ' es ' , l^.dato.promedio:2:2);
     l:= l^.sig;
   end;
 end;
 procedure mayores (var l:lista2; a: arbol; n: real);
 begin
   mayoresParte1(l,a,n);
   imprimirMayores(l);
 
 end;
var
  a: arbol; n: integer; lis2: lista2;
begin
  Randomize;
  procesarDatos(a);
  imprimirArbol(a);
  writeln('La cantidad de alumnos con legajo impar es ' , cantAlumnos(a));
  aprobados(a);
  writeln('Ingrese un numero para comparar ' );
  readln(n);
  lis2:= nil;
  mayores(lis2, a,n);
end.
