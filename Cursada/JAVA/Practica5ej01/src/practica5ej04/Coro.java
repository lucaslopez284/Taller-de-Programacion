/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej04;

/**
 *
 * @author lopez
 */
public abstract class Coro {
    private String nombre;
    private Director direc;
    private int diml = 0;
    private int cantMax;
    
    public Coro (String n, Director d, int max){
        this.setNombre(n);
        this.setDirec(d);
        this.setCantMax(max);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getDirec() {
        return direc;
    }

    public void setDirec(Director direc) {
        this.direc = direc;
    }

    public int getDiml() {
        return diml;
    }

    private void setDiml(int diml) {
        this.diml = diml;
    }

    public int getCantMax() {
        return cantMax;
    }

    public void setCantMax(int cantMax) {
        this.cantMax = cantMax;
    }
    
    
    
}
