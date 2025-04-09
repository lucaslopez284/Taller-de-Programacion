/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author lopez
 */
public class ej03Personas {
     public static void main(String[] args) {
         System.out.println("ingrese el nombre de la persona");
         String nombre = Lector.leerString();
         int dni = GeneradorAleatorio.generarInt(100000);
         int edad = GeneradorAleatorio.generarInt(100);
         Persona p1 = new Persona (nombre,dni,edad);
         System.out.println(p1.toString());
         System.out.println("ingrese el nombre del trabajador");
         nombre = Lector.leerString();
         dni = GeneradorAleatorio.generarInt(100000);
         edad = GeneradorAleatorio.generarInt(100);
         System.out.println("ingrese la tarea del trabajador");
         String laburo = Lector.leerString();
         Trabajador t1 = new Trabajador (nombre,dni,edad,laburo);
         System.out.println(p1.toString());
         System.out.println(t1.toString());
     }
}
