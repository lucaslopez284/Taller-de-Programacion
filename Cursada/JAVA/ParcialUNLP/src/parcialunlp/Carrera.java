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
public class Carrera {
    private String nombre;
    private String facultad;
    private int creacion;
    
    public Carrera (String n, String f, int c){
        this.setNombre(n);
        this.setFacultad(f);
        this.setCreacion(c);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFacultad() {
        return facultad;
    }

    public void setFacultad(String facultad) {
        this.facultad = facultad;
    }

    public int getCreacion() {
        return creacion;
    }

    public void setCreacion(int creacion) {
        this.creacion = creacion;
    }
    
    public String toString (){
        String aux = this.getNombre() + " facultad: " + this.getFacultad() + " creacion: " + this.getCreacion() + "\n";
        return aux;
    }
    
    
}
