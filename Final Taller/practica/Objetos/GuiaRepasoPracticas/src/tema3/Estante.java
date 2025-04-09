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
public class Estante {
    private String nombre;
    private int max;
    private int diml;
    private Libro vector [];

    public Estante(String unNombre) {
        this.setNombre(unNombre);
        this.setMax(20);
        this.setDiml(0);
        this.vector = new Libro [20];
        this.inicializar(vector);
    }
    
    public void inicializar ( Libro [] vector){
        for (int i = 0; i< 20; i++)
            vector[i] = null;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    public Libro[] getVector() {
        return vector;
    }

    public void setVector(Libro[] vector) {
        this.vector = vector;
    }
    
    public int cantidadAlmacenada (){
        return this.getDiml();
    }
    
    public boolean estaLleno (){
        boolean aux = false;
        if (this.getDiml()== 20)
            aux = true;
        return aux;
    }
    
    public void agregarLibro (Libro l){
        if (this.getDiml()< 20){
            this.getVector()[this.getDiml()] = l;
            this.setDiml(this.getDiml() + 1);
        }
    }
    
    public Libro busqueda (String nombre){
        Libro aux = new Libro();
        Boolean esta = false;
        int i = 0;
        while ((i< this.getDiml())&& (esta != true)){
            if (this.getVector()[i].getTitulo().equals(nombre)){
                esta = true;
                aux = this.getVector()[i];
            }
            i++;
        }
        return aux;
    }
    
    public String toString (){
        String aux = "Estante: " + this.getNombre() + " cantidad almacenada: " + this.cantidadAlmacenada() + "\n";
        for (int i = 0; i < this.getDiml(); i++){
            aux+= "Libro " + (i+1) + " : " + this.getVector()[i].toString() + "\n";
        }
        
        return aux;
    }
}
