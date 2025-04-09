/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialunlp;

/**
 *
 * @author lopez
 */
public class ParcialUNLP {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Carrera car = new Carrera ("Licenciatura en monos" , "Animales" , 2010);
       
        SistemaAnual s1 = new SistemaAnual (car, 10);
        s1.registrarCantidad(2015, 3, 77);
        s1.registrarCantidad(2015, 3, 11);
        System.out.println(s1.toString());
        SistemaTrimestral s2 = new SistemaTrimestral (car, 10);
        s2.registrarCantidad(2012, 3, 117);
        System.out.println(s2.toString());
        System.out.println(s1.retornarCantidadTrimestres(77));
    }
    
} 
