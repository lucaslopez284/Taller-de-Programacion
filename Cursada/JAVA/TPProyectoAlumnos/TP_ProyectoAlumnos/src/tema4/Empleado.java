/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;


public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleado (String unNombre, double unSueldo, int unaAntiguedad) {
        setNombre(unNombre);
        setSueldo(unSueldo);
        setAntiguedad(unaAntiguedad);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double unSueldo) {
        sueldo = unSueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int unaAntiguedad) {
        antiguedad = unaAntiguedad;
    }
    
    public String toString(){
        String aux;
        aux = " Nombre: " + getNombre() + " Antiguedad: "+ getAntiguedad() + " Sueldo: " + this.calcularSueldoACobrar() + " Efectividad: " + this.calcularEfectividad();
        return aux;
    }
    
    public double sueldoBase() {
        return this.getSueldo() + ((this.getSueldo()* 0.10)*this.getAntiguedad());
    }
    public abstract double calcularEfectividad();
  
    public abstract double calcularSueldoACobrar();
    
} 
        
