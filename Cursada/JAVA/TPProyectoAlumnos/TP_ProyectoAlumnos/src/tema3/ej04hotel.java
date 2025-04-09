/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import tema4.Persona;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author lopez
 */
public class ej04hotel {
    public static void main (String [] args) {
        System.out.println("ingrese la cantidad de habitaciones del hotel : ");
        int cant = Lector.leerInt(); 
        Hotel miHotel = new Hotel (cant);
        System.out.print("ingrese el nombre del cliente : ");
        String nombre = Lector.leerString();
        int dni = GeneradorAleatorio.generarInt(100000);
        int edad = GeneradorAleatorio.generarInt(100);
        Persona Cliente = new Persona (nombre,dni,edad);
        int i = 0;
        while (!(Cliente.getNombre().equals("ZZZ"))){
            System.out.println("ingrese la habitacion deseada ");
            int habit = Lector.leerInt();
            miHotel.getHabitaciones(habit).setHuesped(Cliente);
            System.out.print("ingrese el nombre del cliente : ");
            nombre = Lector.leerString();
            dni = GeneradorAleatorio.generarInt(100000);
            edad = GeneradorAleatorio.generarInt(100);
            Persona Cliente = new Persona (nombre,dni,edad);
            
        }
        System.out.println();
        System.out.println("Hotel antes del aumento");
        System.out.println(miHotel.toString());
        miHotel.aumentarPrecio(1234);
        System.out.println("Hotel despues del aumento");
        System.out.println(miHotel.toString());
    }
    
    
    
    
    }
}
