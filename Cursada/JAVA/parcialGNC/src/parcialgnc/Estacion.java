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
public class Estacion {
    private String direccion;
    private double precioM3;
    private int maxSur = 6;
    private int diml = 0;
    private Surtidor [] registroSur;
    
    public Estacion (String dire, double p, int v){
        this.setDireccion(dire);
        this.setPrecioM3(p);
        this.registroSur = new Surtidor [6];
        this.inicializarSurtidores(v);
    }
    
    public void inicializarSurtidores(int v){
        for (int i = 0; i< this.getMaxSur(); i++)
            this.getRegistroSur()[i] =  new Surtidor(v);
    }
    
    public void crearVenta (int NS, int dni, int cant, String forma){
        double aux = cant * this.getPrecioM3();
        Venta v1 = new Venta (dni,cant,aux, forma);
        if (this.getRegistroSur()[NS - 1] != null) {
          
          this.getRegistroSur()[NS - 1].agregarVenta(v1);
          
        }
        
    }
    
    
   
            
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getPrecioM3() {
        return precioM3;
    }

    public void setPrecioM3(double precioM3) {
        this.precioM3 = precioM3;
    }

    public int getMaxSur() {
        return maxSur;
    }

    public void setMaxSur(int maxSur) {
        this.maxSur = maxSur;
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    public Surtidor[] getRegistroSur() {
        return registroSur;
    }

    public void setRegistroSur(Surtidor[] registroSur) {
        this.registroSur = registroSur;
    }
    
    public void fueraDeServicio (double filtro){
        for (int i = 0; i< this.getMaxSur(); i++){
            if (this.getRegistroSur()[i] != null)
               if (this.getRegistroSur()[i].totalM3()< filtro)
                   this.getRegistroSur()[i].setNoEnServicio();
        }
    }
    
    public Venta mayorVenta (){
        Venta auxV = null;
        double auxMax = 0;
        double aux2;
        for (int i = 0; i < this.getMaxSur(); i++){
            if (this.getRegistroSur()[i] == null) {
                if (this.getRegistroSur()[i].mayorVenta().getMonto() > auxMax){
                    auxMax = this.getRegistroSur()[i].mayorVenta().getMonto();
                    auxV = this.getRegistroSur()[i].mayorVenta();
                }
            } 
          }
        return auxV;
    }
        
     
    
    public String toString (){
        String aux = "Estacion: " + this.getDireccion() + " precio por m3: " + this.getPrecioM3() + "\n";
        for (int i = 0; i < this.getMaxSur(); i++){
            aux = aux + " Surtidor: " + (i+1);
            if (this.getRegistroSur()[i]!= null){
                aux = aux + this.getRegistroSur()[i].toString() + "\n";
                
            }
            else aux = aux + " Surtidor no instanciado " + "\n";
        }
        return aux;
    }
    
    
    
}
