Program Prac5Ej1;
{ El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas. }
  
const
 dimF = 300;

type 
 Oficina = record
   CodIden : integer;
   DniPro: integer;
   Expensa: real;
 end;
 
 Vector = array [1..300] of oficina;
 
 Procedure Leeroficina (var o: oficina);
 begin
     o.CodIden:= random (500);
     if (o.codIden <> 0) then begin
      o.DNIPro:= random(1000) + 100;
      o.Expensa:= random(50) * 1000;  
     end;   
 end;
 
 
 Procedure CargarVector (var v: vector; var dimL: integer);
 var o: oficina;
 begin
   dimL:= 0;
   Leeroficina(o);
   While((o.CodIden <> 0) and (dimL < dimF)) do begin
         dimL:= dimL + 1;
         V[dimL]:= o;
         Leeroficina(o);
   end;
 
 end;


 Procedure InformarVector(v:vector ; dimL: integer);
 var i: integer;
 begin
    For i:= 1 to dimL do 
       writeln(' la oficina de numero ' , v[i].CodIden , ' cuyo propietario tiene de dni : ' , v[i].DNIPro , ' paga de expensas ' , v[i].Expensa:2:2);
 
 end;
 
 
 Procedure OrdenarVector(var v:vector; dimL: integer);
 var i, j, pos: integer; item:oficina;
 begin
    for i:= 1 to dimL - 1 do begin
         pos:= i;
         For j:= i+1 to dimL do begin
              if (v[j].codIden < v[pos].codIden) then
                        pos:= J ;
              item:= v[pos];
              v[pos]:= V[i];
              v[i]:= item;
            end;
      end;
 end;
  
 Function BusquedaDicotomica(v:vector; dimL:integer; codbuscar:integer): integer;
 var ini, medio, fin: integer;
 begin
    BusquedaDicotomica:= 0;
    ini:= 1;
    fin:= dimL;
    medio:= (ini + fin) div 2;
    while ((ini<= fin) and (v[medio].codIden <> codBuscar)) do begin
            if (codBuscar > v[medio].codIden) then
                      ini := medio + 1
            else if(codBuscar < v[medio].codIden) then
                       fin:= medio - 1;
            medio:= (ini + fin) div 2;
            
     end;
   if ((ini <=fin)and(v[medio].codIden = codBuscar)) then BusquedaDicotomica:= medio;          
    
 
 end;
 
 
 Function MontoTotal(v: vector; dimL: integer): real;
 begin
   if (dimL = 0) then MontoTotal:= 0
        else MontoTotal:= v[dimL].Expensa + MontoTotal(v, diml-1);
 
 end;
 
 
 
    
 
 
 
 var v1,v2: vector; dimL,pos,codBuscar : integer; monto:real;
 begin
    CargarVector(v1,dimL);
    InformarVector(v1,dimL);
    v2:=v1;
    writeln;
    writeln;
    writeln('-----------------------Ahora Ordenado--------------------------');
    writeln;
    writeln;
    OrdenarVector(v2,dimL);
    InformarVector(v2,dimL);
    writeln('Inserte un codigo de oficina a buscar ');
    readln(codBuscar);
    pos:= BusquedaDicotomica(v2,dimL,codBuscar);
    if (pos <> 0) then writeln('El codigo : ' , codBuscar , ' se encuentra en la posicion ' , pos)
                  else writeln (' No se encontro el codigo de oficina : ' , codBuscar);
    monto:= MontoTotal(v2,dimL);
    if (monto > 0) then writeln (' El monto total entre todas las expensas es igual a ' , monto:2:2)
                   else writeln (' el vector esta vacio ' );
 end.
