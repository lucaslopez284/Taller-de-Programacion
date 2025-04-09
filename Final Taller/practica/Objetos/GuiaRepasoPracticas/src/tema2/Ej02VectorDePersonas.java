/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
public class Ej02VectorDePersonas {
    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        int df = 15;
        int dl = 0;
        Persona vector [] = new Persona [15];
        String n;
        int e;
        int d;
        e = GeneradorAleatorio.generarInt(100);
        while ((dl < df)&& (e!=0)){
            n = GeneradorAleatorio.generarString(10);
            d = GeneradorAleatorio.generarInt(2000) + 4000;
            Persona p = new Persona (n,d,e);
            vector [dl] = p;
            dl++;
            e = GeneradorAleatorio.generarInt(50);
        }
        
        for (int i = 0; i < dl; i++)
            System.out.println("Posicion: " + (i+1) + " | " + vector[i].toString());
        
        
        int mayores = 0;
        for (int i = 0; i < dl; i++){
            if (vector[i].getEdad() > 65)
                mayores++;
        }
        System.out.println("La cantidad de personas mayores a 65 es " + mayores);
        
        int menor = 8000;
        int pMenor = 0;
        for (int i = 0; i < dl; i++){
            if (vector[i].getDNI()< menor){
                pMenor = i;
                menor = vector[i].getDNI();
            }
        }
        System.out.println(vector[pMenor].toString());
        
    }
}
