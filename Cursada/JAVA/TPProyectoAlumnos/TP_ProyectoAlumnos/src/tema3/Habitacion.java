/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import tema4.Persona;

/**
 *
 * @author lopez
 */
public class Habitacion {
    private Persona huesped;
    private double costo;
    private boolean disponibilidad;
    
    public Habitacion (double precio){
         this.disponibilidad = true;
         this.costo = precio;
         this.huesped = null;
     
     
}

    public Persona getHuesped() {
        return huesped;
    }

    public void setHuesped(Persona unHuesped){
        if (getDisponibilidad()){
                setDisponibilidad(false);
                huesped = unHuesped;
        }
             else {
                System.out.println("mala suerte, la habitacion esta ocupada");
                System.out.println();
            }
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double unCosto) {
        costo = unCosto;
    }

    public boolean getDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(boolean nuevaDisponibilidad) {
        disponibilidad = nuevaDisponibilidad;
    }
    
    
    
    
}
