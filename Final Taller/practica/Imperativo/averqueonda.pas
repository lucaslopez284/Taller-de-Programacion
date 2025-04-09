program jjaj;
 
type
  fecha = record
   dia: integer;
   mes: integer;
  end;
  
  pedido = record
    dni : integer;
    fec : fecha;
    monto: real;
  end;
  
  pedido2 = record
   fec: fecha;
   monto: real;
  end;
  
  lista = ^nodo;
  nodo = record
    dato: pedido2;
    sig: lista;
  end;
  
  datoArbol = record
    dni: integer;
    lis: lista;
  end;
  
  arbol = ^nodoArbol;
  nodoArbol = record
    dato : datoArbol;
    hd: arbol;
    hi: arbol;  
  end;
  
  procedure leerFecha (var f: fecha);
  begin
    f.dia:= Random (30) + 1;
    f.mes:= Random (12) + 1;
  end;
  
  procedure leerPedido(var p: pedido);
  begin
    p.monto:= Random (1000);
    if (p.monto<> 0) then begin
      leerFecha(p.fec);
      p.dni:= Random (30) + 400;
    end;
  end;
  
  procedure asignar (var p2: pedido2; p: pedido);
  begin
    p2.fec:= p.fec;
    p2.monto:= p.monto;
  end;
  
  procedure agregarAdelante (var l: lista; d: pedido2);
  var nue: lista;
  begin
    new (nue);
    nue^.dato:= d;
    nue^.sig:= l;
    l:= nue;
  end;
  
  procedure cargarArbol (var a: arbol; p: pedido);
  var p2: pedido2;
  begin
    if (a = nil) then begin
      new (a);
      a^.hi:= nil;
      a^.hd:= nil;
      a^.dato.dni:= p.dni;
      a^.dato.lis := nil;
      asignar (p2,p);
      agregarAdelante(a^.dato.lis, p2)
    end
    else if (a^.dato.dni = p.dni) then begin
             asignar (p2,p);
             agregarAdelante(a^.dato.lis, p2)
        end
        else if (p.dni< a^.dato.dni) then 
              cargarArbol(a^.hi,p)
             else cargarArbol (a^.hd,p);
   end; 
   
   procedure procesarInfo (var a: arbol);
   var p: pedido;
   begin
     a:= nil;
     leerPedido(p);
     while (p.monto <> 0) do begin
       cargarArbol(a,p);
       leerPedido(p);
     end;
   end;
   
   procedure imprimirlista (l: lista);
   begin
     while (l<> nil) do begin
       writeln('Monto: ', l^.dato.monto:2:2, ' Dia: ' , l^.dato.fec.dia , ' Mes: ' , l^.dato.fec.mes);
       l:= l^.sig;
     end;
   end;
   
   procedure imprimirCliente (info: datoArbol);
   begin
     writeln('Cliente de DNI: ' , info.dni);
     imprimirlista(info.lis);
   end;
   
   procedure imprimirArbol (a: arbol);
   begin
     if (a<> nil) then begin;
       imprimirArbol(a^.hi);
       imprimirCliente(a^.dato);
       imprimirArbol(a^.hd);
     end;
   end;
   
   procedure contar(l: lista; var mon: real; var cant: integer);
   begin
      mon:= 0;
      cant:= 0;
      while (l<> nil) do begin;
        cant:= cant + 1;
        mon:= mon + l^.dato.monto;
        l:= l^.sig;
      end;
   end;
   
   procedure busqueda (a: arbol; dni: integer; var mon: real; var cant: integer);
   begin
     if (a = nil) then begin 
        mon:= 0;
        cant:= 0;
     end
     else
       if (a^.dato.dni = dni) then contar(a^.dato.lis,mon,cant)
       else if (dni < a^.dato.dni) then busqueda (a^.hi,dni,mon,cant)
            else if (dni > a^.dato.dni) then busqueda (a^.hd,dni,mon,cant);
   end;
   
   function evaluarFecha(f: fecha; f2: fecha): boolean;
   begin
     if ((f.dia = f2.dia) and (f.mes = f2.mes)) then evaluarFecha:= true
     else evaluarFecha:= false;
   end;
   
   function evaluarCliente (l: lista; f: fecha): boolean;
   var hay: boolean;
   begin
     hay:= false;
     while ((hay = false) and (l<> nil)) do begin
         hay:= evaluarFecha(f,l^.dato.fec);
         l:= l^.sig;
     end;
     evaluarCliente:= hay;
   end;
    
   procedure sumarCliente (info: datoArbol;f: fecha;var cant: integer);
   begin
     if (evaluarCliente(info.lis,f) )then 
       cant:= cant + 1;
   end;
   
   procedure busquedaFecha (a: arbol; f: fecha; var cant: integer);
   begin
     if (a<> nil) then begin;
       busquedaFecha(a^.hi,f,cant);
       sumarCliente(a^.dato,f,cant);
       busquedaFecha(a^.hd,f,cant);
     end;
   end;
  
var
    a: arbol; mon: real; cantCli,cant,dni: integer; f: fecha;
begin
  Randomize;
  writeln('--------------Inciso A----------------');
  procesarInfo(a);
  imprimirArbol(a);
  writeln('--------------Inciso B----------------');
  writeln('Ingrese fecha a buscar');
  write('dia: ');
  readln(f.dia);
  write('mes: ');
  readln(f.mes);
  cantCli:= 0;
  busquedaFecha(a,f,cantCli);
  writeln('La cantidad de clientes que realizaron pedidos en la fecha leida es de ' , cantCli);
  writeln('--------------Inciso C----------------');
  writeln('Ingrese DNI a buscar');
  readln(dni);
  busqueda(a,dni,mon,cant);
  if (cant = 0) then writeln('No se encuentra registrado ningun cliente con DNI ', dni)
  else writeln('El cliente de DNI ', dni, ' realizo ' , cant , ' pedidos con el monto total de ' , mon:2:2);
end.

