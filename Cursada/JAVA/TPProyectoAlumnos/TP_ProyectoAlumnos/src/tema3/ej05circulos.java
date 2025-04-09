/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author lopez
 */
public class ej05circulos {
    public static void main (String [] args) {
     
        System.out.println("Ingrese radio");
        double radioo = Lector.leerDouble();
        System.out.println("Ingrese color relleno");
        String colorRe = Lector.leerString();
        System.out.println("Ingrese color linea");
        String colorLi = Lector.leerString();
        Circulo circulo1 = new Circulo (radioo, colorRe, colorLi);
        System.out.println("El color de relleno es " + circulo1.getRelleno() + " mientras que el de linea es " + circulo1.getLinea());
        System.out.println("El radio del circulo es " + circulo1.getRadio());
        System.out.println("El perimetro del circulo es " + circulo1.calcularPerimetro());
        System.out.println("El area del circulo es " + circulo1.calcularArea());
    }
}
