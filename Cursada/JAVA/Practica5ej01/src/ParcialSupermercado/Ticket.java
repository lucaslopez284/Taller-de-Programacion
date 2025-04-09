/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialSupermercado;

/**
 *
 * @author lopez
 */
public class Ticket {
    private int numero;
    private int cuitCli;
    private int cantComprada;
    private double monto;
    private String medioPago;
    
    
    public Ticket (int num, int cuit, int cant, double precio, String medio) {
        this.setNumero(num);
        this.setCantComprada(cant);
        this.setCuitCli(cuit);
        this.setMonto(precio);
        this.setMedioPago(medio);
        
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getCuitCli() {
        return cuitCli;
    }

    public void setCuitCli(int cuitCli) {
        this.cuitCli = cuitCli;
    }

    public int getCantComprada() {
        return cantComprada;
    }

    public void setCantComprada(int cantComprada) {
        this.cantComprada = cantComprada;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMedioPago() {
        return medioPago;
    }

    public void setMedioPago(String medioPago) {
        this.medioPago = medioPago;
    }
    
    @Override
    public String toString (){
            return "Numero: " + this.getNumero() + " Cuilt: " + this.getCuitCli() 
                    + " Cant comprada: " + this.getCantComprada() + " Monto abonado: " +
                    this.getMonto() + " Medio de pago: " + this.getMedioPago() + "\n";
    }
}
