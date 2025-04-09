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
public class ej02empleados {
    public static void main(String[] args) {
        System.out.println("ingrese el nombre del jugador : ");
        String nombre = Lector.leerString();
        double sueldo = GeneradorAleatorio.generarDouble(100000);
        int ant = GeneradorAleatorio.generarInt(10) + 1;
        System.out.println("ingrese cantidad de goles metidos ");
        int cantG = Lector.leerInt();
        System.out.println("ingrese cantidad de partidos jugados ");
        int cantP = Lector.leerInt();
        Jugador j1 = new Jugador (nombre,sueldo,ant,cantP,cantG);
        System.out.println("ingrese el nombre del dt : ");
        nombre = Lector.leerString();
        sueldo = GeneradorAleatorio.generarInt(100000);
        ant = GeneradorAleatorio.generarInt(10);
        System.out.println("ingrese cantidad de titulos ");
        int cantT = Lector.leerInt();
        Entrenador e1 = new Entrenador (nombre,sueldo,ant,cantT);
        System.out.println(j1.toString());
        System.out.println(e1.toString());
            
           
}
}