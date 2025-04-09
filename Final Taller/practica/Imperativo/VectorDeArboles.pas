program jjj;

type
  rubros = 1..10;
  producto = record
    cod: integer;
    rubro: rubros;
    stock: integer;
    precio: real;
  end;
  
  producto2 = record
    cod: integer;
    stock: integer;
    precio: real;
  end;
  
  arbol = ^nodo;
  nodo = record
    dato: producto2;
    hd: arbol;
    hi: arbol;
  end;
  
  vector = array [rubros] of arbol;
  
  procedure leerProducto(var p: producto);
  begin
    p.cod:= Random (100);
    if (p.cod <> 0) then begin
      p.rubro:= Random (10) + 1;
      p.stock:= Random (20) + 1;
      p.precio:= (Random (100) + 20) / (Random (10) + 5);
    end;
  end;
  
  procedure inicializar (var v: vector);
  var i: rubros;
  begin
    for i:= 1 to 10 do 
      v[i]:= nil;
  end;
  
  procedure asignar (var p2: producto2; p: producto);
  begin
    p2.cod:= p.cod;
    p2.stock:= p.stock;
    p2.precio:= p.precio;
  end;
  
  procedure cargarArbol (var a: arbol; p: producto2);
  begin
    if (a = nil) then begin
      new (a);
      a^.dato:= p;
      a^.hi:= nil;
      a^.hd:= nil;
    end
    else if (p.cod <= a^.dato.cod) then cargarArbol(a^.hi,p)
         else cargarArbol(a^.hd,p);
  end;
  
  procedure cargarDatos (var v: vector);
  var p: producto ; p2: producto2;
  begin
    inicializar(v);
    leerProducto(p);
    while (p.cod <> 0) do begin
      asignar(p2,p);
      cargarArbol(v[p.rubro],p2);
      leerProducto(p);
    end;
  end;
  
  procedure imprimirProducto (p: producto2);
  begin
    writeln('Codigo: ' , p.cod , ' Stock: ' , p.stock , ' Precio: ' , p.precio:2:2);
  end;
  
  procedure imprimirArbol (a: arbol);
  begin
    if (a <> nil) then begin
      imprimirArbol(a^.hi);
      imprimirProducto(a^.dato);
      imprimirArbol(a^.hd);
    end;
  end;
  
  procedure imprimirDatos(v: vector);
  var i: rubros;
  begin
    for i:= 1 to 10 do begin
      writeln('Arbol del rubro ' , i , ' : ');
      imprimirArbol(v[i])
    end;
  end;
  
  function busquedaCodigo (a: arbol; c: integer): boolean;
  begin
    if (a = nil)then busquedaCodigo:= false
    else if (c = a^.dato.cod) then busquedaCodigo:= true
         else if (c < a^.dato.cod) then busquedaCodigo:= busquedaCodigo(a^.hi,c)
              else busquedaCodigo:= busquedaCodigo(a^.hd,c);
  end; 
  
  procedure mayorCodigo (a: arbol; var cod: integer; var st: integer);
  begin
    if (a<> nil) then 
      if (a^.hd = nil) then begin
         cod:= a^.dato.cod;
         st:= a^.dato.stock;
      end
      else mayorCodigo(a^.hd,cod,st);
  end;
  
  procedure mayoresCodigosPorRubro (v: vector);
  var cod,st,i: integer;
  begin
    for i:= 1 to 10 do begin
      cod:= 0; 
      st:= 0;
      mayorCodigo(v[i],cod,st);
      writeln('El codigo de producto mayor del rubro ' , i, ' es ' , cod , ' con stock de ' , st , ' unidades');
   end;   
  end;
  
  function entreCodigos (a: arbol;c1: integer;c2: integer): integer;
  begin
    if (a = nil) then entreCodigos:= 0
      else if ((c1 < a^.dato.cod) and (c2 > a^.dato.cod))then entreCodigos:= 1 + entreCodigos(a^.hi,c1,c2) + entreCodigos(a^.hd,c1,c2)
           else if (c1 >= a^.dato.cod) then entreCodigos:= entreCodigos(a^.hd,c1,c2)
                else entreCodigos:= entreCodigos(a^.hi,c1,c2);
  end;
  
  procedure entreCodigosPorRubro (v: vector; c1: integer; c2: integer);
  var i: rubros ;cant: integer;
  begin
    for i:= 1 to 10 do begin;
      cant:= entreCodigos(v[i],c1,c2);
      writeln('La cantidad de productos dentro del rubro ' , i , ' con codigo entre ' , c1 , ' y ' , c2 , ' es ' , cant);
    end;
  end; 
  
var v: vector; c,c1,c2: integer; r: rubros;
begin
  Randomize;
  writeln('-------------INCISO A -------------------');
  cargarDatos(v);
  imprimirDatos(v);
  writeln('-------------INCISO B -------------------');
  writeln('Ingrese codigo');
  readln(c);
  writeln('Ingrese rubro');
  readln(r);
  if (busquedaCodigo(v[r],c) )then writeln('El codigo ' , c , ' se encuentra en el rubro ' , r)
  else writeln('El codigo ' , c , ' no se encuentra en el rubro ' , r);
  
  writeln('-------------INCISO C -------------------');
  mayoresCodigosPorRubro(v);
  writeln('-------------INCISO D -------------------');
  writeln('Ingrese un primer codigo');
  readln(c1);
  writeln('Ingrese un segundo codigo, mayor al anterior');
  readln(c2);
  entreCodigosPorRubro(v,c1,c2);
  readln;
end.
