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
	 GeneradorAleatorio.iniciar();    
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
         int matriz [] [] = new int [5][5];
         int i;
         int j;
         for (i = 0; i < 5 ; i++)
             for (j = 0; j < 5 ; j++)
                 matriz [i][j] = GeneradorAleatorio.generarInt(5);
        //Paso 4. mostrar el contenido de la matriz en consola
         for (i = 0; i < 5 ; i++){
             for (j = 0; j < 5 ; j++)
                 System.out.print ("Posicion ("+i+","+j+")" + matriz [i][j] + " | ");
             System.out.println();
         }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
         int suma = 0;
         for (j = 0 ; j < 5 ; j++)
             suma += matriz[1][j];
         System.out.println("La suma de los elementos de la fila 1 es igual a: " + suma);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
         int vector []= new int [5];
         int parcial;
         for (j = 0; j < 5 ; j++){
             parcial = 0;
             for (i = 0; i < 5 ; i++)
                 parcial += matriz [i][j];
             vector [j] = parcial;
         }
         for (i = 0; i < 5 ; i++)
           System.out.println("La suma de los elementos de la columna " + i + " es igual a: " + vector [i]);
         
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println("Ingrese un valor entero a buscar");
        int valor = Lector.leerInt();
        boolean esta = false;
        i = 0; 
        j = 0;
        int f = 0;
        int c = 0;
        while ((i< 5) && (esta != true)){
            while ((j < 5)&&(esta != true)){
                if (matriz [i][j] == valor){
                    esta = true;
                    f = i;
                    c = j;
                }
                j++;
            }
            i++;
        }
        
        if (esta == true)
            System.out.println("El numero " + valor + " se encuentra en la fila " + f + " y en la columna " + c);
        else 
            System.out.println("No se encontro el numero " + valor);
    }
}
