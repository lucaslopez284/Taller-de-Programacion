/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ej01Persona {
    public static void main(String[] args) {
        System.out.println("Ingrese nombre");
        String nom;
        nom = Lector.leerString();
        System.out.println("Ingrese DNI");
        int d;
        d = Lector.leerInt();
        System.out.println("Ingrese edad");
        int e;
        e = Lector.leerInt();
        Persona p = new Persona(nom,d,e);
        System.out.println(p.toString());
        
    }
       
   
    
}
