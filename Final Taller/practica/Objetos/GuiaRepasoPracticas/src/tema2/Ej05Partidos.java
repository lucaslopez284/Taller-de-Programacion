/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej05Partidos {
        public static void main(String[] args) {
            GeneradorAleatorio.iniciar();
            int cant = 0;
            int max = 20;
            String l;
            String v;
            int gl;
            int gv;
            System.out.println("Ingrese equipo local");
            l = Lector.leerString();
            gl = GeneradorAleatorio.generarInt(6);
            System.out.println("Ingrese equipo visitante");
            v = Lector.leerString();
            gv = GeneradorAleatorio.generarInt(6);
            Partido vector [] = new Partido [20];
            while ((cant < max ) && (!v.equals("ZZZ"))){
                Partido p = new Partido(l,v,gl,gv);
                vector [cant] = p;
                cant++;
                System.out.println("Ingrese equipo local");
                l = Lector.leerString();
                gl = GeneradorAleatorio.generarInt(6);
                System.out.println("Ingrese equipo visitante");
                v = Lector.leerString();
                gv = GeneradorAleatorio.generarInt(6);
            }
            
            int ganoRiver = 0;
            int golesBoca = 0;
            
            for (int i = 0; i< cant; i++){
                if (vector[i].getGanador().equals("River"))
                    ganoRiver++;
                if (vector[i].getLocal().equals("Boca"))
                    golesBoca += vector[i].getGolesLocal();
                System.out.println(vector[i].getLocal() + " " + vector[i].getGolesLocal() + " VS " + vector[i].getVisitante() + " " + vector[i].getGolesVisitante());
            }
            System.out.println("La cantidad de partidos que gano River fue " + ganoRiver);
            System.out.println("La cantidad de goles que hizo Boca en la Bombonera fue " + golesBoca);
        }

}
