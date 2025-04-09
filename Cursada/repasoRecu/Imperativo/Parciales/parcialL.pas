program turnoL;
const
 dimf = 12;
type
  meses = 1..12;
  compra = record
    monto: real;
    factura: integer;
    codcli: integer;
    mes: meses;
  end;
  vector = array [1..dimf] of real;
  
  datoArbol = record
    codcli :integer;
    vec : vector;
   end;
   
  arbol = ^nodo;
  nodo = record
    dato : datoArbol;
    hd : arbol;
    hi : arbol;
  end;
  procedure leerCompra(var c: compra);
  begin
   c.codcli := Random(1);
   if (c.codcli <> 0) then begin
      c.factura:= Random(2000) + 10000;
      c.monto:= Random (20000) / (Random (10) + 1);
      c.mes:= Random(12) + 1;
    end;
  end;
  procedure inicializarVector (var v: vector);
  var i: integer;
  begin
    for i:= 1 to dimf do 
      v[i]:= 0;
  end;
  
  procedure sumarMonto (var v: vector; mes: meses; monto: real);
  begin
    v[mes]:= v[mes] + monto; 
  end;
  
  procedure cargarArbol (var a: arbol; c: compra);
  begin
    if (a = nil) then begin
      new (a);
      a^.dato.codcli:= c.codcli;
      inicializarVector(a^.dato.vec);
      sumarMonto(a^.dato.vec, c.mes, c.monto);
      a^.hi:= nil;
      a^.hd:= nil;
     end
   else if (c.codcli = a^.dato.codcli) then
          sumarMonto(a^.dato.vec, c.mes, c.monto)
         else if (c.codcli < a^.dato.codcli) then
                  cargarArbol(a^.hi, c)
               else if (c.codcli > a^.dato.codcli) then
                   cargarArbol(a^.hd,c);
  end;
  
  procedure procesarDatos(var a: arbol) ;
  var c: compra;
  begin
    leerCompra(c);
    while (c.codcli <> 0) do begin;
      cargarArbol(a,c);
      leerCompra(c);
    end;
  end;
     
  procedure imprimirVector (v: vector);
  var i: integer;
  begin
    for i:= 1 to dimf do 
      writeln('el monto gastado en el mes ' , i , ' es ' , v[i] :2:2);
  end;
  
  procedure imprimirArbol (a: arbol);
  begin
    if (a<> nil) then begin
      imprimirArbol(a^.hi);
      writeln('gasto mensual del cliente ' , a^.dato.codcli);
      imprimirVector(a^.dato.vec);
      imprimirArbol(a^.hd);
    end;
  
  end;
  
  function mayorMes (v: vector): integer;
  var i, max: integer; aux: real ;
  begin
    i:= 1;
    aux:= -1;
    max:= 0;
    for i:= 1 to dimf do begin
      if (v[i] > aux) then begin
         max:= i;
         aux:= v[i];
     end;   
   end;
   mayorMes:= max;
  end;
   
  procedure incisoB (a: arbol; var esta: boolean; var mes: integer; cod: integer);
  begin
    if (a<> nil) then begin
      if (cod = a^.dato.codcli) then begin
        mes:= mayorMes(a^.dato.vec);
        esta:= true;
      end
      else if (cod < a^.dato.codcli) then
              incisoB(a^.hi, esta, mes,cod)
           else
             if (cod > a^.dato.codcli) then
               incisoB(a^.hd, esta, mes, cod);
   end;
  end; 
   
  function gastoNada (v: vector; mes: integer) : boolean;
  begin
    if (v[mes]= 0)then
      gastoNada:= true
    else gastoNada:= false;
  end;
  
  function incisoC (a: arbol; mes: integer) : integer;
  var sumar: boolean;
  begin
    if (a = nil) then
      incisoC:= 0
    else begin
         sumar:= gastoNada(a^.dato.vec,mes);
         if (sumar) then
           incisoC:= 1 + incisoC(a^.hi,mes) + incisoC(a^.hd,mes)
         else incisoC:= 0  + incisoC(a^.hi,mes) + incisoC(a^.hd,mes);
  end
 end;
var
 a: arbol; mes, codigo: integer;
 encontre: boolean;
begin
  Randomize;
  procesarDatos(a);
  writeln('----------------Inciso A---------------');
  imprimirArbol(a);
  writeln('----------------Inciso B---------------');
  writeln('Inserte codigo de cliente');
  readln(codigo);
  encontre:= false;
  incisoB(a,encontre,mes, codigo);
  if (encontre) then
    writeln(' el mes de mayor gasto para el cliente ' , codigo , ' fue ' , mes)
  else
    writeln ( ' el cliente ' , codigo , ' no se encuentra en la estructura ');
  writeln('----------------Inciso C---------------');
  writeln('Inserte un mes');
  readln(mes);
  writeln('La cantidad de clientes que no gastaron en el mes ' , mes , ' es ' , incisoC(a,mes));
end.
   
    
