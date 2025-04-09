/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialuno;

/**
 *
 * @author lopez
 */
public class Cuenta {
    private int CBU;
    private String alias;
    private int DNIT;
    private String moneda;
    private double monto;
    
    public Cuenta (int c, String a, int d, String md, double mt){
        this.setCBU(c);
        this.setAlias(a);
        this.setDNIT(d);
        this.setMoneda(md);
        this.setMonto(mt);
        
    }

    public Cuenta() {
        
    }

    public int getCBU() {
        return CBU;
    }

    public void setCBU(int CBU) {
        this.CBU = CBU;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public int getDNIT() {
        return DNIT;
    }

    public void setDNIT(int DNIT) {
        this.DNIT = DNIT;
    }

    public String getMoneda() {
        return moneda;
    }

    public void setMoneda(String moneda) {
        this.moneda = moneda;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }
    
    public boolean busqueda (int unCBU){
        boolean aux = false;
        if (this.getCBU()== unCBU)
            aux = true;
        return aux;
            
    }
    
    public void incremento (double unMonto){
        this.setMonto(this.getMonto()+ unMonto);
    }
    
    public String toString (){
        return " CBU: " + this.getCBU() + " alias: " + this.getAlias() +
                " Dni titular: " + this.getDNIT() + " moneda: " + this.getMoneda()
                + " monto: " + this.getMonto() + "\n";
    }
    
    
}
