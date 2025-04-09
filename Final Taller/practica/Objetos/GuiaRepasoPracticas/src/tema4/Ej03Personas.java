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
public class Ej03Personas {
    public static void main(String[] args) {
        Persona p = new Persona ("Pocho Cerutti", 280419, 35);
        Trabajador t = new Trabajador ("abogado","Marce Moretti", 91218, 50);
        System.out.println(p.toString());
        System.out.println(t.toString());
    }
}
