/*
Clase Libro a la cual se agregaron constructores. 
 */
package tema3;

/**
 *
 * @author vsanz
 */
public class Libro {
   private String titulo;
   private Autor autorLibro;
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; 
   
     
    
    public Libro(  String unTitulo,  String unaEditorial, 
    int unAñoEdicion, String unISBN, double unPrecio, Autor unAutor){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         
         ISBN =  unISBN;
         precio = unPrecio;
         autorLibro = unAutor;
    }
    
   
        
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
  
    public String getAutor(){
        String aux;
        aux = autorLibro.getNombre();
        return aux;
    }
    
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
   
    
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
   
    
   @Override
    public String toString(){
        String aux;
        Autor aut;
        aut = autorLibro;
        aux= titulo + " por " + aut.getNombre() + " - " + añoEdicion + " - " + " ISBN: " + ISBN;
       return ( aux);
    }
        
}
