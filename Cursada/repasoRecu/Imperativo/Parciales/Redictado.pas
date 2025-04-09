program redictado;
type
  sucursales = 1..5;
  
  venta = record
    cod: integer;
    dniCli: integer;
    sucursal: sucursales;
    monto: real;
  end;
  
  vector = array [sucursales] of real;
  
  datoArbol = record
   dni: integer;
   v: vector;
  end;
  
  arbol=^nodo;
  nodo = record
    dato: datoArbol;
    hi: arbol;
    hd: arbol;
  end;
  
  procedure inicializar (var v: vector);
  var i: sucursales;
  begin
    for i:= 1 to 5 do
      v[i]:= 0;
  end;
  
  procedure leerVenta(var v: venta);
  begin
    v.cod:= Random (50);
    if (v.cod<> 0) then begin
         v.dniCli:= Random (10) + 4000;
         v.monto:= (Random (600) + 25) / (Random (10) + 1);
         v.sucursal:= Random (5) + 1;
    end;
  end;
  
  procedure cargarVector (var v : vector; n: sucursales; monto: real);
  begin
    v[n]:= v[n] + monto;
  end;
  
  procedure cargarArbol (var a: arbol; ven: venta);
  begin
    if (a= nil) then begin
      new (a);
      a^.dato.dni:= ven.dniCli;
      inicializar(a^.dato.v);
      cargarVector(a^.dato.v, ven.sucursal, ven.monto);
      a^.hi:= nil;
      a^.hd:= nil;
    end
    else if (a^.dato.dni = ven.dniCli) then cargarVector(a^.dato.v, ven.sucursal, ven.monto)
          else if (ven.dniCli < a^.dato.dni) then cargarArbol(a^.hi,ven)
               else cargarArbol(a^.hd,ven);
  end;
  
  procedure procesarDatos (var a: arbol);
  var ven: venta;
  begin
    a:= nil;
    leerVenta(ven);
    while (ven.cod <> 0) do begin
        cargarArbol(a,ven);
        leerVenta(ven);
     end;
  end;
  
  procedure imprimirVector (v: vector);
  var i: sucursales;
  begin
    for i:= 1 to 5 do 
      writeln('El monto gastado en la sucursal ' , i , ' es ' , v[i]:2:2);
  end;
  
  procedure imprimirArbol (a: arbol);
  begin
    if (a<> nil) then begin
      imprimirArbol(a^.hi);
      writeln('Cliente de DNI ' , a^.dato.dni);
      imprimirVector(a^.dato.v);
      imprimirArbol(a^.hd);
    end;
  end;
  
  function valido (v: vector; sucu: sucursales): boolean;
  begin
    if (v[sucu] = 0) then valido:= true
    else valido:= false;
  end;
  
  function cantidad (a: arbol; sucu: sucursales): integer ;
  begin
    if (a = nil) then cantidad:= 0
    else if (valido (a^.dato.v, sucu)) then cantidad:= 1 + cantidad(a^.hi,sucu) + cantidad(a^.hd,sucu)
         else cantidad:= cantidad(a^.hi,sucu) + cantidad(a^.hd,sucu);
  end;
   
  function contarVector (v: vector): real;
  var i: sucursales; aux: real;
  begin
    aux:= 0;
    for i:= 1 to 5 do 
      aux:= aux + v[i];
    contarVector:= aux;
  end;
  
  function montoTotal (a: arbol; dni: integer): real;
  begin
    if (a= nil) then montoTotal:= 0
    else if (a^.dato.dni = dni) then montoTotal:= contarVector(a^.dato.v)
         else if (dni < a^.dato.dni) then montoTotal:= montoTotal(a^.hi,dni)
              else montoTotal:= montoTotal(a^.hd,dni);
  end;
  
var a: arbol; sucu: sucursales; dni: integer;
begin
  Randomize;
  writeln('--------------Inciso A------------');
  procesarDatos(a);
  imprimirArbol(a);
  
  writeln('--------------Inciso B------------');
  writeln('Ingrese un numero de sucursal de 1 a 5');
  readln(sucu);
  writeln('La cantidad de clientes que gastaron 0 en la sucursal ' , sucu , ' es ' , cantidad(a,sucu));
  
  writeln('--------------Inciso C------------');
  writeln('Ingrese un numero de DNI');
  readln(dni);
  writeln('El monto total gastado por el cliente de DNI ' , dni , ' es ' , montoTotal(a,dni):2:2);
end.
