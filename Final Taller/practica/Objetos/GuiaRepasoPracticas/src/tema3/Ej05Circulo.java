/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;
public class Ej05Circulo {
    public static void main(String[] args){
        System.out.println("Ingrese informacion del circulo");
        System.out.println("Ingrese radio del circulo");
        double r = Lector.leerDouble();
        System.out.println("Ingrese color de linea del circulo");
        String cl = Lector.leerString();
        System.out.println("Ingrese color de relleno del circulo");
        String cr = Lector.leerString();
        Circulo c = new Circulo (r,cl,cr);
        System.out.println(c.toString());
        System.out.println("Perimetro: " + c.calcularPerimetro());
        System.out.println("Area: " + c.calcularArea());
    }
}
