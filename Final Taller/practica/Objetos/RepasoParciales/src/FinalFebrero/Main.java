/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalFebrero;

/**
 *
 * @author lopez
 */ 
public class Main {
     public static void main(String[] args) {
         Empresa e = new Empresa ("ofiService", "Quirno 70");
         Persona p1 = new Persona ("Lucas", "45739642");
         Persona p2 = new Persona ("Catalina", "46739642");
         Persona p3 = new Persona ("Ezequiel", "46739642");
         Persona p4 = new Persona ("Malena", "46739642");
         e.agregarAlquiler(p1, 100, 1, 1);
         e.agregarAlquiler(p2, 100, 1, 2);
         e.agregarAlquiler(p3, 100, 2, 1);
         e.agregarAlquiler(p4, 100, 3, 1);
         e.incremento();
         e.liberarOficina("45739642");
         System.out.println(e.toString());
         System.out.println("Cantidad de oficinas del piso 1: " + e.cantOfi(1));
     }
}
