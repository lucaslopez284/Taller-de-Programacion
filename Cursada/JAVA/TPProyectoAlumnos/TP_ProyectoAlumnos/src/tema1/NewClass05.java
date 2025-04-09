/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/**
 *
 * @author lopez
 */
import PaqueteLectura.Lector;
public class NewClass05 {
    public static void main(String[] args) {
        int cliente = 5;
        int puntajes = 4;
        int [][] matriz = new int [cliente] [puntajes];
        int i;
        int j;
        
        for (i = 0; i<5; i++) {
            System.out.println("Cliente " + i + ": ");
            for (j=0 ; j<4; j++) {
                System.out.println("Ingrese puntaje del aspecto " + j + " para el cliente " + i);
                matriz [i][j] = Lector.leerInt();
            }
            System.out.println("Finalizo el cliente: " + i );
        }
        for (i = 0; i < 5; i++) {
           
            System.out.print("Cliente " + i + " / ");
            for (j = 0; j < 4; j++) 
                 System.out.print(matriz[i][j] + " ");
            System.out.println();
        }
        double total;
        double promedio;
        for (j=0 ; j<4; j++) {
            total = 0;
            for (i = 0; i<5; i++)
               total = matriz [i][j] + total;
            promedio = total / 5;
            System.out.println("El promedio del aspecto " + j + " es igual a " + promedio);
            
            
        }
    }
}
 