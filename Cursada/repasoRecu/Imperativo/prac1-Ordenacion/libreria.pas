program libreria;

const
  dimf= 30;

type
  rubros = 1..8;
  producto = record
    cod: integer;
    rubro: rubros;
    precio: real;
  end;
  
  
  producto2 = record
    cod: integer;
    precio: real;
  end;
  
  lista = ^nodo;
  nodo = record
    dato: producto2;
    sig: lista;
   end;
   
   vector = array[rubros] of lista;
   rubro3 = array [1..dimf] of producto2;
   
   Procedure leerProducto(var p: producto);
   begin
     p.precio:= Random (100);
     if (p.precio <> 0) then begin
       p.cod:= Random (1000) + 2500;
       p.rubro:= Random (8) + 1;
     end;
   end;
   
   Procedure inicializarListas (var v: vector);
   var i: integer;
   begin
     for i:= 1 to 8 do;
      v[i]:= nil;
   end;
   
   procedure asignar(var p2: producto2; p: producto);
   begin
     p2.cod:= p.cod;
     p2.precio:= p.precio;
   end;
   
   
   procedure insertarOrdenado (var l: lista; info: producto2);
   var
     nue, act, ant: lista;
   begin
     new(nue);
     nue^.dato:=info;
     act:= l;
     ant:= l;
     while (act <> nil) and (info.cod > act^.dato.cod) do begin
       ant:= act;
       act:= act^.sig;
     end;
     if (act = ant) then
       l:= nue
     else
       ant^.sig:= nue;
     nue^.sig:= act;
   end;
   
   procedure procesarDatos (var v: vector);
   var
     p: producto;
     p2: producto2;
   begin
     inicializarListas(v);
     leerProducto(p);
     while (p.precio <> 0) do begin
       asignar(p2,p);
       insertarOrdenado(v[p.rubro], p2);
       leerProducto(p);
     end;  
   end; 
   
   procedure imprimirLista (l: lista);
   begin
     while (l<> nil) do begin
       writeln('Codigo de producto ' , l^.dato.cod);
       l:= l^.sig;
     end;
   end;
   
   procedure imprimirDatos (v: vector);
   var i: integer;
   begin
     for i:= 1 to 8 do begin;
       writeln('Lista del rubro ' , i);
       imprimirLista(v[i]);
     end;
   end;
   
   procedure generarVector(l: lista; var v: rubro3; var diml: integer);
   begin
     diml:= 0;
     while (l<> nil) and (diml <dimf) do begin
       diml:= diml + 1;
       v[diml]:= l^.dato;
       l:= l^.sig;
     end;
   end;
   
  procedure imprimirVector(v: rubro3; diml: integer);
  var i: integer;
  begin
    for i:= 1 to diml do begin
      writeln('Elemento: ' , i);
      writeln('Codigo de producto: ', v[i].cod , ' precio: ' , v[i].precio:2:2);
    end;
  end;
  
  procedure seleccion (var v: rubro3; diml: integer);
  var i, j, pos: integer ; item: producto2;
  begin
    for i:= 1 to (diml - 1) do begin
      pos:= i;
      for j:= i +1 to diml do 
        if (v[j].precio < v[pos].precio) then 
          pos:= j;
      item:= v[pos];
      v[pos]:= v[i];
      v[i]:= item;
       
  end;
 end;
 
   function sumaTotal(v: rubro3;diml: integer): real;
   var aux: real;
       i: integer;
   begin
    aux:= 0;
    for i:= 1 to diml do
      aux:= v[i].precio + aux;
    sumaTotal:= aux;
   end; 
var
 v: vector; diml: integer;
 v2: rubro3; suma: real;
 
begin
  Randomize;
  procesarDatos(v);
  imprimirDatos(v);
  generarVector(v[3],v2,diml);
  imprimirVector(v2,diml);
  seleccion(v2,diml);
  imprimirVector(v2,diml);
  suma:= sumaTotal(v2, diml);
  writeln('El promedio de precios del vector es ' , suma / diml :2:2);
end.
   
   

