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
public class Ej03Estante {
    public static void main(String[] args){
        String n = "Herbert Schildt";
        String bio = "Un gran hombre";
        String ori = "Argentina";
        Autor a1 = new Autor (n,bio,ori);
        n = "John Horton";
        bio = "Un gran valiente";
        ori = "Holanda";
        Autor a2 = new Autor (n,bio,ori);
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 a1, "978-0071809252", 21.72);
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               a2, "978-1512108347");
        Libro libro3= new Libro("Mujercitas",  
                              "CreateSpace Independent Publishing", 
                               a2, "978-1512108347");
        
        Estante est = new Estante("Lucas");
        est.agregarLibro(libro1);
        est.agregarLibro(libro2);
        est.agregarLibro(libro3);
        System.out.println(est.toString());
        System.out.println(est.estaLleno());
        System.out.println(est.busqueda("Mujercitas"));
    }
}
