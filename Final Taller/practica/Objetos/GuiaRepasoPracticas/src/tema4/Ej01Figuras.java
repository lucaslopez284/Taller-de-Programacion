/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import PaqueteLectura.Lector;

/**
 *
 * @author lopez
 */
public class Ej01Figuras {
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
        c.despintar();
        System.out.println(c.toString());
        System.out.println("Perimetro: " + c.calcularPerimetro());
        System.out.println("Area: " + c.calcularArea());
        System.out.println("Ingrese informacion del triangulo");
        System.out.println("Ingrese color relleno");
        cr = Lector.leerString();
        System.out.println("Ingrese color de linea");
        cl = Lector.leerString();
        System.out.println("Ingrese longitud del lado 1");
        int l1 = Lector.leerInt();
        System.out.println("Ingrese longitud del lado 2");
        int l2 = Lector.leerInt();
        System.out.println("Ingrese longitud del lado 3");
        int l3 = Lector.leerInt();
        Triangulo t = new Triangulo(l1,l2,l3,cr,cl);
        System.out.println(t.toString());
    }
}
