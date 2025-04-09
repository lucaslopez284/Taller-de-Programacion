program ej1p1;
const dimf = 50;

type 
    dias = 0..31;
    codigos = 1..15;
    cantidades = 1..99;
    rango3 = 0..50;
    
    venta = record
     dia : dias;
     cod : codigos;
     cant : cantidades;
    end;
    
    bis = record
     cod : codigos;
     cant : cantidades;
    end;
    
    lista =^nodo;
    nodo = record
    dato: bis;
    sig: lista;
    end;
    vector = array [1..dimf] of venta;
    
   
procedure leerventa (var v : venta);
 begin
    writeln ('ingrese el dia de venta');
    readln(v.dia);
    if (v.dia <> 0) then begin
     write ('Codigo de producto: ');
     v.cod:= random(15) + 1;
     writeln (v.cod);
     write ('Ingrese cantidad (entre 1 y 99): ');
     readln (v.cant);
   end;
end;

procedure cargarvector (var vec : vector; var dl : integer);
var ven : venta;
begin
 dl:= 0;
 leerventa(ven); 
 while ((ven.dia <> 0) and (dl < dimf)) do begin;
   dl:= dl + 1;
   vec[dl]:= ven;
   leerventa(ven);
 end;
end;


procedure imprimirvector (vec : vector ; dl : integer);
var i: integer;
begin
for i := 1 to dl do begin;
 writeln('el dia de la venta' , i , ' fue ' , vec[i].dia);
 writeln;
 writeln('el codigo de la venta' , i , ' fue ' , vec[i].cod);
 writeln;
 writeln('la cantidad vendida de la venta' , i , ' fue ' , vec[i].cant);
 writeln;
 writeln;
 writeln;
 end;
end;


procedure Ordenar (var v: vector; dimL: integer);

var i, j , pos : integer; item: venta;	
		
begin
 for i:= 1 to dimL - 1 do 
 begin {busca el mínimo y guarda en pos la posición}
   pos := i;
   for j := i+1 to dimL do 
        if (v[j].cod < v[pos].cod) then pos:=j;

   {intercambia v[i] y v[pos]}
   item := v[pos];   
   v[pos] := v[i];   
   v[i] := item;
 end;
end;


procedure EliminarElemento (var v: vector ; var dl : integer; pos : integer);
var i: integer;
begin
    for i:= pos to dl - 1 do;
          v[i] := v[i+1];
    dl:= dl - 1;

end;

procedure EliminarRango(var v: vector; var dl:integer; cod1, cod2: integer);
var i: integer;
begin
   i:= 1;
   while (i<=dl) do 
         if (v[i].cod >= cod1) and (v[i].cod <= cod2) then eliminarElemento(v,dl,i)
                                                      else i:= i +1;



end;

procedure InsertarOrdenado (var L: lista; d: bis);
var nue, act, ant: lista;
begin
  new (nue);
  nue^.dato:= d;
  act := l ; ant:= l;
  while (act <> nil) and (d.cod > act^.dato.cod) do;
   begin
    ant:= act;
    act:= act^.sig;
   end;
  If (act = ant) then l:= nue
                 else ant^.sig:= nue;
  nue^.sig:= act;
                 
end;
		
         
Procedure CargarLista (var l: lista; v: vector; diml: integer);
var i: integer; dato: bis;
begin
  for i:= 1 to diml do ;
    if (v[i].cod mod 2 = 0) then begin dato.cod:= v[i].cod;
                                       dato.cant:= v[i].cant;
                                       InsertarOrdenado(l, dato);
    end;  
            
end;
procedure imprimirlista (l: lista);
begin
  while(l<> nil) do begin
   writeln(' El producto de codigo ', l^.dato.cod , ' se vendio ' , l^.dato.cant , ' cantidad de veces');
   l:= l^.sig;
end;
end;

procedure cargarvectorpares(var v2: vector; var dlpar: integer; v1:vector; dl:integer);
var i: integer;
begin
  dlpar:= 0;
  for i:= 1 to dl do
       if((v1[i].cod mod 2) = 0) then begin;
            dlpar:= dlpar +1;
            v2[dlpar]:= v1[i];
       end;
 
end;
 
var 
 v1,v2: vector; 
 cod1, cod2, diml,dimlpar: integer;
 l: lista;
begin
randomize;
cargarvector(v1,diml);
imprimirvector(v1,diml);

writeln('vector ordenado');
Ordenar(v1,diml);
imprimirvector(v1,diml);
writeln('ingrese el valor de cod1');
readln(cod1);
writeln('ingrese el valor de cod2');
readln(cod2);
eliminarRango(v1,diml,cod1,cod2);
imprimirvector(v1,diml);
l:= nil;
cargarlista(l,v1,diml);
cargarvectorpares(v2,dimlpar,v1,diml);

writeln('ahora pares');
imprimirvector(v2,dimlpar);

end.
