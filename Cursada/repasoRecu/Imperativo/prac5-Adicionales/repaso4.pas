program repaso4; 

type
  
  reclamo = record
    cod: integer;
    dni: integer;
    anio: integer;
    tipo: integer;
    
  end;
  
  reclamo2 = record
    cod: integer;
    anio: integer;
    tipo: integer;
    
  end;
  
  lista =^nodolista;
  nodolista= record
    dato: reclamo2;
    sig: lista;
    
  end;
  
  lista2 =^nodolista2;
  nodolista2= record
    dato: integer;
    sig: lista2;
    
  end;
  
  datoArbol = record
    dni: integer;
    cant: integer;
    lis: lista
  end;
  
  arbol = ^nodo;
  nodo = record
    dato:datoArbol;
    hi: arbol;
    hd: arbol;
  end;
  
   
  
  procedure leerReclamo (var r: reclamo);
  begin
    r.cod:= Random (1000);
    if (r.cod<> 0) then begin
       r.dni:= Random (50) + 4300;
       r.anio:= 2000 + Random (25);
       r.tipo:= Random(5) + 1;
    end;
  end;
  
  procedure asignar(var r2: reclamo2; r: reclamo);
  begin
    r2.tipo:= r.tipo;
    r2.cod:= r.cod;
    r2.anio:= r.anio;
  end;
  
  procedure agregarAdelante (var l: lista; r2: reclamo2);
  var nue: lista;
  begin
    new (nue);
    nue^.dato:= r2;
    nue^.sig:= l;
    l:= nue;
  end;
  
  procedure agregarAdelante2 (var l: lista2; cod: integer);
  var nue: lista2;
  begin
    new (nue);
    nue^.dato:= cod;
    nue^.sig:= l;
    l:= nue;
  end;
  
  procedure cargarArbol (var a: arbol; r: reclamo);
  var r2: reclamo2;
  begin
    if (a= nil) then begin
      new (a);
      asignar(r2,r);
      a^.dato.lis:= nil;
      agregarAdelante(a^.dato.lis,r2);
      a^.dato.cant:= 1;
      a^.dato.dni:= r.dni;
      a^.hi:= nil;
      a^.hd:= nil;
    end
    else if (a^.dato.dni = r.dni) then begin
            a^.dato.cant:= a^.dato.cant + 1;
            asignar(r2,r);
            agregarAdelante(a^.dato.lis,r2);
          end
         else if(r.dni < a^.dato.dni) then cargarArbol(a^.hi,r)
              else cargarArbol(a^.hd,r);
  end;
  
  procedure procesarDatos(var a: arbol);
  var r: reclamo;
  begin
    a:= nil;
    leerReclamo(r);
    while(r.cod <> 0) do begin
      cargarArbol(a,r);
      leerReclamo(r);
    end;
  end;
  
  procedure imprimirLista (l: lista);
  begin
    while (l<> nil) do begin
      writeln('Codigo: ' , l^.dato.cod , ' Anio: ' , l^.dato.anio , ' Tipo: ' , l^.dato.tipo);
      l:= l^.sig;
    end;
  end;
  
  procedure imprimirDatos (a: arbol);
  begin
    if (a<> nil) then begin
      imprimirDatos(a^.hi);
      writeln('DNI: ' , a^.dato.dni , ' Cantidad de reclamos: ' , a^.dato.cant);
      writeln('Lista de reclamos ');
      imprimirLista(a^.dato.lis);
      imprimirDatos(a^.hd);
    end;
  end;
  
  function cantidad(a: arbol; dni: integer): integer;
  begin
    if (a = nil) then cantidad:= 0
    else if (a^.dato.dni = dni) then cantidad:= a^.dato.cant
         else if (dni < a^.dato.dni) then cantidad:= cantidad(a^.hi,dni)
              else cantidad:= cantidad(a^.hd,dni);
  end;
  
  function cantidadEntre(a: arbol; dni1: integer; dni2: integer): integer;
  begin
    if (a = nil) then cantidadEntre:= 0
    else if (a^.dato.dni > dni1) and (a^.dato.dni < dni2) then cantidadEntre:= a^.dato.cant + cantidadEntre(a^.hi,dni1,dni2) + cantidadEntre(a^.hd,dni1,dni2)
         else if (a^.dato.dni <= dni1) then cantidadEntre:= cantidadEntre(a^.hd,dni1,dni2)
              else cantidadEntre:= cantidadEntre(a^.hi,dni1,dni2);
  end;
  
  procedure busqueda (var l: lista2; lis: lista; anio: integer);
  var cod: integer;
  begin
    while (lis <> nil) do begin
      if (lis^.dato.anio = anio) then begin
        cod:= lis^.dato.cod;
        agregarAdelante2(l,cod);
      end;
      lis:= lis^.sig;
  end;
  end;
  
  procedure imprimirLista2(l: lista2; anio: integer);
  begin
    writeln('Lista de codigos de reclamos del anio ' , anio);
    while (l<> nil) do begin
      writeln('Codigo de producto ' , l^.dato);
      l:= l^.sig;
    end;
  end; 
  
  
  
  procedure cargarLista (var l: lista2; a: arbol; anio: integer);
  begin
    if (a<> nil) then begin
      cargarLista(l,a^.hi,anio);
      busqueda(l,a^.dato.lis,anio);
      cargarLista(l,a^.hi,anio);
  end;
 end;
   
  
var
 a: arbol; dni,dni1,dni2,anio: integer;
 l: lista2;

begin
  Randomize;
  writeln('-----------Inciso A------------');
  procesarDatos(a);
  imprimirDatos(a);
  writeln('-----------Inciso B------------');
  writeln('Inserte DNI');
  readln(dni);
  writeln('La cantidad de reclamos efectuados por el DNI ' , dni , ' es ' , cantidad(a,dni));
  writeln('-----------Inciso C------------');
  writeln('Inserte DNI');
  readln(dni1);
  writeln('Inserte DNI');
  readln(dni2);
  writeln('La cantidad de reclamos efectuados por el DNIS ' , ' entre ' , dni1 , ' y ' , dni2 , ' es ' , cantidadEntre(a,dni1,dni2));
  writeln('-----------Inciso D------------');
  writeln('Inserte anio');
  readln(anio);
  cargarLista (l,a,anio);
  imprimirLista2(l,anio);
  
end.
