/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalSeptiembre2022;

/**
 *
 * @author lopez
 */
public class SubsidioDeEstadia extends Subsidio {
      private String lugarDestino;
      private double costoPasajes;
      private int dias;
      private double montoHotel;

    public SubsidioDeEstadia(String lugarDestino, double costoPasajes, int dias, double montoHotel, String Investigador, String planDeTrabajo, Fecha fec) {
        super(Investigador, planDeTrabajo, fec);
        this.setLugarDestino(lugarDestino);
        this.setCostoPasajes(costoPasajes);
        this.setDias(dias);
        this.setMontoHotel(montoHotel);
    }
      
      

    public String getLugarDestino() {
        return lugarDestino;
    }

    public void setLugarDestino(String lugarDestino) {
        this.lugarDestino = lugarDestino;
    }

    public double getCostoPasajes() {
        return costoPasajes;
    }

    public void setCostoPasajes(double costoPasajes) {
        this.costoPasajes = costoPasajes;
    }

    public int getDias() {
        return dias;
    }

    public void setDias(int dias) {
        this.dias = dias;
    }

    public double getMontoHotel() {
        return montoHotel;
    }

    public void setMontoHotel(double montoHotel) {
        this.montoHotel = montoHotel;
    }
      
      

    @Override
    public double getMontoTotal() {
        return this.getCostoPasajes() + (this.getDias() * this.getMontoHotel());
    }

    @Override
    public String toString() {
        String aux = super.toString() + "\n";
        aux += "Lugar de destino: " + this.getLugarDestino() + ", dias de estadia: " + this.getDias();
         return aux;
    }
    
    
    
}
