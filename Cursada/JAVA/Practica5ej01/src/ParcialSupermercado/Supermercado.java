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
public class Supermercado {
    private String direccion;
    private int numVenta = 0;
    private int cantCajasMax = 5;
    private int cantCajasAct = 0;
    private Caja [] registroCajas;
    
    public Supermercado (String dire) {
        this.setDireccion(dire);
        this.registroCajas = new Caja [5];
     
 }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getNumVenta() {
        return numVenta;
    }

    public void setNumVenta(int numVenta) {
        this.numVenta = numVenta;
    }

    public int getCantCajasMax() {
        return cantCajasMax;
    }

    public void setCantCajasMax(int cantCajasMax) {
        this.cantCajasMax = cantCajasMax;
    }

    public int getCantCajasAct() {
        return cantCajasAct;
    }

    public void setCantCajasAct(int cantCajasAct) {
        this.cantCajasAct = cantCajasAct;
    }

    public Caja[] getRegistroCajas() {
        return registroCajas;
    }

    public void setRegistroCajas(Caja[] registroCajas) {
        this.registroCajas = registroCajas;
    }
    
    public void AgregarCaja (Caja unaCaja) {
        if (this.getCantCajasAct()< this.getCantCajasMax()) {
            this.getRegistroCajas()[this.getCantCajasAct()] = unaCaja;
            this.setCantCajasAct(this.getCantCajasAct() + 1);
            System.out.println("Se pudo agregar la caja");
        }
        
        else System.out.println("Supermercado lleno ");
           
    }
    
    public void nuevoTicket (int numCaja, int cuit, int cant, double precio, String medio){
        int num = this.getNumVenta();
        this.setNumVenta(this.getNumVenta()+1);
        Ticket t1 = new Ticket (num, cuit,cant,precio, medio);
        this.getRegistroCajas()[numCaja - 1].agregarTicket(t1);
    }
    
    public int  masCredito (){
        int max = 0;
        int cajaMax = -1;
        int aux;
        for (int i = 0; i < 5; i++){
            if (this.getRegistroCajas()[i] != null) {
                aux = this.getRegistroCajas()[i].contadorCredito();
                if (aux > max){
                    max = aux;
                    cajaMax = i + 1;
                }
                
            }
        }
        return cajaMax;
    }
    
    public String toString (){
        String aux = "Supermercado: " + this.getDireccion() + "Cantidad de cajas: " + this.getCantCajasAct()+ "\n";
        for (int i =0; i< this.getCantCajasAct(); i++){
            aux = aux + "Caja: " + (i+1);
            if (this.getRegistroCajas()[i] != null)
                aux = aux + this.getRegistroCajas()[i].toString();
            aux = aux + "\n";
        }
        return aux;
    }
}
