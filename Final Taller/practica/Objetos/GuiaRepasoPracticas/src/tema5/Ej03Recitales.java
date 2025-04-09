/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author lopez
 */
public class Ej03Recitales {
    public static void main(String[] args) {
        Fecha f1 = new Fecha ("Buenos Aires", 28);
        Fecha f2 = new Fecha ("Rio de Janeiro", 14);
        Fecha f3 = new Fecha ("Paris", 4);
        Fecha f4 = new Fecha ("Londres", 10);
        String t1 = "La hija del fletero";
        String t2 = "TV Fuhrer";
        String t3 = "Un Angel para tu soledad";
        String t4 = "Hello";
        String t5 = "I love you";
        String t6 = "Play the game";
        Evento e = new Evento ("TV","Purita", 28, "Los Redondos", 10);
        Gira g = new Gira ("Lo mejor", 10, "Oasis", 10);
        g.agregarFecha(f1);
        g.agregarFecha(f2);
        g.agregarFecha(f3);
        g.agregarFecha(f4);
        g.agregarTema(t4);
        g.agregarTema(t5);
        g.agregarTema(t6);
        e.agregarTema(t1);
        e.agregarTema(t2);
        e.agregarTema(t3);
        g.actuar();
        e.actuar();
        
    }

}
