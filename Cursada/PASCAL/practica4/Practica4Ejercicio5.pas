Program Prac4Ej5;

{Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
insertarlos a la derecha.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}


type
  
  dias = 1..31;
  meses= 1..12;
  
  
  fecha = record
  dia : dias;
  mes : meses;
  end;
  
  prestamo = record
   ISBN : integer;
   NumSocio : integer;
   Fec: fecha;
   CantDias : integer;
  end;
  
  Reducido = record
   NumSocio : integer;
   Fec: fecha;
   CantDias : integer;
  end;
  
  ArbolUno= ^nodo1;
  nodo1 = record
      dato: prestamo;
      hd: ArbolUno;
      hi: ArbolUno;
   end;
  
  
  Lista = ^nodo;
  nodo = record
    dato: reducido;
    Sig: lista;
   end;
   
  DatoBis = record
   ISBN: integer;
   lis: lista;
  end;
    
ArbolDos= ^nodo2;
  nodo2 = record
      dato: DatoBis;
      hd: ArbolDos;
      hi: ArbolDos;
   end;  
  
 InfoFG = record
  ISBN : integer;
  CantPrestado: integer;
 end;
 
 ArbolFG = ^nodoFG;
  nodoFG = record
      dato: InfoFG;
      hd: ArbolFG;
      hi: ArbolFG;
  end;
 
procedure leerfecha (var f: fecha);
begin
    f.dia:= random (31) + 1;
    f.mes:= random (12) + 1;
end;

Procedure LeerPrestamo (var p: prestamo);

begin
 p.ISBN:= random(30);
 if (p.ISBN <> 0) then begin
   leerfecha(p.fec);
   p.NumSocio:= random(50);
   p.CantDias:= random(20) + 5;
  end;
 end;
 
 
 procedure AgregarAdelante (var L: lista; info: reducido);
var 
   nue : lista;
begin
  new (nue);
  nue^.dato:= info;
  nue^.sig:= l;
  l:= nue;
end;

Procedure CargarArboluno (var a: arboluno; info: prestamo);
begin
  if (a = nil) then begin new(a); a^.dato:= info; a^.hi := nil; a^.hd:= nil; 
                    end
                else if (info.ISBN >= a^.dato.ISBN) then cargararboluno (a^.hd, info)
                                                  else cargararboluno (a^.hi, info);
end;

Procedure Cargararboldos (var a: arboldos; info: prestamo);
var p:reducido;
begin 
    if (a = nil) then begin new (a); a^.dato.ISBN:= info.ISBN; a^.dato.lis:= nil; p.fec:= info.fec; p.cantdias:= info.cantdias; p.NumSocio:=info.numsocio;
                            agregaradelante(a^.dato.lis, p); a^.hd:= nil; a^.hi:= nil;
                            end
                  else if (a^.dato.ISBN = info.ISBN) then begin p.fec:= info.fec; p.cantdias:= info.cantdias; p.NumSocio:=info.numsocio;
                                                agregaradelante(a^.dato.lis, p) 
                                                end
                                                   else if  (info.ISBN > a^.dato.ISBN) then cargararboldos(a^.hd, info)
                                                                                    
                                                                                     else cargararboldos(a^.hi, info);
end;

 
Procedure ProcesarInformacion (Var a1:arboluno; var a2: arboldos);
var p: prestamo; 
begin
 a1:= nil; a2:= nil; 
 leerprestamo(p);
 while(p.ISBN <> 0) do begin
     CargarArboluno(a1,p); 
     CargarArboldos(a2,p);
     leerprestamo(p);
 end;

end;



Procedure ImprimirFecha (f:fecha);
begin
   write(' el dia: ' , f.dia, ' del mes ' , f.mes);
end;
  
Procedure ImprimirNodoArboluno (p:prestamo);
begin
  
  writeln(' se pidio prestado el libro de ISBN ' , p.ISBN , ' por parte del socio de numero ' , p.numsocio, ' con el plazo de ', p.CantDias , ' dias ');
  ImprimirFecha(p.fec);
  writeln
end;



procedure ImprimirArbolUno(a: arboluno);
begin 
    if (a<>nil) then begin;
        ImprimirArbolUno(a^.hi);
        ImprimirNodoArboluno(a^.dato);
        ImprimirArbolUno(a^.hd);
     end;
 end;

Procedure Informar(p:reducido; ISBN: integer);
begin
     
     writeln(' se pidio prestado el libro de ISBN ' , ISBN , ' por parte del socio de numero ' , p.numsocio, ' con el plazo de ', p.CantDias , ' dias ');
     ImprimirFecha(p.fec);
     writeln
