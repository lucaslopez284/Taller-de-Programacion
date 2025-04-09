
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        int DF = 5;
        double [] vector = new double [DF];
        
        //Paso 3: Crear el vector para 15 double 
        
        //Paso 4: Declarar indice y variables auxiliares a usar
         int i;
         double altura;
         double total = 0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=0;i<5;i++){
            System.out.println("Ingrese altura");
            altura = Lector.leerDouble();
            vector [i]= altura;
            total = total + altura;
            
        } 
        //Paso 7: Calcular el promedio de alturas, informarlo
         double promedio;
         promedio = total / DF; 
         System.out.println("la altura promedio es " + promedio);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
         int cant = 0;
         for (i=0;i<5;i++)
             if (vector[i]> promedio)
                 cant++;
        //Paso 9: Informar la cantidad.
      System.out.println("la cantidad de alturas mayores al promedio de " + promedio + " es igual a " + cant);
    }
}
