program ej3;
type  
 rango = 1..8;
 pelicula = record
  CodPeli: integer;
  CodGenero: rango;
  Puntaje: integer;
 end;
 lista = ^nodo;
 nodo = record
  dato: pelicula;
  sig: lista;
 end;
 
 bis = record
  codgenero: rango;
  codpelimax: integer;
 end;
 
 Vector = array [rango] of lista;
 VectorMaximos = array [rango] of bis;

 
procedure IniciarListas (var v:vector);
var i: integer;
begin
  for i:= 1 to 8 do
   v[i]:= nil;
end;

procedure LeerPelicula (var p: pelicula);
begin
 writeln('ingrese el codigo de pelicula');
 readln(p.codpeli);
 if (p.codpeli<> -1) then begin;
  writeln('codigo de pelicula: ' , p.codpeli);
  p.codgenero:= random (8) + 1;
  writeln('codigo de genero : '   , p.codgenero);
  p.puntaje := random (10) + 1;
  writeln('puntaje:  ' , p.puntaje);
end;
end;


procedure AgregarAtras (var L: lista ; p : pelicula);
var 
 nue, aux: lista;
begin
 new (nue);
 nue^.dato:= p;
 nue^. sig:= nil;
 if (l = nil) then L:= nue            
              else begin
                   aux:= l;
                   while (aux^.sig <> nil) do 
                        aux:= aux^.sig;
                   aux^.sig:= nue;
              end; 
                   
end; 
 
procedure CargarDatos (var v: vector);
var p: pelicula;
begin 
  iniciarlistas(v);
  LeerPelicula(p);
  while(p.codpeli<> -1)do begin;
   AgregarAtras(v[p.codgenero], p);
   LeerPelicula(p);
  end;

end;

procedure informarPelicula (p: pelicula; i: integer);
begin
 writeln('pelicula de  la lista del genero', i);

 writeln (' el genero de pelicula es: ' , p.codgenero);


 writeln('  el codigo de la pelicula es:' , p.codpeli);

 writeln(' el puntaje de la pelicula fue: ' , p.puntaje);
 
 readln;
 readln;
end;


procedure imprimirlista ( l:lista; i: integer);
begin
     if (l = nil) then writeln('la lista del genero:' , i , ' se encuentra vacia')
                  else while(l <> nil) do begin;
                            informarPelicula(l^.dato, i);
                            l:= l^.sig;
                        end;
end;

procedure InformarDatos (v: vector);
var i : integer;
begin 
  for i:= 1 to 8 do begin;
   imprimirlista(v[i], i);
 end;
end;

procedure iniciarvecmax (var v: vectormaximos);
var i: integer;
begin 
 for i:= 1 to 8 do begin
  v[i].codgenero:= i;
  v[i].codpelimax:= 0;
 end; 
end;

function maximo (l: lista): integer;
var puntajemax: integer; codmax: integer;
begin 

 if (l = nil) then begin puntajemax:= 0; codmax:= 0; 
                 end
              else while (l <> nil) do begin
                       if (l^.dato.puntaje > puntajemax) then begin
                             puntajemax:= l^.dato.puntaje;
                             codmax:= l^.dato.codpeli;
                       end;
  
  
             end;
 maximo:= codmax;
 end;


procedure obtenermaximos (v : vector ; var vecmax : vectormaximos);
var i : integer;
begin
  for i:= 1 to 8 do begin;
   vecmax[i].codpelimax := maximo(v[i]);
  end;

end;

procedure informardatosbis (vecmax: vectormaximos);
var i: integer;
begin
   for i:= 1 to 8 do begin;
    writeln ('el codigo de pelicula que obtuvo mas puntaje del genero:  ' , vecmax[i].codgenero , ' fue : ', vecmax[i].codpelimax);

end;
end;
  
var 
 Vec: vector;
 vecmax: vectormaximos;
 i: integer;
begin
 randomize;
 CargarDatos(vec);
 for i:= 1 to 8 do begin
  imprimirlista(vec[i],i);
 end;
 iniciarvecmax(vecmax);
 obtenermaximos(vec, vecmax);
 informardatosbis(vecmax);
 readln;
 
end.
