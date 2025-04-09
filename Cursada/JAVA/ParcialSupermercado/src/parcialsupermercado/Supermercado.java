/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialsupermercado;

/**
 *
 * @author lopez
 */
public class Supermercado {
    private String nombre;
    private String direccion;
    private int cantG;
    private int cantE;
    private Producto [][] matriz;
    private int [] vector;
    
    public Supermercado (String n, String d, int g, int e){
        this.setNombre(n);
        this.setDireccion(d);
        this.setCantG(g);
        this.setCantE(e);
        this.matriz = new Producto [g][e];
        this.vector = new int [g];
        this.inicializarMatriz();
        
        
    }
    
    public void agregarProducto (Producto p){
       boolean encontre = false;
       int i = 0;
       
       while (i < this.getCantG() && encontre == false){
           int j = 0;
           while (j < this.getCantE() && encontre == false){
               if (this.getMatriz()[i][j] == null){
                   encontre = true;
                   this.getMatriz()[i][j] = p;
               }
               j++;
           }
           
           i = i + 1;
       }
       
    }
    
    public void inicializarContador (){
        for (int i = 0; i< this.getCantG(); i++){
            this.vector[i] = 0;
        }
         
    }
    
    public void inicializarMatriz (){
        for (int i = 0; i < this.getCantG(); i++)
            for (int j = 0; j< this.getCantE(); j++)
                this.getMatriz()[i][j] = null;
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

    public int getCantG() {
        return cantG;
    }

    public void setCantG(int cantG) {
        this.cantG = cantG;
    }

    public int getCantE() {
        return cantE;
    }

    public void setCantE(int cantE) {
        this.cantE = cantE;
    }

    public Producto[][] getMatriz() {
        return matriz;
    }

    public void setMatriz(Producto[][] matriz) {
        this.matriz = matriz;
    }
    
    
    public String mismaMarca (int g, String m){
        String aux = "";
        for (int i = 0; i < this.getCantE(); i++){
            if (this.getMatriz()[g-1][i].getMarca().equals(m))
                aux = aux + this.getMatriz()[g-1][i].toString();
        }
        return aux;
    }
    
    public int masUnidades (){
        int gondolaMax = -1;
        int max = -1;
        for (int i = 0; i < this.getCantG(); i++){
            int contador = 0;
            for (int j = 0; j < this.getCantE(); j++){
                contador = contador + this.getMatriz()[i][j].getCantUni();
            }
            if (contador > max){
                max = contador;
                gondolaMax = i+1;
            }
            
        }
        return gondolaMax;
    }
    
    
    public String toString (){
        String aux = "Supermercado: " + this.getNombre() + " Direccion: " + this.getDireccion() + "\n";
        for (int i = 0; i < this.getCantG(); i++){
            aux = aux + " Gondola: " + (i+1) + "\n";
            for (int j = 0; j < this.getCantE(); j++){
                aux = aux + " Estante: " + (j+1) + this.getMatriz()[i][j];
            }
        }
        return aux;
    }
    
    
}
