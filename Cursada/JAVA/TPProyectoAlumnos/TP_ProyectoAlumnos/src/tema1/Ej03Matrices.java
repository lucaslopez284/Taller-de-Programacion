/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector; 	
public class Ej03Matrices {

    public static void main(String[] args) {
	    //Paso 2. iniciar el generador aleatorio     
	   
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
          
         int [][] matriz = new int [5][5];
         int i, j ;
         for (i=0; i<5 ; i++)
            for (j=0;j<5; j++)
                 matriz [i][j]= GeneradorAleatorio.generarInt(31);
        //Paso 4. mostrar el contenido de la matriz en consola
         System.out.println("Elementos de la matriz numeros: ");
        for (i = 0; i < 5; i++) {
           
            System.out.println("--------------------------");
            for (j = 0; j < 5; j++) 
                 System.out.print(matriz[i][j] + " ");
      
        }
        System.out.println();
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
         int suma = 0;
         for (j = 0; j < 5; j++)
             suma = suma + matriz [1][j];
         System.out.println("La suma de los elementos de la fila 1 es igusl a " + suma);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
         int [] vec = new int [5];
         for (j=0; j<5 ; j++){
           int total = 0;
           for (i=0;i<5; i++) {
               
               total = total + matriz [i][j];
        
            } 
         vec [j] = total; 
         }
        
        for (j=0; j<5 ; j++)
            System.out.println("La suma de los elementos de la columna " + j + " es igual a " + vec[j]);
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println("ingrese un valor a buscar");
        int valor = Lector.leerInt();
        boolean esta = false;
        i = 0;
        j = 0;
        while (esta = false && i<5 ) {
          while (esta = false && j<5) {
             if (matriz [i][j] == valor)
                  esta = true;
             j++; }
          i++;    }
        if (esta == true)
             System.out.println("El valor " + valor + " esta en la matriz");
        else 
            System.out.println("El valor " + valor + " no esta en la matriz");
        /*    }*/
        
    
   }
     

}