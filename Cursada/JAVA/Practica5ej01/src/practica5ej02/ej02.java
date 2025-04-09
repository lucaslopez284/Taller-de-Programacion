/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej02;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
import java.util.Locale;


public class ej02 {
    public static void main(String[] args) {
        
        Estacionamiento est1 = new Estacionamiento(" El mejor lugar ", "calle 28 avenida 04", 10, 20, 3,3);
        Auto au1 = new Auto ("Lucas", "280419");
        Auto au2 = new Auto ("Pedro", "091218");
        Auto au3 = new Auto ("Delga", "260611");
        Auto au4 = new Auto ("Thiago", "280919");
        Auto au5 = new Auto ("Lacava", "181019");
        Auto au6 = new Auto ("Blas", "100219");
        est1.agregarAuto(au1, 1, 3);
        est1.agregarAuto(au2, 2, 2);
        est1.agregarAuto(au3, 3, 2);
        est1.agregarAuto(au4, 3, 3);
        est1.agregarAuto(au5, 2, 2);
        est1.agregarAuto(au6, 1, 1);
        
        System.out.println(est1.toString());
        GeneradorAleatorio.iniciar();
        int pla = GeneradorAleatorio.generarInt(3) + 1;
       
        System.out.println("Ingrese Patente");
        String pat1 = Lector.leerString();
        System.out.println(est1.buscarPatente(pat1));
        
        System.out.println("La cantidad de autos en la plaza " + pla + " es " + est1.cantPlaza(pla));
        
        
        
    }
}
