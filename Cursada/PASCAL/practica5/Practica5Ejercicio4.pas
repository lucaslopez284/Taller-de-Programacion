program prac5ej4;

{ Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se ingresa código, DNI de la persona, año y tipo de reclamo. El ingreso finaliza con el
código de igual a 0. Se pide:
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido. }

  
type 

rango = 2010..2018;


reclamo = record
 codigo: integer;
 Dni: integer;
 anio: rango;
 tipo: integer;
 end;
 


InfoLista = record
  codigo: integer;
  anio: rango;
  tipo: integer;
end;

lista = ^nodolista;
 nodolista = record
   dato: infolista;
   sig: lista;
 end;
 
InfoArbol = record
 DNI: integer;
 Cant: integer;
 Reclamos: lista;
 end;

 
Arbol = ^nodoArbol;
NodoArbol = record
  dato: InfoArbol;
  hd: Arbol;
  hi: Arbol;
 end;
 
 
Procedure LeerReclamo(var R: reclamo);
begin
 R.codigo:= random(30);
 if (R.codigo <> 0) then begin
    R.DNI:= random (5) + 1000;
    R.anio:= random (8) + 2010;
    R.tipo:= random (5) + 1;
 end; 
 end;
 
Procedure AgregarAdelante(var l:lista; info: infoLista);
var nue: lista;
begin
  new(nue);
  nue^.dato:= info;
  nue^.sig:= l;
  L:= nue;
end;
 
Procedure cargarArbol(var a:arbol; R: reclamo);
var redu: infolista;
begin
   if (a = nil) then begin
     new (a);
     a^.dato.DNI:= R.DNI;
     a^.dato.cant:= 1;
     a^.hi:= nil;
     a^.hd:= nil;
     redu.codigo:= r.codigo;
     redu.anio:= r.anio;
     redu.tipo:= r.tipo;
     AgregarAdelante(a^.dato.Reclamos,redu);
    end
   else if (R.DNI = a^.dato.DNI) then begin
     a^.dato.cant:= a^.dato.cant + 1;
     redu.codigo:= r.codigo;
     redu.anio:= r.anio;
     redu.tipo:= r.tipo;
     AgregarAdelante(a^.dato.Reclamos,redu);
    end
                                 else if (R.DNI < a^.dato.DNI) then cargarArbol(a^.hi,R)
                                                               else cargarArbol(a^.hd,R);             

end;

Procedure CargarDatos (var a: arbol);
var R: reclamo;
begin
  a:= nil;
  LeerReclamo(R);
  while(R.codigo <> 0) do begin
      cargarArbol(a,R);
      LeerReclamo(R);
    end;
end;


Procedure InformarReclamos (l: lista);
begin
  while (l<>nil) do begin
    writeln(' Codigo de reclamo ' , l^.dato.codigo , ' Anio de reclamo ' , l^.dato.anio , ' Tipo de reclamo ' , l^.dato.tipo);
    l:= l^.sig
  end;
 writeln;
end;
 
 
Procedure InformarDatos(a:arbol);
begin
 if (a<> nil) then begin
   InformarDatos(a^.hi);
   writeln('DNI del autor del o de los reclamos ' , a^.dato.DNI);
   writeln(' Cantidad de reclamos ' , a^.dato.cant);
   writeln(' Lista de reclamos ');
   InformarReclamos(a^.dato.reclamos);
   InformarDatos(a^.hd);
 end;
end;

Function IncisoB (a:arbol; DNI: integer): integer;
begin
  if (a= nil) then IncisoB:= 0
  else if (DNI = a^.dato.DNI) then IncisoB:= a^.dato.cant
       else if (DNI < a^.dato.DNI) then IncisoB:= IncisoB(a^.hi, DNI)
            else IncisoB:= IncisoB(a^.hd, DNI);


end;

Function IncisoC (a: arbol; DNI1: integer; DNI2: integer) : integer ;
begin
  if(a= nil) then IncisoC:= 0
  else if ((DNI1 < a^.dato.DNI) and (DNI2 > a^.dato.DNI)) then   
       IncisoC:= a^.dato.cant + IncisoC(a^.hi,DNI1,DNI2) + IncisoC(a^.hd,DNI1,DNI2)
       else if (DNI1 >= a^.dato.DNI) then IncisoC:=  IncisoC(a^.hd,DNI1,DNI2)
            else IncisoC:=  IncisoC(a^.hi,DNI1,DNI2)

end; 

Function ContarLista(l:lista; anio:rango) : integer;
var cant: integer;
begin
   cant:= 0;
   while (l<>nil) do begin
      if (l^.dato.anio = anio) then
          cant:= cant + 1;
      l:= l^.sig 
    end;
   ContarLista:= cant;
end;
 

Function IncisoD (a: arbol; anio: rango): integer;
begin
  if (a = nil) then IncisoD:= 0
  else IncisoD:= ContarLista(a^.dato.reclamos, anio) + IncisoD(a^.hi,anio) + IncisoD(a^.hd,anio)

end;




var a:arbol; DNIB,cantB,DNIC1,DNIC2,cantC,cantD: integer;
    anioD: rango;
   
begin
 randomize;
 CargarDatos(a);
 writeln('--------------------inciso A----------------------');
 writeln;
 writeln;
 writeln;
 if(a <> nil) then InformarDatos(a)
              else writeln('Arbol vacio');
 {writeln('--------------------inciso B----------------------');
 writeln;
 writeln;
 writeln;
 writeln('Ingrese un DNI valido');
 readln(DNIB);
 cantB:= IncisoB(a, DNIB);
 if (cantB > 0) then writeln(' La cantidad de reclamos hechos por la persona de dni ' , DNIB , ' es ' , cantB)
                else writeln(' No se encontraron reclamos hechos por la persona con DNI ' , DNIB);
 writeln('--------------------inciso C----------------------');
 writeln;
 writeln;
 writeln;
 writeln(' Ingrese un DNI ');
 readln(DNIC1);
 writeln(' Ingrese un segundo DNI (que sea mayor al primero)');
 readln(DNIC2);
 cantC:= IncisoC(a, DNIC1, DNIC2);
 If (cantC > 0) then writeln (' La cantidad de reclamos hechos por el rango de DNIS de ' , DNIC1 , ' a ' , DNIC2 , ' es ' , cantC)
                else writeln ( ' No se encontraron reclamos hechos por el rango de DNIS de ' , DNIC1 , ' a ' , DNIC2);} 
  
              
 writeln('--------------------inciso D----------------------');
 writeln;
 writeln;
 writeln;
 writeln(' Ingrese un anio valido ');
 readln(anioD);
 CantD:= IncisoD(a,anioD);
 if (cantD > 0) then writeln(' La cantidad de reclamos hechos durante el anio ' , aniod , ' es ' , cantd)
                else writeln(' No se encontraron reclamos hechos durante el anio ' , anioD);
 
 
end.
