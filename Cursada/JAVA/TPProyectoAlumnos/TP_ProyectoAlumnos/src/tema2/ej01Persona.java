/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import tema4.Persona;
import PaqueteLectura.Lector;

/**
 *
 * @author lopez
 */
public class ej01Persona {
     public static void main(String[] args){
            System.out.println("Ingrese nombre");
            String nombre = Lector.leerString();  	               
            System.out.println("Ingrese dni");  
            int dni = Lector.leerInt();	               
            System.out.println("Ingrese edad");
            int edad = Lector.leerInt();
            Persona p1 = new Persona(nombre,dni,edad);
            System.out.println(p1.toString());
            
    }     
}
