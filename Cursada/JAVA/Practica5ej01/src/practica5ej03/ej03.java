/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej03;

import PaqueteLectura.GeneradorAleatorio;


/**
 *
 * @author lopez
 */
public class ej03 {
     public static void main(String[] args) {
         Gira g1 = new Gira ("La banda de Sarandi", 20, "Gira BA", 10);
         fecha f = new fecha (28, "Buenos Aires");
         g1.agregarFecha(f);
         for(int j=0; j<10; j++) 
            g1.agregarTema(GeneradorAleatorio.generarString(4));
         g1.Actuar();
         
         System.out.println("Costo de la gira: " + g1.calcularCosto());
         
         EventoOcasional e1 = new EventoOcasional ("Los mejores", 12, 3 , "Sporle", 28);
         for (int i = 0; i<5;i++)
            e1.agregarTema(GeneradorAleatorio.generarString(4));
         e1.Actuar();
         System.out.println("Costo del event: " + e1.calcularCosto());
     }
     
}

