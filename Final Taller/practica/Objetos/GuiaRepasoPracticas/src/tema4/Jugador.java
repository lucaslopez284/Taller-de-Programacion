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
public class Jugador extends Empleado {
    public int partidos;
    public int goles;

    public Jugador(int partidos, int goles, String nombre, double sueldoBasico, int antiguedad) {
        super(nombre, sueldoBasico, antiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }

    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }

    @Override
    public String toString() {
        return super.toString() + " Jugador{" + "partidos=" + partidos + ", goles=" + goles + '}';
    }

    @Override
    public double calcularEfectividad() {
        return ((double)(this.getGoles()/ this.getPartidos()))* 100;
    }

    @Override
    public double calcularSueldo() {
        double aux = super.calcularSueldo();
        if (((double)(this.getGoles()/ this.getPartidos())) > 0.5)
          aux = aux + this.getSueldoBasico();
    
        return aux;
    }
    
    
    
}
