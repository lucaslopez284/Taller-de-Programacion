program repaso1;

const
  dimf = 300;

type 
  oficina = record
    codigo: integer;
    dni: integer;
    expensa: real; 
  end;
  
  vector = array [1..dimf] of oficina;
  
  procedure leerOficina(var o: oficina);
  begin
      o.codigo:= Random (600);
      if (o.codigo<> 0) then begin
        o.dni:= Random (2000) + 4000;
        o.expensa:= Random (40000) + 2000 / Random (2000);;
      end;
  end;
  
  procedure cargarVector(var v: vector; var diml: integer);
  var o: oficina;
  begin
    diml:= 0;
    leerOficina(o);
    while (diml < dimf) and (o.codigo <> 0) do begin
      diml:= diml + 1;
      v[diml]:= o;
      leerOficina(o);
    end;
  end;
  
  procedure imprimirVector(v: vector; diml: integer);
  var i: integer;
  begin
    for i:= 1 to diml do 
      writeln('Elemento: ' , i , ' Codigo de oficina: ' , v[i].codigo , ' DNI: ' , v[i].dni , ' Expensa: ' , v[i].expensa:2:2);
    end;
 
  procedure insercion (var v: vector; diml: integer);
  var i,j: integer; actual: oficina;
  begin
    for i:= 2 to diml do begin
      actual:= v[i];
      j:= i - 1;
      while (j>0) and (v[j].codigo < actual.codigo) do begin
         v[j+1]:= v[j];
         j:= j-1;
       end;
      v[j+1]:= actual;
     end;
  end;   
  
  function busquedaDicotomica(v: vector;diml: integer; cod: integer): integer;
  var ini,medio,fin: integer;
  begin
    ini:= 1;
    fin:= diml;
    medio:= (ini + fin) div 2;
    while(ini<= medio) and (cod <> v[medio].codigo) do begin
       if (cod < v[medio].codigo) then fin:= medio -1
       else ini:= medio +1;
       medio:= (ini + fin) div 2;
     end;
  if (ini<=fin) and (cod = v[medio].codigo) then
     busquedaDicotomica:= medio
  else busquedaDicotomica:= 0;
  end;
  
  function montoExpensas(v: vector; diml: integer): real;
  begin
     if (diml = 0) then montoExpensas:= 0
     else montoExpensas:= v[diml].expensa + montoExpensas(v,diml-1);
  end;
 
var
  v: vector; diml,cod,pos: integer;
begin
  Randomize;
  cargarVector(v,diml);
  imprimirVector(v,diml);
  writeln('Ahora orden');
  insercion(v,diml);
  imprimirVector(v,diml);
  writeln('Ingrese un codigo a buscar ');
  readln(cod);
  pos:= busquedaDicotomica(v,diml,cod);
  if (pos<>0) then writeln('El codigo de oficina ' , cod , ' se encuentra en la posicion ' , pos)
  else writeln('El codigo de oficina ' , cod , ' no se encuentra en el vector');
  writeln('El monto total de expensas es ' , montoExpensas (v,diml):2:2);
end.
