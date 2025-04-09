program ej3prac3 ;
{Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.
b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).
c. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}


type 
 fecha = record
  dia: integer;
  mes: integer;
  a: integer;
 end;
 
alumno = record
 codmateria: integer;
 fec: fecha;
 nota: integer;
end;

lista = ^nodo;
nodo = record
 dato : alumno;
 sig : lista;
end;


DatoArbol = record
 codleg: integer;
 lis: lista;
end;

Arbol=^nodoarbol;
nodoarbol = record
  dato: DatoArbol;
  hi: arbol;
  hd: arbol;
end;

procedure LeerFecha (var f: fecha);
begin
 f.dia:= random (31) + 1;
 f.mes:= random (12) + 1;
 f.a:= random (10) + 2014;
end;

procedure LeerAlumno (var A: alumno);
begin
 LeerFecha(A.fec);
 A.codmateria:= random(50) + 1;
 A.nota:=random (10) + 1;
end;

procedure AgregarAdelante (var l: lista; alum: alumno);
var nue: lista;
begin
  new(nue);
  nue^.dato:= alum;
  nue^.sig:= l;
  l:= nue;
end;
 
Procedure Agregar(var a: arbol; leg: integer; alum: alumno);
begin
 if (a= nil) then begin 
                    new (a);
                     a^.dato.codleg:= leg;
                     AgregarAdelante (a^.dato.lis, alum);
                     a^.hd:= nil; 
                     a^.hi:= nil;
                       end
             else if (leg = a^.dato.codleg) then AgregarAdelante (a^.dato.lis, alum)
                                            else if(leg<= a^.dato.codleg) then agregar(a^.hi,leg,alum)
                                                                          else agregar(a^.hd,leg,alum);


end;


Procedure CargarInfo (var a: arbol);
var leg:integer; alum: alumno;
begin
 a:= nil;
 leeralumno(alum);
 leg:= random (50);
 while(leg <> 0) do begin
         agregar(a,leg,alum);
         leeralumno(alum);
         leg:= random (50);
       end;
    
 
end;

Procedure ImprimirFecha(f: fecha);
begin
     writeln( 'dia: ' , f.dia , ' mes: ' , f. mes , 'a:', f.a);
end;

procedure Imprimirlista(l: lista; codleg: integer);
begin
  while (l<>nil) do begin;
         imprimirfecha(l^.dato.fec);
         writeln(' el alumno de legajo' , codleg, ' se saco un ' , l^.dato.nota , ' en la materia ' , l^.dato.codmateria);
         l:= l^.sig;
end;
end;
Procedure ImprimirInfo (a: arbol);

begin
    if (a<>nil) then begin
           imprimirinfo(a^.hi);
           imprimirlista(a^.dato.lis,a^.dato.codleg);
           imprimirinfo(a^.hd);
          
        end;
end;

procedure cantimpar(a:arbol; var cant: integer);


begin
 if(a<>nil) then begin
      cantimpar(a^.hi,cant);
      if ((a^.dato.codleg mod 2) = 1) then cant:= cant + 1;
      cantimpar(a^.hd,cant);
end;
end;


procedure contarfinales(l:lista;codleg: integer);
var cant:integer;
begin
cant:= 0;
while (l<>nil) do begin
       if(l^.dato.nota >= 4) then cant:= cant + 1;
       l:=L^.sig;
   end;
 writeln('el alumno de legajo', codleg, ' aprobo ' , cant , ' finales ');
end;
procedure finalesaprobados(a:arbol);
begin
 if (a<>nil) then begin
     finalesaprobados(a^.hi);
     contarfinales(a^.dato.lis,a^.dato.codleg);
     finalesaprobados(a^.hd);
   end;
end;

Procedure Analisis(l:lista; codleg: integer; v:real);
var promedio, totalnotas, cantfinales: real;
begin
   totalnotas:= 0; cantfinales:= 0;
   while(l<>nil) do begin
         totalnotas:= totalnotas + l^.dato.nota;
         cantfinales:= cantfinales + 1;
         l:= l^.sig;
    end;
   promedio:= totalnotas / cantfinales;
   if (promedio > v) then writeln('el alumno de legajo ' , codleg , 'tiene un promedio de' , promedio , ' superando asi al valor de..', v);
 
end;

 
Procedure InformarCumplenPromedio(a: arbol; valor:real);
begin
  if (a<>nil) then begin
     InformarCumplenPromedio(a^.hi,valor);
     Analisis(a^.dato.lis, a^.dato.codleg,valor);
     InformarCumplenPromedio(a^.hd,valor);
    end;
end;
var a: arbol; cant: integer;
    valor: real;
begin
 randomize;
 CargarInfo(a);
 ImprimirInfo(a);
 cant:= 0;
 cantimpar(a, cant);
 writeln ('la cantidad de legajos impares es: ', cant);
 FinalesAprobados(a);
 writeln('ingrese un valor real');
 readln(valor);
 InformarCumplenPromedio(a,valor);
end.
