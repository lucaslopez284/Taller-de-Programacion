/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author lopez
 */
public class Ej02Empleados {
    public static void main(String[] args) {
        Jugador j= new Jugador(10, 25, "Carlitos", 1000, 4);
        Entrenador e = new Entrenador(8, "Sabello", 2000, 10);
   
        System.out.println(j.toString());
        System.out.println(e.toString());
    }
    
}
