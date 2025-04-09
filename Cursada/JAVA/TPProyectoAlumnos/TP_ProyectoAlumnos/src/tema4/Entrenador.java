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
public class Entrenador extends Empleado {
    private int cantTitulos;
    
    public Entrenador(String unNombre, double unSueldo, int unaAntiguedad, int nueCant){
         super(unNombre, unSueldo, unaAntiguedad);
         setCantTitulos(nueCant);
    }

    public int getCantTitulos() {
        return cantTitulos;
    }

    public void setCantTitulos(int cantTitulos) {
        this.cantTitulos = cantTitulos;
    }

    @Override
    public double calcularEfectividad() {
        return this.getCantTitulos()/ this.getAntiguedad();
    }

    @Override
    public double calcularSueldoACobrar() {
        double aux = this.sueldoBase();
        if (this.getCantTitulos() > 1 && this.getCantTitulos() < 5)
            aux = aux + 5000;
        else  if (this.getCantTitulos() > 4 && this.getCantTitulos() < 11)
             aux = aux + 30000;
              else  if (this.getCantTitulos() > 10)
                  aux = aux + 50000;
        return aux;
    }
    
}
    
    
    

