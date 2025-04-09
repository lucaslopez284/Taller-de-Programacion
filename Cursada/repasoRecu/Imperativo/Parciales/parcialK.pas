program parcialTurnoK;
type
  subGenero = 1..15;
  
  
  libro = record
    isbn : integer;
    codAutor: integer;
    codGenero: subGenero;
  end;
  
  libroLista = record
    isbn : integer;
    codAutor: integer;
    codGenero: subGenero;
  end;
  
  lista = ^nodo;
  nodo = record
    dato: libroLista;
    sig: lista;
  end; 
  
  datoArbol = record
    codAutor: integer;
    lis: lista;
  end;
  
  arbol = ^nodoArbol;
  nodoArbol = record
    dato: datoArbol;
    hi:arbol;
    hd: arbol;
  end;
  
  datolista2 = record
    codAutor: integer;
    cantLibros : integer;
   end;
  
  lista2 = ^nodolista2;
  nodolista2 = record
    dato: datolista2;
    sig: lista2;
  end; 
    
 
 
 
 procedure leerLibro (var l: libro);
 begin
   l.isbn:= Random(500);
   if (l.isbn <> 0) then
     begin
       l.codAutor:= Random(100) + 1 ;
       l.codGenero:= Random(15) + 1 ;
     end;
 end;
 
 procedure agregarAdelante(var l: lista; info:libroLista);
 var nue: lista;
 begin
   new(nue);
   nue^.dato:= info;
   nue^.sig:= l;
   l:= nue;
 end;
 
 procedure cargarArbol(var a: arbol; l: libro);
 var 
     laux: libroLista;     
 begin
   if (a = nil) then begin
     new (a);
     a^.dato.codAutor:= l.codAutor;
     a^.dato.lis:= nil;
     laux.isbn:= l.isbn;
     laux.codGenero:= l.codGenero;
     agregarAdelante(a^.dato.lis, laux);
     a^.hi:= nil;
     a^.hd:= nil;
   end
   else
     if (a^.dato.codAutor = l.codAutor) then begin
       laux.isbn:= l.isbn;
       laux.codGenero:= l.codGenero;
       agregarAdelante(a^.dato.lis, laux);
     end
     else
       if (l.codAutor < a^.dato.codAutor) then
         cargarArbol(a^.hi,l)
       else
         cargarArbol(a^.hd,l)
 end;


 procedure procesarDatos(var a: arbol);
 var l: libro;
 begin
   a:= nil;
   leerLibro(l);
   while(l.isbn <> 0) do begin
     cargarArbol(a,l);
     leerLibro(l);
   end;
 end;
 
 procedure imprimirLista(l: lista);
 var i: integer;
 begin
   i:= 1;
   while (l<> nil) do
   begin
     write('libro: ' , i , ' ');
     write('isbn: ' , l^.dato.isbn , ' ');
     writeln('genero: ' , l^.dato.codGenero);
     i:= i + 1;
     l:= l^.sig;
   end;
 end;
 procedure insertarOrdenado(var l: lista2; d: datolista2);
 var 
   nue, act, ant: lista2;
 begin
   new(nue);
   nue^.dato:= d;
   act:= l;
   while( (act <> nil) and (act^.dato.codAutor < d.codAutor) ) do
    begin
     ant:= act;
     act:= act^.sig;
    end;
   if (act = l) then
     l:= nue
   else
     ant^.sig:= nue;
   nue^.sig:= act;
 end;
 procedure imprimirArbol (a: arbol);
 begin
 if(a<> nil) then begin
   imprimirArbol(a^.hi);
   writeln('lista del autor: ' , a^.dato.codAutor);
   imprimirLista(a^.dato.lis);
   imprimirArbol(a^.hd);
  end;
 end;
 
 
 function cantidad (l: lista) : integer;
 var aux:integer;
 begin
   aux := 0;
   while (l<>nil) do begin
     aux:= aux + 1;
     l:= l^.sig;
     end;  
   cantidad:= aux;
 end;
 
 procedure cargarLista(a: arbol; var l: lista2; cod: integer);
 var
   aux: datolista2;
 begin
   if (a<> nil) then begin
     if (cod < a^.dato.codAutor) then begin
       aux.codAutor:= a^.dato.codAutor;
       aux.cantLibros:= cantidad(a^.dato.lis);
       insertarOrdenado(l, aux);
       cargarLista(a^.hi, l, cod);
       cargarLista(a^.hd, l, cod);
     end
     else
       if (cod > a^.dato.codAutor) then begin
         cargarLista(a^.hd, l, cod);
       end;
  end;
 end;
 procedure imprimirIncisoB (l: lista2);
 begin 
   while (l<>nil) do begin
     write('Codigo de autor ' , l^.dato.codAutor , '');
     writeln (' cant de libros ' , l^.dato.cantLibros);
     l:= l^.sig;
   end;
 end;
   
 procedure recursivo(l: lista2; var cantMax: integer; var codMax: integer);
 begin
   if (l<> nil) then begin
     recursivo(l^.sig, cantMax, codMax);
     if (l^.dato.cantLibros > cantMax) then begin
       cantMax:= l^.dato.cantLibros;
       codMax:= l^.dato.codAutor;
     end;
   end;
end;
 var
   a: arbol; lis: lista2; cod, codMax, cantMax: integer;
 begin
   randomize;
   procesarDatos(a);
   imprimirArbol(a);
   writeln('ingrese codigo');
   readln(cod);
   lis:= nil;
   cargarLista(a,lis,cod);
   imprimirIncisoB(lis);
   cantMax:= -1;
   codMax:= -1;
   recursivo(lis,cantMax,codMax);
   writeln('codigo de autor con mas libros ' , codMax, ' con la cantidad: ', cantMax);
 end.
