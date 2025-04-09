program actividad;
type 
     lista = ^nodo;
     nodo = record 
        dato: integer;
        sig: lista;
     end;
    
procedure NuevoNodo (var l: lista; num: integer);
var nuevo, actual, anterior: lista;
begin 
     new (nuevo);
     anterior:= l ;
     actual:= l ;
     nuevo^.dato:= num;
     while (actual <> nil) and ( actual^.dato<num) do begin;
       anterior:= actual;
       actual:= actual^.sig;
      end;
      
     if (actual = anterior) then l:= nuevo 
                            else anterior^.sig:= nuevo;   
  
          
     nuevo^.sig:= actual;
end;


procedure cargarlista (var l: lista);
  var a: integer;
  
  begin 
        
        a:= random (51) + 100;
        while (a <> 120) do begin;
             nuevonodo(l,a);
             a:= random (51) + 100;
         end;
  end;










procedure ImprimirLista (l: lista);
  begin
   while (l <> nil) do  begin;
        writeln(' el numero almacenado es  ' ,  l^.dato);
        l:= l^.sig;
    end;    
 end;
         
function BuscarOrdenado ( l: lista; num: integer): boolean;
var encontre : boolean;
begin
 encontre:= false;
 while ( (l <> nil) and (l^.dato < num)) do begin;
    l:= l^.sig;
  end;
 if ( l <> nil) and (l^.dato = num) then encontre:= true;
 BuscarOrdenado:= encontre;
end;


var
 lis:lista; numero: integer;
 esta: boolean;
begin
 lis:= nil;
 randomize;
 Cargarlista(lis);
 ImprimirLista (lis);
 writeln(' ingrese el valor a buscar');
 read (numero);
 esta:= BuscarOrdenado (lis, numero);
 if (esta = true) then writeln (' si se encuentra')
                  else writeln ( 'no se encuentra');
 readln;
end.



