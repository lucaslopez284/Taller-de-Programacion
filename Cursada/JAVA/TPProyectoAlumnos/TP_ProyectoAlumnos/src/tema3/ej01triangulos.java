/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author lopez
 */
public class ej01triangulos {

    public static void main(String[] args) {
        System.out.println("Inserte longitud del lado A"); 
        double ladoAA = Lector.leerDouble();
        System.out.println("Inserte longitud del lado B"); 
        double ladoBB = Lector.leerDouble();
        System.out.println("Inserte longitud del lado C"); 
        double ladoCC = Lector.leerDouble();
        System.out.println("Inserte color de relleno"); 
        String color1 = Lector.leerString();
        System.out.println("Inserte color de linea"); 
        String color2 = Lector.leerString();
        Triangulo tri = new Triangulo (ladoAA, ladoBB, ladoCC, color1, color2);
        System.out.println("Perimetro del triangulo " + tri.calcularPerimetro());
        System.out.println("Area del triangulo " + tri.calcularArea());
        System.out.println(tri.toString());
        
         
    }
}
