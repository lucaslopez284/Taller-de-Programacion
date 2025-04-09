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
private int capacidadMaxima=10;
//inicia el dibujo, sin figuras
public Dibujo (String titulo){
    this.setTitulo(titulo);
    this.setGuardadas(0);
    this.vector = new Figura [10];
    this.inicializar();
}

public void inicializar (){
    for (int i = 0 ; i < 10; i++)
        this.getVector()[i] = null;
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

    public int getCapacidadMaxima() {
        return capacidadMaxima;
    }

    public void setCapacidadMaxima(int capacidadMaxima) {
        this.capacidadMaxima = capacidadMaxima;
    }


//agrega la figura al dibujo
public void agregar(Figura f){
  if (this.getGuardadas()< this.getCapacidadMaxima()){
     this.getVector()[this.getGuardadas()] = f;
     this.setGuardadas(this.getGuardadas() + 1);
     System.out.println("la figura " + f.toString() + " se ha guardado");
  }
  else {
      System.out.println("El dibujo ya esta completo");
  }
}


public double calcularArea(){
  double aux = 0;
  for (int i = 0 ; i < this.getGuardadas(); i++){
     aux += this.getVector()[i].calcularArea();
  }
  return aux;
}

public void mostrar(){
  System.out.println("Titulo del dibujo: " + this.getTitulo());
  System.out.println("Area del dibujo: " + this.calcularArea());
  for (int i = 0 ; i < this.getGuardadas(); i++){
      System.out.println("Figura " + (i+1) + " : " + this.getVector()[i].toString());
  }
}

public boolean estaLleno() {
  return (guardadas == capacidadMaxima);
}
}
