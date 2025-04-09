/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;


public class Auto {
    private String propietario;
    private int patente;

    public Auto(String propietario, int patente) {
        this.setPropietario(propietario);
        this.setPatente(patente);
    }

    public String getPropietario() {
        return propietario;
    }

    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }

    public int getPatente() {
        return patente;
    }

    public void setPatente(int patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return "Auto{" + "propietario: " + this.getPropietario() + ", patente: " + this.getPatente() + '}';
    }
    
    
}