end;
 
procedure ImprimirNodoArboldos(l:lista; ISBN: integer);
 begin
  while (l<>nil) do begin
       informar(l^.dato,ISBN);
       l:=L^.sig;
  end
 
 end;
 
procedure ImprimirArbolDos(a:arboldos);
begin
    if(a<>nil) then begin
          ImprimirArboldos(a^.hi);
          imprimirnodoarboldos(a^.dato.lis, a^.dato.ISBN);
          ImprimirArboldos(a^.hd);
       end;
end;
 
Procedure InformarArboles (a1: arboluno; a2:arboldos);
begin
  writeln('----------------ahora arbol 1------------------------');
  writeln;
  writeln;
  ImprimirArbolUno(a1);
  writeln;
  writeln;
  writeln('----------------ahora arbol 2-------------------------');
  ImprimirArboldos(a2);
  writeln;
  writeln;
 end;
 
 Function IncisoB(a1:arboluno): integer;
 begin
     if (a1 = nil) then IncisoB:= 0
                        else if (a1^.hd <> nil) then IncisoB:= IncisoB(a1^.hd)
                                                else if (a1^.hd = nil) then IncisoB:= a1^.dato.ISBN;
           
 end;
 
 Function IncisoC(a2:arboldos): integer;
 begin
     if (a2 = nil) then IncisoC:= 0
                        else if (a2^.hi <> nil) then IncisoC:= IncisoC(a2^.hi)
                                                else if (a2^.hi = nil) then IncisoC:= a2^.dato.ISBN;
           
 end;

Procedure IncisoD(a1: arboluno; num:integer; var cantD: integer);
begin
   If (a1 <> nil) then begin
          IncisoD(a1^.hi,num,CantD);   
          if (a1^.dato.NumSocio = num) then 
              cantD:= CantD + 1;
          IncisoD(a1^.hd,num,CantD);   
    end;                                    
          
end;

Procedure ContarLista(l: lista; num: integer; var CantE: integer);
begin
    while (l<>nil) do begin
          if(l^.dato.NumSocio = num) then 
                 CantE:= CantE + 1;
          l:= l^.sig;
         end;
end;


Procedure IncisoE(a2: arboldos; num: integer; var CantE: integer);
begin
     if (a2<>nil) then begin
       IncisoE(a2^.hi,num,CantE);
       ContarLista(a2^.dato.lis,num,CantE);
       IncisoE(a2^.hd,num,CantE);
       
     end;
end;


Function IncisoI(a1:arboluno; num1,num2: integer) : integer;
begin
    if (a1 = nil) then IncisoI:= 0
                 else if ((a1^.dato.ISBN >= num1) and (a1^.dato.ISBN <= num2)) then  IncisoI:= 1 + IncisoI(a1^.hi,num1,num2) + IncisoI(a1^.hd,num1,num2) 
                                else If (a1^.dato.ISBN < num1 ) then IncisoI:= IncisoI(a1^.hd,num1,num2)
                                                                else IncisoI:= IncisoI(a1^.hi,num1,num2);
                                

end;
 
Function ContarNodo(l: lista): integer;
var cant: integer;
begin
cant:= 0;
while (l<>nil) do begin
          cant:= Cant + 1;
          l:= l^.sig;
         end;
ContarNodo:= Cant;
end;

Function IncisoJ (a2:arboldos; num1,num2: integer): Integer;
 
begin
   if (a2 = nil) then IncisoJ:= 0
                 else if ((a2^.dato.ISBN >= num1) and (a2^.dato.ISBN <= num2)) then 
                  IncisoJ:= ContarNodo(a2^.dato.lis) +  IncisoJ(a2^.hi,num1,num2) + IncisoJ(a2^.hd,num1,num2) 
                           else if (num1 > a2^.dato.ISBN) then IncisoJ:= IncisoJ(a2^.hd,num1,num2)
                                                         else IncisoJ:= IncisoJ(a2^.hi,num1,num2);
end;


Procedure ArmarArbolG (Var a:ArbolFG; i:infoFG);
begin
    if (a= nil) then begin new(a) ; a^.dato:= i; a^.hi:= nil ; a^.hd:= nil; end
                  else if (i.ISBN >= a^.dato.ISBN) then ArmarArbolG (a^.hd, i)
                                                  else ArmarArbolG (a^.hi, i);
end;
 

