program finalDiciembre;

type 


  
  vehiculo = record
    patente: String;
    marca: string;
    fabricacion: integer;
    color : String;
    dniPro: integer;
  end;
  
  arbol = ^nodo;
  nodo = record
    dato: vehiculo;
    hd: arbol;
    hi: arbol;
  end;
  
  lista= ^nodoLista;
  nodoLista = record
    dato: vehiculo;
    sig: lista;
  end;
  
  procedure leerVehiculo(var v: vehiculo);
  var colores : array [1..4] of String =('rojo', ' azul', 'blanco', 'negro');
      marcas :array [1..4] of String =('ferrari', ' audi', 'toyota', 'subaru');
  begin
    writeln('--------------------------------');
    writeln('Ingrese Patente');
    readln(v.patente);
    if (v.patente <> 'ZZZ') then begin
       v.marca:= marcas[Random (4)+ 1];
       v.fabricacion:= Random (20) + 2006;
       v.color:= colores[Random (4)+ 1];
       v.dniPro:= Random (350) + 4200;
    end;
    writeln('--------------------------------');
    writeln;
  end;
  
  
  procedure cargarArbol (var a: arbol; v: vehiculo);
  begin
    if (a = nil) then begin
      new (a);
      a^.hd:= nil;
      a^.hi:= nil;
      a^.dato:= v;
    end
    else if (v.dniPro <= a^.dato.dniPro) then cargarArbol(a^.hi,v)
         else cargarArbol(a^.hd,v);
  end;
  
  procedure cargarDatos (var a: arbol);
  var v: vehiculo;
  begin
    a:= nil;
    leerVehiculo(v);
    while (v.patente <> 'ZZZ') do begin
      cargarArbol(a,v);
      leerVehiculo(v);
   end;
  end;
  
  procedure imprimirVehiculo (v: vehiculo);
  begin
    writeln('Dni: ' , v.dniPro, ' , patente: ' , v.patente , ' , marca: ', v.marca , ', fabricado en: ' , v.fabricacion, ' , color: ' , v.color);
  end;
  
  procedure imprimirArbol (a: arbol);
  begin
   if(a<> nil) then begin
    imprimirArbol(a^.hi);
    imprimirVehiculo(a^.dato);
    imprimirArbol(a^.hd);
   end;
  end; 
  
  function rango(a: arbol; an1: integer; an2: integer) : integer;
  begin
    if (a = nil) then rango:= 0
    else if (an1 <= a^.dato.fabricacion) and (an2 >= a^.dato.fabricacion) then rango:= 1 + rango(a^.hi,an1,an2) + rango(a^.hd,an1,an2) 
         else if (an1 > a^.dato.fabricacion) then rango:= rango(a^.hi,an1,an2)
              else rango:= rango(a^.hd,an1,an2)
  end; 
  
  procedure insertar(var l: lista; var ult: lista; dat: vehiculo) ;
  var nue: lista;
  begin
    new (nue);
    nue^.dato:= dat;
    nue^.sig:= nil;
    if (l = nil)then 
      l:= nue
    else 
      ult^.sig:= nue;
    ult:= nue;
  end;
  
  procedure recorrerArbol (a: arbol;d: integer; var l: lista; var ult: lista);
  begin
   if(a<> nil) then begin
      recorrerArbol(a^.hi,d,l,ult);
      if (a^.dato.dniPro < d)then begin
        insertar(l,ult,a^.dato);
       end;
      recorrerArbol(a^.hd,d,l,ult);
    end;
  end;
  
  procedure imprimirLista(l: lista);
  begin
    while (l<> nil) do begin
      imprimirVehiculo(l^.dato);
      l:= l^.sig;
    end;
  end;
  
  
  procedure inciso3(a: arbol; d: integer; var l: lista);
  var ult: lista;
  begin
    l:= nil;
    recorrerArbol(a,d,l,ult);
    if (l= nil) then writeln('lista vacia');
    imprimirLista(l);
  
  end;
    
  

var a:arbol; an1,an2,d: integer; l: lista;
begin
  writeln('----------------INCISO A----------------------');
  Randomize;
  cargarDatos(a);
  imprimirArbol(a);
  writeln;
  writeln('----------------INCISO B----------------------');
  writeln;
  writeln;
  writeln;
  writeln('Inserte anio ');
  readln(an1);
  writeln('Inserte otro anio ');
  readln(an2);
  writeln('La cantidad de vehiculos fabricados entre ', an1 , ' y ' , an2, ' es igual a ' , rango(a,an1,an2));
  writeln('----------------INCISO C----------------------');
  writeln;
  writeln;
  writeln;
  writeln('Inserte DNI ');
  readln(d);
  inciso3(a,d,l);
  
end.
