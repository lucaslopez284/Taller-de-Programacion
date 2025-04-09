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
public class Surtidor {
    private boolean enServicio = true;
    private int maxVentas;
    private int diml = 0;
    private Venta [] registroVentas;
    
    
    public Surtidor (int max){
        this.setMaxVentas(max);
        this.registroVentas = new Venta [max];
        this.inicializarVentas(max);
        
    }
    
    public void inicializarVentas (int max){
        for (int i = 0; i< this.getMaxVentas(); i++)
            this.getRegistroVentas()[i]= null;
    }

    public boolean isEnServicio() {
        return enServicio;
    }

    public void setNoEnServicio() {
        this.enServicio = false;
    }

    
    public int getMaxVentas() {
        return maxVentas;
    }

    public void setMaxVentas(int maxVentas) {
        this.maxVentas = maxVentas;
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    public Venta[] getRegistroVentas() {
        return registroVentas;
    }

    public void setRegistroVentas(Venta[] registroVentas) {
        this.registroVentas = registroVentas;
    }
    
    public void agregarVenta (Venta V){
       
        if (this.getDiml()< this.getMaxVentas()){
            
            this.getRegistroVentas()[this.getDiml()] = V;
            this.setDiml(this.getDiml()+1);
            System.out.println(" Se agrego correctamente la venta ");
            
        }
        else System.out.println(" No se pudo agregar la venta ");
        
        
    }
    
    public int totalM3 () {
        int aux = 0;
        for (int i = 0; i< this.getDiml(); i++){
            aux = aux + this.getRegistroVentas()[i].getCantM3();
        }
        return aux;
            
    }
    
    public Venta mayorVenta(){
        Venta aux = null;
        double max = 0;
        for (int i = 0; i< this.getDiml();i++){
            if (this.getRegistroVentas()[i].getMonto() > max){
                max = this.getRegistroVentas()[i].getMonto();
                aux = this.getRegistroVentas()[i];
            }
        }
        return aux;
    }
    
    public String toString (){
        String aux;
        
        if (this.isEnServicio())
            aux = " no esta fuera de servicio ";
        else aux = " esta fuera de servicio ";
        for (int i= 0; i < this.getDiml(); i++) 
            aux = aux  + this.getRegistroVentas()[i].toString();
        return aux;
    }
    
}
