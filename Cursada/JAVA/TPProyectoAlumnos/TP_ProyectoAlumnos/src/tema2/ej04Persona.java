/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import tema4.Persona;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author lopez
 */
public class ej04Persona {
    public static void main(String[] args) {
        int dias = 5;
        int turnos = 8;
        String fin = "ZZZ";
        Persona [][] matriz = new Persona [dias][turnos];
        int dimlD = 0;
        int cupos = 40;
        int participantes = 0;
        int [] veclogico = new int[dias];
        String nom;
        int dni;
        int edad;
        int dia;
        //nom = leerNombre();
        nom = GeneradorAleatorio.generarString(6);
        int i;
        int j;
        //inicializar matriz
        for (i = 0; i < dias; i++)
            for (j = 0; j < turnos; j++) 
                matriz [i][j] = null;
                
        while((!nom.equals(fin)) && (participantes < cupos )){
            edad = GeneradorAleatorio.generarInt(100);
            dni = GeneradorAleatorio.generarInt(200) + 200;
            dia = leerDia();
            
            int turno = -1;
            boolean disponible;
            disponible = false;
            
            for (j = 0; disponible != true && j < turnos; j++) {
                if (matriz [dia][j] == null){
                    turno = j;
                   
                    disponible = true;
                }
                 veclogico[dia] = j + 1;
            }
             
            
            if (disponible == true){
                matriz [dia] [turno] = new Persona (nom,dni,edad);
                participantes ++;   
            }
            else System.out.println(" no hay mas turnos disponibles en el dia " + dia);
            nom = GeneradorAleatorio.generarString(6);
            //nom = leerNombre();
        }
        
        
        for (i = 0; i < dias; i++){;
            int cantdiaria = 0;
            for (j = 0; j < veclogico [i]; j ++){
                if (matriz [i][j]!= null){
                    System.out.println(matriz [i][j].toString());
                    System.out.println(" tengo el casting el dia " + i + " en el turno " + j );
                    cantdiaria++;
                    
                }
               
           }
         System.out.println(" en el dia " + i + " se anotaron " + cantdiaria + " personas"); 
        }
    }    
    public static String leerNombre(){
        System.out.print("ingrese el nombre de la persona : ");
        String aux = Lector.leerString();
        return aux;
    }
    
    public static int leerDia(){
        System.out.print("ingrese el dia que quiere acudir al casting : ");
        int aux = Lector.leerInt();
        return aux;
    }    
}
