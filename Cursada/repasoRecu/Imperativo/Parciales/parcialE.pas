program parcialE;
const
  dimf= 7;
type
  generos= 1..7;
  
  libro = record
    isbn: integer;
    codAutor: integer;
    genero: generos;
   end;
   
   datoArbol = record
     codAutor: integer;
     cant: integer;
   end;
   
   datoVector = record
     cod: integer;
     cant: integer;
    end;
    
    vector = array [generos] of datoVector;
    
    arbol = ^nodo;
    nodo= record
      dato: datoArbol;
      hi: arbol;
      hd: arbol; 
    end;
   
 var v: array[generos] of string =('literario ' , 'filosofia ' , 'arte', 'biologia', 'computacion', 'medicina', 'ingenieria');
     
  procedure leerlibro(var l: libro);
  begin
    l.isbn := Random (1000);
    if (l.isbn <> 0) then begin
      l.codAutor:= Random (20) + 100;
      l.genero:= Random(7) + 1;
    end;
  end;
  
  procedure inicializar (var vec: vector);
  var i: generos;
  begin
    for i:= 1 to dimf do begin
      vec[i].cant:= 0;
      vec[i].cod:= i;
    end;
  end;
  
  procedure cargarArbol(var a: arbol; l: libro);
  begin
    if (a= nil) then begin
      new (a);
      a^.dato.cant:= 1;
      a^.dato.codAutor:= l.codAutor;
      a^.hi:= nil;
      a^.hd:= nil;
    end
    else if (a^.dato.codAutor = l.codAutor) then begin
            a^.dato.cant:= a^.dato.cant + 1;
          end
         else if (l.codAutor < a^.dato.codAutor) then cargarArbol(a^.hi,l)
              else cargarArbol(a^.hd,l);
  end;
  
  procedure cargarVector (var vec: vector; n: generos);
  begin
    vec[n].cant:= vec[n].cant + 1;
  end;
  
  procedure procesarDatos (var a: arbol; var vec: vector);
  var l: libro;
  begin
    a:= nil;
    inicializar(vec);
    leerlibro(l);
    while (l.isbn <> 0) do begin
      cargarArbol(a,l);
      cargarVector(vec,l.genero);
      leerlibro(l);
    end;
  end;
  
  procedure imprimirArbol(a: arbol);
  begin
    if (a<> nil) then begin
      imprimirArbol(a^.hi);
      writeln('El autor de codigo ' , a^.dato.codAutor , ' tiene ' , a^.dato.cant , ' libros ');
      imprimirArbol(a^.hd);
    end;
  end;
  
  procedure imprimirVector (vec: vector);
  var i: generos;
  begin
    for i:= 1 to dimf do 
      writeln('Al genero ' , v[vec[i].cod] , ' de codigo ' , vec[i].cod , ' le corresponden ' , vec[i].cant , ' libros ');
  end;
  
  procedure ordenacion (var vec: vector; var material: string);
  var pos,i,j,diml: generos ; item: datoVector;
  begin
    diml:= 7;
    for i:= 1 to diml - 1 do begin
      pos:= i;
      for j:= i+1 to diml do
        if (vec [j].cant > vec[pos].cant) then pos:= j;
      item:= vec[pos];
      vec[pos]:= vec[i];
      vec[i]:= item;
    end;
    
    if (vec [1].cant > 0) then material:= v[vec[1].cod];
  end;
  
  function cantidad (a: arbol; cod1: integer; cod2: integer) : integer;
  begin
    if (a= nil) then cantidad:= 0
    else if (a^.dato.codAutor > cod1) and (a^.dato.codAutor < cod2) then 
          cantidad:= a^.dato.cant+ cantidad (a^.hi,cod1,cod2) + cantidad(a^.hd,cod1,cod2)
         else if (a^.dato.codAutor <= cod1) then cantidad:= cantidad(a^.hd,cod1,cod2)
               else cantidad:= cantidad (a^.hi,cod1,cod2);
  end;
  


var vec: vector; a: arbol; material: string; cod1,cod2: integer;

begin
  Randomize;
  procesarDatos(a,vec);
  writeln('-------------Inciso A-------------');
  writeln('------------- Arbol -------------- ');
  imprimirArbol(a);
  writeln('--------------Vector-------------');
  imprimirVector(vec);
  writeln('-------------Inciso B-------------');
  material:= 'a';
  ordenacion(vec, material);
  imprimirVector(vec);
  if (material <> 'a') then writeln('El genero con mayor cantidad de libros vendidos es ' , material)
  else writeln('No se vendio ningun libro ');
  writeln('-------------Inciso C-------------');
  writeln('Ingrese cod 1' );
  readln(cod1);
  writeln('Ingrese cod 2');
  readln(cod2);
  writeln('La cantidad de libros correspondientes a loc codigos de autores entre ' , cod1 , ' y ' , cod2 , ' es ' , cantidad(a,cod1,cod2));
end.
