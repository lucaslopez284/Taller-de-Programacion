/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author lopez
 */
public class Dibujo {
    private String titulo;
    private Figura [] vector;
    private int guardadas;
    private int capacidad = 10;
    
    public Dibujo (String unTitulo ) {
        this.setTitulo(unTitulo);
        vector = new Figura [10];
        this.setGuardadas(0);
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Figura[] getVector() {
        return vector;
    }

    public void setVector(Figura[] vector) {
        this.vector = vector;
    }

    public int getGuardadas() {
        return guardadas;
    }

    public void setGuardadas(int guardadas) {
        this.guardadas = guardadas;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }
    
    public boolean estaLleno (){
        return (guardadas == capacidad);
    }
     
   
    
    public void agregar (Figura f){
        boolean chequeo = this.estaLleno();
        if (chequeo == false) {
            vector[guardadas]= f;
            this.setGuardadas(this.getGuardadas()+1);
            System.out.println("La figura " + f.toString() + " se pudo guardar ");
        }
        else System.out.println("El vector esta lleno");
    }
    
    public double calcularAreaTotal (){
        double aux = 0;
        for (int i = 0; i < this.getGuardadas(); i++){
            aux = aux + vector[i].calcularArea();
        }
        
        return aux;
        
    
  }
    
    public void mostrar (){
        int corte = this.getGuardadas();
        System.out.println("Titulo del dibujo: " + this.getTitulo() + "Area del dibujo: " + this.calcularAreaTotal());
        for (int i = 0; i < corte ; i++){
            System.out.println(this.getVector()[i].toString());
        }
    }
}
