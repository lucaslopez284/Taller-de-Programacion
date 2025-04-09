/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej02;

/**
 *
 * @author lopez
 */
public class Auto {
    private String Propietario;
    private String Patente;
    
    public Auto (String unNombre, String pat){
        this.setPropietario(unNombre);
        this.setPatente(pat);
        
    }
    
    public Auto(){
        this.Propietario = "Ninguno";
        this.Patente = "0";
    }

    public String getPropietario() {
        return Propietario;
    }

    public void setPropietario(String Propietario) {
        this.Propietario = Propietario;
    }

    public String getPatente() {
        return Patente;
    }

    public void setPatente(String Patente) {
        this.Patente = Patente;
    }
    
    @Override
    public String toString (){
        String aux;
        aux = " Nombre: " + this.getPropietario() + " Patente " + this.getPatente();
        return aux;
    }
    
}
