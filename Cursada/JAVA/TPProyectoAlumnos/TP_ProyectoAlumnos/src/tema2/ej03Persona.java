/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author lopez
 */
import tema4.Persona;
import PaqueteLectura.Lector; 
import PaqueteLectura.GeneradorAleatorio;
public class ej03Persona {
    public static void main(String[] args) {
        int dias = 5;
        int turnos = 8;
        String fin = "ZZZ";
        Persona [][] matriz = new Persona [dias][turnos];
        int dimlD = 0;
        
        int [] veclogico = new int[dias];
        String nom;
        int dni;
        int edad;
        int t =0;
        System.out.println("Ingrese nombre");
        nom = Lector.leerString();  
        
        for (dimlD= 0;dimlD < dias && !nom.equals(fin) ;dimlD++){
            for (t = 0; t < turnos && !nom.equals(fin); t++) {
                edad = GeneradorAleatorio.generarInt(100);
                dni = GeneradorAleatorio.generarInt(200) + 200;
                matriz [dimlD][t] = new Persona (nom,dni,edad);
                veclogico [dimlD] = t + 1;
                System.out.println("Ingrese nombre");
                nom = Lector.leerString();
                
            }
            

        }
        
        for (int i = 0; i< dimlD; i++)
            for (int j = 0; j < veclogico[i]; j++) {
                System.out.println(matriz[i][j].toString());
                System.out.println("Tengo el casting el dia " + i + " en el turno " + j);
                System.out.println(" ");
            }  
        
        
        
            
    }
    
}
