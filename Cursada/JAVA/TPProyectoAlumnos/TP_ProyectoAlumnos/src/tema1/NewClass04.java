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
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector; 	
public class NewClass04 {
    public static void main(String[] args) {
        int [][] matriz = new int [8][4];
        int i, j ;
        for (i=0; i<8 ; i++)
            for (j=0;j<4; j++)
                 matriz [i][j]=0;
        System.out.println("Ingrese piso del 0 a 7");
        int aux = Lector.leerInt();
        System.out.println("Ingrese oficina del 0 al 3");
        int oficina = Lector.leerInt();
        int piso;
        while (aux != 9) {
            piso = aux;
            matriz [piso][oficina] = matriz [piso][oficina] + 1;
            System.out.println("Ingrese piso del 0 a 7");
            aux = Lector.leerInt();
            System.out.println("Ingrese oficina del 0 al 3");
            oficina = Lector.leerInt();
             
        }
        for (i=0; i<8 ; i++)
            for (j=0;j<4; j++)
                 System.out.println("la cantidad de personas en la oficina " + j + " del piso " + i + " es igual a " + matriz [i] [j]);
        
    }
}
