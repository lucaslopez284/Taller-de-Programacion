/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;


import PaqueteLectura.Lector; 	
public class Ej02Estacionamiento {
    public static void main(String[] args) {
        Estacionamiento e = new Estacionamiento ("Moretti" , "9 y 12", 8, 21, 3, 3);
        Auto a1 = new Auto ("Big Ari", 28419);
        Auto a2 = new Auto ("RDI", 21419);
        Auto a3 = new Auto ("Irala", 28919);
        Auto a4 = new Auto ("Vombergar", 14919);
        Auto a5 = new Auto ("Pocho", 23319);
        Auto a6 = new Auto ("Campi", 11319);
        e.agregarAuto(a1, 1, 1);
        e.agregarAuto(a2, 1, 2);
        e.agregarAuto(a3, 2, 2);
        e.agregarAuto(a4, 2, 3);
        e.agregarAuto(a5, 3, 1);
        e.agregarAuto(a5, 3, 3);
        System.out.println(e.toString());
         
        System.out.println("Inserte patente");
        int p = Lector.leerInt();
        System.out.println(e.busquedaPatente(p));
    }
}
