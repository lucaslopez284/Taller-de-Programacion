program djsjsdjsd;

 type
   alumno = record
     nombre: String;
     dni: integer;
     tiempo: real;
   end;
   
   arbol =^nodo;
   nodo = record
     dato: alumno;
     hd: arbol;
     hi: arbol;
   end;
   
   lista =^nodoLista;
   nodoLista = record
     dato: alumno;
     sig: lista;
   end;
   
   procedure leerAlumno(var a: alumno);
   var v : array [1..6]of String = ('Mateo', 'Lucas','Federico', 'Malena','Catalina', 'Lautaro');
   begin
     a.nombre:= v [Random (6) + 1];
     a.dni:= Random (1000);
     if (a.dni <> 0) then begin
       a.nombre:= v [Random (6) + 1];
       a.dni:= a.dni + 4500;
       a.tiempo:= (Random (25) + 10) / (Random (5) + 1);
     end;
   end;
   
   procedure cargarArbol (var a: arbol; al: alumno);
   begin
     if (a = nil) then begin
       new (a);
       a^.dato:= al;
       a^.hi:= nil;
       a^.hd:= nil;
     end
     else if (al.tiempo <=  a^.dato.tiempo) then cargarArbol(a^.hi,al)
          else cargarArbol(a^.hd,al)
   end;
   
   procedure cargarDatos (var a: arbol);
   var al:alumno;
   begin
     a:= nil;
     leerAlumno(al);
     while (al.dni <> 0) do begin
       cargarArbol(a,al);
       leerAlumno(al);
     end;
   end;
   
   procedure imprimirNodo (a: alumno);
   begin
     writeln('Nombre ' , a.nombre, ' , dni ' , a.dni , ' , tiempo , ' , a.tiempo:2:2); 
   end;
   
   procedure imprimirArbol (a: arbol);
   begin
     if (a<> nil) then begin
       imprimirArbol(a^.hi);
       imprimirNodo(a^.dato);
       imprimirArbol(a^.hd);
     end;
   
   end;
   
   procedure agregarAdelante (var l: lista; a: alumno);
   var nue: lista;
   begin
     new (nue);
     nue^.dato:= a;
     nue^.sig:= l;
     l:= nue;
   end;
   
   procedure rango(var l: lista; a: arbol; n1: real; n2: real);
   begin
     if (a <> nil) then begin
       if ((a^.dato.tiempo > n1) and ( a^.dato.tiempo < n2)) then begin 
         rango(l,a^.hd,n1,n2);
         agregarAdelante(l,a^.dato);
         rango(l,a^.hi,n1,n2);
     end
     else if (n1 >= a^.dato.tiempo) then rango(l,a^.hd,n1,n2)
          else rango(l,a^.hi,n1,n2);
    end;
   end;
   
   procedure imprimirLista(l: lista);
   begin
     while (l<> nil) do begin
       imprimirNodo(l^.dato);
       l:= l^.sig;
     end;
   end;
   
   procedure incisoB (var l: lista; a: arbol; n1: real; n2: real);
   begin
     rango(l,a,n1,n2);
     writeln('Lista de los alumnos con tiempo entre ' , n1:2 , ' y ' , n2:2);
     imprimirLista(l);
   end;
   
   procedure masRapido (var n: string; var dni: integer; a: arbol);
   begin 
     if (a <> nil) then begin
        if (a^.hi <> nil) then masRapido (n,dni,a^.hi)
        else begin
          n:= a^.dato.nombre;
          dni:= a^.dato.dni;
        end;
     end;
   end;
   
var a: arbol; n1,n2: real; l: lista; n: string; dni: integer;
begin
  writeln('---------------INCISO A----------------');
  Randomize;
  cargarDatos(a);
  imprimirArbol(a);
  writeln('---------------INCISO B----------------');
  writeln('Ingrese un primer numero');
  readln(n1);
  writeln('Ingrese un segundo numero');
  readln(n2);
  incisoB(l,a,n1,n2);
  writeln('---------------INCISO C----------------');
  n:= ''; dni:= 0;
  masRapido(n,dni,a);
  writeln('El alumno mas rapido fue ' , n, ' y su DNI es ' , dni);
end.
