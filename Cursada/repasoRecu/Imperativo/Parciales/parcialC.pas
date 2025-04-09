program parcialC;

type

 dias = 1..30;
 envio = record
  codcli: integer;
  dia: dias;
  peso: real;
  postal: integer;
 end;
 
 resumen = record
  codcli: integer;
  dia: dias;
  peso: real;
 end; 
  
 lista = ^nodolista;
 nodolista = record
  dato: resumen;
  sig: lista;
 end;
 
 datoArbol = record
   postal: integer;
   lis: lista;
 end;
 
 arbol = ^nodo;
 nodo = record
   dato: datoArbol;
   hi: arbol;
   hd: arbol;
 end; 
  
  procedure leerEnvio (var e: envio);
  begin
    e.codcli:= Random(1000);
    if (e.codcli <> 0) then begin
      e.dia:= Random (30) + 1;
      e.peso:= Random (20000) / (Random (10) + 1);
      e.postal:= Random(100);
     end;
  end;
  
  procedure asignar (var aux: resumen; e: envio);
  begin
    aux.peso:= e.peso;
    aux.dia:= e.dia;
    aux.codcli:= e.codcli;
  end;
  
  procedure agregarAdelante (var l: lista; aux: resumen);
  var nue: lista;
  begin
    new(nue);
    nue^.dato:= aux;
    nue^.sig:= l;
    l:= nue;
  end;
  
  procedure agregarArbol(var a: arbol; e: envio);
  var aux: resumen;
  begin
    if (a = nil) then begin
      new(a);
      a^.dato.postal:= e.postal;
      asignar(aux,e);
      a^.dato.lis:= nil;
      agregarAdelante(a^.dato.lis,aux);
    end
    else if (e.postal = a^.dato.postal) then begin
         asignar(aux,e);
         agregarAdelante(a^.dato.lis,aux);
     end
         else if (e.postal < a^.dato.postal) then
                agregarArbol(a^.hi,e)
               else if (e.postal > a^.dato.postal) then
                        agregarArbol(a^.hd,e)
           
  end;
  
  procedure procesarDatos (var a: arbol);
  var e: envio;
  begin
    a:= nil;
    leerEnvio(e);
    while (e.codcli <> 0) do begin
      agregarArbol(a,e);
      leerEnvio(e);
     end;
  end;
  
  procedure imprimirNodoLista (aux: resumen);
  begin
    writeln('codigo cliente ' , aux.codcli , ' dia ' , aux.dia , ' peso ' , aux.peso:2:2);
  end;
  
  procedure imprimirLista (l: lista);
  begin
    while (l<> nil) do begin
      imprimirNodoLista(l^.dato);
      l:= l^.sig;
    end;
  end;
  
  procedure imprimirArbol (a: arbol);
  begin
    if (a<> nil) then begin
      imprimirArbol(a^.hi);
      writeln('envios de la postal ' , a^.dato.postal);
      imprimirLista(a^.dato.lis);
      imprimirArbol(a^.hd);
    end;
  end;
  
  function incisoB (a: arbol; postal: integer): lista;
  begin
    if (a= nil) then
      incisoB:= nil
    else if (postal = a^.dato.postal) then
          incisoB:= a^.dato.lis
         else if (postal < a^.dato.postal) then
                incisoB:= incisoB(a^.hi,postal)
              else if(postal > a^.dato.postal) then
                       incisoB:= incisoB(a^.hd,postal);
      
  end; 
  
  procedure maximo (var max: integer; var pesomax: real; cliente: integer; peso: real);
  begin
    if (peso > pesomax) then begin
      pesomax:= peso;
      max:= cliente;
    end;
  end;
  
  procedure minimo (var min: integer; var pesomin: real; cliente: integer; peso: real);
  begin
    if (peso < pesomin) then begin
      pesomin:= peso;
      min:= cliente;
    end;
  end;
  
  procedure incisoC(l: lista; var min: integer; var max: integer; var pmin: real; var pmax: real);
  begin
    if (l<> nil) then begin
      minimo(min, pmin, l^.dato.codcli, l^.dato.peso);
      maximo(max, pmax, l^.dato.codcli, l^.dato.peso);
      incisoC(l^.sig, min,max,pmin,pmax);
   end;
  end;
var
 a: arbol; listaB: lista; pmin, pmax: real; min, max: integer;
 cod: integer;
begin
  Randomize;
  procesarDatos(a);
  writeln('------------Inciso A -------------');
  imprimirArbol(a);
  writeln('------------Inciso B -------------');
  writeln('inserte codigo a buscar ');
  readln(cod);
  listaB:= incisoB(a,cod);
  if (listaB <> nil) then
    imprimirLista(listaB)
  else 
    writeln(' no se encontro el codigo de postal ' , cod);
  writeln('------------Inciso C -------------');
  pmin:= 10000;
  pmax:= -1;
  incisoC(listaB, min, max, pmin, pmax);
  if (listaB = nil) then
    writeln(' la estructura esta vacia')
  else begin 
    writeln(' el codigo con menor peso fue ' , min);
    writeln(' el codigo de mayor peso fue ' , max);
  end;
end.
