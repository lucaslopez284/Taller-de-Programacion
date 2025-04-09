program ej2;

type 
  lista =^nodo;
  nodo = record
    dato: integer;
    sig: lista;
  end;
  procedure agregarAdelante(var l: lista; n : integer);
  var
    nue: lista;
  begin
    new(nue);
    nue^.dato:= n;
    nue^.sig:= l;
    l:= nue;
  
  end;
  
  procedure cargarLista(var l: lista);
  var n: integer;
  begin
    n:= Random (101) + 100;
    if (n<> 100) then begin
      agregarAdelante (l,n);
      cargarLista(l);
    end;
  end;
  
  procedure imprimirLista (l: lista) ;
  begin
    if(l<> nil) then begin
      writeln('Numero ' , l^.dato);
      imprimirLista(l^.sig);
    end;
  end;
  
  procedure imprimirListaInversa (l: lista) ;
  begin
    if(l<> nil) then begin
      
      imprimirListaInversa(l^.sig);
      writeln('Numero ' , l^.dato);
    end;
  end;
    
  function minimo(l: lista; min: integer): integer;
  begin
    if (l<> nil) then begin
        if (l^.dato < min) then begin
          min:= l^.dato
        end;
        minimo:= minimo(l^.sig, min);
    end
    else 
      minimo:= min;
  end;
  
  function busqueda(l: lista; n: integer): boolean;
  begin
    if (l<> nil) then begin
        if (l^.dato = n) then begin
          busqueda := true;
        end
        else
          busqueda:= busqueda(l^.sig, n);
    end
    else busqueda:= false;
  end;
 
var
 l: lista; min, num: integer;
 esta: boolean;
begin
  l:= nil;
  Randomize;
  cargarLista(l);
  writeln('-------Lista en orden -------');
  imprimirLista(l);
  writeln('---------Lista en orden inverso ----------');
  imprimirListaInversa(l);
  writeln('----------Inciso D------------');
  min:= 250;
  min:= minimo(l,min);
  writeln('el valor minimo de la lista es ' , min);
  writeln('----------Inciso e------------');
  writeln('Inserte numero a buscar');
  readln(num);
  esta:= busqueda(l,num);
  if (esta) then
    writeln('El numero ' , num , ' se encuentra en la lista')
  else
    writeln('El numero ' , num , ' no se encuentra en la lista');
end.
