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
public class Proyecto {
    private String nombre;
    private int codigo;
    private String director;
    private int cant;
    private Investigador [] vector;
    private int max = 50;

    public Proyecto (String nombre, int codigo, String director) {
        this.setNombre(nombre);
        this.setCodigo(codigo);
        this.setDirector(director);
        this.setCant(0);
        this.vector = new Investigador [50];
    }
    
    
    public void inicializar (){
        for (int i= 0; i < max; i++){
            this.getVector()[i] = null;
        }
    }
    
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public int getCant() {
        return cant;
    }

    private void setCant(int cant) {
        this.cant = cant;
    }

    public Investigador[] getVector() {
        return vector;
    }

    public void setVector(Investigador[] vector) {
        this.vector = vector;
    }
    
    
    public void agregarInvestigador (Investigador i){
        if (this.getCant()< max){
          this.getVector()[this.getCant()] = i;
          this.setCant(this.getCant() + 1);
       }
        else {
                System.out.println("Se alcanzo la cantidad maxima de investigadores");
        }
    }
    
    public void otorgar(String n){
        boolean esta = false;
        int i = 0;
        while ((i < this.getCant()) && (esta == false)){
          if  (this.getVector()[i].getNombre().equals(n)) {
              this.getVector()[i].otorgarSubsidios();
              esta = true;
          }
          i++;
        }
    }

    @Override
    public String toString() {
        String aux = "Proyecto: " + this.getNombre()+ ", codigo: " + this.getCodigo() + ", director: " + this.getDirector() + "\n";
        for (int i = 0; i < this.getCant();i++){
            aux += "Investigador: " + (i+1) + this.getVector()[i].toString();
        }
        return aux;
    }
    
    
    
}
