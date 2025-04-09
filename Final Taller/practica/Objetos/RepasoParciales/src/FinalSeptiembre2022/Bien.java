/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalSeptiembre2022;

/**
 *
 * @author lopez
 */
public class Bien {
    private String descripcion;
    private int cant;
    private double costoPorUnidad;

    public Bien(String descripcion, int cant, double costoPorUnidad) {
        this.setDescripcion(descripcion);
        this.setCant(cant);
        this.setCostoPorUnidad(costoPorUnidad);
    }
    
    

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    public double getCostoPorUnidad() {
        return costoPorUnidad;
    }

    public void setCostoPorUnidad(double costoPorUnidad) {
        this.costoPorUnidad = costoPorUnidad;
    }
    
    public double costoFinal (){
        return this.getCant() * this.getCostoPorUnidad();
    }
    
    
}
