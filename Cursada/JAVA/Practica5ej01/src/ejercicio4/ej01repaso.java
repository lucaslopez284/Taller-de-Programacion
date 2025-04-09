/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author lopez
 */
public class ej01repaso {
      public static void main(String[] args) {
       GeneradorAleatorio.iniciar();
        
       Estacion est1 = new Estacion("La Plata", -34.921, -57.955);
       Estacion est2 = new Estacion("Mar del Plata", -38.002, -57.556);
        
       Anual sistAnual = new Anual (est1, 3, 2021);
       Mensual sistMensual = new Mensual(est2, 4, 2020);
       
      // sistAnual.registrarTemperatura(150, 2021, 3);
       //sistMensual.registrarTemperatura(158, 2022, 5);
       
       sistMensual.cargarAMano();
       
       System.out.println(sistAnual.toString());
       System.out.println(sistAnual.mayorTemperatura());
       System.out.println(sistMensual.toString());
       System.out.println(sistMensual.mayorTemperatura());
}
      

}
