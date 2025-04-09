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
public class ej01figuras {
    public static void main(String[] args) {
        System.out.println("Inserte longitud del lado 1 del triangulo"); 
        double lado1 = Lector.leerDouble();
        System.out.println("Inserte longitud del lado 2 del triangulo"); 
        double lado2 = Lector.leerDouble();
        System.out.println("Inserte longitud del lado 3 del triangulo"); 
        double lado3 = Lector.leerDouble();
        System.out.println("Inserte color de relleno del triangulo"); 
        String colorR = Lector.leerString();
        System.out.println("Inserte color de linea del triangulo"); 
        String colorL = Lector.leerString();
        Triangulo triangulo1 = new Triangulo (lado1, lado2, lado3, colorR, colorL);
        System.out.println(triangulo1.toString());
        
        
        System.out.println("Inserte radio del circulo"); 
        double radio = Lector.leerDouble();
        System.out.println("Inserte color de relleno del circulo"); 
        String colorR2 = Lector.leerString();
        System.out.println("Inserte color de linea del circulo"); 
        String colorL2 = Lector.leerString();
        Circulo circulo1 = new Circulo (radio, colorR2, colorL2);
        System.out.println(circulo1.toString());
        circulo1.despintar();
        System.out.println (circulo1.toString());
}
    
}
