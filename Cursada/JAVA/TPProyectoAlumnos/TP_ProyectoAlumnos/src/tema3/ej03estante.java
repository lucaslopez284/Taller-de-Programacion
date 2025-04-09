/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author lopez
 */
public class ej03estante {
    
    public static void main (String [] args) {
        Estante estanteria = new Estante ();
        Autor autorLibro1 = new Autor("Ortiz","arranco bien y despues se pincho","Sarandi");
        Libro libro1 = new Libro("Mujercitas","FF.ES",1999,"534534",19999,autorLibro1);
        Autor autorLibro2 = new Autor("Peter Grance","buen tipo","Polvorines");
        Libro libro2 = new Libro("La gran casa de Coleoni","GG.EZ",2001,"865889",13555,autorLibro2);
        estanteria.agregarLibro(libro2);
        estanteria.agregarLibro(libro1);
        
        System.out.println("La cantidad de libros cargados es " + estanteria.getDiml());
        
        Libro libroBuscar = estanteria.devolverLibro("Mujercitas");
        if (libroBuscar != null)
            System.out.println ("El autor del libro buscado fue " + libroBuscar.getAutor());
        else System.out.println ("No se encontro el libro buscado");
    }
}
