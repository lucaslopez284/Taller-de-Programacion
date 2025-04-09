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
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio [] vector;
    private int cant;
    private int max = 5;

    public Investigador(String nombre, int categoria, String especialidad) {
        this.setNombre(nombre);
        this.setCategoria(categoria);
        this.setEspecialidad(especialidad);
        this.vector = new Subsidio [5];
        this.inicializar();
        this.setCant(0);
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

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Subsidio[] getVector() {
        return vector;
    }

    public void setVector(Subsidio[] vector) {
        this.vector = vector;
    }

    public int getCant() {
        return cant;
    }

    private void setCant(int cant) {
        this.cant = cant;
    }
    
    public void agregarSubsidio (Subsidio s){
        if (this.getCant()< max){
          this.getVector()[this.getCant()] = s;
          this.setCant(this.getCant() + 1);
       }
        else {
                System.out.println("Se alcanzo la cantidad maxima de subsidios");
        }
    }
    
    public double montoTotal(){
        double aux = 0;
        for (int i = 0; i < this.getCant(); i++){
            aux += this.getVector()[i].devolverMonto();
        }
        return aux;
    }
    
    public void otorgarSubsidios (){
        for (int i = 0; i < this.getCant(); i++){
            this.getVector()[i].setOtorgado();
        }
    }

    @Override
    public String toString() {
        return " Nombre: " + this.getNombre() + ", categoria: " + this.getCategoria() + ", especialidad: " + this.getEspecialidad() + ", dinero otorgado: " + this.montoTotal() + "\n";
    }
    
    
    
    
}
