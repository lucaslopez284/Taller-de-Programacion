program prueba;
type 
 arbol = ^nodo;
 nodo = record
  dato: integer;
  hi:arbol;
  hd:arbol;
 end;
 
vector = array [1..7] of integer;

procedure agregar (var a:arbol; num: integer);
begin
   if(a = nil) then begin
        new (a); a^.dato:= num; a^.hi := nil; a^.hd:= nil;
        end
               else if (num <= a^.dato) then agregar(a^.hi, num)
                                        else agregar(a^.hd, num);
        
    

end;


procedure cargararbol (var a: arbol; v:vector);
var 
   num, i:integer;
begin
   a:= nil;
   for i:= 1 to 7 do begin
      num:=v[i];
      agregar(a,num);
   
    end;

end;


procedure EnOrden (a:arbol);
begin
if (a<>nil) then begin
     EnOrden(a^.hi);
     writeln('el dato del nodo es ' , a^.dato);
     EnOrden(a^.hd);
end;
end;

procedure PreOrden (a:arbol);
begin
    if(a<>nil) then begin
        writeln('el dato del nodo es ' , a^.dato);
        PreOrden(a^.hi);
        PreOrden(a^.hd);
     end;
        

end;


procedure PostOrden (a:arbol);
begin
  if(a<>nil) then begin
       PostOrden(a^.hi);
       PostOrden(a^.hd);
       writeln('el dato del nodo es ' , a^.dato);
      end;

end;

procedure OrdenInverso (a:arbol);
begin
if (a<>nil) then begin
     OrdenInverso(a^.hd);
     writeln('el dato del nodo es ' , a^.dato);
     OrdenInverso(a^.hi);
end;
end;

var
  a:arbol; v:vector;


begin
 v[1]:= 15;
 v[2]:= 8;
 v[3]:= 24;
 v[4]:= 7;
 v[5]:= 12;
 v[6]:= 16;
 v[7]:= 30;
 cargararbol(a,v);
 writeln('imprimir en orden');
 EnOrden(a);
 writeln;
 writeln('ahora PreOrden');
 PreOrden(a);
 writeln;
 writeln('ahora PostOrden');
 PostOrden(a);
 writeln;
 writeln('ahora orden inverso');
 OrdenInverso(a);
 readln;
end.



