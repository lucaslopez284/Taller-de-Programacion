program parcialF;

type
  subMaterial = 1..8;
  artesania = record
    dni: integer;
    cod: integer;
    material: integer;
  end;
 
  datoArbol = record
    dni: integer;
    cant: integer;
  end;
  
  arbol= ^nodoArbol;
  nodoArbol = record
    dato: datoArbol;
    hi: arbol;
    hd: arbol;
  end;
  
  datoVector = record
    material: string;
    cant: integer;
  end; 
 
  vector = array [subMaterial] of datoVector;
  
 
 
 var v: array [subMaterial] of string = ('madera' , 'yeso' , 'ceramica' , 'vidrio', 'acero', 'porcelana', 'lana', 'carton');
 
 procedure inicializar (var vec: vector);
 var i: subMaterial;
 begin
   for i:= 1 to 8 do begin
     vec[i].material:= v[i];
     vec[i].cant:= 0;
   end;
 end;
 
 procedure leerArtesania (var a: artesania);
 begin
   a.dni:= Random (10000);
   if (a.dni <> 0) then begin
     a.cod:= Random (100) + 2000;
     a.material:= Random (8) + 1;
   end;
 end;
 
 procedure cargarEstructuras (var a: arbol; var vec: vector;art: artesania);
 begin
   if (a=nil) then begin
     new(a);
     a^.dato.dni := art.dni;
     a^.dato.cant:= 1;
     vec[art.material].cant:= vec[art.material].cant + 1;
     a^.hi:= nil;
     a^.hd:= nil;
   end
   else if (a^.dato.dni = art.dni) then begin
          a^.dato.cant:= a^.dato.cant + 1;
          vec[art.material].cant:= vec[art.material].cant + 1;
       end
       else if (art.dni < a^.dato.dni ) then cargarEstructuras(a^.hi,vec,art)
            else cargarEstructuras(a^.hd,vec,art);
 end;
 
 procedure procesarDatos (var a: arbol; var vec: vector);
 var art: artesania;
 begin
   a:= nil;
   inicializar(vec);
   leerArtesania(art);
   while (art.dni <> 0) do begin
     cargarEstructuras(a,vec,art);
     leerArtesania(art);
  end;
 end;
 
 procedure imprimirArbol (a: arbol);
 begin
   if (a<> nil) then begin
     imprimirArbol(a^.hi);
     writeln('DNI: ' , a^.dato.dni , ' Cantidad de artesanias: ' , a^.dato.cant);
     imprimirArbol(a^.hd);
   end;
 end;
 
 procedure imprimirVector (vec: vector);
 var i: subMaterial;
 begin
   for i:= 1 to 8 do 
     writeln('El material ' , vec[i].material , ' fue parte de ' , vec[i].cant , ' artesanias ');
 end;
 
 function menores (a: arbol ; dni: integer) : integer;
 begin
   if (a= nil) then menores:= 0
   else if (a^.dato.dni < dni) then menores:= 1 + menores (a^.hi,dni) + menores(a^.hd,dni)
        else menores:= menores(a^.hi,dni);
 end;  
 
 procedure ordenacion (var vec: vector; diml: integer);
 var i, j, pos: subMaterial; item: datoVector;
 begin
   for i:= 1 to diml - 1 do begin
      pos:= i;
      for j:= i+1 to diml do
        if (vec[j].cant < vec[pos].cant) then pos:= j;
      item:= vec[pos];
      vec[pos]:= vec[i];
      vec[i]:= item;
   end;
 end;
 
 procedure incisoC(var vec: vector; var material: string);
 var diml: integer;
 begin
   diml:= 8;
   ordenacion(vec,8);
   imprimirVector(vec);
   material:= vec[diml].material;
 end;
 
 
 
var vec: vector; a: arbol; dni: integer;
    material: string;
 
begin
  Randomize;
  writeln('-------------Inciso A ----------');
  procesarDatos(a,vec);
  imprimirArbol(a);
  imprimirVector(vec);
  writeln('-------------Inciso B ----------');
  writeln('Inserte DNI ' );
  readln(dni);
  writeln('La cantidad de DNIS menores a ' , dni , ' es ' , menores(a,dni));
  writeln('-------------Inciso C ----------');
  material:= 'Ninguno';
  incisoC(vec, material);
  writeln('El material con mayor cantidad de artesanias es ' , material);
end.
 
