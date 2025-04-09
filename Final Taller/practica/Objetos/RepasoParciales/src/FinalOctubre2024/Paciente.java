/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalOctubre2024;

/**
 *
 * @author lopez
 */
public class Paciente {
    private String nombre;
    private String dni;
    private String obraSocial;

    public Paciente(String dni, String nombre, String obraSocial) {
        this.setNombre(nombre);
        this.setDni(dni);
        this.setObraSocial(obraSocial);
    }
    
    

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getObraSocial() {
        return obraSocial;
    }

    public void setObraSocial(String obraSocial) {
        this.obraSocial = obraSocial;
    }

    @Override
    public String toString() {
        return "Paciente " + this.getNombre() + " , dni " + this.getDni() + ", obraSocial " + this.getObraSocial();
    }
    
    
    
    
    
}
