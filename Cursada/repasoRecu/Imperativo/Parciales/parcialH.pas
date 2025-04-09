program parcialH;
type 
  sucursales = 1..10;
  venta = record
    dniCli: integer;
    sucursal: sucursales;
    factura: integer;
    monto: real;
  end;
  
  venta2 = record
    factura: integer;
    monto: real;
  end;
  
  lista =^nodo;
  nodo = record
    dato: venta2;
    sig: lista;
  end;
  
  datoArbol = record
     dniCli: integer;
     lis: lista;
  end;
  
  arbol=^nodoArbol;
  nodoArbol = record
    dato: datoArbol;
    hi: arbol;
    hd: arbol;
  end;
  
  vector = array [sucursales] of integer;
  
  procedure inicializar (var v: vector);
  var i: integer;
  begin
    for i:= 1 to 10 do
      v[i]:= 0;
  end;
  
  procedure leerVenta (var v: venta);
  begin
    v.dniCli:= Random (100);
    if (v.dniCli <> 0) then begin
      v.sucursal:= Random (10) + 1;
      v.factura:= Random (5000) ;
      v.monto:= (Random (250) + 10) / (Random (8) + 1);
   end;
  end;
  
  procedure agregarAdelante (var l: lista; v2: venta2);
  var nue: lista;
  begin
    new (nue);
    nue^.dato:= v2;
    nue^.sig:= l;
    l:= nue;
  end;
  
  procedure asignar (var v2:venta2; v: venta);
  begin
    v2.factura:= v.factura;
    v2.monto:= v.monto;
  end;
  
  procedure cargarArbol (var a: arbol; v: venta);
  var v2: venta2;
  begin
    if (a= nil) then begin
      new (a);
      a^.dato.dniCli:= v.dniCli; 
      asignar(v2,v);
      a^.dato.lis:= nil; 
      agregarAdelante(a^.dato.lis,v2);
      a^.hi:= nil;
      a^.hd:= nil;
    end
    else if (a^.dato.dniCli = v.dniCli) then begin
           asignar(v2,v);
           agregarAdelante(a^.dato.lis,v2);
         end
         else if(v.dniCli < a^.dato.dniCli) then cargarArbol(a^.hi,v)
              else cargarArbol(a^.hd,v);
  end;
  
  procedure cargarVector (var v: vector ; n: integer);
  begin
    v[n]:= v[n] + 1
  end;
  
  procedure procesarDatos (var a: arbol; var v: vector);
  var ven: venta;
  begin
    a:= nil;
    inicializar(v);
    leerVenta(ven);
    while (ven.dniCli<> 0) do begin
      cargarArbol(a,ven);
      cargarVector(v,ven.sucursal);
      leerVenta(ven);
    end;
   end;
   
  procedure imprimirLista (l: lista);
  begin
    while (l<> nil) do begin
      writeln('Factura: ' ,  l^.dato.factura , ' Monto: ' , l^.dato.monto:2:2);
      l:= l^.sig;
     end;
  end;
  
  procedure imprimirArbol (a: arbol);
  begin
    if (a<> nil) then begin
        imprimirArbol(a^.hi);
        writeln('Lista del dni: ' , a^.dato.dniCli);
        imprimirLista(a^.dato.lis);
        imprimirArbol(a^.hd);
    end;
  end;
  
  procedure imprimirVector (v: vector);
  var i: sucursales;
  begin
    writeln('------------Vector----------');
    for i:= 1 to 10 do 
      writeln('La cantidad de ventas de la sucursal ' , i, ' fue ', v[i]);
  end;
   
  function sumar (l: lista; monto: real): integer;
  var cant: integer;
  begin
    cant:= 0; 
    while (l<> nil) do begin
      if (l^.dato.monto > monto) then
        cant:= cant + 1;
      l:= l^.sig;
    end; 
    sumar:= cant;
  end; 
  
  function cantidad(a: arbol; dni: integer; monto: real) : integer;
  begin
    if (a= nil) then cantidad:= 0
    else if (a^.dato.dniCli = dni) then cantidad:= sumar(a^.dato.lis, monto)
         else if (dni < a^.dato.dniCli) then cantidad:= cantidad(a^.hi,dni,monto)
              else cantidad:= cantidad(a^.hd,dni,monto)
  end;
  
  procedure mayorVentas (v: vector; var max: integer; var cod: integer; diml: integer);
  begin
    if (diml> 0) then begin
      if (v[diml] > max) then begin
         max:= v[diml];
         cod:= diml;
      end;
      mayorVentas(v,max,cod,diml-1);
   end;
  end;
 
  
var
  a: arbol; v: vector; dni,cod,max: integer; monto: real;
begin
  Randomize;
  writeln('----------Inciso A----------');
  procesarDatos(a,v);
  writeln('----------Arbol-----');
  imprimirArbol(a);
  imprimirVector(v);
  writeln('----------Inciso B-----------');
  writeln('Ingrese DNI');
  readln(dni);
  writeln('Ingrese monto');
  readln(monto);
  writeln('La cantidad de facturas del dni ' , dni , ' con monto superior a ', monto:2:2 , ' es ' , cantidad(a,dni,monto));
  writeln('----------Inciso C-----------');
  max:= 0;
  mayorVentas(v,max,cod,10);
  writeln('El codigo de sucursal con mayor cantidad de ventas es ', cod);
end.
    
  
