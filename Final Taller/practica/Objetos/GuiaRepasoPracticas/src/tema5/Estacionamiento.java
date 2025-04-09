/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author lopez
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private double apertura;
    private double cierre;
    private int pisos;
    private int plazas;
    private Auto [] [] matriz;
    private int [] vector;

    public Estacionamiento(String nombre, String direccion) {
        this.setNombre(nombre);
        this.setDireccion(direccion);
        this.setApertura(8.0);
        this.setCierre(21);
        this.setPisos(5);
        this.setPlazas(10);
        this.matriz = new Auto [5][10];
        this.vector = new int [5];
        this.inicializar();
    }

    public Estacionamiento(String nombre, String direccion, double apertura, double cierre, int pisos, int plazas) {
        this.setNombre(nombre);
        this.setDireccion(direccion);
        this.setApertura(apertura);
        this.setCierre(cierre);
        this.setPisos(pisos);
        this.setPlazas(plazas);
        this.matriz = new Auto [pisos][plazas];
        this.vector = new int [pisos];
        this.inicializar();
    }

    
    
    
    
    
    public void inicializar (){
        for (int i = 0; i < this.getPisos(); i++) {
            for (int j = 0; j < this.getPlazas(); j++)
                this.getMatriz()[i][j] = null;
            
            this.getVector()[i] = 0;
        }
    }
    
    
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getApertura() {
        return apertura;
    }

    public void setApertura(double apertura) {
        this.apertura = apertura;
    }

    public double getCierre() {
        return cierre;
    }

    public void setCierre(double cierre) {
        this.cierre = cierre;
    }

    

    public int getPisos() {
        return pisos;
    }

    public void setPisos(int pisos) {
        this.pisos = pisos;
    }

    public int getPlazas() {
        return plazas;
    }

    public void setPlazas(int plazas) {
        this.plazas = plazas;
    }

    public Auto[][] getMatriz() {
        return matriz;
    }

    public void setMatriz(Auto[][] matriz) {
        this.matriz = matriz;
    }

    public int[] getVector() {
        return vector;
    }

    public void setVector(int[] vector) {
        this.vector = vector;
    }
    
    public void agregarAuto(Auto a, int pi, int pl){
        this.getMatriz()[pi - 1] [pl - 1] = a;
    }
    
    public String busquedaPatente (int p){
        String aux = "Auto inexistente";
        boolean esta = false;
        int i = 0;
        int j;
        while ((esta != true)&& (i < this.getPisos())){
            j = 0;
            while ((esta != true)&& (j < this.getPlazas())){
                if (this.getMatriz()[i][j]!= null){
                    if (this.getMatriz()[i][j].getPatente() == p){
                        aux = "Piso " + (i+1) +", plaza " + (j+1) + " "+ this.getMatriz()[i][j].toString();
                        esta = true;
                    }
                }
                j++;
            }
            i++;
        }
        return aux;
    }

    @Override
    public String toString() {
        String aux = "Estacionamiento: " + this.getNombre() + ", direccion: " + this.getDireccion() + ", apertura: " 
                + this.getApertura() + ", cierre: " + this.getCierre() + ", pisos: " + this.getPisos()
                + ", plazas: " + this.getPlazas() + "\n";
        for (int i = 0; i< this.getPisos(); i++){
            aux += "Piso " + (i+1) + " : ";
            for (int j = 0; j < this.getPlazas(); j++){
                aux += "Plaza " + (j+1) + " : ";
                if (this.getMatriz()[i][j] != null)
                    aux += this.getMatriz()[i][j].toString() + " | ";
                else{
                    aux += "libre | ";
                }
            }
            aux += "\n";
        }
        return aux;
    }
    
    public int cantPlaza(int p){
        int aux = 0;
        for (int i = 0; i < this.getPisos(); i++){
            if (this.getMatriz()[i][p] != null)
                aux++;
        }
        return aux;
    }
    
    
}
