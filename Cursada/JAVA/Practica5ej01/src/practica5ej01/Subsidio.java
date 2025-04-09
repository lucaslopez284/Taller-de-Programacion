/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej01;

/**
 *
 * @author lopez
 */
public class Subsidio {
    private double monto;
    private String motivo;
    private boolean estado = false;
    
    public Subsidio (double mon, String mot){
        this.setMonto(mon);
        this.setMotivo(mot);
        
    }
    
    public Subsidio (){
        
    }

    
    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado() {
       if(this.getEstado() == false)
           this.estado = true;
    }
    
}
