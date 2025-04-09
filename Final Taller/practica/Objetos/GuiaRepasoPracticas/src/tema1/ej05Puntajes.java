/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ej05Puntajes {
    public static void main(String[] args) {
        int puntajes [][] = new int [5][4];
        double promedio [] = new double [4];
        int p;
        for (int i = 0; i< 5; i++){
            System.out.println("Ingrese puntajes");
            System.out.println("Atencion al cliente");
            p = Lector.leerInt();
            puntajes[i][0] = p;
            System.out.println("Calidad de la comida");
            p = Lector.leerInt();
            puntajes[i][1] = p;
            System.out.println("Precio");
            p = Lector.leerInt();
            puntajes[i][2] = p;
            System.out.println("Ambiente");
            p = Lector.leerInt();
            puntajes[i][3] = p;
        }
        
        double prom;
        for (int i = 0; i<4;i++){
            prom = 0;
            for (int j = 0; j< 5; j++)
                prom += puntajes [j][i];
            prom = (double) prom / 5;
            promedio [i] = prom;
        }
        
        System.out.println("Calificaciones: ");
        System.out.println("Atencion al cliente: " + promedio [0]);
        System.out.println("Calidad con la comida: " + promedio [1]);
        System.out.println("Precio: " + promedio [2]);
        System.out.println("Ambiente: " + promedio [3]);
    }
}
