/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();      
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        int DL = 0;
        int num;
        num = GeneradorAleatorio.generarInt(20);
        while (DL < DF && num != DF) {
            
            tabla2[DL]= num;
            DL = DL + 1;
            num = GeneradorAleatorio.generarInt(20);
           }
        for (i=0;i<DL;i++) 
            System.out.println("2x" + tabla2[i]  + "=" + tabla2[i] * 2);

    }
    
}
