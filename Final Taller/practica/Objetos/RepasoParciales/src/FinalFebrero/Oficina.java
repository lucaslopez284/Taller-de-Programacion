/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalFebrero;

/**
 *
 * @author lopez
 */
public class Oficina {
    private boolean alquilado = false;
    private Persona ocupante;
    private double montoDiario;

    public Oficina(Persona ocupante, double montoDiario) {
        this.setAlquilado();
        this.setOcupante(ocupante);
        this.setMontoDiario(montoDiario); 
    }
    
    

    public boolean isAlquilado() {
        return alquilado;
    }

    public void setAlquilado() {
        this.alquilado = true;
    }

    public Persona getOcupante() {
        return ocupante;
    }

    public void setOcupante(Persona ocupante) {
        this.ocupante = ocupante;
    }

    public double getMontoDiario() {
        return montoDiario;
    }

    public void setMontoDiario(double montoDiario) {
        this.montoDiario = montoDiario;
    }

    @Override
    public String toString() {
        return "En uso " + this.isAlquilado() + ", ocupante " + this.getOcupante() + 
                ", montoDiario " + this.getMontoDiario();
    }
    
    
    
}
