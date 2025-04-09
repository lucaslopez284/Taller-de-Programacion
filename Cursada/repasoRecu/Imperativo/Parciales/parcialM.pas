program parcialM;

type 
  diagnosticos = 1..6;
  
  atencion = record
    matricula: integer;
    dniPaciente: integer;
    dia: integer;
    diagnostico : integer; 
  end;
  
  datoArbol = record
    matricula : integer;
    cant: integer;
  end;
  
  lista= ^nodoL;
  nodoL = record
    dato: integer;
    sig: lista;
    end;
    
  arbol =^nodo;
  nodo = record
    dato: datoArbol;
    hi: arbol;
    hd: arbol;
  end;
  
  datoVector = record
    diagnostico: string;
    lis: lista;
  end;
  
  vector = array[diagnosticos] of datoVector;
  
  var v: array [diagnosticos] of string = ('A' , 'B' , 'C' , 'D', 'E', 'F');
  
  procedure inicializar (var vec: vector);
  var i: diagnosticos;
  begin
    for i:= 1 to 6 do begin
        vec[i].diagnostico:= v[i];
        vec[i].lis:= nil;
     end;
  end;
  
  procedure leerAtencion (var a: atencion);
  begin
    a.dniPaciente:= Random (100);
    if (a.dniPaciente<> 0) then begin
      a.matricula:= Random (1000) + 1000;
      a.dia:= Random (31)+ 1;
      a.diagnostico:= Random (6) + 1;
    end;
  end;
  
  procedure agregarAdelante (var l: lista; dni: integer);
  var nue: lista;
  begin
    new (nue);
    nue^.dato:= dni;
    nue^.sig:= l;
    l:= nue;
  end;
  
  procedure cargarArbol (var a: arbol; matricula: integer);
  begin
    if (a = nil) then begin
      new (a);
      a^.dato.matricula:= matricula;
      a^.dato.cant:= 1;
      a^.hi:= nil;
      a^.hd:= nil;
    end
    else if (a^.dato.matricula = matricula) then a^.dato.cant:= a^.dato.cant + 1
         else if (matricula < a^.dato.matricula) then cargarArbol(a^.hi,matricula)
              else cargarArbol(a^.hd,matricula);
 end;
 
 procedure procesarDatos (var a: arbol; var vec: vector);
 var at: atencion;
 begin
   a:= nil;
   inicializar(vec);
   leerAtencion(at);
   while (at.dniPaciente <> 0) do begin
      cargarArbol(a,at.matricula);
      agregarAdelante(vec[at.diagnostico].lis, at.dniPaciente);
      leerAtencion(at);
    end;
   
 
 end;
 
 procedure imprimirLista (l: lista);
 begin
   while (l<> nil) do begin
     writeln('Paciente con DNI: ' , l^.dato);
     l:= l^.sig;
   end;
 end;
 
 procedure imprimirVector (vec: vector);
 var i: diagnosticos;
 begin
   for i:= 1 to 6 do begin
     writeln('Lista de pacientes con Diagnostico ' , vec[i].diagnostico);
     imprimirLista(vec[i].lis);
   end;
 end;
 
 procedure imprimirArbol (a: arbol);
 begin
   if (a<> nil) then begin
     imprimirArbol(a^.hi);
     writeln('Medico de matricula: ' , a^.dato.matricula , ' cantidad de atenciones ' , a^.dato.cant);
     imprimirArbol(a^.hd);
   end;
 end; 
 
 procedure imprimirTodo (a: arbol; vec: vector);
 begin
   writeln('---------- Arbol ----------');
   imprimirArbol(a);
   writeln('---------- Vector ----------');
   imprimirVector(vec);
 end;
 
 function mayores(a: arbol; mat: integer) : integer;
 begin
   if (a = nil) then mayores:= 0
   else if (a^.dato.matricula > mat) then mayores:= a^.dato.cant + mayores(a^.hi,mat) + mayores(a^.hd,mat)
        else mayores:= mayores(a^.hd,mat);
 
 end;
 
 function contarLista (l: lista) : integer;
 var aux: integer;
 begin
   aux:= 0;
   while (l<> nil) do begin
     aux:= aux + 1;
     l:= l^.sig
   end;     
   contarLista:= aux;
 end;
 
 procedure recursivo (vec: vector; var diag: string; var max: integer; diml: integer);
 var aux: integer;
 begin
    if (diml > 0) then begin
      aux:= contarLista(vec[diml].lis);
      if (aux > max) then begin
        max:= aux;
        diag:= vec[diml].diagnostico;
      end;
      recursivo(vec,diag,max,diml-1);
   end;
 end; 
      
  



var vec: vector; a: arbol; mat, diml, max: integer; diag: string; 
begin
  Randomize;
  writeln('----------Inciso A ------------');
  procesarDatos(a,vec);
  imprimirTodo(a,vec);
  writeln('----------Inciso B ------------');
  writeln('Ingrese matricula ');
  readln(mat);
  writeln('La cantidad de atenciones realizadas por los medicos  con matricula superior a ' , mat , ' es ' , mayores(a,mat));
  writeln('----------Inciso C ------------');
  diag:= 'Z';
  max:= 0;
  diml:= 6;
  recursivo (vec,diag,max, diml);
  if (max > 0) then writeln('El diagnostico con mayor cantidad de pacientes atendidos es ' , diag)
  else writeln('La estructura de datos se encuentra vacia');
  readln;
end.
