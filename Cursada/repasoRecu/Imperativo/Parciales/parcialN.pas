program parcialN;
const 
  dimf = 12;
type 
 atencion = record
   matricula: integer;
   dni: integer;
   mes: integer;
   diagnostico: char;
  end;

  
 aten2 = record
   dni: integer;
   diagnostico: char;
  end;
  
 arbol = ^nodo;
 nodo = record
   dato: aten2;
   hd: arbol;
   hi: arbol;
 end;
 
 vec = array [1..dimf] of arbol;
 
 procedure leerAtencion (var a: atencion);
 var
   v: array [1..5] of char = ('L','M','N','O','P');
 begin
   a.matricula:= Random(1000);
   if (a.matricula <>0) then begin
     a.dni:= Random(5000) + 1000;
     a.mes:= Random(12) + 1;
     a.diagnostico := v[Random(5) + 1];
   end;
 end;
 
  
 procedure inicializar(var v: vec);
 var i:integer;
 begin
   i:= 1;
   for i:= 1 to dimf do;
     v[i]:= nil;
 end;
 
 procedure cargarArbol (var a: arbol; info: aten2); 
 begin
   if (a = nil) then begin
     new(a);
     a^.dato:= info;
     a^.hd:= nil;
     a^.hi:= nil;
   end
   else if (info.dni <= a^.dato.dni) then
          cargarArbol(a^.hi, info)
         else
          cargarArbol(a^.hd, info);
 end;
 
 procedure procesarDatos(var v: vec);
 var
   a: atencion; aux: aten2;
 begin
   leerAtencion(a);
   while (a.matricula <> 0) do begin;
     aux.dni:= a.dni;
     aux.diagnostico:= a.diagnostico;
     cargarArbol(v[a.mes], aux);
     leerAtencion(a);
   end;
 end;
 
 procedure imprimirNodo (info: aten2);
 begin
   writeln('dni: ' , info.dni , ' diagnostico: ' , info.diagnostico);
 end;
 procedure imprimirArbol (a: arbol);
 begin
 if (a <> nil) then begin
   imprimirArbol(a^.hi);
   imprimirNodo(a^.dato);
   imprimirArbol(a^.hd);
  end;
 end;
 
 procedure imprimirTodo (v: vec);
 var i: integer;
 begin
   for i:= 1 to dimf do begin;
     writeln (' arbol del mes ' , i);
     imprimirArbol(v[i]);
   end;
 end;
 
 function cantAtenciones (a: arbol) : integer;
 begin
   if (a = nil) then
     cantAtenciones:= 0
   else
    if (a<> nil) then
     cantAtenciones:= 1 + cantAtenciones(a^.hi) + cantAtenciones(a^.hd);
 end;
 
 procedure recursivo (v: vec; var maxAtencion: integer; var mesMax: integer; diml: integer);
 var aux: integer;
 begin
   if (diml <> 0) then begin
     aux:= cantAtenciones(v[diml]);
     if (aux > maxAtencion) then begin
       maxAtencion:= aux;
       mesMax:= diml;
     end;
     recursivo(v, maxAtencion, mesMax, diml - 1)
   end;
 
 end;
  
 procedure buscarEnElArbol (a: arbol; var encontre: boolean;dni: integer);
 begin
   if (a <> nil) then begin
     if (dni = a^.dato.dni) then
       encontre:= true
     else if (dni < a^.dato.dni) then
           buscarEnElArbol(a^.hi, encontre,dni)
          else if (dni > a^.dato.dni) then
            buscarEnElArbol(a^.hd, encontre, dni);
  end;
 end;
 
 procedure busqueda(v: vec; var encontre: boolean;dni: integer);
 var i: integer;
 begin
   i:= 1;
   while (i <= dimf) and (encontre = false) do begin;
     buscarEnElArbol(v[i], encontre,dni);
     i:= i + 1;
   end;
 end;
var
  v: vec; diml: integer; mes, maxA: integer;
  encontre: boolean; dni: integer;
begin
  Randomize;
  inicializar(v);
  procesarDatos(v);
  writeln('-------------Inciso A--------------');
  imprimirTodo(v);
  writeln('-------------Inciso B--------------');
  diml:= dimf;
  mes:= -1;
  maxA:= 0;
  recursivo(v,maxA,mes,diml);
  if (mes = -1) then
    writeln('no se cargo correctamente')
  else
    writeln('el mes con mas cantidad de atenciones es ' , mes);
  writeln('-------------Inciso C--------------');
  writeln('inserte dni a buscar');
  readln(dni);
  encontre:= false;
  busqueda(v,encontre,dni);
  if (encontre = false) then
    writeln('no se encontro el dni ' , dni)
  else
    writeln('el dni ' , dni, ' se encuentra en el arbol');
end.
