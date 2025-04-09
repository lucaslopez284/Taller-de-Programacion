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
public class Sistema {
    private Poliza [][] polizas;
    private int [] vector;
    private int rubros = 10;
    private int dimf = 200;

    public Sistema() {
        this.polizas = new Poliza [10] [200];
        this.vector = new int [10];
        this.inicializar();
    }
    
    private void inicializar(){
        for (int i = 0; i< this.getRubros(); i++)
            this.setVector(i,0);
        for (int i = 0; i < this.getRubros(); i++)
            for (int j = 0; j< this.getDimf(); j++)
                this.getPolizas()[i][j]= null;
    }

    public int getRubros() {
        return rubros;
    }

    public void setRubros(int rubros) {
        this.rubros = rubros;
    }

    public int getDimf() {
        return dimf;
    }

    public void setDimf(int dimf) {
        this.dimf = dimf;
    }
    
    
    public Poliza[][] getPolizas() {
        return polizas;
    }

    public void setPolizas(Poliza[][] polizas) {
        this.polizas = polizas;
    }

    public int getVector(int r) {
        return this.vector[r];
    }

    public void setVector(int r, int c) {
        this.vector [r] = c;
    }
    
    public void agregarPoliza(Poliza p, int rub){
        if (this.getVector(rub) < this.getDimf()) {
            this.getPolizas()[rub][this.getVector(rub)] = p;
            this.setVector(rub, (this.getVector(rub) + 1));
        }
    }
    
    public String infoCliente (int d){
        String aux = "";
        for (int i = 0; i < this.getRubros(); i++)
            for (int j = 0; j< this.getVector(i);j++){
                if (this.getPolizas()[i][j].mismoDni(d))
                    aux += this.getPolizas()[i][j].toString();
            }
                
        return aux;
    }
    
    public void aumentarCuotas (double p, int r){
        double aux;
        for (int i = 0; i < this.getVector(r); i++){
            aux = this.getPolizas()[r][i].getCuota() * p;
            this.getPolizas()[r][i].setCuota(aux); 
         }
    }
    
    public int cantidadAVencer(int m, int a){
        int cant = 0;
        for (int i = 0; i < this.getRubros(); i++){
            for (int j = 0; j < this.getVector(i); j++)
                if (this.getPolizas()[i][j].mismaFecha(m, a))
                    cant++;
        }
        return cant;
    }
    
    public String toString(){
        String aux = "";
        for (int i = 0; i < this.getRubros(); i++){
            aux += "Polizas del rubro " + i + "\n";
            for (int j = 0; j < this.getVector(i); j++){
                aux += this.getPolizas()[i][j].toString() + "\n";
            }
        }
        return aux;
    }
    
    
    
}
