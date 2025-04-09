/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalAbril2024;

/**
 *
 * @author lopez
 */
public class Poliza {
    private double monto;
    private double cuota;
    private Fecha comienzo;
    private Fecha fin;
    private Cliente cli;

    public Poliza(double monto, double cuota, Fecha comienzo, Fecha fin, Cliente cli) {
        this.setMonto(monto);
        this.setCuota(cuota);
        this.setComienzo(comienzo);
        this.setFin(fin);
        this.setCli(cli);
    }
    
    

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public double getCuota() {
        return cuota;
    }

    public void setCuota(double cuota) {
        this.cuota = cuota;
    }

    public Fecha getComienzo() {
        return comienzo;
    }

    public void setComienzo(Fecha comienzo) {
        this.comienzo = comienzo;
    }

    public Fecha getFin() {
        return fin;
    }

    public void setFin(Fecha fin) {
        this.fin = fin;
    }

    public Cliente getCli() {
        return cli;
    }

    public void setCli(Cliente cli) {
        this.cli = cli;
    }
    
    public boolean mismoDni (int d){
        boolean aux = this.getCli().esIgual(d);
        return aux;
    }
    
    public boolean mismaFecha (int m, int a){
        boolean aux = this.getFin().coincide(m, a);
        return aux;
    }

    @Override
    public String toString() {
        return "Monto: " + this.getMonto() + ", cuota: " + this.getCuota() + 
                ", comienzo: " + this.getComienzo().toString() 
                + ", fin: " + this.getFin().toString();
    }
    
    
    
}
