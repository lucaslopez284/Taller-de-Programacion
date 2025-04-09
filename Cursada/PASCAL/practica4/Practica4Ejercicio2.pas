program practica4ej2;
{i. Informar el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informar los datos del socio con el número de socio más chico. Debe invocar a un
módulo recursivo que retorne dicho socio.
iii. Leer un valor entero e informar si existe o no existe un socio con ese valor. Debe
invocar a un módulo recursivo que reciba el valor leído y retornar verdadero o falso.
iv. Leer e informar la cantidad de socios cuyos códigos se encuentran comprendidos
entre los valores leídos. Debe invocar a un módulo recursivo que reciba los valores
leídos y retorne la cantidad solicitada.}





type rangoEdad = 12..100;
     cadena15 = string [15];
     socio = record
               numero: integer;
               nombre: cadena15;
               edad: rangoEdad;
             end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: socio;
                    HI: arbol;
                    HD: arbol;
                 end;
     
procedure GenerarArbol (var a: arbol);
{ Implementar un modulo que almacene informacion de socios de un club en un arbol binario de busqueda. De cada socio se debe almacenar numero de socio, 
nombre y edad. La carga finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. La informacion de cada socio debe generarse
aleatoriamente. }

  Procedure CargarSocio (var s: socio);
  var vNombres:array [0..9] of string= ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola'); 
  
  begin
    s.numero:= random (51);
    If (s.numero <> 0)
    then begin
           s.nombre:= vNombres[random(10)];
           s.edad:= 12 + random (79);
         end;
  end;  
  
  Procedure InsertarElemento (var a: arbol; elem: socio);
  Begin
    if (a = nil) 
    then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.numero < a^.dato.numero) 
         then InsertarElemento(a^.HI, elem)
         else InsertarElemento(a^.HD, elem); 
  End;

var unSocio: socio;  
Begin
 writeln;
 writeln ('----- Ingreso de socios y armado del arbol ----->');
 writeln;
 a:= nil;
 CargarSocio (unSocio);
 while (unSocio.numero <> 0)do
  begin
   InsertarElemento (a, unSocio);
   CargarSocio (unSocio);
  end;
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;
 
procedure InformarSociosOrdenCreciente (a: arbol);
{ Informar los datos de los socios en orden creciente. }
  
  procedure InformarDatosSociosOrdenCreciente (a: arbol);
  begin
    if ((a <> nil) and (a^.HI <> nil))
    then InformarDatosSociosOrdenCreciente (a^.HI);
    writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
    if ((a <> nil) and (a^.HD <> nil))
    then InformarDatosSociosOrdenCreciente (a^.HD);
  end;

Begin
 writeln;
 writeln ('----- Socios en orden creciente por numero de socio ----->');
 writeln;
 InformarDatosSociosOrdenCreciente (a);
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;

procedure informarsociosordendecreciente(a:arbol);
begin
    if((a<>nil) and (a^.hd <> nil))
    then informarsociosordendecreciente(a^.hd);
    writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
    if ((a<>nil)and (a^.hi <> nil)) 
    then informarsociosordendecreciente(a^.hi);
           
end;


procedure InformarNumeroSocioConMasEdad (a: arbol);
{ Informar el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor.  }

     procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);
	begin
	  if (nuevoValor >= maxValor) then
	  begin
		maxValor := nuevoValor;
		maxElem := nuevoElem;
	  end;
	end;
	procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
	begin
	   if (a <> nil) then
	   begin
		  actualizarMaximo(maxEdad,maxNum,a^.dato.edad,a^.dato.numero);
		  numeroMasEdad(a^.hi, maxEdad,maxNum);
		  numeroMasEdad(a^.hd, maxEdad,maxNum);
	   end; 
	end;

var maxEdad, maxNum: integer;
begin
  writeln;
  writeln ('----- Informar Numero Socio Con Mas Edad ----->');
  writeln;
  maxEdad := -1;
  NumeroMasEdad (a, maxEdad, maxNum);
  if (maxEdad = -1) 
  then writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Numero de socio con mas edad: ', maxNum);
         writeln;
       end;
  writeln;
  writeln ('//////////////////////////////////////////////////////////');
  writeln;
end;

procedure AumentarEdadNumeroImpar (a: arbol);
{Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios que se les aumento la edad.}
  
  function AumentarEdad (a: arbol): integer;
  var resto: integer;
  begin
     if (a = nil) 
     then AumentarEdad:= 0
     else begin
            resto:= a^.dato.edad mod 2;
            if (resto = 1) then a^.dato.edad:= a^.dato.edad + 1;
            AumentarEdad:= resto + AumentarEdad (a^.HI) + AumentarEdad (a^.HD);
          end;  
  end;

begin
  writeln;
  writeln ('----- Cantidad de socios con edad aumentada ----->');
  writeln;
  writeln ('Cantidad: ', AumentarEdad (a));
  writeln;
  writeln;
  writeln ('//////////////////////////////////////////////////////////');
  writeln;
end;

Procedure InformarExistenciaNombreSocio (a:arbol);
    function busqueda (a:arbol; nom: string): boolean;
    var esta:boolean;
    begin
      
      if ( a = nil) then esta:= false
                    else begin if (a^.dato.nombre = nom) then esta:= true
                                                   else begin esta:= busqueda(a^.hi,nom);
                                                              if (esta = false) then 
                                                                esta:= busqueda(a^.hd,nom);
                                                      end;
                      busqueda:= esta;
                      end;       
    busqueda:= esta;
    
    end;

