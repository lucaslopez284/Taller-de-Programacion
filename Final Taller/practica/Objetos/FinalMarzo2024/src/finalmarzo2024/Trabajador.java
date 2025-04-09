/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalmarzo2024;

/**
 *
 * @author lopez
 */
public class Trabajador {
    private String nombre;
    private String apellido;
    private int antiguedad;

    public Trabajador(String nombre, String apellido, int antiguedad) {
        this.setNombre(nombre);
        this.setApellido(apellido);
        this.setAntiguedad(antiguedad);
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

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return this.getNombre() + " " + this.getApellido() + ", antiguedad  " + this.getAntiguedad();
    }
    
    
    
}
