/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialempresa;


public abstract class Persona {
    private String nombre;
    private int DNI;
    private int ingreso;
    private double sueldo;
    
    public Persona (String n, int d, int i, double s){
        this.setNombre(n);
        this.setDNI(d);
        this.setIngreso(i);
        this.setSueldo(s);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getIngreso() {
        return ingreso;
    }

    public void setIngreso(int ingreso) {
        this.ingreso = ingreso;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }
    
    public String toString (){
        return " Nombre: " + this.getNombre() + " DNI: " + this.getDNI() + " sueldo a cobrar: " 
                + this.sueldoACobrar() + "\n";
    }
    
    public double sumaAntiguedad(){
        double aux = this.getSueldo();
        if (this.getIngreso()< 2004)
            aux = aux + aux * 0.1;
        return aux;
    }
    
    
    public abstract double sueldoACobrar();
}