Procedure CargarArbolG (a2:arboldos; var aG:ArbolFG);
var i: InfoFG;
     
begin
    
    if (a2<>nil) then begin
         I.ISBN:= a2^.dato.ISBN; I.CantPrestado:= ContarNodo(a2^.dato.lis); ArmarArbolG(ag,i);
         CargarArbolG(a2^.hi,ag);
         CargarArbolG(a2^.hd,ag);
      end;
end;

Procedure InformarArbolG(a:ArbolFG);
begin
   if (a <> nil) then begin
         InformarArbolG(a^.hi);
         writeln(' El libro de ISBN ' , a^.dato.ISBN , ' fue prestado ' , a^.dato.CantPrestado , ' veces ');
         InformarArbolG(a^.hd)
      end
  end; 

 var a1:arboluno; a2: arboldos;aG:ArbolFG; 
 ISBNMasGrande,ISBNMasChico,NumINCD, CANTD, NumINCE, CANTE, Num1i, Num2i, CantI, Num1J, Num2J, CantJ: integer;
 
 
 begin
 randomize;
 ProcesarInformacion(a1,a2);
 InformarArboles(a1,a2);
 writeln;
 writeln;
 writeln('----------------ahora INCISO B------------------------');
 writeln;
 writeln;
 ISBNMasGrande:= IncisoB(a1);
 if (ISBNMasGrande > 0) then writeln('el ISBN mas grande es: ' , ISBNMasGrande)
                        else writeln(' El arbol esta vacio');
 writeln;
 writeln;
 writeln('----------------ahora INCISO C------------------------');
 writeln;
 writeln;
 ISBNMasChico:= IncisoC(a2);
 if (ISBNMasChico > 0) then writeln('el ISBN mas chico es: ' , ISBNMasChico)
                       else writeln(' El arbol esta vacio');
 writeln;
 writeln;
 writeln('----------------ahora INCISO D------------------------');
 writeln;
 writeln;
 writeln(' Inserte el numero de socio a buscar par el Inciso D ');
 readln(NumINCD);
 CantD:= 0;
 IncisoD(a1,NumINCD,CantD);
 if (CantD > 0) then writeln (' El numero de socio ' , NumINCD , ' pidio ' , CantD , ' prestamos ' )
                else writeln (' No se registran prestamos al numero de socio ' , NumINCD); 
 writeln;
 writeln('----------------ahora INCISO E------------------------');
 writeln;
 writeln;
 writeln(' Inserte el numero de socio a buscar par el Inciso E ');
 readln(NumINCE);
 CantE:= 0;
 IncisoE(a2,NumINCE,CantE);
 if (CantE > 0) then writeln (' El numero de socio ' , NumINCE , ' pidio ' , CantE , ' prestamos ' )
                else writeln (' No se registran prestamos al numero de socio ' , NumINCE); 
                
 writeln;
 writeln;
 writeln('----------------ahora INCISO G------------------------');
 aG:= nil;
 writeln;
 writeln;                    
 CargarArbolG(a2,aG);
 InformarArbolG(aG);
 writeln;
 writeln;
 writeln;
 writeln;
 writeln('----------------ahora INCISO I------------------------');
 writeln;
 writeln;            
 
 writeln(' Inserte el primer numero a buscar con el inciso i ');
 readln(Num1i);
 writeln(' Inserte el segundo numero a buscar con el inciso i (que sea mayor que el primero) ');
 readln(Num2i);
 CantI:=IncisoI(a1,Num1i,Num2i);
 if (cantI > 0) then writeln( CantI, ' es la cantidad de ISBN prestados que se encuentran en el rango de ' , num1i , ' a ' , num2i)
                else writeln(' No se encuentran ISBN prestados dentro del rango de '  , Num1i, ' a ' , Num2i);
 
 writeln;
 writeln;
 writeln('----------------ahora INCISO J------------------------');
 writeln;
 writeln;
 writeln(' Inserte el primer numero a buscar con el inciso i ');
 readln(Num1J);
 writeln(' Inserte el segundo numero a buscar con el inciso i (que sea mayor que el primero) ');
 readln(Num2J);
 CantJ:= IncisoJ(a2,Num1J,Num2J);
 
 if (cantJ > 0) then writeln( CantI, ' es la cantidad de ISBN prestados que se encuentran en el rango de ' , num1J , ' a ' , num2J)
                else writeln(' No se encuentran ISBN prestados dentro del rango de '  , Num1J, ' a ' , Num2J);
 
 readln
 end.
