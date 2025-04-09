/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author lopez
 */
public abstract class Empleado {
    public String nombre;
    public double sueldoBasico;
    public int antiguedad;

    public Empleado(String nombre, double sueldoBasico, int antiguedad) {
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.antiguedad = antiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public abstract double calcularEfectividad();
    public double calcularSueldo(){
        return this.getSueldoBasico() + (2025 - this.getAntiguedad() * (0.10 * this.getSueldoBasico()));
    }
    @Override
    public String toString() {
        return "Empleado{ nombre: " + this.getNombre() + ", sueldo: " + this.calcularSueldo() + ", efectividad: " + this.calcularEfectividad() + '}' ;
    }
    
    
    
    
}
