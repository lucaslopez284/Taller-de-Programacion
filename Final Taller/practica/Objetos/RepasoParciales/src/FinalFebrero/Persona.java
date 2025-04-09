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
public class Persona {
    private String nombre;
    private String DNI;

    public Persona(String nombre, String DNI) {
        this.setNombre(nombre);
        this.setDNI(DNI);
    }
    
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    @Override
    public String toString() {
        String aux = "Persona:" + this.getNombre() + ", DNI: " + this.getDNI();
        return aux;
    }
    
      
    
    
}
