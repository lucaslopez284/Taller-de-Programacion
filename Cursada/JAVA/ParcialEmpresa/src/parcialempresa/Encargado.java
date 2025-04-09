/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialempresa;

/**
 *
 * @author lopez
 */
public class Encargado extends Persona{
    private int cantEmp;
    
    
    public Encargado (String nom, int dn, int ing, double sue, int cant){
        super(nom,dn,ing,sue);
        this.setCantEmp(cant);
    }
    
    
    public int getCantEmp() {
        return cantEmp;
    }

    public void setCantEmp(int cantEmp) {
        this.cantEmp = cantEmp;
    }
    
    

    @Override
    public double sueldoACobrar() {
       double aux = this.sumaAntiguedad();
       aux = aux + 1000* this.getCantEmp();
       return aux;
    }
    
}
