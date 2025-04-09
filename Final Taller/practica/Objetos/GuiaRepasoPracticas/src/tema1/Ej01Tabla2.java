/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

   
    public static void main(String[] args) {
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        GeneradorAleatorio.iniciar();  
        int  i = 0;
        int a = GeneradorAleatorio.generarInt(20);
        while ((a!=11) && (i < DF))  {
            
            tabla2[i]=2*a;
            a = GeneradorAleatorio.generarInt(20);
            i++;
      }
        for (i=0; i<DF;i++) {
            System.out.println("Posicion " + i + ": " + "2x" + a + "="+ tabla2[i]);
        }

    }
    
}
