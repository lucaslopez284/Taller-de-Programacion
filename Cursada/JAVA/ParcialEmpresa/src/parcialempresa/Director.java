/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialempresa;

/**
 *
 * @author lopez
 */
public class Director extends Persona{
    private double montoVia;
    
    public Director (String nom, int dn, int ing, double sue, double m){
        super(nom,dn,ing,sue);
        this.setMontoVia(m);
    }

    public double getMontoVia() {
        return montoVia;
    }

    public void setMontoVia(double montoVia) {
        this.montoVia = montoVia;
    }

    @Override
    public double sueldoACobrar() {
       double aux = this.sumaAntiguedad();
       aux = aux + this.getMontoVia();
       return aux;
    }
    
    
    
}
