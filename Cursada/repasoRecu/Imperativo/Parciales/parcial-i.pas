program parcialI;

const
  dimf = 7; 
type
  subrango = 1..7; 
  
  alquiler = record
    dniCli: integer;
    chasis: integer;
    dias: subrango;
  end;
  
  lista =^nodoL;
  nodoL = record
    dato: integer;
    sig: lista;
  end;
  
  datoArbol = record
    lis: lista;
    cant: integer ;
    chasis: integer;
  end;
  
  arbol = ^nodo;
  nodo = record
    dato: datoArbol;
    hi: arbol;
    hd: arbol;
  end;
  
 
  
  vector = array [subrango] of arbol;
  
  procedure inicializar (var v: vector);
  var i: subrango;
  begin
    for i:= 1 to dimf do
      v[i]:= nil;
  end;
  
  procedure leerAlquiler (var a: alquiler);
  begin
    a.chasis:= Random (1000);
   if (a.chasis <> 0) then begin
     a.dias:= Random (7) + 1;
     a.dniCli:= Random (10) + 4000;
   end;
  end;
  
  procedure agregarAdelante (var l: lista; dni: integer);
  var nue: lista;
  begin
    new (nue);
    nue^.dato:= dni;
    nue^.sig:= l;
    l:= nue;
  end;
  
  procedure cargarArbol (var a: arbol; alq: alquiler) ;
  begin
    if (a = nil) then begin
      new (a);
      a^.dato.chasis:= alq.chasis;
      a^.dato.cant:= 1;
      a^.dato.lis:= nil;
      agregaradelante (a^.dato.lis, alq.dniCli);
      a^.hi:= nil;
      a^.hd:= nil;
    end
    else if (a^.dato.chasis = alq.chasis) then begin
           a^.dato.chasis:= a^.dato.cant + 1;
           agregaradelante (a^.dato.lis, alq.dniCli);
          end
          else if (alq.chasis < a^.dato.chasis ) then cargarArbol(a^.hi,alq)
               else cargarArbol(a^.hd,alq);
          
  end;
  
  procedure procesarDatos (var v: vector);
  var alq: alquiler;
  begin
    inicializar(v);
    leerAlquiler(alq);
    while (alq.chasis <> 0) do begin
      cargarArbol(v[alq.dias], alq);
      leerAlquiler(alq);
    end;
  end;
  
  procedure imprimirLista(l: lista);
  begin
    while (l<> nil) do begin
      writeln('Dni del cliente ' , l^.dato);
      l:= l^.sig;
    end;
  end;
  
  procedure imprimirArbol (a: arbol);
  begin
    if (a<> nil) then begin
       imprimirArbol(a^.hi);
       writeln('Numero de chasis:  ' , a^.dato.chasis , ' cantidad de alquileres: ' , a^.dato.cant);
       imprimirLista (a^.dato.lis);
       imprimirArbol(a^.hd);
    end;
  end;
  
  procedure imprimirTodo (v: vector);
  var i: subrango;
  begin
    for i:= 1 to dimf do begin
      writeln('Alquileres de duracion de ' , i , ' dias ');
      imprimirArbol(v[i]);
    end;
  end;
  
  function busqueda (l: lista; dni: integer): integer;
  var cant: integer;
  begin
    cant:= 0;
    while (l<> nil) do begin
      if (l^.dato = dni) then
        cant:= cant + 1;
      l:= l^.sig;
    end;
    busqueda:= cant;
  end;
  
  function cantDia (a: arbol; dni: integer): integer;
  begin
    if (a= nil) then cantDia:= 0
    else cantDia:= busqueda(a^.dato.lis,dni) + cantDia(a^.hi,dni) + cantDia(a^.hd,dni)
  end;
  
  function cantidadDNI (v: vector; dni: integer): integer;
  var aux: integer; i: subrango;
  begin
    aux:= 0;
    for i:= 1 to dimf do 
      aux:= aux + cantDia (v[i],dni);
    cantidadDNI:= aux;
  end; 
  
  function cantidadEntre(a: arbol; cha1: integer; cha2: integer): integer;
  begin
    if (a= nil) then cantidadEntre:= 0
    else if (a^.dato.chasis >= cha1 ) and (a^.dato.chasis <= cha2) then
             cantidadEntre:= a^.dato.cant + cantidadEntre(a^.hi,cha1,cha2) + cantidadEntre(a^.hd,cha1,cha2)
          else if (a^.dato.chasis < cha1) then cantidadEntre:= cantidadEntre(a^.hd,cha1,cha2)
               else cantidadEntre:= cantidadEntre(a^.hi,cha1,cha2);
  end;
   
 
  
var v: vector; dni: integer; cha1, cha2, cant: integer;
begin
  Randomize;
  writeln('-------------- Inciso A -------------');
  procesarDatos(v);
  imprimirTodo(v);
  writeln('-------------- Inciso B -------------');
  writeln('Ingrese dni ');
  readln(dni);
  writeln('La cantidad de alquileres realizados por el dni ' , dni , ' es ' , cantidadDNI(v,dni));
  writeln('-------------- Inciso C -------------');
  writeln('Ingrese chasis 1 ');
  readln(cha1);
  writeln('Ingrese chasis 2 ');
  readln(cha2);
  readln;
  writeln('Ingrese una cantidad de dias');
  readln(cant);
  writeln('La cantidad de alquileres realizados con numero de chasis entre ' ,  cha1  , ' y ' ,  cha2  , ' es ' , cantidadEntre(v[cant],cha1,cha2));
  readln();
end.


 procedure seleccion (var v: vector ; diml: integer);
 var i,j,pos,item: integer;
 begin
   for i:= i to (diml - 1) do begin
     pos:= i;
     for j:= i + 1 to diml do
       
 
 end;
