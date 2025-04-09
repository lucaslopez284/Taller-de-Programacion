/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author lopez
 */
public class Ej03Casting {
    public static void main(String[] args){
        Persona matriz [] [] = new Persona [5][8];
        System.out.println("Arranca el casting");
        String nom;
        int dni;
        int edad;
        System.out.println("Ingrese nombre");
        nom = Lector.leerString();
        int contador = 0;
        int dia = 0;
        int turno = 0;
        while ((contador < 40)&&(!nom.equals("ZZZ"))){
            edad = GeneradorAleatorio.generarInt(50) + 25;
            dni = GeneradorAleatorio.generarInt(5000) + 4000;
            Persona p = new Persona (nom,dni,edad);
            matriz [dia][turno]= p;
            contador++;
            turno++;
            if (turno == 8){
                turno = 0;
                dia++;
            }
            System.out.println("Ingrese nombre");
            nom = Lector.leerString();
       }
        turno = 0;
        dia = 0;
        while (contador > 0){
            System.out.println("Dia: " + (dia + 1) + " Turno: " + (turno + 1) + " " + matriz [dia][turno].getNombre());
            contador--;
            turno++;
            if (turno == 8){
                turno = 0;
                dia++;
            }
        }
        
    }
}
