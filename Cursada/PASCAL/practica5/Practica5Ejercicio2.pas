program prac5ej2;

{Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:
a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente}


type

 rango = 2010..2018;
 
 
 auto = record
  patente: integer;
  anio : rango;
  marca : string;
  modelo: integer;
 end;
 
 arbolA =^nodoA ;
 nodoA = record
  dato: auto;
  hd:arbolA;
  hi:arbolA;
 end;
 
 inforeducida = record
  patente: integer;
  anio: rango;
  modelo: integer;
 
 end;
 
 lista=^nodo;
 nodo = record
   dato:inforeducida;
   sig:lista;
 
 end;

 infoArbolB = record
  marca : string;
  lis: lista;
 end;
 
 arbolB =^nodoB;
 nodoB = record
  dato: infoArbolB;
  hd:ArbolB;
  hi:ArbolB;
 end;
 
 infolistaD = record
  patente: integer;
  marca : string;
  modelo: integer;
 end;
 
 ListaD =^nodoD;
 nodoD = record
   dato: infolistaD;
   sig: listaD
 end;
 
 
 
 InfoVectorD = record
  anio: rango;
  lis: ListaD;
 end;
 
 vec = array [rango] of InfoVectorD;
 
 


Procedure leerAuto (var a: auto);
 var v:array [0..9] of string= ('FORD', 'AUDI', 'TOYOTA', 'MERCEDES', 'HILUX', 'AMAROK', 'RANGER', 'KANGO', 'JEEP', 'MMM');
 begin
    
    a.marca:=v[random(10)];
    if (a.marca <> 'MMM') then begin
          a.patente:= random (101) + 110;
          a.anio:= random (8) + 2010;
          a.modelo:= random (5) + 1;
       end;  
 
 end;
 
  
 
 
  
Procedure CargarArbolPatente(var a: arbolA ; au: auto);
begin
  if (a= nil) then begin
     new(a);
     a^.dato:= au;
     a^.hi := nil;
     a^.hd := nil;
   end
  else if (au.patente <= a^.dato.patente) then CargarArbolPatente(a^.hi,au)
                                          else CargarArbolPatente(a^.hd,au);
end;
                                          
Procedure agregaradelante (var l: lista; info: inforeducida);
var nue: lista;
begin
 new(nue);
 nue^.dato:= info;
 nue^.sig:= l;
 l:= nue;
end;    
          
Procedure CargarArbolMarca (var a: arbolB ; au: auto);   
 var autoredu: inforeducida;
 begin
   if (a= nil) then begin
     new(a);
     a^.dato.marca:= au.marca;
     a^.hi := nil;
     a^.hd := nil;
     autoredu.patente:=au.patente;
     autoredu.anio:=au.anio;
     autoredu.modelo:= au.modelo;
     agregaradelante(a^.dato.lis,autoredu);
   end
   else if (a^.dato.marca = au.marca) then begin
                                       autoredu.patente:=au.patente;
                                       autoredu.anio:=au.anio;
                                       autoredu.modelo:= au.modelo;
                                       agregaradelante(a^.dato.lis,autoredu);
                                      end
                                      else if (au.marca < a^.dato.marca) then CargarArbolMarca(a^.hi,au)
                                                                         else CargarArbolMarca(a^.hd,au);
                                      
 end;       
         
Procedure ProcesarAutos (var a1:arbolA; var a2:arbolB);
var au:auto;
begin
 
  leerAuto(au);
  while (au.marca <> 'MMM') do begin
      CargarArbolPatente(a1,au);
      CargarArbolMarca(a2,au);
      leerAuto(au);
   end;
 end;
 
 
 Procedure InformarArbolPatente (a:arbolA);
 begin
  if (a<>nil) then begin
      InformarArbolPatente(a^.hi);
      writeln('patente: ' , a^.dato.patente , ' fabricacion: ' , a^.dato.anio , ' marca: ' , a^.dato.marca , ' modelo: ' , a^.dato.modelo);
      InformarArbolPatente(a^.hd);
   end;
 end; 
 
 Procedure InformarLista (l:lista; marca: string);
 begin
 writeln(' Lista de la marca: ' , marca);
 while (l<>nil) do begin
     writeln('patente: ' , l^.dato.patente , ' fabricacion: ' , l^.dato.anio , ' modelo: ' , l^.dato.modelo);
     l:= l^.sig;
  end;
 end;

Procedure InformarArbolMarcas (a2:arbolB);
begin
   if (a2<>nil) then begin
         InformarArbolMarcas(a2^.hi);
         InformarLista(a2^.dato.lis,a2^.dato.marca);
         InformarArbolMarcas(a2^.hd);
   end;
end;

Procedure ContarMarcasB(a1:arbolA; marca: string; var Cant: integer);
begin
    if (a1<>nil) then begin
         ContarMarcasB(a1^.hi, marca, cant);
         if (a1^.dato.marca = marca) then
            cant:= cant + 1;
         ContarMarcasB(a1^.hd, marca, cant);
    end;
end;

Function ContarCantC(l:lista): integer;
Var cant: integer;
begin
  cant:= 0;
  while (l<>nil) do begin
           cant:= cant + 1;
           l:=l^.sig;
  end;
  ContarCantC:= cant;
end;


Function ContarMarcasC(a2:arbolB; marca: string): integer;
begin
  if (a2=nil) then ContarMarcasC:= 0
              else if (a2^.dato.marca = marca) then ContarMarcasC:= ContarCantC(a2^.dato.lis)
                                        else if (marca > a2^.dato.marca) then ContarMarcasC:= ContarMarcasC(a2^.hd,marca)
                                                                         else ContarMarcasC:= ContarMarcasC(a2^.hi,marca);

