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
public class Entrenador extends Empleado{
    public int campeonatos;

    public Entrenador(int campeonatos, String nombre, double sueldoBasico, int antiguedad) {
        super(nombre, sueldoBasico, antiguedad);
        this.campeonatos = campeonatos;
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }

    @Override
    public String toString() {
        return super.toString()+ " Entrenador{" + "campeonatos=" + campeonatos + '}';
    }

    @Override
    public double calcularEfectividad() {
        return ((double)(this.getCampeonatos()/ this.getAntiguedad())) * 100;
    }

    @Override
    public double calcularSueldo() {
        double aux = super.calcularSueldo();
        if (this.getCampeonatos() > 0 && this.getCampeonatos() < 5)
          aux = aux + 5000;
        else {
            if (this.getCampeonatos() < 11)
                aux = aux + 30000;
            else {
                if (this.getCampeonatos() > 10)
                    aux = aux + 50000;
            }
        }
        return aux;
    }

    
    
    
}
