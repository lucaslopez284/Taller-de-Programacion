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
public class Ej04Casting {
    public static void main(String[] args){
        Persona matriz [] [] = new Persona [5][8];
        int vector [] = new int [5];
        for (int i = 0; i<5;i++)
            vector [i]=0;
        
        System.out.println("Arranca el casting");
        String nom;
        int dni;
        int edad;
        System.out.println("Ingrese nombre");
        nom = Lector.leerString();
        int contador = 0;

        int turno = 0;
        int dia;
        while ((contador < 40)&&(!nom.equals("ZZZ"))){
            System.out.println("Ingrese dia del 1 al 5");
            dia = Lector.leerInt();
            edad = GeneradorAleatorio.generarInt(50) + 25;
            dni = GeneradorAleatorio.generarInt(5000) + 4000;
            Persona p = new Persona (nom,dni,edad);
            turno = vector [dia - 1];
            if (turno == 8) {
                System.out.println("Sin turnos disponibles");
            }
            else {
              matriz [dia - 1][turno]= p;
              vector [dia - 1] = vector [dia - 1] + 1;
              contador++;
             }
              System.out.println("Ingrese nombre");
              nom = Lector.leerString();
       }
        int j;
        for (int i = 0; i< 5; i++){
            System.out.println("Cantidad de inscriptos para el dia " + (i+1) + " : " + vector[i]);
            for (j= 0; j < vector[i]; j++){
                if (matriz [i][j] != null){
                   System.out.println(" Turno: " + (j + 1) + " " + matriz [i][j].getNombre());
                }
            }
        }
        
    }
}
