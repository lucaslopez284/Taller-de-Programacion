/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej04;

/**
 *
 * @author lopez
 */
public class Persona {
    private String Nombre;
    private int DNI;
    private int edad;

    
    public Persona (String n, int d, int e){
        this.setNombre(n);
        this.setDNI(d);
        this.setEdad(e);
    
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    
    
    public String toString (){
        return "Nombre: " + this.getNombre() + " DNI: " + this.getDNI() + " Edad: " + this.getEdad();
    }
    
}
