/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej03;

/**
 *
 * @author lopez
 */
public class Gira extends Recital {
    private String nombre;
    private int cantFechasMax;
    private int cantActual;
    private fecha [] registro ;
    private fecha fecActual;
    private int aux = 0;
    
    public Gira (String unaBanda, int max, String nom, int cantF){
        super(unaBanda,max);
        this.setNombre(nom);
        this.setCantFechasMax(cantF);
        registro = new fecha[cantF];
        this.setCantActual(0);
        for (int i = 0; i < this.getCantFechasMax(); i++){
            this.getRegistro()[i] = null;
        }
        this.setFecActual(null);
        
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantFechasMax() {
        return cantFechasMax;
    }

    public void setCantFechasMax(int cantFechas) {
        this.cantFechasMax = cantFechas;
    }

    public fecha[] getRegistro() {
        return registro;
    }

    public void setRegistro(fecha[] registro) {
        this.registro = registro;
    }

    public int getCantActual() {
        return cantActual;
    }

    public void setCantActual(int cantActual) {
        this.cantActual = cantActual;
    }

    public fecha getFecActual() {
        return fecActual;
    }

    public void setFecActual(fecha fecActual) {
        this.fecActual = fecActual;
    }

    public int getAux() {
        return aux;
    }

    public void setAux(int aux) {
        this.aux = aux;
    }

    
    
    
    public void agregarFecha (fecha f){
        if (this.getCantActual()< this.getCantFechasMax()){
            this.getRegistro()[this.getCantActual()] = f;
            if (this.getFecActual()== null) {
                this.setFecActual(f);
            }
            this.setCantActual(this.getCantActual() + 1);
            
            System.out.println("Se pudo agregar la fecha " + f.toString());
        }
        else System.out.println("Ya se alcanzo la cantidad maxima de fechas");
    }
    
    
    @Override
    public void Actuar(){
        System.out.println(" Buenas noches " + this.getFecActual().getCiudad());
        super.Actuar();
        this.setFecActual(this.getRegistro()[aux +1 ]);
        this.setAux(this.getAux()+1);
    }

    @Override
    public double calcularCosto() {
        return 30000 * this.getCantActual();
    }
    
}
