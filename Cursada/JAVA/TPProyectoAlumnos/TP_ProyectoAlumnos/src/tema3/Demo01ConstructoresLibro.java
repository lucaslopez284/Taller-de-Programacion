/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package tema3;

/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Autor autor1 = new Autor ("Herbert Schildt" , "un gran chabon" , "Polvorines");
        Libro libro1= new  Libro ( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014, "978-0071809252", 21.72 , autor1);
        Autor autor2 = new Autor ("John Horton", "hizo buenos libros" , "Floresta");
        Libro libro2= new Libro ("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               2019, "978-1512108347", 28.04, autor2);
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
       
    }
    
}
