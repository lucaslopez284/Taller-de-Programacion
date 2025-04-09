program finalAgosto23;

type 

  categorias = 1..6;
  direccion = record
    calle: integer;
    altura: integer;
   end;
   
   fecha = record
     mes: integer;
     dia: integer;
     hora: integer;
    end;
    
   denuncia = record
     categoria: categorias;
     dni: integer;
     dire: direccion;
     fec: fecha;
   end;
   
   denuncia2 = record
     dni: integer;
     dire: direccion;
     fec: fecha;
   end;
   
   arbol = ^nodo;
   nodo= record
     dato: denuncia2;
     hd: arbol;
     hi: arbol;
   end;
   
   datoLista = record
     calle: integer;
     totales: integer;
     julio: integer;
   end;
   
   lista =^nodoL;
   nodoL = record
     dato: datoLista;
     sig: lista;
   end;
   
   vector = array [categorias] of arbol;
   
   procedure leerFecha (var f: fecha);
   begin
     f.mes:= Random (12) + 1;
     f.dia:= Random (30) + 1;
     f.hora:= Random (23) + 1;
   end;
   
   procedure leerDireccion (var d: direccion);
   begin
     d.calle:= Random (100) + 1;
     d.altura:= Random (100) + 1;
   end;
   
   procedure leerDenuncia (var d: denuncia);
   begin
     d.dni:= Random (300);
     if (d.dni <> 0) then begin
       d.dni:= d.dni + 4500;
       d.categoria:= Random (6) + 1;
       leerDireccion(d.dire);
       leerFecha(d.fec);
     end;
   end;
   
   procedure inicializar (var v: vector);
   var i: categorias;
   begin
     for i:= 1 to 6 do 
       v[i]:= nil;
   end;
   
   procedure asignar (var d2: denuncia2; d: denuncia);
   begin
     d2.dni:= d.dni;
     d2.fec:= d.fec;
     d2.dire:= d.dire;
   end;
   
   procedure cargarArbol(var a: arbol; d: denuncia2);
   begin 
     if (a = nil) then begin
       new (a);
       a^.hi:= nil;
       a^.hd:= nil;
       a^.dato:= d;
     end
     else if (d.dire.calle <= a^.dato.dire.calle) then cargarArbol (a^.hi,d)
          else cargarArbol(a^.hd,d);
   end;
   
   procedure cargarDatos (var v: vector);
   var d: denuncia; d2: denuncia2;
   begin
     inicializar(v);
     leerDenuncia(d);
     while (d.dni <> 0) do begin
       asignar(d2,d);
       cargarArbol(v[d.categoria], d2);
       leerDenuncia(d);
     end;
   end;
  
   procedure imprimirFecha (f: fecha);
   begin
     writeln( ' mes ' , f.mes , ' dia ', f.dia, ' hora ', f.hora); 
   end;
   
   procedure imprimirDire (d: direccion);
   begin
     write(' calle ', d.calle, ' altura ', d.altura);
   end;
   
   procedure imprimirDenuncia (d: denuncia2);
   begin
     write('DNI ', d.dni);
     imprimirDire(d.dire);
     imprimirFecha(d.fec);
   end;
   
   procedure imprimirArbol (a: arbol);
   begin
     if (a<> nil) then begin
       imprimirArbol(a^.hi);
       imprimirDenuncia(a^.dato);
       imprimirArbol(a^.hd);
     end;
   end;
   
   procedure imprimirDatos (v: vector);
   var i: categorias;
   
   begin
     for i:= 1 to 6 do begin
       writeln('Listado de denuncias de categoria ' , i);
       imprimirArbol(v[i]);
     end;
   end;
    
   procedure insertarOrdenado(var l: lista; d: denuncia2);
   var nue,act, ant: lista;
   begin
     new (nue);
     nue^.dato.calle:= d.dire.calle;
     act:= l;
     ant:= l;
     while ((act<> nil) and (d.dire.calle > act^.dato.calle) ) do begin
        ant:= act;
        act:= act^.sig;
     end;
     if (act <> nil) then begin
         if (d.dire.calle = act^.dato.calle) then begin
            act^.dato.totales:= act^.dato.totales + 1;
            if (d.fec.mes = 7) then
              act^.dato.julio:= act^.dato.julio + 1;
          end
     end
     else if (ant = act) then begin
               nue^.dato.julio:= 1;
               nue^.dato.totales:= 1;
               l:= nue;
           end
          else begin
            nue^.dato.julio:= 1;
            nue^.dato.totales:= 1;
            ant^.sig:= nue;
         end; 
         nue^.sig:= act;
   end;

   procedure recorrerArbol(var l: lista ;a: arbol);
   begin
     if (a<> nil) then begin
       recorrerArbol(l, a^.hi);
       insertarOrdenado(l, a^.dato);
       recorrerArbol(l, a^.hd);
     end;
   end;
   
   procedure nuevaLista (var l: lista; v: vector);
   var i: integer;
   begin
     for i:= 1 to 6 do
       recorrerArbol(l,v[i]);
   end;
   
   procedure imprimirLista (l: lista);
   begin
     while (l<> nil) do begin
       writeln('Calle ', l^.dato.calle , ' cant de denuncias totales ' , l^.dato.totales , ' cant de denuncias en julio ' , l^.dato.julio);
       l:= l^.sig;
     end;
   end;
   
   procedure incisoB (var l: lista; v: vector);
   begin
     l:= nil;
     nuevaLista(l,v);
     imprimirLista(l);
   end;
   
   procedure recursion (var max: integer; var maxCant: integer; l: lista);
   begin
     if (l<> nil) then  begin
       if (l^.dato.totales > maxCant) then begin
         max:= l^.dato.calle;
         maxCant:= l^.dato.totales;
       end;
       recursion(max,maxcant,l^.sig);
     end;
   end;

var v: vector; l: lista; max,maxCant: integer;
begin
  writeln('-------------------INCISO A--------------------');
  Randomize;
  cargarDatos(v);
  imprimirDatos(v);
  writeln('-------------------INCISO B--------------------');
  incisoB(l,v);
  writeln('-------------------INCISO C--------------------');
  max:= 0;
  maxCant:= 0;
  recursion (max,maxCant,l);
  writeln('La calle con mas cantidad de denuncias totales fue ' , max , ' con la cantidad de ' , maxCant);
end.
