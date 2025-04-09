program repaso3;

type
  rubros = 1..10;
  
  producto = record
    codigo: integer;
    rubro: rubros;
    stock: integer;
    unitario: real;
  end;
  
  producto2 = record
    codigo: integer;
    stock: integer;
    unitario: real;
  end;
  
  arbol=^nodo;
  nodo= record
    dato: producto2;
    hi: arbol;
    hd: arbol;
  end;
  dato2 = record
    codigo: integer;
    stock: integer;
  end;
  
  vector = array [rubros] of arbol;
  vector2 = array [rubros] of dato2;
  vector3 = array [rubros] of integer;
  
  procedure inicializar (var v: vector);
  var i: integer;
  begin
    for i:= 1 to 10 do;
      v[i]:= nil;
  end;
  
  procedure leerProducto (var p: producto);
  begin
    p.codigo:= Random (50);
    if (p.codigo <> 0) then begin
      p.rubro:= Random (10) + 1;
      p.stock:= Random (30) + 1;
      p.unitario:= Random (1000) + 200 / Random (200);
    end;
  end;
  
  procedure asignar (var p2: producto2; p: producto);
  begin
    p2.codigo:= p.codigo;
    p2.stock:= p.stock;
    p2.unitario:= p.unitario;
  end;
  
  procedure cargarArbol(var a: arbol; p2: producto2);
  begin
    if (a = nil) then begin
       new(a);
       a^.dato:= p2;
       a^.hi:= nil;
       a^.hd:= nil;
    end
    else if(p2.codigo<= a^.dato.codigo) then
            cargarArbol(a^.hi,p2)
         else cargarArbol(a^.hd,p2);
  end;
  
  procedure procesarDatos (var v: vector);
  var p: producto; p2: producto2;
  begin
    inicializar(v);
    leerProducto(p);
    while (p.codigo<>0) do begin
       asignar(p2,p);
       cargarArbol(v[p.rubro],p2);
       leerProducto(p);
    end;
  end;
  
  procedure imprimirProducto(p: producto2);
  begin
    writeln('Codigo de Producto ' , p.codigo , ' Stock ' , p.stock, ' Unitario ' , p.unitario:2:2);
  end;
  
  procedure imprimirArbol (a: arbol);
  begin
    if (a<> nil) then begin
      imprimirArbol(a^.hi);
      imprimirProducto(a^.dato);
      imprimirArbol(a^.hd);
    end; 
  end;
  
  procedure imprimirDatos(v: vector);
  var i: integer;
  begin
    for i:= 1 to 10 do begin 
      writeln('Productos del rubro ' , i);
      imprimirArbol(v[i]);
    end;
  end;
  
  function buscarEnElArbol(a: arbol; cod: integer): boolean;
  begin
    if (a=nil) then  buscarEnElArbol:= false
    else if (a^.dato.codigo = cod) then buscarEnElArbol:= true
         else if (cod < a^.dato.codigo) then buscarEnElArbol:= buscarEnElArbol(a^.hi,cod)
              else buscarEnElArbol:= buscarEnElArbol(a^.hd,cod);
  end;
  
  
  function busqueda (v: vector; rubro: integer;cod: integer): boolean;
  var ok: boolean;
  begin
    ok:= buscarEnElArbol(v[rubro], cod);
    busqueda:= ok;
  end;
  
  procedure mayores (a: arbol; var cod: integer; var stock: integer);
  begin
    if (a <> nil) then begin
       if (a^.hd = nil) then begin
         cod:= a^.dato.codigo;
         stock:= a^.dato.stock; 
       end
       else mayores (a^.hd,cod,stock);
  end;
  end;
  
  procedure imprimirVector2(v: vector2);
  var j: integer;
  begin
    for j:= 1 to 10 do 
      writeln('Producto de mayor codigo del rubro ' , j , ' codigo: ' , v[j].codigo , ' stock ' , v[j].stock);
  end;
  
  procedure imprimirVector3(v: vector3; cod1: integer; cod2: integer);
  var j: integer;
  begin
    for j:= 1 to 10 do 
      writeln('La cantidad de productos del rubro ' , j , ' con numero de codigo entre ' , cod1 , ' y ' , cod2 , ' es ' , v[j]);
  end;  
  
  
  procedure mayorCodigo(v: vector; var v2: vector2);
  var cod, stock, i: integer;
      info: dato2;
  begin
    for i:= 1 to 10 do begin
      cod:= 0;
      stock:= 0;
      mayores(v[i], cod,stock);
      info.codigo:= cod;
      info.stock:= stock;
      v2[i]:= info;
    end;
    imprimirVector2(v2);
  end;
  
  function cantidad(a:arbol; cod1: integer; cod2: integer): integer;
  begin
    if (a= nil) then cantidad:= 0
    else if (a^.dato.codigo > cod1) and (a^.dato.codigo < cod2) then cantidad:= 1 + cantidad(a^.hi,cod1,cod2) + cantidad(a^.hd,cod1,cod2)
         else if (a^.dato.codigo <= cod1) then cantidad:= cantidad(a^.hd,cod1,cod2)
              else cantidad:= cantidad(a^.hd,cod1,cod2)
  end;
  
  procedure entreCodigos(v: vector; var v3: vector3; cod1: integer; cod2: integer);
  var i,cant: integer;
  begin
    for i:= 1 to 10 do begin
      cant:= cantidad(v[i],cod1,cod2);
      v3[i]:= cant;
    end;
    imprimirVector3(v3,cod1,cod2);
  end;
  
  

  
var
 v: vector; rubro, cod,cod1,cod2: integer; existe: boolean;
 v2: vector2; v3: vector3;
begin
  Randomize;
  writeln('Inciso A');
  procesarDatos(v);
  imprimirDatos(v);
  writeln('Inciso B');
 { writeln('Inserte un rubro ');
  readln(rubro);
  writeln('Inserte un codigo ');
  readln(cod);
  existe:= busqueda(v,rubro,cod);
  if (existe) then writeln('El codigo ' , cod, ' se encuentra en el rubro ' , rubro)
  else writeln('El codigo ' , cod, ' no se encuentra en el rubro ' , rubro);}
  mayorCodigo(v,v2);
  writeln('Inserte cod1 ');
  readln(cod1);
  writeln('Inserte cod2 ');
  readln(cod2);
  entreCodigos(v,v3,cod1,cod2);
  

end.
  
