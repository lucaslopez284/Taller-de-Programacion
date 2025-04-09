/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ej04EdificioOficinas {
    
    public static void main(String[] args) {
        int matriz [] [] = new int [8][4];
        
        for (int i= 0; i<8 ; i++)
            for (int j= 0; j< 4; j++)
                matriz [i][j]= 0;
        
        int x;
        int y;
        System.out.println("Ingrese numero de piso");
        x = Lector.leerInt();
        while (x!= 9){
            x = x-1;
            System.out.println("Ingrese numero de oficina");
            y = Lector.leerInt();
            if (y < 4) {
                y= y-1;
                matriz [x][y] = matriz [x][y] + 1;
            }
            System.out.println("Ingrese numero de piso");
            x = Lector.leerInt();
        }
        
        for (int i= 0; i<8 ; i++){
            System.out.println("Piso " + (i+1));
            for (int j= 0; j< 4; j++){
                System.out.print("Oficina " + (j+1) + " Personas: " + matriz [i][j] + " | ");   
        }
            System.out.println();
        }
    }
}
