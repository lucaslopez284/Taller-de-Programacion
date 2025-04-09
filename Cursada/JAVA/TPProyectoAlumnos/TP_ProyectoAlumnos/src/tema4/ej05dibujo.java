/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author lopez
 */
public class ej05dibujo {
    public static void main (String [] args) {
        Dibujo d = new Dibujo (" Primeer Dibujo ");
        Cuadrado c1 = new Cuadrado (10, "Violeta" , "Celeste");
        Rectangulo r = new Rectangulo (20,10, "Azul", "Celeste");
        Cuadrado c2 = new Cuadrado (30, "Rojo", "Naranja");
        d.agregar(c1);
        d.agregar(r);
        d.agregar(c2);
        d.mostrar();
        
    }
    
}
