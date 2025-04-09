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
public abstract class Banco {
    private String nombre;
    private int cantEmp;
    private int cantCMax;
    private int cantC = 0;
    private Cuenta [] registroCuentas;
    
    public Banco (String n, int e, int cm){
        this.setNombre(n);
        this.setCantEmp(e);
        this.setCantCMax(cm);
        this.registroCuentas = new Cuenta [cm];
        this.inicializarCuentas(registroCuentas, cm);
    }
    
    public void inicializarCuentas (Cuenta [] reg , int max) {
        
        for (int i = 0; i< max; i++){
            this.registroCuentas[i] = null;
        
      }
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantEmp() {
        return cantEmp;
    }

    public void setCantEmp(int cantEmp) {
        this.cantEmp = cantEmp;
    }

    public int getCantC() {
        return cantC;
    }

    public void setCantC(int cantC) {
        this.cantC = cantC;
    }

    public int getCantCMax() {
        return cantCMax;
    }

    public void setCantCMax(int cantCMax) {
        this.cantCMax = cantCMax;
    }
    
    

    public Cuenta[] getRegistroCuentas() {
        return registroCuentas;
    }

    public void setRegistroCuentas(Cuenta[] registroCuentas) {
        this.registroCuentas = registroCuentas;
    }
    
    
    public Cuenta obtenerCBU (int unCBU){
        Cuenta aux = new Cuenta();
        aux = null;
        boolean encontre = false;
        int contador = 0;
        while (contador < this.getCantCMax() && encontre != true) {
            if (this.registroCuentas[contador] != null) {
                if (this.getRegistroCuentas()[contador].busqueda(unCBU)) {
                encontre = true;
                aux = this.getRegistroCuentas()[contador];
             }
            }
            contador++;
    }
        return aux;
    }
    
    
     public void agregarCuenta(Cuenta nueCuenta) {
        this.getRegistroCuentas()[this.getCantC()] = nueCuenta;
        this.setCantC(this.getCantC()+ 1);
    }
     
     public void incrementar (int unCBU, double unMonto){
        
        boolean encontre = false;
        int contador = 0;
        while (contador < this.getCantCMax() && encontre != true){
            if (this.registroCuentas[contador] != null) {
             if (this.getRegistroCuentas()[contador].busqueda(unCBU)) {
                encontre = true;
                this.getRegistroCuentas()[contador].incremento(unMonto);
             }
            }
            contador++;
    }
        
        
     }
    
    public abstract boolean chequeo(Cuenta c);
        
    public boolean puedeRecibirTarjeta (int unCBU){
        boolean aux = false;
        boolean encontre = false;
        int contador = 0;
        while (contador < this.getCantCMax() && encontre != true) {
            if (this.registroCuentas[contador] != null) {
               if (this.registroCuentas[contador].busqueda(unCBU)) {
                encontre = true;
                aux = this.chequeo(this.getRegistroCuentas()[contador]);
             }
            }
            contador++;
    }
        return aux;
    
}
    public String toString (){
        
        String aux = " Nombre: " + this.getNombre() + " cantidad de empleados: " + this.getCantEmp() +
                     " cantidades de cuentas actuales: " + this.getCantC() +
                     " cantidades maxima de cuentas: " + this.getCantCMax() + "\n";
        for (int i = 0; i < this.getCantC(); i++)
            aux = aux + this.getRegistroCuentas()[i].toString();
        return aux;
    }
     
}
