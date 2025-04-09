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
public class ej05Partido {
     public static void main(String[] args) {
         
         int max = 20;
         String fin = "ZZZ";
         Partido [] vecpartidos = new Partido [max];
         int diml = 0;
         String vis = cargarEquipo();
         while ((diml < max) && !vis.equals(fin)) {
             String loc = cargarEquipo();
             int golloc = GeneradorAleatorio.generarInt(5);
             int golvis = GeneradorAleatorio.generarInt(5);
             vecpartidos[diml] = new Partido (loc,vis,golloc,golvis);
             diml++;
             vis = cargarEquipo();
             
         }
         
         
         
         int i;
         for (i= 0; i <diml; i++)
             System.out.println(vecpartidos[i].getLocal() + " " + vecpartidos[i].getGolesLocal() + " VS " + vecpartidos[i].getVisitante() + " " + vecpartidos[i].getGolesVisitante());
         
         int cantRiver = 0;
         for (i = 0; i < diml; i++){
              if (vecpartidos[i].getGanador().equals("River")){
                  cantRiver++; 
          }
         }
         System.out.println("La cantidad de partidos que gano River es " + cantRiver);
         
         
         int cantBoca = 0;
         for (i=0; i <diml; i++)
             if(vecpartidos[i].getLocal().equals("Boca"))
                 cantBoca = cantBoca + vecpartidos[i].getGolesLocal();
            
         System.out.println("La cantidad de goles que metio Boca en la Bombonera es " + cantBoca);
     }
  
    

public static String cargarEquipo() {
        System.out.print("ingrese el equipo : ");
        String aux = Lector.leerString();
        return aux;
}

}