end;

Procedure AgregarListaD (var l:listaD; info:InfoListaD);
var nue: listaD;
begin
 new(nue);
 nue^.dato:= info;
 nue^.sig:= l;
 L:= nue;
end;
 
Procedure InicializarVector (var vD:vec);
var i: integer;
begin
  For i:= 2010 to 2018 do begin
    vd[i].anio:= i;
    vd[i].lis:= nil;
  end;
end;

Procedure CargarVector (var vD: vec; au: auto);
var autoredu: InfoListaD;
begin
   autoredu.patente:= au.patente;
   autoredu.marca:= au.marca;
   autoredu.modelo:= au.modelo;
   AgregarListaD(vD[au.anio].lis, autoredu)

end;



Procedure Completarinfo(a1: arbolA; var vD:vec);

begin
  if (a1<>nil) then begin 
    Completarinfo(a1^.hi,vD);
    CargarVector(vd, a1^.dato);
    Completarinfo(a1^.hd,vD)
  end;
end;

Procedure InformarLista (l:listaD; anio: integer);
Begin
   writeln('lista de anio: ' , anio);
   while (l<>nil) do begin
        writeln(' Patente: ', l^.dato.patente , ' marca: ', l^.dato.marca , 'modelo: ' , l^.dato.modelo );
        l:= l^.sig;
    end;
end;
Procedure InformarVector (vD:vec);
var i:rango;
begin
  for i:= 2010 to 2018 do
     if (vD[i].lis <> nil) then InformarLista(vD[i].lis, vD[i].anio)
                           else writeln('No se registran autos fabricados en el anio: ' , i);
end;

Procedure GenerarVectorD(a1:arbolA; var vD: vec);

begin
 InicializarVector(vD);
 Completarinfo(a1,vD);
 InformarVector(vD);
 
 end;
 



Function BuscarIncisoE(a:arbolA; patente: integer) : integer;
begin
 if (a= nil) then BuscarIncisoE:= 0
             else if (a^.dato.patente = patente) then BuscarIncisoE:= a^.dato.modelo
                                                 else if (patente > a^.dato.patente) then BuscarIncisoE:= BuscarIncisoE(a^.hd,patente)
                                                                                     else BuscarIncisoE:= BuscarIncisoE(a^.hi,patente);
end;

Procedure BuscarEnLista (l: lista; patente: integer; var modelo: integer);
var esta: boolean;
begin
   esta:= false;
   while ((l<>nil) and (esta = false) ) do begin
        if (l^.dato.patente = patente) then begin
           esta:= true;
           modelo:= l^.dato.modelo;
        end;
        l:= l^.sig;
    end;    
    
 
end;
  
Procedure BuscarIncisoF(a:arbolB; patente: integer; var modelo: integer);

 
  
begin
   
    if (a= nil) then modelo:= 0
         else begin
         BuscarEnLista(a^.dato.lis, patente, modelo);
         if (modelo = 0) then BuscarIncisoF(a^.hi,patente,modelo);
         if (modelo = 0) then BuscarIncisoF(a^.hd,patente,modelo);
       end;  
      
end;

 
var a1:arbolA; a2:arbolB; cantB, cantC, patE, patF,modE, modF: integer;
    vMarcas:array [0..8] of string= ('FORD', 'AUDI', 'TOYOTA', 'MERCEDES', 'HILUX', 'AMAROK', 'RANGER', 'KANGO', 'JEEP');
    MarcaB, MarcaC: string;
    vD:vec;
   
begin
   a1:= nil;
   a2:= nil;
   randomize;
   ProcesarAutos(a1,a2);
   writeln('----------------INCISO A I ---------------------');
   writeln;
   writeln;
   if (a1 <> nil) then InformarArbolPatente(a1)
                 else writeln('arbol de patentes quedo vacio');
   writeln('----------------INCISO A II ---------------------');
   writeln;
   writeln;
   if (a2 <> nil) then InformarArbolMarcas(a2)
                 else writeln('arbol de marcas esta vacio');
   writeln('----------------INCISO B ---------------------');
   writeln;
   writeln;
   MarcaB:= vMarcas[random (8)];
   CantB:= 0;
   ContarMarcasB(a1,MarcaB,CantB);
   if (CantB > 0) then writeln(' La cantidad de autos de marca ' , MarcaB , ' es ' , CantB)
                  else writeln(' No hay autos de marca ' , MarcaB);
   writeln('----------------INCISO C ---------------------');
   writeln;
   writeln;
   MarcaC:= vMarcas[random (8)];
   CantC:= ContarMarcasC(a2,MarcaC);
   if (CantC > 0) then writeln(' La cantidad de autos de marca ' , MarcaC , ' es ' , CantC)
                  else writeln(' No hay autos de marca ' , MarcaC);
   writeln('----------------INCISO D---------------------');
   writeln;
   writeln;
   GenerarVectorD(a1,Vd);
   writeln('----------------INCISO E---------------------');
   writeln;
   writeln;
   writeln('Ingrese patente a buscar');
   readln(patE);
   modE:= BuscarIncisoE(a1,patE);
   if (modE > 0) then writeln(' El modelo de la patente ' , patE , ' es ' , modE)
                 else writeln(' No hay autos de patente ' , patE);
   writeln('----------------INCISO F---------------------');
   writeln;
   writeln;
   writeln('Ingrese patente a buscar');
   readln(patF);
   modF:= 0;
   BuscarIncisoF(a2,patF,modF);
   if (modF > 0) then writeln(' El modelo de la patente ' , patF , ' es ' , modF)
                  else writeln(' No hay autos de patente ' , patF);
end.