var nombre: string; estar: boolean;
begin
   writeln('ingrese el nombre a buscar');
   read(nombre);
   estar:= busqueda(a,nombre); 
   if (estar = true) then writeln( ' el nombre ', nombre , ' se encuentra en el arbol ')
                         else writeln( ' el nombre ', nombre , ' no se encuentra en el arbol ');
end;

procedure contar(a: arbol; var cant: integer);
begin
   if (a<> nil) then begin;
         cant:= cant +1;
         contar (a^.hi, cant);
         contar (a^.hd, cant);
     end;
end;

procedure SumarEdades (a:arbol; var cant: integer);
begin
     if (a<>nil) then begin
           cant:= a^.dato.edad + cant;
           SumarEdades(a^.hi, cant);
           SumarEdades(a^.hd, cant);
       end;

end;



Procedure InformarCantidadSocios (a: arbol);
 
var cant: integer;
begin
 cant:= 0;
 contar(a, cant);
 writeln(' la cantidad de socios total es igual a: ' , cant)

end;

Procedure InformarPromedioEdadSocios (a:arbol);
  var total, cant, promedio: integer;
 begin
    cant:= 0;
    contar(a, cant);
    total:= 0;
    sumaredades (a,total);
    promedio:= total div cant;
    writeln(' el promedio de edad de socios es igual a: ' ,promedio);
 
 end;
 
 procedure InformarMayorNumSocio (a:arbol);
 
    Procedure MasGrande(a:arbol; var num: integer); 
    begin
         if (a<>nil) then begin
               num:= a^.dato.numero;
               MasGrande(a^.hd,num);
           end;    
              
    
    end;
 
  var num: integer;
 begin
      num:= 0; {en caso de que este vacio, no se deberia modificar el 0}
      MasGrande(a,num);
      if (num <> 0) then writeln( ' el mayor numero de socio es ' , num)
                    else writeln('Arbol vacio');
     
   
 end;
 
 Procedure InformarMenorNumSocio (a:arbol);
          
          Procedure EncontrarMasChico( a:arbol; var info: socio);
          begin
           if (a<>nil) then begin
                     info:= a^.dato;
                     EncontrarMasChico(a^.hi,info);
                 end;    
          
          
          end;
          

 
 
 
 var info: socio;
 
 begin
    info.numero:= 0; {en caso de que este vacio, no se deberia modificar el 0}
    EncontrarMasChico(a, info);
    if (info.numero <> 0) then writeln ('El socio de numero mas chico es' , info.nombre , ' de edad ' , info.edad , ' y cuyo numero es ' , info.numero)
                          else writeln('arbol vacio');
 end;
  
  
 
 Procedure ExisteValorLeido (a:arbol);
      
   Function BuscarValor(a: arbol; valor: integer): boolean;
     
      
     
    var esta:boolean;
    begin
      
      if ( a = nil) then BuscarValor:= false
                    else begin if (a^.dato.numero = valor) then esta:= true
                                                           else begin if (a^.dato.numero < valor) then esta:= BuscarValor(a^.hi,valor) 
                                                                          else esta:= BuscarValor(a^.hd,valor);
                                                             end;
                                                     
                      BuscarValor:= esta;
                      end;       
    
    end;

 
 
 var
 valor: integer; encontre: boolean;
 begin
 writeln('Inserte el valor a buscar');
 readln(valor);
 
 encontre:= buscarValor(a,valor);
 if (encontre = true) then writeln('el valor ingresado: ' , valor , ' se encuentra en el arbol')
                      else writeln(' el valor no esta en el arbol');
                  
 end;
  
 Procedure InformarEntreDosCodigos (a: arbol);
 
          function CantidadEntre(a: arbol; num1, num2: integer): integer;
           var cant: integer;
  
           begin
  
           cant:= 0;
           if (a = nil) then cant:= 0
                        else  if (( num1 < a^.dato.numero ) and ( num2 > a^.dato.numero)) then 
                           begin
                             cant:= cant + 1;
                             cant:= cant + CantidadEntre (a^.hi,num1,num2); 
                             cant:= cant + CantidadEntre (a^.hd,num1,num2); 
                           end
                                               else  if (num1 >= a^.dato.numero) then cant:= cant + CantidadEntre(a^.hi,num1,num2) 
                                                                  else cant:= cant + CantidadEntre(a^.hd,num1,num2);
                                 
                 
                 
          cantidadentre:= cant;
          end;
    

 
 
 
 
 
 
 
 
 
 
 var num1, num2, cant:integer;
 begin
  writeln;
  write ('Ingrese primer numero de socio: ');
  readln (num1);
  write ('Ingrese segundo numero de socio (mayor al primer numero): ');
  readln (num2);
  cant:= CantidadEntre(a,num1,num2);
  if (cant > 0) then writeln ('los cantidad de socios cuyo numero se encuentra entre ', num1, 'y' , num2 , ' es igual a ' , cant)
                else writeln (' no existen numeros de socio entre los valores ' , num1, ' y ' , num2);
 
 end;
 
 
 
  
 
 
 
var a: arbol; 
Begin
  randomize;
  GenerarArbol (a);
  InformarSociosOrdenCreciente (a);
  {
  writeln('ahora decreciente');
  InformarSociosOrdenDecreciente (a);
  InformarNumeroSocioConMasEdad (a);
  AumentarEdadNumeroImpar (a);
  InformarExistenciaNombreSocio (a);
  InformarCantidadSocios (a);
  InformarPromedioEdadSocios (a);}
  InformarMayorNumSocio(a);
  InformarMenorNumSocio (a);
  ExisteValorLeido(a);
  InformarEntreDosCodigos(a);
  
End.

