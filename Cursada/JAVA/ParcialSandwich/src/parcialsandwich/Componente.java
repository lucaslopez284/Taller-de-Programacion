/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialsandwich;

/**
 *
 * @author lopez
 */
public abstract class Componente {
    private String nombre;
    private double costo;
    
    public Componente (String n, double cos){
        this.setNombre(n);
        this.setCosto(cos);
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    public String toString (){
        String aux = " Nombre: " + this.getNombre() + " costo: " + this.getCosto();
        return aux;
    }
    
    public abstract double calcularCostoFinal();
    
    
}
