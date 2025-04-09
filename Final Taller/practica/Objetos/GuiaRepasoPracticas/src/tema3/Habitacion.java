/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author lopez
 */
public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Persona cliente;

    public Habitacion() {
        this.setCosto(GeneradorAleatorio.generarDouble(6000) + 2000);
        this.setOcupada(false);
        this.setCliente(null);
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public Persona getCliente() {
        return cliente;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }
    
    public void aumentar(Double precio){
        this.setCosto(this.getCosto()+ precio);
    }
    
    public void ocupar (Persona cliente){
        this.setOcupada(true);
        this.setCliente(cliente);
    }

    @Override
    public String toString() {
        String aux = " costo: " + this.getCosto() + ", ocupada: " + this.isOcupada(); 
        if (this.isOcupada())
            aux += ", cliente: " + this.getCliente().toString();
        return aux;
    }
    
    
}
