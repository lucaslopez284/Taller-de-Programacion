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


    
  public class ej02Persona {
    public static void main (String[] args){
        int df = 15;
        int dl = 0;
        
        Persona [] vec = new Persona [df];
        GeneradorAleatorio.iniciar(); 
        String nom;
        int dni;
        int edad;
        
        
        edad = GeneradorAleatorio.generarInt(100);
        dni = GeneradorAleatorio.generarInt(200) + 200;
        nom = GeneradorAleatorio.generarString(8);
        while ((dl < df) && (edad != 0) ) {
            Persona p1 = new Persona(nom,dni,edad);
            vec [dl] = p1;
            dl++;
            edad = GeneradorAleatorio.generarInt(100);
            dni = GeneradorAleatorio.generarInt(200) + 200;
            nom = GeneradorAleatorio.generarString(8);
            
            
        } 
        for (int i = 0; i < dl; i++) {
            System.out.print(" pos vector : " + i + " / ");
            System.out.println(vec[i].toString());
    }
        int aux;
        int cant = 0;
        for (int i = 0; i < dl; i++) {
            aux = vec[i].getEdad();
            if (aux > 65)
                cant++;
         }
        System.out.println ("la cantidad de personas mayores a 65 es igual a  " + cant);
        
        int pos = 0;
        int minimo = 100000;
        for (int i = 0; i < dl; i++) {
             aux = vec[i].getDNI();
             if (aux < minimo) {
                 minimo = aux;
                 pos = i;
                 
             }
      
    }    
        System.out.println(vec[pos].toString());
        
}


}
