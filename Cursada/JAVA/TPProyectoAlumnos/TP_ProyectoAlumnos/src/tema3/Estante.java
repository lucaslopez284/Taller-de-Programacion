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
    private Libro [] almacen ;
    private int Max = 20;
    private int diml;
    
    
    public Estante () {
        this.almacen = new Libro [Max];
        this.diml =  0;
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int nuevadiml) {
        diml = nuevadiml;
    }
    
    public boolean estanteLleno (){
        boolean aux;
        if (diml == (Max - 1))
            aux = true;
        else aux = false;
        return aux;
    }
    
    public void agregarLibro (Libro nuevoLibro){
        if (estanteLleno()!= true){
            this.almacen[diml] = nuevoLibro;
            this.diml++;
        }
        else System.out.println("El estante se encuentra lleno");
               
               
    }
    
    public Libro devolverLibro(String tituloBuscado){
        int i = 0;
        boolean encontre = false;
        while ((i < this.diml) && (encontre != true)){
             if (almacen[i].getTitulo().equals(tituloBuscado))
                 encontre = true;
             else i++;
        }
        if (encontre)
            return almacen[i];
        else 
            return null;
    }
            
    
}
