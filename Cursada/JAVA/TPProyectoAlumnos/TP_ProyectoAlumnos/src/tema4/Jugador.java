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
    private int cantPartidos;
    private int cantGoles;
    
    public Jugador (String unNombre, double unSueldo, int unaAntiguedad, int cantP, int cantG) {
        super(unNombre, unSueldo, unaAntiguedad);
        setCantPartidos(cantP);
        setCantGoles(cantG);
    }

    public int getCantPartidos() {
        return cantPartidos;
    }

    public void setCantPartidos(int cantPartidos) {
        this.cantPartidos = cantPartidos;
    }

    public int getCantGoles() {
        return cantGoles;
    }

    public void setCantGoles(int cantGoles) {
        this.cantGoles = cantGoles;
    }

    
    public double calcularEfectividad() {
        return getCantGoles() / getCantPartidos();
    }

    
    public double calcularSueldoACobrar() {
        double aux = this.sueldoBase();
         if(this.calcularEfectividad() > 0.5){
            aux = aux + this.getSueldo();
        }
        return aux;
    }
    
 }
