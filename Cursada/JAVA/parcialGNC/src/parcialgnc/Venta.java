/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialgnc;

/**
 *
 * @author lopez
 */
public class Venta {
    private int dniCliente;
    private int cantM3;
    private double monto;
    private String medioPago;
    
    public Venta (int d, int cant, double mon, String medio){
        this.setDniCliente(d);
        this.setCantM3(cant);
        this.setMonto(mon);
        this.setMedioPago(medio);
    }

    public int getDniCliente() {
        return dniCliente;
    }

    public void setDniCliente(int dniCliente) {
        this.dniCliente = dniCliente;
    }

    public int getCantM3() {
        return cantM3;
    }

    public void setCantM3(int cantM3) {
        this.cantM3 = cantM3;
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
    
    
    public String toString (){
        return " Cliente: " + this.getDniCliente() + " cant m3: " + this.getCantM3() + " monto: " + this.getMonto()
                + " medio de pago: " + this.getMedioPago() + "\n";
    }
            
    
}
