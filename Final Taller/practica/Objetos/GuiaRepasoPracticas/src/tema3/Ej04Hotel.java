/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author lopez
 */
public class Ej04Hotel {
    public static void main(String[] args){
        Hotel h = new Hotel("Moretti", 6);
        System.out.println(h.toString());
        Persona c = new Persona ("Facu", 25,25);
        h.ocuparHabitacion(c, 1);
        h.aumentos(1000);
        System.out.println(h.toString());
    }
}
