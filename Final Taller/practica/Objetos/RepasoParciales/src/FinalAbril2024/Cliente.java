/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalAbril2024;

/**
 *
 * @author lopez
 */
public class Cliente {
    private int dni;
    private String nombre;
    private String apellido;

    public Cliente(int dni, String nombre, String apellido) {
        this.setDni(dni);
        this.setNombre(nombre);
        this.setApellido(apellido);
    }
    
    

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    
    public boolean esIgual (int d){
        boolean aux = false;
        if (d == this.getDni())
            aux = true;
        return aux;
    }

    @Override
    public String toString() {
        return "DNI: " + this.getDni() + ", nombre: " + this.getNombre() + ", apellido: " + this.getApellido();
    }
    
    
}
