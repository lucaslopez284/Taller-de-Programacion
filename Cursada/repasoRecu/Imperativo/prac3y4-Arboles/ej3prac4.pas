program ej3p4;
type 
  venta = record
    codventa: integer;
    codproducto: integer;
    cantvendida: integer;
    monto: real;
  end;
  producto = record
    cantvendida: integer;
    codigo: integer;
    monto: real;
  end;
 
  arbol=^nodoArbol;
  nodoArbol = record
    dato: producto;
    hi: arbol;
    hd: arbol;
  end;  
  
 procedure leerVenta(var v: venta);
 begin
   v.codventa:= Random (250) - 1;
   if (v.codventa <> -1) then begin
     v.monto:= Random  (20000) / Random (1000);
     v.codproducto:= Random (20); 
     v.cantVendida:= Random(30) + 1;    
   end;       
 end;
 
 procedure cargarArbol (var a: arbol; p: producto);
 begin
   if (a= nil) then begin
     new (a);
     a^.dato:= p;
     a^.hi:= nil;
     a^.hd:= nil;
   end
   else if(p.codigo = a^.dato.codigo) then begin
            a^.dato.monto:= a^.dato.monto + p.monto;
            a^.dato.cantvendida:= a^.dato.cantvendida + p.cantvendida;
         end
        else if (p.codigo < a^.dato.codigo) then 
               cargarArbol(a^.hi,p)
              else
                cargarArbol(a^.hd,p);
  end;      
 
 procedure procesarDatos(var a: arbol);
 var v: venta; p: producto;
 begin
   a:= nil;
   leerVenta(v);
   while (v.codventa <> -1) do begin
        p.codigo:= v.codproducto;
        p.monto:= v.monto * v.cantvendida;
        p.cantvendida:= v.cantvendida;
        cargarArbol(a,p);
        leerVenta(v);
     end;
 end;
  
 procedure imprimirArbol(a: arbol);
 begin 
   if(a<>nil) then begin
     imprimirArbol(a^.hi);
     writeln('Codigo de producto: ' , a^.dato.codigo , ' Cant vendida: ' , a^.dato.cantvendida , ' Monto recaudado ' , a^.dato.monto:2:2);
     imprimirArbol(a^.hd);
   end;
 end; 
  
 procedure mayorVendido(a:arbol; var cod: integer; var max: integer);
 begin
   if (a<>nil) then begin
     mayorVendido(a^.hi,cod,max);
     if (a^.dato.cantvendida > max) then begin
         max:= a^.dato.cantvendida;
         cod:= a^.dato.codigo;
       end;
     mayorVendido(a^.hd,cod,max);
   end;
 
 end;
  
 function menores (a:arbol; n: integer): integer;
 begin
    if (a= nil) then menores:= 0
    else if (a^.dato.codigo < n) then menores:= 1 + menores(a^.hi,n) + menores(a^.hd,n)
         else if(a^.dato.codigo >= n) then menores:= menores(a^.hi,n);
    
 end;  
  
 function montoEntre(a:arbol; num1: integer; num2: integer): real;
 begin
     if (a = nil) then montoEntre:= 0
     else begin if(a^.dato.codigo > num1) and (a^.dato.codigo < num2) then 
                 montoEntre:= a^.dato.monto + montoEntre(a^.hi,num1,num2) + montoEntre(a^.hd,num1,num2)
           else if (a^.dato.codigo <= num1) then montoEntre:= montoEntre(a^.hd,num1,num2)
                else if (a^.dato.codigo >= num2) then montoEntre:= montoEntre(a^.hi,num1,num2)
      end;
 end;
var
  a: arbol; cod,max, num,num1,num2: integer; monto: real;
begin
  Randomize;
  procesarDatos(a);
  imprimirArbol(a);
  cod:= -1;
  max:= -1;
  mayorVendido(a,cod, max);
  if (cod <> -1) then
    writeln('El producto de mayor cantidad vendida es ' , cod , ' con la cantidad de ' , max)
  else writeln('Arbol vacio, no hay maximo');
  writeln('Inserte num ' );
  readln(num);
  writeln('La cantidad de productos con codigo menor a ' , num , ' es ' , menores(a,num));
  writeln('Inserte num 1 ');
  readln(num1);
  writeln('Inserte num 2 ');
  readln(num2);
  monto:= montoEntre(a,num1,num2);
  writeln('El monto recaudado de los productos con codigo entre ' , num1  , ' y ' , num2 , ' es ' , monto:2:2 );
end.
