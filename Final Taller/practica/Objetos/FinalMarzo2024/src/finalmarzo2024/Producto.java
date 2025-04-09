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
public class Producto {
    private int cod;
    private int etapa = 1;
    private double costo = 0;

    public Producto(int cod) {
        this.setCod(cod);
    }
    
    
    public void cambiarEtapa (double p){
        if (this.getEtapa()< 5){
          this.setEtapa(this.getEtapa() + 1);
          this.setCosto(this.getCosto() + p);
        }
    }
    
    public double devolverCostoFinalizado(){
        double aux = 0;
        if (this.getEtapa() == 5)
            aux = this.getCosto();
        return aux;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public int getEtapa() {
        return etapa;
    }

    public void setEtapa(int etapa) {
        this.etapa = etapa;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    
}
