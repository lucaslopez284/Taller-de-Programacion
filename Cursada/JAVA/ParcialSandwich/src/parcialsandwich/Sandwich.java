/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialsandwich;

/**
 *
 * @author lopez
 */
public class Sandwich {
    private String nombre;
    private Pan unPan;
    private int diml = 0;
    private int maxIng;
    private Ingrediente [] vector;
    
    public Sandwich (String n, Pan p, int max){
        this.setNombre(n);
        this.setUnPan(p);
        this.setMaxIng(max);
        this.vector = new Ingrediente [max];
        this.InicializarVector();
        
    }
    
    public void InicializarVector(){
        for (int i = 0; i< this.getMaxIng(); i++)
            this.getVector()[i] = null;
    }
    
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Pan getUnPan() {
        return unPan;
    }

    public void setUnPan(Pan unPan) {
        this.unPan = unPan;
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    public int getMaxIng() {
        return maxIng;
    }

    public void setMaxIng(int maxIng) {
        this.maxIng = maxIng;
    }

    public Ingrediente[] getVector() {
        return vector;
    }

    public void setVector(Ingrediente[] vector) {
        this.vector = vector;
    }
    
    public void agregarIngrediente (Ingrediente ing){
        if (this.getDiml()< this.getMaxIng()){
            this.getVector()[this.getDiml()] = ing;
            this.setDiml(this.getDiml() + 1);
            System.out.println (" Se pudo agregar el ingrediente " + ing.getNombre());
        }
        else System.out.println (" Se alcanzo la cantidad maxima de ingredientes ");
    }
    
    public double costoIngredientes (){
        double aux = 0;
        for (int i = 0; i< this.getDiml(); i++){
            aux = aux + this.getVector()[i].calcularCostoFinal();
        }
        return aux;
    }
    
    public double costoFinal (){
        double aux = this.getUnPan().calcularCostoFinal() + this.costoIngredientes();
        return aux;
    }
    
    public String toString (){
        String aux = " Nombre: " + this.getNombre() + "\n" + this.getUnPan().toString() 
                     + " cantidad de ingredientes: " + this.getDiml() + "\n";
        for (int i = 0; i < this.getDiml(); i++){
            aux = aux + this.getVector()[i].toString();
        }
        
        aux = aux + " costo del sandwich: " + this.costoFinal();
        
        return aux;
    }
    
    
}
