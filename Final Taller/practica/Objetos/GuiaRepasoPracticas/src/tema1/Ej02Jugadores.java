
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos

import PaqueteLectura.Lector;



public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        int df = 15;
        
        //Paso 3: Crear el vector para 15 double 
        double [] vector = new double [df];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
         int total = 0;
         int i;
         int x;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
         for (i=0; i< df; i++){
            System.out.println("Ingrese altura para posicion " + (i+1));
            x = Lector.leerInt();
            total += x;
            vector[i]= x;
          }
        //Paso 7: Calcular el promedio de alturas, informarlo
         double pro = (double) total / df;
         System.out.println("La altura promedio es " + pro);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
         int cant = 0;
         for (i=0; i<df ; i++) {
             if (vector [i] > pro)
                 cant++;
         }
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de alturas supeiores al promedio de  " + pro + " es " + cant);
    }
    
}
